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
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js">
	
</script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js">
	
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
			class="navbar-brand" href="Accueil.jsp">MediaBrette</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
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
	<!-- Carousel -->
	<div class="container-fluid py-5 text-center"
		style="background-color: black;">
		<c:if
			test="${ !empty sessionScope.login && !empty sessionScope.password}">
			<p style="color: white;">Bienvenue ${ sessionScope.login }</p>
		</c:if>
	</div>
	<div id="carousel" class="carousel slide carousel-fade"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carousel" data-slide-to="0" class="active"></li>
			<li data-target="#carousel" data-slide-to="1"></li>
			<li data-target="#carousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item active">
				<div class="view">
					<img class="d-block w-100"
						src="https://cdn.discordapp.com/attachments/689728081765859328/822411371005476874/image0.png"
						alt="Premiere slide">
					<div class="mask rgba-black-light"></div>
				</div>
				<div class="carousel-caption">
					<h3 class="h3-responsive mb-4">
						<mark style="background-color: black; color: white;">Catalogue
							de documents</mark>
					</h3>
					<a class="btn btn-secondary px-5 py-2" href="catalogue.jsp"
						role="button"> Consulter </a>
				</div>
			</div>
			<div class="carousel-item">
				<div class="view">
					<img class="d-block w-100"
						src="https://cdn.discordapp.com/attachments/689728081765859328/822419939482009620/image0.jpg"
						alt="Deuxieme slide">
					<div class="mask rgba-black-strong"></div>
				</div>
				<div class="carousel-caption">
					<h3 class="h3-responsive mb-4">
						<mark style="background-color: black; color: white;"> Ajout
							de document </mark>
					</h3>
					<a class="btn btn-secondary px-5 py-2" href="AjoutDocument.jsp"
						role="button"> Ajouter</a>
				</div>
			</div>
			<div class="carousel-item">
				<div class="view">
					<img class="d-block w-100"
						src="https://cdn.discordapp.com/attachments/689728081765859328/822425885277552670/image0.jpg"
						alt="Troisième slide">
					<div class="mask rgba-black-strong"></div>
				</div>
				<div class="carousel-caption">
					<h3 class="h3-responsive mb-4">
						<mark style="background-color: black; color: white;">
							Crédits</mark>
					</h3>
					<a class="btn btn-secondary px-5 py-2" href="credits.jsp"
						role="button"> Consulter</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Fin Carousel -->
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