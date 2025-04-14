<?php
include 'config.php';

$id = intval($_GET['id']);

$stmt = $conn->prepare("DELETE FROM categorias WHERE id=?");
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    echo "Categoria eliminada com sucesso!";
} else {
    echo "Erro ao eliminar: " . $conn->error;
}

$conn->close();
header('Location: listar_categorias.php');
?>