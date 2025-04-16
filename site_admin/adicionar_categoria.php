<?php
session_start();
include "config.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $categoria = $_POST['categoria'];

    $stmt = $conn->prepare("INSERT INTO categorias (categoria) VALUES (?)");
    if ($stmt === false) {
        die("Erro na preparação do statement: " . $conn->error);
    }

    $stmt->bind_param("s", $categoria);

    if ($stmt->execute()) {
        header('Location: listar_categorias.php');
        exit;
    } else {
        echo "Erro ao adicionar categoria: " . $stmt->error;
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Nova Categoria</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#D1DEC6] min-h-screen flex flex-col">

    <nav class="bg-white shadow-md p-4 flex items-center justify-between">
        <div class="flex items-center space-x-4">
            <img src="logo.png" alt="Logotipo 20'Age" class="w-12 h-12">
            <span class="text-[#B67272] text-xl font-bold">20'Age Admin</span>
        </div>
        <a href="logout.php" class="bg-[#B67272] text-white px-4 py-2 rounded-lg hover:bg-[#754949] transition">Logout</a>
    </nav>

    <main class="flex-grow p-8">
        <div class="text-2xl text-[#3C453A] font-bold mb-12">
            Adicionar Nova Categoria
        </div>

        <div class="bg-white p-6 rounded-lg shadow-lg">
            <form method="POST" action="">
                <div class="mb-4">
                    <label for="categoria" class="block text-[#3C453A] font-medium">Categoria</label>
                    <input type="text" name="categoria" id="categoria" required class="mt-2 p-2 w-full border border-[#B67272] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">
                </div>
                <div class="flex justify-end">
                    <input type="submit" value="Adicionar" class="bg-[#B67272] text-white px-6 py-3 rounded-lg font-bold hover:bg-[#9E4C4C] transition">
                </div>
            </form>
        </div>

        <div class="mt-6">
            <a href="listar_categorias.php" class="bg-[#3C453A] text-white font-bold px-6 py-3 rounded-lg hover:bg-[#262B24] transition">Voltar</a>
        </div>

    </main>

    <footer class="bg-white text-center text-sm text-gray-500 py-4">
        © 2025 20'Age. Todos os direitos reservados.
    </footer>

</body>
</html>
