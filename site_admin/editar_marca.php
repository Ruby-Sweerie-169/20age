<?php
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $marca = $_POST['marca'];

    $stmt = $conn->prepare("UPDATE marca SET marca=? WHERE id=?");
    $stmt->bind_param("si", $marca,$id);

    if ($stmt->execute()) {
        header('Location: listar_marca.php');
        exit;
    } else {
        echo "Erro ao editar marca: " . $stmt->error;
    }
    $stmt->close();
} else {
    if (!isset($_GET['id'])) {
        die("ID não fornecido na URL.");
    }
    $id = intval($_GET['id']);

    $sql = "SELECT * FROM marca WHERE id = $id";
    $result = $conn->query($sql);
    
    if ($result->num_rows == 0) {
        die("Marca não encontrada.");
    }
    
    $marcaDados = $result->fetch_assoc();
}
    $conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar marca</title>
</head>
<body>
    <h1>Editar marca</h1>
    <form method="POST" action="">
        <input type="hidden" name="id" value="<?php echo $marcaDados['id']; ?>">
        
        <label for="marca">Marca:</label>
        <input type="text" name="marca" value="<?php echo $marcaDados['marca']; ?>" required>

        <input type="Submit" value="Alterar">
    </form><br /><br />

    <a href="pagina_inicial.php">Voltar</a>
</body>
</html>