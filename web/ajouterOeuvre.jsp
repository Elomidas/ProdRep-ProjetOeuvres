<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ajouter une oeuvre</title>
</head>


<body>
<h1> Ajout d'une oeuvre </h1>

<div>
    <form name='ajouterOeuvre' method="post" action="Controleur?action=insererOeuvre">
        <div class="form-group row">
            <label for="titre" class="col-sm-2 col-form-label">Titre de l'oeuvre </label>
            <input name="titre" class="form-control" id="titre" value="">
        </div>

        <div class="form-group row">
            <label for="prix" class="col-sm-2 col-form-label">Prix </label>
            <input type="number" name="prix" class="form-control" id="prix" value="">
        </div>

        <div class="form-group row">
            <label for="proprietaire" class="col-sm-2 col-form-label">Propriétaire </label>
            <select name="idProprietaire" class="form-control" id="proprietaire" required>
                <c:forEach items="${mesProprietaires}" var="prop">
                    <option value="${prop.idProprietaire}">${prop.prenomProprietaire} ${prop.nomProprietaire}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Bouton Ajouter -->
        <input class="btn btn-primary" type="submit" name="bt" value="Ajouter">
        <a class="btn btn-light" href="index.jsp">Annuler</a>

    </form>
</div>
</body>
</html>