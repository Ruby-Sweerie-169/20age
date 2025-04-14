<?php
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $descr = $_POST['descr'];
    $ano = $_POST['ano'];
    $id_marca = $_POST['id_marca'];
    $id_categoria = $_POST['id_categoria'];
    $preco = $_POST['preco'];
    $foto = $_POST['foto'];

    $stmt = $conn->prepare("UPDATE artigo SET descr=?, ano=?, id_marca=?, id_categoria=?, preco=?, foto=? WHERE id=?");
    $stmt->bind_param("siiidsi", $descr, $ano, $id_marca, $id_categoria, $preco, $foto, $id);

    if ($stmt->execute()) {
        header('Location: listar_artigos.php');
        exit;
    } else {
        echo "Erro ao editar artigo: " . $stmt->error;
    }
    $stmt->close();
} else {
    if (!isset($_GET['id'])) {
        die("ID não fornecido na URL.");
    }
    $id = intval($_GET['id']);

    // Corrigido: buscar só o artigo com esse ID
    $stmt = $conn->prepare("SELECT * FROM artigo WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows == 0) {
        die("Artigo não encontrado.");
    }
    
    $artigoDados = $result->fetch_assoc();
}
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Editar Artigo</title>
</head>
<body>
    <h1>Editar Artigo</h1>
    <form method="POST" action="">
        <input type="hidden" name="id" value="<?php echo $artigoDados['id']; ?>">

        <label>Descrição</label>
        <input type="text" name="descr" value="<?php echo $artigoDados['descr']; ?>" required><br /><br />
        
        <label>Ano</label>
        <input type="number" name="ano" value="<?php echo $artigoDados['ano']; ?>" required><br /><br />
        
        <label>Marca</label>
        <select name="id_marca" required>
            <?php
            $id_selecionado = $artigoDados['id_marca'];
            $stmt = $conn->prepare("SELECT * FROM marca");
            $stmt->execute();
            $marcas = $stmt->get_result();
            while ($row = $marcas->fetch_assoc()):
                $selected = ($row['id'] == $id_selecionado) ? "selected" : "";
                echo "<option value='{$row['id']}' $selected>{$row['marca']}</option>";
            endwhile;
            ?>
        </select><br /><br />
        
        <label>Categoria</label>
        <select name="id_categoria" required>
            <?php
            $id_categoria = $artigoDados['id_categoria'];
            $stmt = $conn->prepare("SELECT * FROM categorias");
            $stmt->execute();
            $categorias = $stmt->get_result();
            while ($row = $categorias->fetch_assoc()):
                $selected = ($row['id'] == $id_categoria) ? "selected" : "";
                echo "<option value='{$row['id']}' $selected>{$row['categoria']}</option>";
            endwhile;
            ?>
        </select><br /><br />

        <label>Preço</label>
        <input type="number" step="any" name="preco" value="<?php echo $artigoDados['preco']; ?>" required><br /><br />

        <label>URL da foto</label>
        <input type="text" name="foto" value="<?php echo $artigoDados['foto']; ?>" required><br /><br />

        <input type="submit" value="Alterar">
    </form><br />

    <a href="pagina_inicial.php">Voltar</a>
</body>
</html>
