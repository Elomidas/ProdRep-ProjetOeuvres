<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Affichage de toutes les oeuvres en vente</title>
</head>
<body>
<P>
    <A href="index.jsp"><FONT face="Arial" color="#004080">Retour
        Accueil</FONT></A>
</P>
<P align="center">
    <FONT face="Arial" size="5" color="#004080"><U> <STRONG>Listing&nbsp;des
        oeuvres en vente </STRONG></U></FONT>
</P>

<TABLE BORDER="1">
    <CAPTION>Tableau des Oeuvres en vente</CAPTION>
    <TR>
        <TH>Numero</TH>
        <TH>Titre</TH>
        <TH>Etat/TH>
        <TH>Prix</TH>
        <TH>Propriétaire</TH>

    </TR>

    <c:forEach items="${mesOeuvresV}" var="item">
        <tr>
            <td>${item.idOeuvrevente}</td>
            <td>${item.titreOeuvrevente}</td>
            <td>${item.etatOeuvrevente}</td>
            <td>${item.prixOeuvrevente}</td>
            <td>${item.proprietaire}</td>
        </tr>
    </c:forEach>
</TABLE>
</body>
</html>