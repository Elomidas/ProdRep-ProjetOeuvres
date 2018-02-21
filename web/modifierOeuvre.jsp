<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					Formulaire de modification d'oeuvres
				</h2>
			</div>
		</div>

<div align="center">
	<form  name='identification' method="post" action="Controleur?action=insererAdherent" onsubmit="return teste()">
		<p align="left">
			<font face="Arial" color="#004080"></font>
			<font face="Arial" color="#004080"> <br>&nbsp;  &nbsp;  &nbsp; Nom de l'adherent : </font>
			<input type="text" name="txtnom" value=""  id ="nom"> <br>
			<font face="Arial" color="#004080">
				<br>Prenom de l'adherent : </font>
			<input type="text" name="txtprenom"  id ="prenom"  > <br>

			<font face="Arial" color="#004080"> <br>&nbsp;  &nbsp;  &nbsp; Ville de l'adherent :</font>
			<input type="text" name="txtville" id ="ville">
			<font face="Arial" color="#004080">	<br></font><br>

			<!-- Boutons Ajouter -->

			<input type="submit" name="bt"  value="Modifier" >
			<font face="Arial" color="#004080"></font>
			&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		</p></form>
</div>
</jsp:body>
</t:layout>