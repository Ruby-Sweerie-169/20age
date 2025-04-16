<?php
session_start();
include "config.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $descr = $_POST['descr'];
    $ano = $_POST['ano'];
    $id_marca = $_POST['id_marca'];
    $id_categoria = $_POST['id_categoria'];
    $preco = $_POST['preco'];
    $foto = $_POST['foto'];

    $stmt = $conn->prepare("INSERT INTO artigo (descr, ano, id_marca, id_categoria, preco, foto) VALUES (?,?,?,?,?,?)");
    if ($stmt === false) {
        die("Erro na preparação do statement: " . $conn->error);
    }

    $stmt->bind_param("siiiis", $descr, $ano,$id_marca,$id_categoria,$preco,$foto);

    if ($stmt->execute()) {
        header('Location: listar_artigos.php');
        exit;
    } else {
        echo "Erro ao adicionar artigo: " . $stmt->error;
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Novo Artigo</title>
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
            Adicionar Novo Artigo
        </div>

        <div class="bg-white p-6 rounded-lg shadow-lg">
            <form method="POST" action="">
                <div class="mb-4">
                    <label for="descr" class="block text-[#3C453A] font-medium">Descrição</label>
                    <input type="text" name="descr" id="descr" required class="mt-2 p-2 w-full border border-[#B67272] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">
                </div>

                <div class="mb-4">
                    <label for="ano" class="block text-[#3C453A] font-medium">Ano</label>
                    <input type="number" name="ano" id="ano" required class="mt-2 p-2 w-full border border-[#B67272] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">
                </div>

                <div class="mb-4">
                    <label for="id_marca" class="block text-[#3C453A] font-medium">Marca</label>
                    <select name="id_marca" id="id_marca" required class="mt-2 p-2 w-full border border-[#B67272] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">
                        <?php
                        $stmt = $conn->prepare("SELECT * from marca");
                        $stmt->execute();
                        $result = $stmt->get_result();

                        while ($row = $result->fetch_assoc()):
                            echo "<option value='{$row['id']}'>{$row['marca']}</option>";
                        endwhile;
                        ?>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="id_categoria" class="block text-[#3C453A] font-medium">Categoria</label>
                    <select name="id_categoria" id="id_categoria" required class="mt-2 p-2 w-full border border-[#B67272] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">
                        <?php
                        $stmt = $conn->prepare("SELECT * from categorias");
                        $stmt->execute();
                        $result = $stmt->get_result();

                        while ($row = $result->fetch_assoc()):
                            echo "<option value='{$row['id']}'>{$row['categoria']}</option>";
                        endwhile;
                        $conn->close();    
                        ?>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="preco" class="block text-[#3C453A] font-medium">Preço</label>
                    <input type="number" step="any" name="preco" id="preco" required class="mt-2 p-2 w-full border border-[#B67272] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">
                </div>

                <div class="mb-4">
                    <label for="foto" class="block text-[#3C453A] font-medium">URL da Foto</label>
                    <input type="text" name="foto" id="foto" required class="mt-2 p-2 w-full border border-[#B67272] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#B67272]">
                </div>

                <div class="flex justify-end">
                    <input type="submit" value="Adicionar" class="bg-[#B67272] text-white px-6 py-3 rounded-lg font-bold hover:bg-[#9E4C4C] transition">
                </div>
            </form>
        </div>

        <div class="mt-6">
            <a href="pagina_inicial.php" class="bg-[#3C453A] text-white font-bold px-6 py-3 rounded-lg hover:bg-[#262B24] transition">Voltar</a>
        </div>

    </main>

    <footer class="bg-white text-center text-sm text-gray-500 py-4">
        © 2025 20'Age. Todos os direitos reservados.
    </footer>

</body>
</html>
