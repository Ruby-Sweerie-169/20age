<?php
include 'config.php';

$stmt = $conn->prepare("SELECT * FROM marca ORDER BY marca");
$stmt->execute();
$result = $stmt->get_result();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de marcas</title>
</head>
<body>
    <h1>Lista de Marcas</h1>
        
        <div>
            <?php if ($result && $result->num_rows > 0): ?>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Marca</th>
                        <th>Ações</th>
                    </tr>
                    
                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $row['id']; ?></td>
                        <td><?php echo $row['marca'];?></td>
                        <td>
                            <a href="editar_marca.php?id=<?php echo $row['id'];?>">Editar</a>
                            <a href="eliminar_marca.php?id=<?php echo $row['id'];?>">Eliminar</a>
                        </td>
                    </tr>
                <?php endwhile; ?>  
            </table>  
            <?php else: ?>
                <p>Nenhuma marca encontrada.</p>
            <?php endif; ?>
        </div>    
        
        <div>
            <a href="adicionar_marca.php">+ Nova marca</a>
            <a href="pagina_inicial.php">Voltar</a>
        </div>    
</body>
</html>