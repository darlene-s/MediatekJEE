package services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mediatek2021.Mediatek;
import mediatek2021.NewDocException;

/**
 * Servlet implementation class AjoutServlet
 */
@WebServlet("/AjoutServlet")
public class AjoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjoutServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Vide
		request.getServletContext().getRequestDispatcher("/AjoutDocument.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String titre = request.getParameter("titre");
		String auteur = request.getParameter("auteur");
		String typeString = request.getParameter("type");
		String btnAjouter = request.getParameter("btnAjt");
		int type = -1;
		if (!typeString.equals("")) {
			type = Integer.parseInt(typeString);
		} else {
			System.err.println("Vous devez choisir un type de document");
		}
		if(btnAjouter!=null) {
			ajouterDocument(type,auteur,titre);
		}
		
		doGet(request, response);
	}
	public void ajouterDocument (int type,String auteur, String titre) {
		try {
			Mediatek.getInstance().newDocument(type,auteur,titre);
		} catch (NewDocException e){
			e.printStackTrace();
		}
		}
	}

