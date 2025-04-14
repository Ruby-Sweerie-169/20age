<!-- Login do Admin -->

<?php
    include 'config.php';
    session_start();

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
</head>
<body>
    <form action="pagina_inicial.php" method="POST">
        <label>Username </label>
        <input type="text" name="username"><br /><br />
        <label>Password </label>
        <input type="password" name="pass"><br /><br />
        <input type="submit" value="Entrar"><br /><br />
    </form>

    <a href="registar.php">Criar conta</a>
</body>
</html>