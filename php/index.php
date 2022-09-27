<?php

  $servername = trim(file_get_contents("/home/ubuntu/endpoint.txt"));
  $username = trim(file_get_contents("/home/ubuntu/username.txt"));
  $password = trim(file_get_contents("/home/ubuntu/password.txt"));
  //$password="password";

  $hostname = gethostname();
  echo "<h1> from: $hostname </h1>";
  echo "<p>";
  // echo "password: $password";
  // echo "<p>";

  // Create connection
  $conn = new mysqli($servername, $username, $password);

  // Check connection
  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }
  echo "Connected successfully";
  
?>
