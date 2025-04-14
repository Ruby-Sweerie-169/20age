<?php
include "config.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $descr = $_POST['descr'];
    $ano = $_POST['ano'];
    $id_marca = $_POST['id_marca'];
    $id_categoria = $_POST['id_categoria'];
    $preco = $_POST['preco'];
    $foto = $_POST['foto'];

    $stmt = $conn->prepare("INSERT INTO artigo (descr, ano, id_marca, id_categoria, preco, foto) VALUES (?,?,?,?,?,?)");
    if ($stmt === false) {
        die("Erro na preparação do statement: " . $conn->error);
    }

    $stmt->bind_param("siiiis", $descr, $ano,$id_marca,$id_categoria,$preco,$foto);

    if ($stmt->execute()) {
        header('Location: listar_artigos.php');
        exit;
    } else {
        echo "Erro ao adicionar artigo: " . $stmt->error;
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Novo Artigo</title>
</head>
<body>
    <h1>Adicionar novo artigo</h1>
    <form method="POST" action="">
        <label>Descrição</label>
        <input type="text" name="descr" required><br /><br />
        <label>Ano</label>
        <input type="number" name="ano" required><br /><br />
        
        <label>Marca</label>
        <select name="id_marca" id="id_marca" required>
            <?php
            $stmt = $conn->prepare("SELECT * from marca");
            $stmt->execute();
            $result = $stmt->get_result();

            while ($row = $result->fetch_assoc()):
                echo "<option value='{$row['id']}'>{$row['marca']}</option>";
            endwhile;
            ?>
        </select><br /><br />
        
        <label>Categoria</label>
        <select name="id_categoria" id="id_categoria" required>
            <?php
            $stmt = $conn->prepare("SELECT * from categorias");
            $stmt->execute();
            $result = $stmt->get_result();

            while ($row = $result->fetch_assoc()):
                echo "<option value='{$row['id']}'>{$row['categoria']}</option>";
            endwhile;
            $conn->close();    
            ?>
        </select><br /><br />

        <label>Preço</label>
        <input type="number" step="any" name="preco" required><br /><br />

        <label>URL da foto</label>
        <input type="text" name="foto" required><br /><br />

        <input type="Submit" value="Adicionar"><br />
    </form><br /><br />
    
    <a href="pagina_inicial.php">Voltar</a>
</body>
</html>