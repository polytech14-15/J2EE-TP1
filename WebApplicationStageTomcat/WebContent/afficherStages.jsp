<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Affichage de tous les stages</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/all.css">
	
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="">Gestion des Stages  HIGH TECH</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      	<li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Accueil </a></li>
        <li><a href="Controleur?action=saisieStage">Saisie d'un stage <span class="sr-only">(current)</span></a></li>
        <li class="active"><a href="Controleur?action=afficheStage">Affichage liste des stages</a></li>
<!--          <li><a href="Controleur?action=rechercheStage">Recherche d'un stage</a></li> -->
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<section class="content">
<div class="page-header">
  <h3>Listing des Stages </STRONG></h3>
</div>

<div class="panel panel-default tableStages">
  <!-- Default panel contents -->
  <div class="panel-heading">Tableau des Stages</div>

  <!-- Table -->
  <table class="table">
	<TH>#</TH>
	<TH>Libellé</TH>
	<TH>Date début</TH>
	<TH>Date fin</TH>
	<TH>Nombre de places</TH>
	<TH>Nombre d'inscrits</TH>
	<TH>Actions</TH>

	<c:forEach items="${liste}" var="item">
		<tr>
			<td>${item.id}</td>
			<td>${item.libelle}</td>
			<td><fmt:formatDate type="both" dateStyle="short"
					timeStyle="short" value="${item.datedebut}" pattern="dd/MM/yyyy" />
			</td>
			<td><fmt:formatDate type="both" dateStyle="short"
					timeStyle="short" value="${item.datefin}" pattern="dd/MM/yyyy" />
			</td>

			<td>${item.nbplaces}</td>
			<td>${item.nbinscrits}</td>
			
			<td>
				<a href="Controleur?action=modifierStage&id=${item.id}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="Controleur?action=supprimerStage&id=${item.id}"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
			</td>

		</tr>
	</c:forEach>
</table>
</div>
</section>
   

<footer>All rights reserved © 2015 - Sébastien Duret & Marc-Antoine Sayn-Urpar</footer>
</body>
</html>
