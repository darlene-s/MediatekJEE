package persistantdata.utilisateurs;

import mediatek2021.Utilisateur;

/**
 * Classe Bibliothécaire : Implémente l'interface Utilisateur de la lib
 * mediatek.jar car un biliothécaire est un utilisateur
 * 
 * @author S.Darlène | T.Lucie
 *
 */

public class Bibliothecaire implements Utilisateur {

	private final int id_u;
	private final String pseudo, login, password;

	/**
	 * Constructeur de la classe Bibliothécaire
	 * 
	 * @param id_u
	 * @param pseudo
	 * @param login
	 * @param password
	 */
	public Bibliothecaire(int id_u, String Pseudo,String login, String password) {
		this.id_u = id_u;
		this.pseudo = Pseudo;
		this.login = login;
		this.password = password;
	}
	
	/* Getter permettant de récupérer le login du bibliothécaire
	 * 
	 * @return login : login du bibliothécaire
	 */
	public String pseudo() {
		return pseudo;
	}



	/*
	 * Getter permettant de récupérer le login du bibliothécaire
	 * 
	 * @return login : login du bibliothécaire
	 */
	@Override
	public String login() {
		return login;
	}

	/*
	 * Getter permettant de récupérer le mot de passe du bibliothécaire
	 * 
	 * @return password : mot de passe du bibliothécaire
	 */
	@Override
	public String password() {
		return password;
	}

	/*
	 * Getter permettant de récupérer un tableau de données concernant le
	 * bibliothécaire 
	 * [0] : id_u 
	 * [1] : pseudo
	 * [2] : login 
	 * [3] : password
	 * @return tableau de données à propos du bibliothécaire
	 */
	@Override
	public Object[] data() {
		return new Object[] { id_u, login, password };
	}
	
	
}
