package persistantdata;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;

import mediatek2021.Document;
import mediatek2021.Mediatek;
import mediatek2021.NewDocException;
import mediatek2021.PersistentMediatek;
import mediatek2021.SuppressException;
import mediatek2021.Utilisateur;
import persistantdata.documents.Documents;
import persistantdata.utilisateurs.Bibliothecaire;

// classe mono-instance : l'unique instance est connue de la bibliotheque
// via une injection de dépendance dans son bloc static

public class MediatekData implements PersistentMediatek {
	// Jean-François Brette 01/01/2018
	private static Connection connect;
	private PreparedStatement rq;
	private Statement rq1;

	static {
		// injection dynamique de la dépendance dans le package stable mediatek2021
		Mediatek.getInstance().setData(new MediatekData());
		connect = ConnexionBD.getConnect();
	}

	/*
	 * Blocage de l'instanciation
	 */
	private MediatekData() {

	}

	// renvoie la liste de tous les documents de la bibliothèque
	@Override
	public List<Document> catalogue(int type) {
		Document d = null;
		List<Document> catalogue = new ArrayList<Document>();
		String sqlStatement = "SELECT * FROM DOCUMENT WHERE Type_Doc = ?";
		ResultSet rp;
		try {
			synchronized (connect) {
				rq = connect.prepareStatement(sqlStatement);
				if(type==1) {
					rq.setString(1, "Livre");
				} else if(type == 2) {
					rq.setString(1, "DVD");
				} else if(type == 3) {
					rq.setString(1, "CD");
				}
				
				rp = rq.executeQuery();
			}
			while (rp.next()) {
				d = new Documents(rp.getInt(1), rp.getString(2), rp.getString(3), rp.getInt(4), type);
				if (d != null) {
					catalogue.add(d);
				}
			}
			rp.close();
		} catch (SQLException e) {
			System.err.println("Une erreur est survenue" + sqlStatement);
		}
		return catalogue;
		
	}

	// va récupérer le User dans la BD et le renvoie
	// si pas trouvé, renvoie null
	@Override
	public Utilisateur getUser(String login, String password) {
		if (login != null && password != null) {
			try {
				synchronized (connect) {
				rq = connect.prepareStatement("SELECT * FROM UTILISATEUR WHERE Login = ? and Mdp = ?");
				rq.setString(1, login);
				rq.setString(2, password);
				ResultSet table = rq.executeQuery();
				if (!table.next()) {
					return null;
				} else {
					return new Bibliothecaire(table.getInt("ID_Utilisateur"), table.getString("Pseudo"),
							table.getString("Login"), table.getString("Mdp"));
				}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	// va récupérer le document de numéro numDocument dans la BD
	// et le renvoie
	// si pas trouvé, renvoie null
	@Override
	public Document getDocument(int numDocument) {
		try {
			synchronized(connect) {
			String sqlStatement = "SELECT * FROM DOCUMENT WHERE ID_Doc =" + numDocument;
			ResultSet rp;
			rq1 = connect.createStatement();
			rp = rq1.executeQuery(sqlStatement);

			if (rp.next()) {
				if (rp.getString(5).equals("Livre")) {
					return new Documents(rp.getInt(1), rp.getString(2), rp.getString(3), rp.getInt(4), 1);
				} else if (rp.getString(5).equals("DVD")) {
					return new Documents(rp.getInt(1), rp.getString(2), rp.getString(3), rp.getInt(4), 2);
				} else if (rp.getString(5).equals("CD")) {
					return new Documents(rp.getInt(1), rp.getString(2), rp.getString(3), rp.getInt(4), 3);
				}

			} else {
				return null;
			}
			}
			
		} catch (SQLException e) {
			System.err.println("Une erreur est survenue");
		}
		return null;
	}

	// ajoute un nouveau document - exception à définir
	@Override
	public void newDocument(int type, Object... args) throws NewDocException {
		// args[0] -> l'auteur
		// args [1] --> le titre
		// etc en fonction du type et des infos optionnelles
		if (args[0] == "" || args[1] == "" ) {
			throw new NewDocException("Certains champs sont manquants");
		} else if (args.length < 2) {
			throw new NewDocException("Le titre,l'auteur, ou l'image du document à ajouter sont manquants");
		} else if (type > 3 || type < 1) {
			throw new NewDocException("Nous n'acceptons que les documents de type Livre,CD ou DVD");
		}
		/*
		 * args[0] = normalize((String)args[0]); args[1] = normalize((String)args[0]);
		 * args[2] = normalize((String)args[0]); args[3] = normalize((String)args[0]);
		 */
		System.out
				.println("Ajout du document de référence :" + args[0] + args[1]  + Documents.choixType(type));
		String sqlStatement = "INSERT INTO DOCUMENT (ID_Doc, Auteur,Titre,Etat_Document,Type_Doc) VALUES (DocSerie.NEXTVAL, ?,?, 0,?)";
		try {
			synchronized (connect) {
				rq = connect.prepareStatement(sqlStatement);
				rq.setString(1, (String) args[0]); // Auteur
				rq.setString(2, (String) args[1]); // Titre
				if(type==1) {
					rq.setString(3, "Livre");
				} else if (type ==2) {
					rq.setString(3, "DVD");
				} else if (type ==3) {
					rq.setString(3, "CD");
				}
				rq.executeUpdate();
				rq.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/*
	 * @Override public void suppressDoc(int arg0) throws SuppressException { //
	 * TODO Auto-generated method stub
	 * 
	 * }
	 */

	// supprime un document - exception à définir
	@Override
	public void suppressDoc(int numDoc) throws SuppressException {
		Object[] data = getDocument(numDoc).data();
		if ((int)data[3] == 1 ) {
			throw new SuppressException(
					"Le document est actuellement emprunté, vous ne pouvez pas le supprimer du catalogue");
		}
		try {
			synchronized (connect) {
				System.out.println("Suppression du document n°" + numDoc);
				String sqlStatement = "DELETE FROM DOCUMENT WHERE ID_Doc = " + numDoc;
				rq1 = connect.createStatement();
				rq1.executeUpdate(sqlStatement);
				rq1.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	/*
	 * private static String normalize(String s) { s = Normalizer.normalize(s,
	 * Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", ""); return s; }
	 */
}
