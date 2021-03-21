package services;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(value = "/initializeResources", loadOnStartup = 1)
public class InjectionServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void init() throws ServletException {
		try {
			Class.forName("persistantdata.MediatekData");
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}
