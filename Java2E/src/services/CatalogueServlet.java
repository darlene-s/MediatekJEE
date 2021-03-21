package services;

import java.util.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mediatek2021.Document;
import mediatek2021.Mediatek;
import mediatek2021.SuppressException;

/**
 * Servlet implementation class CatalogueServlet
 */
@WebServlet("/Catalogue")
public class CatalogueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<Document> documents = new ArrayList<>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CatalogueServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getServletContext().getRequestDispatcher("/catalogue.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id_doc = request.getParameter("choix");
		String supp = request.getParameter("btnSupprimer");
		String btnValide = request.getParameter("Valider");

		if (btnValide != null) {

			if (id_doc.equals("1")) {
				documents = Mediatek.getInstance().catalogue(1); // livre
			} else if (id_doc.equals("2")) {
				documents = Mediatek.getInstance().catalogue(2);// DVD
			} else if (id_doc.equals("3")) {
				documents = Mediatek.getInstance().catalogue(3); // CD
			}
		}

		if (supp != null) {
			supprimerDoc(supp);
			doGet(request, response);
		}
		request.setAttribute("documents", documents);
		doGet(request, response);
	}

	public void supprimerDoc(String supp) {
		try {
			Mediatek.getInstance().suppressDoc(Integer.parseInt(supp));
		} catch (SuppressException e) {
			e.printStackTrace();
		}
	}

}
