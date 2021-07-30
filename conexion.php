<?php
	
	$hostname="localhost";
	$username="root";
	$password="";
	$dbname="electrodomesticos_store";
	$usertable="persona";
	
	mysqli_connect($hostname,$username, $password)
	mysqli_select_db($dbname);
	
	# Comprobar si existe registro
	
	$query = “SELECT * FROM $usertable”;
	
	$result = mysqli_query($query);
	
	si($result){
		while($row = mysqli_fetch_array($result)){
			echo "Persona: ". $row ."br/>";
		}
	}
?>