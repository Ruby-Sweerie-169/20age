<?php
include 'config.php';

$stmt = $conn->prepare("SELECT 
                            artigo.id AS artigo_id,
                            artigo.descr,
                            artigo.ano,
                            artigo.preco,
                            marca.marca AS nome_marca,
                            categorias.categoria AS nome_categoria
                        FROM artigo
                        INNER JOIN marca ON marca.id = artigo.id_marca
                        INNER JOIN categorias ON categorias.id = artigo.id_categoria
                        ORDER BY artigo.descr");
$stmt->execute();
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de artigos</title>
</head>
<body>
    <h1>Lista de Artigos</h1>
        
        <div>
            <?php if ($result && $result->num_rows > 0): ?>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Descrição</th>
                        <th>Ano</th>
                        <th>Marca</th>
                        <th>Categoria</th>
                        <th>Preço</th>
                        <th>Ações</th>
                    </tr>
                    
                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $row['artigo_id']; ?></td>
                        <td><?php echo $row['descr'];?></td>
                        <td><?php echo $row['ano'];?></td>
                        <td><?php echo $row['nome_marca'];?></td>
                        <td><?php echo $row['nome_categoria'];?></td>
                        <td><?php echo $row['preco'];?></td>
                        <td>
                            <a href="editar_artigo.php?id=<?php echo $row['artigo_id'];?>">Editar</a>
                            <a href="eliminar_artigo.php?id=<?php echo $row['artigo_id'];?>">Eliminar</a>
                        </td>
                    </tr>
                <?php endwhile; ?>  
            </table>        
            <?php else: ?>
                <p>Nenhum artigo encontrado.</p>
            <?php endif; ?>
        </div>    
        
        <div>
            <a href="adicionar_artigo.php">+ Novo Artigo</a>
            <a href="pagina_inicial.php">Voltar</a>
        </div>    
</body>
</html>