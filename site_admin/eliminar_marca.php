<?php
session_start();
include 'config.php';

$id = intval($_GET['id']);

$stmt = $conn->prepare("DELETE FROM marca WHERE id=$id");
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    echo "Marca eliminada com sucesso!";
} else {
    echo "Erro ao eliminar: " . $conn->error;
}

$conn->close();
header('Location: listar_marca.php');
?>