<!DOCTYPE html>
<html lang="es">
<head>

	<title>Sistema de Ventas Online</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- LIBRERIAS BOOTSTRAP-->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="index.css">

	<!-- jQuery library -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" 
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" 
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" 
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<!-- Latest compiled JavaScript -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="formulario.js"></script>
</head>



<body>

<header>
    <h1 class="display-3" id=titulo>Bienvenido a Electronic Store</h1>
</header>

<form>
  <div class="form-group" id="formularioIniciarSesion">

  <div class="col">
        <label >Ingresa tu nombre de usuario: </label>
        <input type="text" class="form-control" placeholder="Nombre de usuario" id="user">
    </div>

    <div class="col">
        <label >Ingresa tu clave de usuario: </label>
        <input type="password" class="form-control" placeholder="Clave de Usuario" id="password">

    </div>
  </div>
  <button type="submit" class="btn btn-primary" id ="login">Iniciar Sesión</button>
  
</form>

<div id="registrarse-enlace">
    ¿No eres usuario de Electronic Store?
    <a href="signup.php">Regístrate</a>
</div>


</body>

</html>


