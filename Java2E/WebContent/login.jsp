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
<body style="background-color: black;">
	<div class="text-center">
		<img
			src="https://cdn.discordapp.com/attachments/689728081765859328/822385756311650314/logoMediabrette.png"
			alt="Bootstrap" class="img-rounded w-25 p-3">
		<h1 class="display-3" style="background-color: white;">Bienvenue
			sur le site de MediaBrette !</h1>
	</div>
	<% if(request.getAttribute("msg")!=null){
		%>
		 <div class="alert alert-dismissible alert-danger">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <h4 class="alert-heading">Connexion échouée</h4>
        <p class="mb-0">Mot de passe ou login invalide !</p>
      </div>
      <% 
	}%>
	<div class="container pt-2 pb-5">
		<form action="Connexion" method="POST">
			<fieldset>
				<legend class="text-center py-4 display-4" style="color: white;">Connexion</legend>
				<h3 class="text-center" style="color: white;">Espace
					bibliothécaires</h3>
				<div class="container d-flex justify-content-center">
					<div class="form-group">
						<label for="LoginImput" style="color: white;"> Identifiant</label>
						<input name="login" class="form-control" id="LoginImput"
							placeholder="Identifiant" style="width: 800px;" />
					</div>
				</div>
				<div class="container d-flex justify-content-center">
					<div class="form-group">
						<label for="MdpImput" style="color: white;">Mot de passe</label> <input
							name="password" type="password" class="form-control"
							id="MdpImput" placeholder="Mot de passe" style="width: 800px;" />
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-sm">
							<div class="text-center py-4">
								<button type="submit" class="btn btn-secondary">Se
									connecter</button>
							</div>
						</div>
						<div class="col-sm">
							<div class="text-center py-4">
								<a class="btn btn-secondary" href="index.jsp" role="button">Retour</a>
							</div>
						</div>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</body>