package controle;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Date;

import meserreurs.MonException;
import metier.Stage;

@WebServlet("/Controleur")
public class Controleur extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private static final String ACTION_TYPE = "action";
	private static final String SAISIE_STAGE = "saisieStage";
	private static final String AFFICHER_STAGE = "afficheStage";
	private static final String RECHERCHER_STAGE = "rechercheStage";
	private static final String CHERCHER_STAGE = "chercheStage";
	private static final String AJOUT_STAGE = "ajoutStage";
	private static final String MODIFIER_STAGE = "modifierStage";
	private static final String EDITER_STAGE = "editerStage";
	private static final String SUPPRIMER_STAGE = "supprimerStage";
	private static final String ERROR_PAGE = null;

	// le format est une combinaison de MM dd yyyy avec / ou �
		// exemple dd/MM/yyyy
		public Date conversionChaineenDate(String unedate, String unformat) throws Exception{
			Date datesortie;
			// on d�finit un format de sortie
			SimpleDateFormat defFormat = new SimpleDateFormat(unformat,Locale.FRANCE);
			datesortie = defFormat.parse(unedate);
			
			return datesortie;
		}


	protected void processusTraiteRequete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, MonException, Exception {
			String actionName = request.getParameter(ACTION_TYPE);
			String destinationPage = ERROR_PAGE;
			List<Stage> listeStages = null;
			// execute l'action

			if (SAISIE_STAGE.equals(actionName)){
				request.setAttribute("stage", new Stage());
				destinationPage = "/saisieStage.jsp";
			}else if (AJOUT_STAGE.equals(actionName)){
				try	{
					Stage unStage = new Stage();
					unStage.setId(request.getParameter("id"));
					unStage.setLibelle(request.getParameter("libelle"));
					unStage.setDatedebut(conversionChaineenDate(request.getParameter("datedebut"), "dd/MM/yyyy"));
					unStage.setDatefin(conversionChaineenDate(request.getParameter("datefin"), "dd/MM/yyyy"));
					unStage.setNbplaces(Integer.parseInt(request.getParameter("nbplaces")));
					unStage.setNbinscrits(Integer.parseInt(request.getParameter("nbinscrits")));
//					unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbplaces"))).intValue());
//					unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbinscrits"))).intValue());
					unStage.insertionStage();
					destinationPage = "/index.jsp";
				} catch (Exception e){
					request.setAttribute("MesErreurs", e.getMessage());
					System.out.println(e.getMessage());
				}
			} else if (AFFICHER_STAGE.equals(actionName)){
				try	{
					Stage unStage = new Stage();
					request.setAttribute("affichageListe", 1);
					listeStages=unStage.rechercheLesStages();
					request.setAttribute("liste", listeStages);
					destinationPage = "/afficherStages.jsp";
				} catch (MonException e){
					request.setAttribute("MesErreurs", e.getMessage());
					destinationPage = "/Erreur.jsp";
				}
			} else if (MODIFIER_STAGE.equals(actionName)){
				try{
					Stage unStage = new Stage();
					listeStages = unStage.rechercheLesStages();
					String id = request.getParameter("id");
					// Get the stage to delete
					for (Stage s : listeStages){
						if (s.getId().equals(id)){
							unStage = s;
							break;
						}
					}
					request.setAttribute("stage", unStage);
					destinationPage = "/editionStage.jsp";
				} catch (MonException e){
					request.setAttribute("MesErreurs", e.getMessage());
					destinationPage = "/Erreur.jsp";
				}
			} else if (EDITER_STAGE.equals(actionName)){
				try{
					Stage unStage = new Stage();
					unStage.setId(request.getParameter("id"));
					unStage.setLibelle(request.getParameter("libelle"));
					unStage.setDatedebut(conversionChaineenDate(request.getParameter("datedebut"), "dd/MM/yyyy"));
					unStage.setDatefin(conversionChaineenDate(request.getParameter("datefin"), "dd/MM/yyyy"));
					unStage.setNbplaces(Integer.parseInt(request.getParameter("nbplaces")));
					unStage.setNbinscrits(Integer.parseInt(request.getParameter("nbinscrits")));
					unStage.editionStage();
					destinationPage = "/index.jsp";					
				} catch (MonException e){
					request.setAttribute("MesErreurs", e.getMessage());
					destinationPage = "/Erreur.jsp";
				}				
			} else if (SUPPRIMER_STAGE.equals(actionName)){
				try {
					Stage unStage = new Stage();
					listeStages = unStage.rechercheLesStages();
					String id = request.getParameter("id");
					// Get the stage to delete
					for (Stage s : listeStages){
						if (s.getId().equals(id)){
							unStage = s;
							break;
						}
					}
					// Remove in the db
					unStage.suppressionStage();
					// Remove to the list
					listeStages.remove(unStage);
					request.setAttribute("liste", listeStages);
					destinationPage = "/afficherStages.jsp";
				} catch (MonException e){
					request.setAttribute("MesErreurs", e.getMessage());
					destinationPage = "/Erreur.jsp";
				}
			}
			// Redirection vers la page jsp appropriee 
			RequestDispatcher dispatcher =getServletContext().getRequestDispatcher(destinationPage);
	           dispatcher.forward(request, response); 
	  } 

	//L�appel de cette proc�dure se fait avec :

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			try
			  {
				processusTraiteRequete(request, response);
					  }
			catch( Exception e)
				{
					e.printStackTrace(); }
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			try
			  {
				processusTraiteRequete(request, response);
			  }
			catch( Exception e)
				{
					e.printStackTrace();;
				}
		}
}