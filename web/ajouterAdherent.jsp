<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
	<jsp:attribute name="head">
		<title>Ajouter un Adhérent</title>
	</jsp:attribute>

	<jsp:attribute name="scripts">
		<script type="text/javascript" src="js/fonctControle.js"></script>
	</jsp:attribute>

	<jsp:body>
		<div class="row">
			<div class="col-xs-2">
				<t:arrow></t:arrow>
			</div>
			<div class="col-xs-8">
				<h2 class="center">
					Ajout d'un adhérent
				</h2>
			</div>
		</div>

		<br /> 

		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<form  name='identification' method="post" action="Controleur?action=insererAdherent" onsubmit="return teste()">
					<div class="row">
						<div class="col-xs-4">
							<label for="nom">
								Nom de l'adhérent :
							</label>
						</div>
						<div class="col-xs-8">
							<input class="form-control" type="text" name="txtnom" value=""  id ="nom" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">
							<label for="prenom">
								Prenom de l'adhérent :
							</label>
						</div>
						<div class="col-xs-8">
							<input class="form-control" type="text" name="txtprenom"  id ="prenom" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">
							<label for="ville">
								Ville de l'adhérent :
							</label>
						</div>
						<div class="col-xs-8">
							<input class="form-control" type="text" name="txtville" id ="ville" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4 col-xs-offset-4">
							<!-- Boutons Ajouter -->
							<input type="submit" name="bt" class="btn btn-info btn-lg" value="Ajouter" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</jsp:body>
</t:layout>