<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Ajouter un Adhérent</title>

	<script src="js/jQuery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/custom.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap-grid.min.css.css" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap-reboot.min.css" />
	<link rel="stylesheet" type="text/css" href="css/custom.css">
</head>

<script type="text/javascript" src="js/foncControle.js">
</script>

<body>
	<div class="container" style="margin-top: 15px;">
		<div class="row">
			<div class="col-xs-8 col-xs-offset-2 center">
				<img class="col-xs-6 col-xs-offset-3 col-md-2 col-md-offset-0" style="vertical-align: middle;" src="img/polytech.png">
				<h1 class="blue col-xs-12 col-md-10">Médiathèque de POLYTECH</h1>
			</div>
		</div>
		<div class="row">
			<h2 class="col-sm-12">
				Ajout d'un adhérent
			</h2>
		</div>

		<br />
		<br /> 

		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<form  name='identification' method="post" action="Controleur?action=insererAdherent" onsubmit="return teste()">
					<p align="left">
						<font face="Arial" color="#004080">
						</font>     
						<font face="Arial" color="#004080">
							<br />&nbsp;  &nbsp;  &nbsp; Nom de l'adherent : 
						</font>
						<input type="text" name="txtnom" value=""  id ="nom" /> <br />
						<font face="Arial" color="#004080">
							<br />Prenom de l'adherent : 
						</font>
						<input type="text" name="txtprenom"  id ="prenom" /> <br />

						<font face="Arial" color="#004080"> <br />&nbsp;  &nbsp;  &nbsp; Ville de l'adherent :</font>
						<input type="text" name="txtville" id ="ville" />
						<font face="Arial" color="#004080">	<br /></font>
						<br />

						<!-- Boutons Ajouter -->

						<input type="submit" name="bt"  value="Ajouter" />
						<font face="Arial" color="#004080"></font>
						&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>