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
        <div class="form-group row">
            <label for="titre" class="col-sm-2 col-form-label">Titre de l'oeuvre </label>
            <input name="titre" class="form-control-plaintext" id="titre" value="${oeuvre.titreOeuvrevente}" readonly>
        </div>

        <div class="form-group row">
            <label for="prix" class="col-sm-2 col-form-label">Prix </label>
            <input name="prix" class="form-control-plaintext" id="prix" value="${oeuvre.prixOeuvrevente}" readonly>
        </div>

        <!-- Champs à remplir -->
        <div class="form-group row">
            <label for="date" class="col-sm-2 col-form-label">Date Réservation </label>
            <input type="date" class="form-control" name="date" id="date" required>
        </div>

        <div class="form-group row">
            <label for="adherent" class="col-sm-2 col-form-label">Adherent </label>
            <select name="idAdherent" class="form-control" id="adherent" required>
                <c:forEach items="${mesAdherents}" var="adherent">
                    <option value="${adherent.idAdherent}">${adherent.prenomAdherent} ${adherent.nomAdherent}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Bouton Réserver -->
        <input class="btn btn-primary" type="submit" name="bt" value="Réserver">
        <a class="btn btn-light" href="Controleur?action=listerOeuvres">Annuler</a>
     </form>
</div>
</body>
</html>