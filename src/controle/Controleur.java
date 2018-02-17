package controle;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.*;
import dao.Service;
import meserreurs.*;

/**
 * Servlet implementation class Controleur
 */
@WebServlet("/Controleur")
public class Controleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ACTION_TYPE = "action";
	private static final String LISTER_RADHERENT = "listerAdherent";
	private static final String AJOUTER_ADHERENT = "ajouterAdherent";
	private static final String INSERER_ADHERENT = "insererAdherent";
	private static final String LISTER_OEUVRE = "listerOeuvre";
	private static final String RESERVER_MENU = "reserverMenu"; // affiche le menu de reservation
	private static final String RESERVER_OEUVRE = "reserverOeuvre"; // réserve une oeuvre
	private static final String ERROR_KEY = "messageErreur";
	private static final String FORM_MODIFIER_OEUVRE = "form_modifierOeuvre"; // formulaire pour modifier une oeuvre
	private static final String MODIFIER_OEUVRE = "modifierOeuvre"; //modifier une oeuvre
	private static final String ERROR_PAGE = "/erreur.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controleur() {
		super();
		// TODO Auto-generated constructor stub

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processusTraiteRequete(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processusTraiteRequete(request, response);
	}

	protected void processusTraiteRequete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String actionName = request.getParameter(ACTION_TYPE);
		String destinationPage = ERROR_PAGE;
		// execute l'action
		if (LISTER_RADHERENT.equals(actionName)) {
			try {

				Service unService = new Service();
				request.setAttribute("mesAdherents", unService.consulterListeAdherents());

			} catch (MonException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			destinationPage = "/listerAdherent.jsp";
		}
		else
		if (AJOUTER_ADHERENT.equals(actionName)) {

			destinationPage = "/ajouterAdherent.jsp";
		} else if (INSERER_ADHERENT.equals(actionName)) {
			try {
				Adherent unAdherent = new Adherent();
				unAdherent.setNomAdherent(request.getParameter("txtnom"));
				unAdherent.setPrenomAdherent(request.getParameter("txtprenom"));
				unAdherent.setVilleAdherent(request.getParameter("txtville"));
				Service unService = new Service();
				unService.insertAdherent(unAdherent);

			} catch (MonException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			destinationPage = "/index.jsp";
		}
		else
		if (LISTER_OEUVRE.equals(actionName)) { // Affiche la liste des oeuvres
			try {

				Service unService = new Service();
				request.setAttribute("mesOeuvresV", unService.consulterListeOeuvresV());

			} catch (MonException e) {
				e.printStackTrace();
			}
			destinationPage = "/listerOeuvre.jsp";
		}
		else
		if (RESERVER_MENU.equals(actionName)) { // affiche le menu de réservation
			try {
				Service unService = new Service();

				// on retourne la liste des adhérents pour le select
				request.setAttribute("mesAdherents", unService.consulterListeAdherents());

				// on récupère l'oeuvre correspondant à l'id en paramètre
				Oeuvrevente oeuvrevente = unService.rechercherOeuvreIdParam(
						Integer.valueOf(request.getParameter("idOeuvre")));

				// on renvoi l'oeuvre pour initialiser les champs du formulaire
				request.setAttribute("oeuvre", oeuvrevente);
			} catch (MonException e) {
				e.printStackTrace();
			}
			destinationPage = "/reserverOeuvre.jsp";

		} else if (RESERVER_OEUVRE.equals(actionName)) { // réserve l'oeuvre
			try {
				Service unService = new Service();
				Reservation reservation = new Reservation();

				// On récupère l'adhérent
				int idAdherent = Integer.valueOf(request.getParameter("idAdherent"));
				Adherent adherent = unService.consulterAdherent(idAdherent);

				// on récupère l'oeuvre
				int idOeuvrevente = Integer.valueOf(request.getParameter("idOeuvre"));
				Oeuvrevente oeuvrevente = unService.rechercherOeuvreIdParam(idOeuvrevente);

				// On parse la date fournie
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String sDate = request.getParameter("date");
				Date date = null;
				try {
					date = sdf.parse(sDate);

					// Si le parse est OK, on réserve
					reservation.setAdherent(adherent);
					reservation.setDate(date);
					reservation.setOeuvrevente(oeuvrevente);
					reservation.setStatus("reservee");

					unService.reserverOeuvre(reservation);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			} catch (MonException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			destinationPage = "/index.jsp";
			//destinationPage = "/listerOeuvre.jsp";
		}
		else if (FORM_MODIFIER_OEUVRE.equals(actionName)) // formulaire de modification d'oeuvre
		{
			try{

				// On récupère tous les propriétaires
				Service unService = new Service();
				request.setAttribute("mesProp", unService.consulterListeProp());

				// On récupère les caractéristiques de l'oeuvre
				request.setAttribute("oeuvre", unService.rechercherOeuvreIdParam(Integer.valueOf(request.getParameter("idOeuvre"))));
			}
			catch (MonException e)
			{
				e.printStackTrace();
			}

			destinationPage = "/modifierOeuvre.jsp";

		}
		else if(MODIFIER_OEUVRE.equals(actionName)) // Modifier une oeuvre
		{
			try{
				//Création du service
				Service unService = new Service();

				//Récupération de l'oeuvre à modifier
				int idOeuvrevente = Integer.valueOf(request.getParameter("idOeuvre"));
				Oeuvrevente oeuvrevente = unService.rechercherOeuvreIdParam(idOeuvrevente);

				String titreOeuvrevente = request.getParameter("txttitre").toString();
				oeuvrevente.setTitreOeuvrevente(titreOeuvrevente);

				float prixOeuvrevente = Float.valueOf(request.getParameter("txtprix"));
				oeuvrevente.setPrixOeuvrevente(prixOeuvrevente);

				Proprietaire propOeuvrevente = unService.rechercherProprietaire(Integer.valueOf(request.getParameter("prop")));
				oeuvrevente.setProprietaire(propOeuvrevente);

				unService.modifierOeuvre(oeuvrevente);
			}
			catch (MonException e)
			{
				e.printStackTrace();
			}
			destinationPage = "/index.jsp";
		}

		else {
			String messageErreur = "[" + actionName + "] n'est pas une action valide.";
			request.setAttribute(ERROR_KEY, messageErreur);
		}

		// Redirection vers la page jsp appropriee
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(destinationPage);
		dispatcher.forward(request, response);

	}

}
