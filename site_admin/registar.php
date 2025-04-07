<!-- Registo do Admin -->

<?php
    include 'config.php';

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $nome = $_POST['nome'];
        $email = $_POST['email'];
        $tlm = $_POST['tlm'];
        $username = $_POST['username'];
        $pass = $_POST['pass'];
        
        // implementação de hash para maior segurança
        $hash_pass = password_hash($pass, PASSWORD_DEFAULT);
        
        // prepared statements para evitar sql injection
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel de Administrador</title>
</head>
<body>
    <h1>Registo</h1>
    <form method="POST" action="">
        <label>Nome </label>
        <input type="text" name="nome" required><br /><br />
        <label>Email </label>
        <input type="text" name="email" required><br /><br />
        <label>Contacto telefónico </label>
        <input type="text" name="tlm" required><br /><br />
        <label>Username </label>
        <input type="text" name="username" required><br /><br />
        <label>Password </label>
        <input type="password" name="pass" required><br /><br />
        <input type="submit" value="Registrar"><br /><br />
    </form>

    <a href="login.php">Voltar</a>
</body>
</html>