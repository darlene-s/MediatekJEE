package persistantdata.utilisateurs;

import mediatek2021.Utilisateur;

/**
 * Classe Biblioth�caire : Impl�mente l'interface Utilisateur de la lib
 * mediatek.jar car un bilioth�caire est un utilisateur
 * 
 * @author S.Darl�ne | T.Lucie
 *
 */

public class Bibliothecaire implements Utilisateur {

	private final int id_u;
	private final String pseudo, login, password;

	/**
	 * Constructeur de la classe Biblioth�caire
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
	
	/* Getter permettant de r�cup�rer le login du biblioth�caire
	 * 
	 * @return login : login du biblioth�caire
	 */
	public String pseudo() {
		return pseudo;
	}



	/*
	 * Getter permettant de r�cup�rer le login du biblioth�caire
	 * 
	 * @return login : login du biblioth�caire
	 */
	@Override
	public String login() {
		return login;
	}

	/*
	 * Getter permettant de r�cup�rer le mot de passe du biblioth�caire
	 * 
	 * @return password : mot de passe du biblioth�caire
	 */
	@Override
	public String password() {
		return password;
	}

	/*
	 * Getter permettant de r�cup�rer un tableau de donn�es concernant le
	 * biblioth�caire 
	 * [0] : id_u 
	 * [1] : pseudo
	 * [2] : login 
	 * [3] : password
	 * @return tableau de donn�es � propos du biblioth�caire
	 */
	@Override
	public Object[] data() {
		return new Object[] { id_u, login, password };
	}
	
	
}
