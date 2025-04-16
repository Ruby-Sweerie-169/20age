<?php
session_start();
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $categoria = $_POST['categoria'];

    $stmt = $conn->prepare("UPDATE categorias SET categoria=? WHERE id=?");
    $stmt->bind_param("si", $categoria,$id);

    if ($stmt->execute()) {
        header('Location: listar_categorias.php');
        exit;
    } else {
        echo "Erro ao editar categoria: " . $stmt->error;
    }
    $stmt->close();
} else {
    if (!isset($_GET['id'])) {
        die("ID não fornecido na URL.");
    }
    $id = intval($_GET['id']);

    $sql = "SELECT * FROM categorias WHERE id = $id";
    $result = $conn->query($sql);
    
    if ($result->num_rows == 0) {
        die("Categoria não encontrada.");
    }
    
    $categoriaDados = $result->fetch_assoc();
}
    $conn->close();
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Categoria</title>
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
            Editar Categoria
        </div>

        <div class="bg-white p-6 rounded-lg shadow-lg">
            <form method="POST" action="">
                <input type="hidden" name="id" value="<?php echo $categoriaDados['id']; ?>">

                <div class="mb-4">
                    <label for="categoria" class="block text-[#3C453A] font-medium">Categoria</label>
                    <input type="text" name="categoria" value="<?php echo $categoriaDados['categoria']; ?>" required class="mt-2 p-2 w-full border border-[#B67272] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">
                </div>

                <div class="flex justify-end">
                    <input type="submit" value="Alterar" class="bg-[#B67272] text-white px-6 py-3 rounded-lg font-bold hover:bg-[#9E4C4C] transition">
                </div>
            </form>
        </div>

        <div class="mt-6">
            <a href="listar_categorias.php" class="bg-[#3C453A] text-white font-bold px-6 py-3 rounded-lg hover:bg-[#262B24] transition">Voltar</a>
        </div>

    </main>

    <!-- Rodapé -->
    <footer class="bg-white text-center text-sm text-gray-500 py-4">
        © 2025 20'Age. Todos os direitos reservados.
    </footer>

</body>
</html>
