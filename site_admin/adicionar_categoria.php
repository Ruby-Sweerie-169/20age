<?php
include "config.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $categoria = $_POST['categoria'];

    $stmt = $conn->prepare("INSERT INTO categorias (categoria) VALUES (?)");
    if ($stmt === false) {
        die("Erro na preparação do statement: " . $conn->error);
    }

    $stmt->bind_param("s", $categoria);

    if ($stmt->execute()) {
        header('Location: listar_categorias.php');
        exit;
    } else {
        echo "Erro ao adicionar categoria: " . $stmt->error;
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nova Categoria</title>
</head>
<body>
    <h1>Adicionar nova categoria</h1>
    <form method="POST" action="">
        <label>Categoria</label>
        <input type="text" name="categoria" required>

        <input type="Submit" value="Adicionar">
    </form><br /><br />
    
    <a href="pagina_inicial.php">Voltar</a>
</body>
</html>