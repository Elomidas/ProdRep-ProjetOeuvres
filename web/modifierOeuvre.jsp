<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
	<jsp:attribute name="head">
		<title>Modifier une oeuvre</title>
	</jsp:attribute>

	<jsp:attribute name="scripts">
		<script language="Javascript" type="text/javascript"></script>
		<script type="text/javascript" src="js/foncControle.js"></script>
	</jsp:attribute>


	<jsp:body>
		<div class="row">
			<div class="col-xs-8 col-xs-offset-2">
				<h2 class="center">
					Formulaire de modifications d'oeuvres
				</h2>
			</div>
		</div>

		<DIV align="center">
			<FORM  name='identification' method="post" action="Controleur?action=modifierOeuvre" onsubmit="return testeOeuvre()">
				<!-- Champ caché -->
				<input type="hidden" name="idOeuvre" value="${oeuvre.idOeuvrevente}">

				<P align="left"><FONT face="Arial" color="#004080"></FONT>
					<FONT face="Arial" color="#004080"> <BR>&nbsp;  &nbsp;  &nbsp; Titre de l'oeuvre : </FONT>
					<INPUT type="text" name="txttitre" value="${oeuvre.titreOeuvrevente}"  id ="titre"> <BR>
					<FONT face="Arial" color="#004080">
						<BR>Prix : </FONT>
					<INPUT type="text" name="txtprix" value="${oeuvre.prixOeuvrevente}" id ="prix"> <BR>

					<FONT face="Arial" color="#004080"> <BR>&nbsp;  &nbsp;  &nbsp; Propriétaire :</FONT>
					<select name="prop">
						<c:forEach items="${mesProp}" var="item">
							<option value="${item.idProprietaire}">${item.nomProprietaire}</option>
						</c:forEach>
					</select>

					<FONT face="Arial" color="#004080">	<BR></FONT><BR>

					<!-- Boutons Ajouter -->

					<INPUT type="submit" name="bt"  value="Modifier" >
					<FONT face="Arial" color="#004080"></FONT>
					&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-light" href="Controleur?action=listerOeuvre">Annuler</a>

				</P></FORM>
		</DIV>
</jsp:body>
</t:layout>