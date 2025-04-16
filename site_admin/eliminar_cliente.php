<?php
session_start();
include 'config.php';

$id = intval($_GET['id']);

$stmt = $conn->prepare("DELETE FROM users WHERE id = ?");
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    header('Location: listar_clientes.php');
    exit;
} else {
    echo "Erro ao eliminar cliente: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
