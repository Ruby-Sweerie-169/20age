<?php
session_start();
include 'config.php';

// Verifica se o utilizador está logado
if (!isset($_SESSION['logado']) || $_SESSION['logado'] !== true) {
    header("Location: login.php");
    exit();
}

$username = $_SESSION['nome_admin'];
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel de Administrador</title>
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
            Olá, <span class="text-black"><?php echo htmlspecialchars($username); ?></span>
        </div>

        <div class="grid gap-6 grid-cols-1 md:grid-cols-3">
            <a href="listar_marca.php" class="bg-[#B67272] p-12 rounded-lg shadow-lg hover:shadow-xl transition text-center text-2xl text-white font-bold hover:bg-[#9E4C4C]">
                Gerir Marcas
            </a>

            <a href="listar_categorias.php" class="bg-[#748571] p-12 rounded-lg shadow-lg hover:shadow-xl transition text-center text-white text-2xl font-bold hover:bg-[#5E6F5B]">
                Gerir Categorias
            </a>

            <a href="listar_artigos.php" class="bg-[#B67272] p-12 rounded-lg shadow-lg hover:shadow-xl transition text-center text-white text-2xl font-bold hover:bg-[#9E4C4C]">
                Gerir Artigos
            </a>

            <a href="listar_clientes.php" class="bg-[#748571] p-12 rounded-lg shadow-lg hover:shadow-xl transition text-center text-white text-2xl font-bold hover:bg-[#5E6F5B]">
                Gerir Clientes
            </a>

        </div>
    </main>

    <footer class="bg-white text-center text-sm text-black py-4">
        © 2025 20'Age. Todos os direitos reservados.
    </footer>

</body>
</html>
