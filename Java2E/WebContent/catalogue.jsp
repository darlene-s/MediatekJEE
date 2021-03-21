
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="mediatek2021.Document"%>
<%@ page import="persistantdata.documents.Documents"%>

<!DOCTYPE html>
<html lang="fr">
<meta charset="UTF-8">

<head>
<title>MediaBrette | La meilleure des médiathèques</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js">
	
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
			width="90" class="d-inline-block align-middle mr-2"></img> <a
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
				<li class="nav-item"><a class="nav-link" href="catalogue.jsp">Catalogue</a>
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
		<h1 class="text-center display-2" style="color: white;">Catalogue</h1>
	</div>
	<div class="container py-5">
		<fieldset>
			<legend style="color: white;">Catégories de documents</legend>
			<form class="form-inline my-lg-3" action="Catalogue" method="POST">
				<div class="form-group">
					<select class="choix" name="choix">
						<option value="null">Type de document</option>
						<option value="1">Livre</option>
						<option value="2">DVD</option>
						<option value="3">CD</option>
					</select>

					<button type="submit" class="btn btn-secondary my-sm-2"
						name="Valider">valider</button>

				</div>
			</form>
		</fieldset>
	</div>


	<%
	if (request.getAttribute("documents") != null) {
		ArrayList<Documents> data = (ArrayList<Documents>) request.getAttribute("documents");
		int i = 0;
		for (Document d : data) {
			i++;
	%>
	<div class="container pt-5">
		<div class="card mb-3" style="width: 18rem;">
			<h3 class="card-header">
				<%=d.data()[2]%>
			</h3>
			<div class="card-body">
				<h5 class="card-title">
					Auteur :
					<%=d.data()[1]%>
				</h5>
				<h6 class="card-subtitle text-muted">
					<%=d.data()[3]%>
				</h6>
			</div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><%=d.data()[4]%></li>
			</ul>
			<form class="form-inline my-lg-3" action="Catalogue" method="POST">
				<div class="card-body text-center">

					<button type="submit" class="btn btn-danger" name="btnSupprimer"
						value="<%=d.data()[0]%>">Supprimer</button>

				</div>
			</form>
		</div>
	</div>
	<%
	}
	}
	%>

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