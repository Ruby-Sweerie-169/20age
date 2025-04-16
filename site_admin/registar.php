<?php
    include 'config.php';

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $nome = $_POST['nome'];
        $email = $_POST['email'];
        $tlm = $_POST['tlm'];
        $username = $_POST['username'];
        $pass = $_POST['pass'];
        
        $hash_pass = password_hash($pass, PASSWORD_DEFAULT);
        
        $stmt = $conn->prepare("INSERT INTO admin (nome, email, tlm, username, pass) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $nome, $email, $tlm, $username, $hash_pass);
        
        if ($stmt->execute()) {
            echo "Administrador registado com sucesso!";
        } else {
            echo "Erro: " . $stmt->error;
        }
        
        $stmt->close();
    }
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registo</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#D8C1A3] flex justify-center items-center min-h-screen">

    <div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-lg">
        
        <div class="mb-6 text-center">
            <img src="logo.png" alt="Logotipo 20'Age" class="mx-auto w-28 h-28">
        </div>

        <h2 class="text-[#B67272] text-2xl font-bold text-center mb-6">Registo</h2>

        <form method="POST" action="">
            <div class="mb-4">
                <label class="block text-gray-700 font-semibold">Nome</label>
                <input type="text" name="nome" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]" required>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 font-semibold">Email</label>
                <input type="text" name="email" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]" required>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 font-semibold">Contacto telefónico</label>
                <input type="text" name="tlm" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]" required>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 font-semibold">Username</label>
                <input type="text" name="username" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]" required>
            </div>

            <div class="mb-6">
                <label class="block text-gray-700 font-semibold">Password</label>
                <input type="password" name="pass" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]" required>
            </div>

            <button type="submit" class="w-full bg-[#748571] hover:bg-[#475245] text-white font-semibold py-2 px-4 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">Registrar</button>
        </form>

        <div class="mt-4 text-center">
            <a href="login.php" class="text-[#748571] font-bold hover:text-[#475245]">Voltar</a>
        </div>
    </div>

</body>
</html>
