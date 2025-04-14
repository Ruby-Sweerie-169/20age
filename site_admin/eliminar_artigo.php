<?php
include 'config.php';

$id = intval($_GET['id']);

$stmt = $conn->prepare("DELETE FROM artigo WHERE id = ?");
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    header('Location: listar_artigos.php');
    exit;
} else {
    echo "Erro ao eliminar: " . $stmt->error;
}

$stmt->close();
$conn->close();

?>