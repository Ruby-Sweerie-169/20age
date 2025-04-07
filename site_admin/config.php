<!-- Para a configuração com a base de dados -->

<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "bd_02";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
?>