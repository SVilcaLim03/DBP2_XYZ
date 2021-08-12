<?php
    session_start();
    require_once("../Repositories/Classes/Conexion.php");
    $connection = new Conexion;

    $conn = $connection->OpenConnection();

    $username = $_POST["user"];
    $password = $_POST["password"];

    $_SESSION["username"] = "$username";
    
       
    $query1 = "SELECT id_cliente FROM cliente_usuario WHERE username='$username' AND password='$password'";
    $query2 = "SELECT id_personal FROM personal WHERE username='$username' AND password='$password'";
    $query3 = "SELECT id_cargo FROM personal WHERE username='$username' AND password='$password'";

	$result1=mysqli_query($conn, $query1);
    $result2=mysqli_query($conn, $query2);
    $result3=mysqli_query($conn, $query3);

	if(mysqli_num_rows($result1) > 0)
	{
        echo 0;
        while ($registro = mysqli_fetch_array($result1))
        {
            $id = $registro["id"];
            $_SESSION["id"] = "$id";
        }
        $_SESSION["permisos"] = "user_employer";
    }
    else if (mysqli_num_rows($result2) > 0 and mysqli_fetch_field_direct($result3, 0) != 1)
    {
        echo 1;
        while ($registro = mysqli_fetch_array($result2))
        {
            $id = $registro["id"];
            $_SESSION["id"] = "$id";
        }
        $_SESSION["permisos"] = "user_client";
    }
    else if (mysqli_fetch_field_direct($result3, 0) == 1)
    {
        echo 2;
        while ($registro = mysqli_fetch_array($result3))
        {
            $id = $registro["id"];
            $_SESSION["id"] = "$id";
        }
        $_SESSION["permisos"] = "user_client";
    }
    else
    {
        echo 3;
    }

    $connection->CloseConnection();
    exit;
?>