package persistantdata.documents;

import mediatek2021.Document;

/**
 * Classe Document : Impl�mente l'interface Document de la lib mediatek.jar car
 * les Livres,CD et DVD sont des documents
 * 
 * @author S.Darl�ne | T.Lucie
 *
 */
public class Documents implements Document {
	int id_d;
	String auteur, titre;
	int etat_doc;
	EDocuments typeDoc;

	/**
	 * Constructeur de la classe Document
	 * 
	 * @param id_d
	 * @param auteur
	 * @param titre
	 * @param etat_doc
	 * @param typeDoc
	 */
	public Documents(int id_d, String auteur, String titre, int etat_doc, int typeDoc) {
		this.id_d = id_d;
		this.auteur = auteur;
		this.titre = titre;
		this.etat_doc = etat_doc;
		this.typeDoc = choixType(typeDoc);
	}

	/*
	 * Getter permettant de r�cup�rer un tableau de donn�es concernant le document
	 * [0] : id_d [1] : auteur [2] : titre [3] : img [4] : etat_doc [5] : typeDoc
	 * 
	 * @return tableau de donn�es � propos du document
	 */
	@Override
	public Object[] data() {
		return new Object[] { id_d, auteur, titre,etat_doc, typeDoc };
	}

	/**
	 * M�thode statique prennant en param�tre le type du document et qui renvoie un
	 * int associ� � sa cat�gorie
	 * 
	 * @param typeDoc
	 * @return
	 */
	static public EDocuments choixType(int typeDoc) {
		switch (typeDoc) {
		case 1:
			return EDocuments.LIVRE;
		case 2:
			return EDocuments.DVD;
		case 3:
			return EDocuments.CD;
		default:
			return null;
		}

	}
	
}
