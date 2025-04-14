<?php
include "config.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $marca = $_POST['marca'];

    $stmt = $conn->prepare("INSERT INTO marca (marca) VALUES (?)");
    if ($stmt === false) {
        die("Erro na preparação do statement: " . $conn->error);
    }

    $stmt->bind_param("s", $marca);

    if ($stmt->execute()) {
        header('Location: listar_marca.php');
        exit;
    } else {
        echo "Erro ao adicionar marca: " . $stmt->error;
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nova marca</title>
</head>
<body>
    <h1>Adicionar nova marca</h1>
    <form method="POST" action="">
        <label>Marca</label>
        <input type="text" name="marca" required>

        <input type="Submit" value="Adicionar">
    </form><br /><br />
    
    <a href="pagina_inicial.php">Voltar</a>
</body>
</html>