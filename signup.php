<!DOCTYPE html>
<html lang="es">
<head>

	<title>Sistema de Ventas Online</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- LIBRERIAS BOOTSTRAP-->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="signup.css">

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
    <h1 class="display-4" id=titulo>Bienvenido a Delta Store</h1>
</header>

<form>
  <div class="form-group" id="formularioRegistrarse">
  <div class="col">
        <label >Ingresa su nombres: </label>
        <input type="text" class="form-control" placeholder="Nombres " id="newName">
    </div>
    <div class="col">
        <label >Ingresa sus apellidos: </label>
        <input type="text" class="form-control" placeholder="Apellidos" id="newLastName">
    </div>
    <div class="col">
        <label >Ingresa su edad: </label>
        <input type="text" class="form-control" placeholder="Edad" id="newAge">
    </div>
    <div class="col">
        <label >Ingresa su tarjeta de crédito: </label>
        <input type="text" class="form-control" placeholder="Tarjeta de Crédito" id="newCreditCard">
    </div>
    <div class="col">
        <label >Ingresa su número de celular: </label>
        <input type="text" class="form-control" placeholder="Número de Celular" id="newCellphone">
    </div>
    <div class="col">
        <label >Ingresa su dirección: </label>
        <input type="text" class="form-control" placeholder="Dirección" id="newAddress">
    </div>
    <div class="col">
        <label >Ingresa su correo electrónico: </label>
        <input type="text" class="form-control" placeholder="Correo Electrónico" id="newEmail">
    </div>
    <div class="col">
        <label >Ingresa un nombre de usuario: </label>
        <input type="text" class="form-control" placeholder="Nombre de usuario" id="newUser">
    </div>
    <div class="col">
        <label >Ingresa una clave de usuario: </label>
        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Clave de Usuario" id="newPassword">
    </div>

    
    
  </div>
  <button type="submit" class="btn btn-primary" id ="signup">Registrarse</button>
  
</form>


</body>

</html>







