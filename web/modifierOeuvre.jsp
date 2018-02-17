<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modifier une oeuvre</title>
</head>
<SCRIPT language="Javascript" type="text/javascript">
    <script type="text/javascript" src="js/foncControle.js"></script>


<body>
<H1> Formulaire de modifications d'oeuvres </H1>

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
<BR>
</body>
</html>