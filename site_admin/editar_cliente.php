<?php
session_start();
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $tlm = $_POST['tlm'];
    $username = $_POST['username'];

    $stmt = $conn->prepare("UPDATE users SET nome=?, email=?, tlm=?, username=? WHERE id=?");
    $stmt->bind_param("ssssi", $nome, $email, $tlm, $username, $id);

    if ($stmt->execute()) {
        header('Location: listar_clientes.php');
        exit;
    } else {
        echo "Erro ao editar cliente: " . $stmt->error;
    }
    $stmt->close();
} else {
    if (!isset($_GET['id'])) {
        die("ID não fornecido na URL.");
    }
    $id = intval($_GET['id']);

    // Corrigido: buscar só o cliente com esse ID
    $stmt = $conn->prepare("SELECT * FROM users WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows == 0) {
        die("Cliente não encontrado.");
    }
    
    $clienteDados = $result->fetch_assoc();
}
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Cliente</title>
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
            Editar Cliente
        </div>

        <div class="bg-white p-6 rounded-lg shadow-lg">
            <form method="POST" action="">
                <input type="hidden" name="id" value="<?php echo $clienteDados['id']; ?>">

                <div class="mb-4">
                    <label for="nome" class="block text-[#3C453A] font-medium">Nome</label>
                    <input type="text" name="nome" value="<?php echo $clienteDados['nome']; ?>" required class="mt-2 p-2 w-full border border-[#B67272] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">
                </div>

                <div class="mb-4">
                    <label for="email" class="block text-[#3C453A] font-medium">Email</label>
                    <input type="email" name="email" value="<?php echo $clienteDados['email']; ?>" required class="mt-2 p-2 w-full border border-[#B67272] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">
                </div>

                <div class="mb-4">
                    <label for="tlm" class="block text-[#3C453A] font-medium">Telefone</label>
                    <input type="text" name="tlm" value="<?php echo $clienteDados['tlm']; ?>" required class="mt-2 p-2 w-full border border-[#B67272] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">
                </div>

                <div class="mb-4">
                    <label for="username" class="block text-[#3C453A] font-medium">Username</label>
                    <input type="text" name="username" value="<?php echo $clienteDados['username']; ?>" required class="mt-2 p-2 w-full border border-[#B67272] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">
                </div>

                <div class="mb-4">
                    <input type="hidden" name="password" value="********" disabled class="mt-2 p-2 w-full border border-[#B67272] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">
                </div>

                <div class="flex justify-end">
                    <input type="submit" value="Alterar" class="bg-[#B67272] text-white px-6 py-3 rounded-lg font-bold hover:bg-[#9E4C4C] transition">
                </div>
            </form>
        </div>

        <div class="mt-6">
            <a href="listar_clientes.php" class="bg-[#3C453A] text-white font-bold px-6 py-3 rounded-lg hover:bg-[#262B24] transition">Voltar</a>
        </div>

    </main>

    <footer class="bg-white text-center text-sm text-gray-500 py-4">
        © 2025 20'Age. Todos os direitos reservados.
    </footer>

</body>
</html>
