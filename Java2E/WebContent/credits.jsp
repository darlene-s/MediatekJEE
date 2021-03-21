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
		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="Accueil.jsp">Accueil </a></li>
				<li class="nav-item"><a class="nav-link" href="catalogue.jsp">Catalogue</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="AjoutDocument.jsp">Ajouter un document</a></li>
				<li class="nav-item"><a class="nav-link" href="credit.jsp">Crédits</a>
				</li>
			</ul>
			<form class="form-inline my-lg-3" action="Deconnexion" method="POST">
				<button type="submit" class="btn btn-secondary my-sm-2">Déconnexion</button>
			</form>
		</div>
	</nav>
	<div class="container py-4">
		<h1 class="text-center display-2" style="color: white;">Crédits</h1>
	</div>
	<blockquote class="blockquote text-center py-5" style="color: white;">
		<p class="mb-0">Site réalisé par dans le cadre du module JavaEE
			encadré par M.Brette | En HTML/Bootstrap | JavaEE (Eclipse) | SQL
			(Oracle XE)</p>
		<footer class="blockquote-footer" style="color: white;">
			IUT de Paris Rives de Seine | Département Informatique 2A<cite
				title="Source Title"> | Souccouchetty Darlène - Groupe 205 &
				Tan Lucie - Groupe 202 </cite>
		</footer>
	</blockquote>
	<footer class="footer fixed-bottom">
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