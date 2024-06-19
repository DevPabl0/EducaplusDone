<?php
    if(!isset($_SESSION)) { //se a sessão não foi iniciada, vai ser
        session_start();
    }
    date_default_timezone_set('America/Sao_Paulo'); 

    $conexao = mysqli_connect("Localhost", "root", "", "TechSolutions"); //conectando ao BD

    if (mysqli_connect_error()){

            die("Erro ao conectar com o Banco de Dados: ").mysqli_connect_errno($conexao); //erro de conexâo
        }
    function redirect($page) {
        header("Location: $page", true, 301);
        exit();
    } 
    function login($conexao) {
        if (isset($_POST['logar']) || isset($_POST['email']) || isset($_POST['senha'])) { //verificando existência dos dados de login

        $email = $conexao->real_escape_string($_POST['email']); //medida protetiva contra sql_injection
        $senha = $conexao->real_escape_string($_POST['senha']); // do tipo -> 1='1' e etc

        $sql_query = "SELECT * from tbusuarios where email_usuario = '$email' LIMIT 1"; //verificando dados de login no BD
        $sql_result = $conexao->query($sql_query) or die("Falha no SQL".$conexao->error); //Executar a query SQL e verificar erros

        $usuario = $sql_result->fetch_assoc(); //Associção da váriavel com o usuário no BD

            if(password_verify($senha, $usuario['senha'])) {

                $_SESSION['user'] = $usuario['nome_usuario'];
                $_SESSION['id'] = $usuario['cod_usuario'];
                $_SESSION['email'] = $usuario['email_usuario'];
                $_SESSION['telefone'] = $usuario['celular'];


                $_SESSION['dt_login'] = date('Y-m-d H:i:s');
                  
                // Query para atualizar a data de login do user no Banco de Dados

                $sql_updt_login = "UPDATE tbUsuarios SET login = '{$_SESSION['dt_login']}' WHERE cod_usuario = {$_SESSION['id']}";
                $conexao->query($sql_updt_login) or die("Falha ao atualizar data de login: ".$conexao->error);

                // Formatar a data de cadastro e login para BR
                $_SESSION['dt_login'] = date('d-m-Y H:i:s');
                $_SESSION['dt_cadastro'] = date('d/m/Y', strtotime($usuario['data_cadastro']));
                $_SESSION['logstatus'] = TRUE; // Definindo status de login no site
                
                usleep(8000);
                header('Location: ../../PaginasPrincipais/principal.php', true, 301); // Redirect página inicial
                exit();

            } else {
                $_SESSION['logerror'] = "Erro de login, verifique os dados inseridos!";     
            }
        }
    }

    function logout() {
        session_unset();
        session_destroy();
    }

    function DeletUser($conexao) {
        $query = "DELETE FROM tbUsuarios WHERE cod_usuario = ?";
        $stmt = $conexao->prepare($query);
        $stmt->bind_param("s", $_SESSION['id']);
        $stmt->execute();
        $stmt->close();
    }

    function IndexRedirect() {
        redirect('../../index.php');
    }

    function LoginRedirect() {
        redirect('../../PaginasPrincipais/SubPags/login.php');
    }

    function loginRedirectError() {
        redirect('SubPags/login.php?erro=true');
    }

    function PrincipalRedirect() {
        redirect('../../PaginasPrincipais/principal.php');
    }
?>