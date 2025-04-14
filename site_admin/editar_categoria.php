<?php
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $categoria = $_POST['categoria'];

    $stmt = $conn->prepare("UPDATE categorias SET categoria=? WHERE id=?");
    $stmt->bind_param("si", $categoria,$id);

    if ($stmt->execute()) {
        header('Location: listar_categorias.php');
        exit;
    } else {
        echo "Erro ao editar categoria: " . $stmt->error;
    }
    $stmt->close();
} else {
    if (!isset($_GET['id'])) {
        die("ID não fornecido na URL.");
    }
    $id = intval($_GET['id']);

    $sql = "SELECT * FROM categorias WHERE id = $id";
    $result = $conn->query($sql);
    
    if ($result->num_rows == 0) {
        die("Categoria não encontrada.");
    }
    
    $categoriaDados = $result->fetch_assoc();
}
    $conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar categoria</title>
</head>
<body>
    <h1>Editar categoria</h1>
    <form method="POST" action="">
        <input type="hidden" name="id" value="<?php echo $categoriaDados['id']; ?>">
        
        <label for="marca">Categoria:</label>
        <input type="text" name="categoria" value="<?php echo $categoriaDados['categoria']; ?>" required>

        <input type="Submit" value="Alterar">
    </form><br /><br />

    <a href="pagina_inicial.php">Voltar</a>
</body>
</html>