<?php
    session_start();
    include("../../source/includes/connect.php");
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Login</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../style.css'>
    <script src='main.js'></script>
</head>
<body>
    <header class="header">

        <a href="../../index.php" class="logo">Educa<span>Plus</span><i class='bx bx-pen bx-flip-vertical bx-tada' style='color:#352eab' ></i></a>
        <?php 
            if(isset($_GET['erro'])) $erro = "O login é necessário para acessar esta página!"; { ?> 
            <a href="#" class="logo"><?php if(isset($erro)) {echo $erro;}?></a>    
        <?php } ?>
    </header>
    
    <section class="login">
        <div class="box">
            <span class="borderLine"></span>
            <form action="login.php" method="post">
                <h2>LOGIN</h2>
                <div class="inputbox">
                    <input type="email" name="email" required="required">
                    <span>Email</span>
                    <i></i>
                </div>
                <div class="inputbox">
                    <input type="password" name="senha" required="required">
                    <span>Senha</span>
                    <i></i>
                </div>
                <div class="links">
                    <a href="esqueci_senha.php">Esqueceu a senha?</a> <br>
                    <a href="cadastro.php"> Não tem uma conta? Cadastre-se</a>  
                </div>
                
                <div class="continue-button">
                        <button type="submit" name="logar"><a href="">Login</a> </button>
                </div>
            </form>
        </div>
</section>
<?php
    if(isset($_SESSION['logstatus'])) {
        PrincipalRedirect();

    } elseif (isset($_POST['logar'])) {
        login($conexao);
        PrincipalRedirect();
    }
?>
</body>
</html>