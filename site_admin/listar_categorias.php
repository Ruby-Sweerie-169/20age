<?php
include 'config.php';

$stmt = $conn->prepare("SELECT * FROM categorias ORDER BY categoria");
$stmt->execute();
$result = $stmt->get_result();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de categorias</title>
</head>
<body>
    <h1>Lista de Categorias</h1>
        
        <div>
            <?php if ($result && $result->num_rows > 0): ?>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Categoria</th>
                        <th>Ações</th>
                    </tr>
                    
                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $row['id']; ?></td>
                        <td><?php echo $row['categoria'];?></td>
                        <td>
                            <a href="editar_categoria.php?id=<?php echo $row['id'];?>">Editar</a>
                            <a href="eliminar_categoria.php?id=<?php echo $row['id'];?>">Eliminar</a>
                        </td>
                    </tr>
                <?php endwhile; ?>  
            </table>
            <?php else: ?>
                <p>Nenhuma categoria encontrada.</p>
            <?php endif; ?>
        </div>    
        
        <div>
            <a href="adicionar_categoria.php">+ Nova Categoria</a>
            <a href="pagina_inicial.php">Voltar</a>
        </div>    
</body>
</html>