<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<meta charset="UTF-8">

<head>
<title>MediaBrette | La meilleure des médiathèques</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous">
	
</script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous">
	
</script>
<link rel="stylesheet" type="text/css" href=".\bootstrap.min.css" />
<link rel="icon" type="image/png"
	href="https://cdn.discordapp.com/attachments/689728081765859328/822385756311650314/logoMediabrette.png" />
</head>
<style>
.carousel {
	height: auto;
	width: auto;
}
</style>

<body style="background-color: black;">
	<nav class="navbar navbar-expand-lg navbar-dark bg-black">
		<img
			src="https://cdn.discordapp.com/attachments/689728081765859328/822385756311650314/logoMediabrette.png"
			width="90" class="d-inline-block align-middle mr-2"></a> <a
			class="navbar-brand" href="#">MediaBrette</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="container">
			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="Accueil.jsp">Accueil </a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath() + "/catalogue.jsp"%>">Catalogue</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="AjoutDocument.jsp">Ajouter un document</a></li>
					<li class="nav-item"><a class="nav-link" href="credits.jsp">Crédits</a>
					</li>
				</ul>
				<form class="form-inline my-lg-3" action="Deconnexion" method="POST">
					<button type="submit" class="btn btn-secondary my-sm-2">Déconnexion</button>
				</form>
			</div>
	</nav>
	<div class="container py-4">
		<h1 class="text-center display-2" style="color: white;">Ajouter
			un document</h1>
	</div>
	<div class="container py-4">
		<form action="AjoutServlet" method="POST">
			<fieldset>
				<legend style="color: white;">Veuillez remplir les champs
					suivants pour ajouter le document au catalogue</legend>
				<div class="form-group">
					<label for="TitreDoc" style="color: white;">Titre du
						document</label> <input name="titre" type="text" class="form-control"
						id="TitreDoc" placeholder="Exemple : Les Misérables">
				</div>
				<div class="form-group">
					<label for="AuteurDoc" style="color: white;">Auteur du
						document</label> <input name="auteur" type="text" class="form-control"
						id="AuteurDoc" placeholder="Exemple : Victor Hugo">
				</div>
				<div class="form-group">
					<label for="TypeDoc" style="color: white;">Type de document</label>
					<select class="form-control" id="TypeDoc" name="type">
						<option value="1">Livre</option>
						<option value="2">CD</option>
						<option value="3">DVD</option>
					</select>
				</div>
			</fieldset>
			<button type="submit" name="btnAjt" class="btn btn-success">Ajouter</button>
			</fieldset>
		</form>
	</div>
	<footer class="footer">
		<div class="footer text-center" style="background-color: black;">
			<div class="container" style="background-color: black;">
				<div class="row">
					<div class="col-12" style="background-color: black;">
						<p class="text-white lead blockquote-footer py-4">© Par
							Souccouchetty Darlène & Tan Lucie</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>