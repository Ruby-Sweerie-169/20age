<?php
session_start();
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
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Artigos</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#D1DEC6] min-h-screen flex flex-col">

    <!-- Navbar -->
    <nav class="bg-white shadow-md p-4 flex items-center justify-between">
        <div class="flex items-center space-x-4">
            <img src="logo.png" alt="Logotipo 20'Age" class="w-12 h-12">
            <span class="text-[#B67272] text-xl font-bold">20'Age Admin</span>
        </div>
        <a href="logout.php" class="bg-[#B67272] text-white px-4 py-2 rounded-lg hover:bg-[#754949] transition">Logout</a>
    </nav>

    <main class="flex-grow p-8">
        <div class="flex justify-between items-center mb-6">
            <div class="text-2xl text-[#3C453A] font-bold">
                Lista de Artigos
            </div>
            <a href="adicionar_artigo.php" class="bg-[#3C453A] font-bold text-white px-6 py-3 rounded-lg hover:bg-[#262B24] transition">+ Novo Artigo</a>
        </div>

        <div class="bg-white p-6 rounded-lg shadow-lg">
            <?php if ($result && $result->num_rows > 0): ?>
                <table class="w-full table-auto border-collapse">
                    <thead>
                        <tr class="bg-[#748571] text-white">
                            <th class="px-4 py-2 text-center">ID</th>
                            <th class="px-4 py-2 text-center">Descrição</th>
                            <th class="px-4 py-2 text-center">Ano</th>
                            <th class="px-4 py-2 text-center">Marca</th>
                            <th class="px-4 py-2 text-center">Categoria</th>
                            <th class="px-4 py-2 text-center">Preço</th>
                            <th class="px-4 py-2 text-center">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = $result->fetch_assoc()): ?>
                            <tr class="border-b">
                                <td class="px-4 py-2 text-center"><?php echo $row['artigo_id']; ?></td>
                                <td class="px-4 py-2 text-center"><?php echo $row['descr']; ?></td>
                                <td class="px-4 py-2 text-center"><?php echo $row['ano']; ?></td>
                                <td class="px-4 py-2 text-center"><?php echo $row['nome_marca']; ?></td>
                                <td class="px-4 py-2 text-center"><?php echo $row['nome_categoria']; ?></td>
                                <td class="px-4 py-2 text-center"><?php echo $row['preco']; ?></td>
                                <td class="px-4 py-2 text-center">
                                    <a href="editar_artigo.php?id=<?php echo $row['artigo_id']; ?>" class="bg-[#B67272] text-white font-bold px-4 py-2 rounded-lg hover:bg-[#754949] transition">Editar</a>
                                    <span class="mx-2">|</span>
                                    <a href="eliminar_artigo.php?id=<?php echo $row['artigo_id']; ?>" class="bg-red-600 text-white font-bold px-4 py-2 rounded-lg hover:bg-red-700 transition">Eliminar</a>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <p class="text-center text-[#B67272]">Nenhum artigo encontrado.</p>
            <?php endif; ?>
        </div>

        <div class="mt-6 flex justify-between">
            <a href="pagina_inicial.php" class="bg-[#3C453A] text-white font-bold px-6 py-3 rounded-lg hover:bg-[#262B24] transition">Voltar</a>
        </div>

    </main>

    <footer class="bg-white text-center text-sm text-gray-500 py-4">
        © 2025 20'Age. Todos os direitos reservados.
    </footer>

</body>
</html>
