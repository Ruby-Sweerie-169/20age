<?php
    session_start();
    include 'config.php';

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
     
        if ($conn->connect_error) {
            die("Falha na conexão: " . $conn->connect_error);
        }
    
        $username = $_POST['username'];
        $pass = $_POST['pass'];
    
        $stmt = $conn->prepare("SELECT id, nome, email, tlm, pass FROM admin WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
    
        if ($result->num_rows === 1) {
            $admin = $result->fetch_assoc();
        
        if (password_verify($pass, $admin['pass'])) {
            $_SESSION['logado'] = true;
            $_SESSION['id_admin'] = $admin['id'];
            $_SESSION['nome_admin'] = $admin['nome'];
            
            header("Location: pagina_inicial.php");
            exit();
        } else {
            $erro = "Senha incorreta";
        }
    } else {
        $erro = "Utilizador não encontrado";
    }

    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#D8C1A3] flex justify-center items-center min-h-screen">

    <div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-sm">
        
        <div class="mb-6 text-center">
            <img src="logo.png" alt="Logotipo 20'Age" class="mx-auto w-28 h-28">
        </div>

        <h2 class="text-[#B67272] text-2xl font-bold text-center mb-6">Login do Admin</h2>

        <?php if (isset($erro)): ?>
            <div class="mb-4 text-red-600 font-semibold text-center">
                <?php echo $erro; ?>
            </div>
        <?php endif; ?>

        <form action="" method="POST">
            <div class="mb-4">
                <label for="username" class="block text-gray-700 font-semibold">Username</label>
                <input type="text" id="username" name="username" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#475245]" required>
            </div>

            <div class="mb-6">
                <label for="password" class="block text-gray-700 font-semibold">Password</label>
                <input type="password" id="password" name="pass" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#475245]" required>
            </div>

            <button type="submit" class="w-full bg-[#748571] hover:bg-[#4E594C] text-white font-semibold py-2 px-4 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4E594C]">Entrar</button>
        </form>

        <div class="mt-4 text-center">
            <a href="registar.php" class="text-[#748571] font-bold hover:text-[#4E594C]">Criar conta</a>
        </div>
    </div>

</body>
</html>
