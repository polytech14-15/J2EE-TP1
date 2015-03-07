<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Home</title>
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
      <a class="navbar-brand" href="#">Gestion des Stages  HIGH TECH</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      	<li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Accueil <span class="sr-only">(current)</span></a></li>
        <li><a href="Controleur?action=saisieStage">Saisie d'un stage </a></li>
        <li><a href="Controleur?action=afficheStage">Affichage liste des stages</a></li>
<!--          <li><a href="Controleur?action=rechercheStage">Recherche d'un stage</a></li> -->
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<section class="content">
	<div class="page-header">
		<H1> Gestion des Stages  HIGH TECH </H1>
	</div>
	<H4> Nous sommes le <%= DateFormat.getDateTimeInstance(DateFormat.FULL,DateFormat.FULL).format(new Date()) %> </H4>
	<div id="menu">
	  <ul>
	      <li><a href="Controleur?action=saisieStage">Saisie d'un stage</a></li>
	      <li><a href="Controleur?action=afficheStage">Affichage liste des stages</a></li>
	      <!--  <li><a href="Controleur?action=rechercheStage">Recherche d'un stage</a></li>   -->
	  </ul>
	</div>
</section>

<footer>All rights reserved © 2015 - Sébastien Duret & Marc-Antoine Sayn-Urpar</footer>

</body>
</html> 
