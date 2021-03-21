package persistantdata;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnexionBD {
	private static Connection connexion;

	private ConnexionBD() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connexion = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "iut");
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static void finConnexion() throws SQLException {
		connexion.close();
	}

	/*
	 * Méthode permettant de déterminer si une BD est accessible
	 * 
	 * @return boolean : booléen qui indique l'état de la BD
	 */
	public static boolean accesBD() throws SQLException {
		return connexion.isClosed();
	}

	public static Connection getConnect() {
		if (connexion == null) {
			new ConnexionBD();
		}
		return connexion;
	}

}