<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Réserver une oeuvre</title>
</head>

<body>
<h1>Réserver une oeuvre</h1>

<div>
    <form name='reservation' method="post" action="Controleur?action=reserverOeuvre">
        <!-- Champ caché -->
        <input type="hidden" name="idOeuvre" value="${oeuvre.idOeuvrevente}">

        <!-- Champs désactivés -->
        <div>
            <label for="titre">Titre de l'oeuvre </label>
            <input name="titre" id="titre" value="${oeuvre.titreOeuvrevente}" disabled>
        </div>

        <div>
            <label for="prix">Prix </label>
            <input name="prix" id="prix" value="${oeuvre.prixOeuvrevente}" disabled>
        </div>

        <!-- Champs à remplir -->
        <div>
            <label for="date">Date Réservation </label>
            <input type="date" name="date" id="date" required>
        </div>

        <div>
            <label for="adherent">Adherent </label>
            <select name="idAdherent" id="adherent" required>
                <c:forEach items="${mesAdherents}" var="adherent">
                    <option value="${adherent.idAdherent}">${adherent.prenomAdherent} ${adherent.nomAdherent}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Bouton Réserver -->
        <input class="btn btn-primary" type="submit" name="bt" value="Réserver">
        <a class="btn btn-light" href="Controleur?action=listerOeuvre">Annuler</a>
     </form>
</div>
</body>
</html>