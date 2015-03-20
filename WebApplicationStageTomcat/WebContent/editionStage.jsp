<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajout d'un stage </title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/all.css">
	
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script language=javascript>
  function verif()
  {
  if(document.getElementById("id").value == "" || 
     document.getElementById("libelle").value == "" || 
     document.getElementById("datedebut").value == "" ||
     document.getElementById("datefin").value == "")
       { alert("Un des champs n'est pas rempli !"); 
         return false; 
       }
  else
    return true;
  }
  function Chargement()
  {
      var obj = document.getElementById("id_erreur");
      if (obj.value!='')
         alert('Erreur signalée  : "'+obj.value+"'");
  }
  </script>
</head>
<body  onLoad="Chargement();">
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
      	<li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Accueil </a></li>
        <li><a href="Controleur?action=saisieStage">Saisie d'un stage <span class="sr-only">(current)</span></a></li>
        <li><a href="Controleur?action=afficheStage">Affichage liste des stages</a></li>
<!--          <li><a href="Controleur?action=rechercheStage">Recherche d'un stage</a></li> -->
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


<section class="content"></section>
<div class="page-header">
	<h3>Formulaire d'édition de stage</h3>
</div>
  
  
  
 <input type ="hidden" name="uneErreur"  value="${MesErreurs}"  id ="id_erreur" >
 <form method="post" action="Controleur" onsubmit="return verif();" class="form-horizontal formStage">
 <fieldset>
 <input type="hidden" name="type" value="ajout"  id="type"/>
 <input type="hidden" name="action" value="editerStage" />


<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="id">Numéro</label>
  <div class="controls">
    <input id="id" name="id" placeholder="" class="input-medium" required="" type="text" value="${stage.id}" required  reaedonly pattern="\d+">
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="libelle">Libellé</label>
  <div class="controls">
    <input id="libelle" name="libelle" placeholder="" class="input-medium" type="text" value="${stage.libelle}" required>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="datedebut">Date de début</label>
  <div class="controls">
   	<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${stage.datedebut}" pattern="dd/MM/yyyy" var="datedebut"/>
    <input id="datedebut" name="datedebut" placeholder="JJ/MM/AAAA" class="input-medium" type="text" value="${datedebut}" required pattern="\d{1,2}/\d{1,2}/\d{4}">
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="datefin">Date de fin</label>
  <div class="controls">
   	<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${stage.datefin}" pattern="dd/MM/yyyy" var="datefin"/>
    <input id="datefin" name="datefin" placeholder="JJ/MM/AAAA" class="input-medium" type="text" value="${datefin}" required pattern="\d{1,2}/\d{1,2}/\d{4}">
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="nbplaces">Nombre de places</label>
  <div class="controls">
    <input id="nbplaces" name="nbplaces" placeholder="0" class="input-medium" type="text" value="${stage.nbplaces}" required pattern="\d+">
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="nbinscrits">Nombre d'inscrits</label>
  <div class="controls">
    <input id="nbinscrits" name="nbinscrits" placeholder="0" class="input-medium" type="text"value="${stage.nbinscrits}" required pattern="\d+">
  </div>
</div>

<!-- Button (Double) -->
<div class="control-group">
  <label class="control-label" for="ajouter"></label>
  <div class="controls">
  	<input type="submit" name="editer" value="Editer" class="btn btn-success"/>
	<input type="reset" name="reset" value="Reset" class="btn btn-info"/>
  </div>
</div>

</fieldset>
</form>
  
  
<footer>All rights reserved © 2015 - Sébastien Duret & Marc-Antoine Sayn-Urpar</footer>
</body>
</html>
