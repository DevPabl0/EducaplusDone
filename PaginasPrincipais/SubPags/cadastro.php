<?php
include('../../source/includes/connect.php');

// Inicializa as variáveis com valores vazios
$nome = $email = $senha = $confirmaSenha = "";
$mensagemErro = "";

// Processa os dados do formulário quando o formulário é enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = test_input($_POST['name']);
    $email = test_input($_POST['email']);
    $senha = test_input($_POST['password']);
    $confirmaSenha = test_input($_POST['confirmPassword']);

    // Validação do nome
    if (strlen($nome) < 3) {
        $mensagemErro = "O nome deve ter pelo menos 3 caracteres.";
    }

    // Validação do email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $mensagemErro = "Por favor, insira um endereço de e-mail válido.";
    }

    // Validação do celular

    // Validação da senha
    if (strlen($senha) < 6) {
        $mensagemErro = "A senha deve ter pelo menos 6 caracteres.";
    }

    // Confirmação da senha
    if ($senha !== $confirmaSenha) {
        $mensagemErro = "As senhas não coincidem.";
    }

    // Se não houver erros, o formulário pode ser enviado
    if ($mensagemErro == "") {
        $cadastro = date("Y-m-d H:i:s");
        $senhacry = password_hash($senha, PASSWORD_DEFAULT);
        $sql = "INSERT INTO tbUsuarios(nome_usuario, email_usuario, celular, senha, data_cadastro)VALUES('$nome', '$email', '$telefone', '$senhacry', '$cadastro')";
        $cadastro = 1;
    } else {
        echo $mensagemErro;
    }
} else {
    echo "problema no cadastramento dos dados";
}

// Função para limpar os dados do formulário
function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
?>

<!DOCTYPE html>
<html lang="pt-br">
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel='stylesheet' type='text/css' media='screen' href='../../style.css'>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
</head>

<body>
    <div class="circle"></div>
    <div class="circle2"></div>
   
    <section class="cadastro">
    <header class="header">
        <a href="../../index.php" class="logo">Educa<span>Plus</span><i class='bx bx-pen bx-flip-vertical bx-tada' style='color:#352eab' ></i></a>
       
       
        
    </header>
    <div class="container">
        <div class="form-image">
            <img src="../../source/img/4871d9279dcf1c108c0dd3c325844b6a.png" alt="img">
        </div>
        <div class="form">
            <form action="cadastro.php" method="post">
                <div class="form-header">
                    <div class="title">
                        <h1>Cadastre-se</h1>
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-box">
                        <label for="name">Nome</label>
                        <input id="name" type="text" name="name" placeholder="Digite seu nome" required maxlength="30">
                    </div>
                    
                    <div class="input-box">
                        <label for="email">E-mail</label>
                        <input id="email" type="email" name="email" placeholder="Digite seu e-mail" required maxlength="50">
                    </div>

                    <div class="input-box">
                        <label for="number">Celular</label>
                        <input id="number" type="tel" name="number" placeholder="(xx) xxxx-xxxx" required maxlength="11">
                    </div>

                    <div class="input-box">
                        <label for="password">Senha</label>
                        <input id="password" type="password" name="password" placeholder="Digite sua senha" required>
                    </div>

                    <div class="input-box">
                        <label for="confirmPassword">Confirme sua Senha</label>
                        <input id="confirmPassword" type="password" name="confirmPassword" placeholder="Digite a senha novamente" required>
                    </div>

                </div>

                <div class="continue-button">
                    <button><a href="#">Cadastrar</a> </button>
                    <p style="color: red; text-align:center;"><?php echo $mensagemErro; ?></p>

                </div>
            </form>
        </div>
    </div>
    </section>

    <script src="../../source/javascript/main.js"></script>
    <?php
    if (isset($cadastro) == 1) {

        if(mysqli_query($conexao,$sql))

                sleep(2);
                loginRedirect();

            }else{

                die("Erro ao cadastrar: ").mysqli_connect_error($conexao);
            }
    
?>
</body>
</html>