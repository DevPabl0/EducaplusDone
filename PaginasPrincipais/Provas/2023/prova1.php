<?php

require('../../../source/includes/connect.php'); 

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simulado do Vestibulinho ETEC 2023 - 1° Semestre</title>
    <link rel="stylesheet" href="../prova.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
   
</head>
<body>
<aside class="close">
        
        <div class="head">
            <div class="logo">
                <a href="#" class="logo">Educa<span>Plus</span><i class='bx bx-pen bx-flip-vertical bx-tada' style='color:#0095f7' ></i></a>
            </div>
            <i class='bx bx-menu hamburger-menu'></i>
        </div>

        <div class="nav">
        <div class="menu">
             <a href="../../principal.php"><i class='bx bxs-home'></i>
                <span>Home</span></a>
                </div>
            <div class="menu  active">
                <i class="bx bx-task"></i>
                <span>Provas</span>
                <i class="bx bx-chevron-down"></i>
            </div>

            <div class="menu-dropdown">
                <div class="sub-menu">
                <span class="menu"><a href="../2015/prova1.php">ETEC 2015 1° Semestre</span></a>
                    <span class="menu"><a href="../2015/prova2.php">ETEC 2015 2° Semestre</span></a>
                    <span class="menu"><a href="../2019/prova1.php">ETEC 2019 1° Semestre</span></a>
                    <!-- <span class="menu"><a href="../../PaginasPrincipais/Provas/2019/prova2.php">ETEC 2019 2° Semestre</span></a> SEM QUESTOES -->
                    <span class="menu"><a href="../2020/prova1.php">ETEC 2020 1° Semestre</span></a>
                    <span class="menu"><a href="../2022/prova2.php">ETEC 2022 1° Semestre</span></a>
                    <span class="menu"><a href="../2023/prova1.php">ETEC 2023 1° Semestre</span></a>
                    <span class="menu"><a href="../2023/prova2.php">ETEC 2023 2° Semestre</span></a>
                    <span class="menu"><a href="../2024/prova1.php">ETEC 2024 1° Semestre</span></a>
                </div>
            </div>

            <div class="menu">
                <i class='bx bx-question-mark'></i>
                <span>Questões</span>
                <i class="bx bx-chevron-down"></i>

            </div>

            <div class="menu-dropdown">
                <div class="sub-menu">
                <span class="menu"><a href="../../materias/matematica.php"> MATEMÁTICA</span></a>
                  <span class="menu"> <a href="../../materias/portu.php"> PORTUGUÊS</span></a>
                  <span class="menu"><a href="../../materias/ciencias.php"> CIÊNCIA</span></a>
                  <span class="menu"> <a href="../../materias/historia.php"> HISTÓRIA</span></a>
                  <span class="menu"> <a href="../../materias/geografia.php"> GEOGRAFIA</span></a>
                  <span class="menu"> <a href="../../materias/cienciashumanas.php"> CIÊNCIAS HUMANAS</span></a>
                </div>
            </div>

            <div class="menu">
            <a href="../../desempenho.php"> <i class='bx bx-bar-chart-alt'></i>
                <span>Desempenho</span></a>
            </div>
            <div class="menu">
            
            <a href="../../configuracoes.php"> <i class="bx bx-cog"></i>
                <span>Configurações </span></a>
            </div>
            
            <div class="menu" style="pointer-events: none;"></div>
        </div>

        <div class="foot">
          <div class="profile">
        <?php
            // Recupera a imagem de perfil do usuário
            $cod_usuario = $_SESSION['id'];
            $sql = "SELECT image_data FROM tbImagensPerfil WHERE cod_usuario = $cod_usuario";
            $result = $conexao->query($sql);

            if ($result->num_rows > 0) {
                // Exibe a imagem de perfil
                $row = $result->fetch_assoc();
                echo '<img src="data:image/jpeg;base64,'.base64_encode($row['image_data']).'" alt="profile" class="perfil">';
            } else {
                // Se o usuário não tiver uma imagem de perfil, exibe uma imagem padrão
                echo '<img src="../../../source/img/perfil-padrao.png" alt="profile">';
            }
          ?>
                <div class="info">
                    <span class="name">
                      <h1>
                      <span><?php echo ucwords($_SESSION['user']); ?></span></h1>
                                      
                    </span>
                  
                </div>
            </div>
<!-- pop up de sair -->
<!-- <button id="dark-mode-toggle">DarkMode</button> -->
<div class="darkzaodecria">
    <input type="checkbox" id="dark-mode-toggle">

    <div class="display">
        <label for="dark-mode-toggle">
            <div class="circle">
                <svg class="sun" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M12 2.25a.75.75 0 0 1 .75.75v2.25a.75.75 0 0 1-1.5 0V3a.75.75 0 0 1 .75-.75ZM7.5 12a4.5 4.5 0 1 1 9 0 4.5 4.5 0 0 1-9 0ZM18.894 6.166a.75.75 0 0 0-1.06-1.06l-1.591 1.59a.75.75 0 1 0 1.06 1.061l1.591-1.59ZM21.75 12a.75.75 0 0 1-.75.75h-2.25a.75.75 0 0 1 0-1.5H21a.75.75 0 0 1 .75.75ZM17.834 18.894a.75.75 0 0 0 1.06-1.06l-1.59-1.591a.75.75 0 1 0-1.061 1.06l1.59 1.591ZM12 18a.75.75 0 0 1 .75.75V21a.75.75 0 0 1-1.5 0v-2.25A.75.75 0 0 1 12 18ZM7.758 17.303a.75.75 0 0 0-1.061-1.06l-1.591 1.59a.75.75 0 0 0 1.06 1.061l1.591-1.59ZM6 12a.75.75 0 0 1-.75.75H3a.75.75 0 0 1 0-1.5h2.25A.75.75 0 0 1 6 12ZM6.697 7.757a.75.75 0 0 0 1.06-1.06l-1.59-1.591a.75.75 0 0 0-1.061 1.06l1.59 1.591Z" />
                </svg>
                <svg class="moon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                    <path fill-rule="evenodd" d="M9.528 1.718a.75.75 0 0 1 .162.819A8.97 8.97 0 0 0 9 6a9 9 0 0 0 9 9 8.97 8.97 0 0 0 3.463-.69.75.75 0 0 1 .981.98 10.503 10.503 0 0 1-9.694 6.46c-5.799 0-10.5-4.7-10.5-10.5 0-4.368 2.667-8.112 6.46-9.694a.75.75 0 0 1 .818.162Z" clip-rule="evenodd" />
                </svg>                               
            </div>
        </label>
    </div>
</div>
<button id="openPopup" class="opnen"> 
    <div class="menu menu-logout">
                <i class="bx bx-log-out"></i>
                <span>      Sair   </span></button>

                <div id="popup" class="popup"> 
                <div class="popup-content">
                <span class="fecha" id="closePopup"><i class='bx bx-x'></i></span>
    <p>Confirmar saída?</p>
    <a href="../source/includes/logout.php"> <button type="submit" class="btnlogout">Sair</button></a>
    <a href="principal.php"> <button class="bai" type="submit">Não</button></a>

    </div>
    </div>

        </div>


        </div>
        </div>
        </div>

    </aside>

    <body>
    <?php

    if(!$conexao) {
        die("Falha na conexão com o banco de dados: " . mysqli_connect_error());
    }

    // Seleciona as questões do banco de dados
    $start_question = 51; // Começa da primeira questão
    $end_question = 90; // Exibe até a quinta questão
    $sql = "SELECT * FROM tbQuestions WHERE cod_question BETWEEN $start_question AND $end_question";
    $result = $conexao->query($sql);

    // Inicializa o contador de questões
    $contador_questao = 1;
    echo "<div id='timer'>
    <h1 id='watch'>00:00:00</h1>
    <button class='start-btn' onclick='start()'>Começar</button>
    <button class='pause-btn' onclick='pause()'>Pausar</button>
    <button class='stop-btn' onclick='stop()''>Parar</button>
</div>";

    // Verifica se há questões
    if ($result->num_rows > 0) {
        echo "<form method='post' action='../../SubPags/calcular_pontuacao.php'>"; // Corrigindo o caminho do action
        // Exibe as questões com o formulário para seleção de respostas
        while ($row = $result->fetch_assoc()) {
            echo "<div class='container'>";
            echo "<h2 class='questao'>Questão $contador_questao:</h2>"; // Exibe o número da questão
            // Recupera e exibe as imagens associadas à pergunta
            $cod_question = $row['cod_question'];
            $sql_imagens = "SELECT image_data FROM tbImagens WHERE cod_question = $cod_question";
            $result_imagens = $conexao->query($sql_imagens);
            while ($row_imagem = $result_imagens->fetch_assoc()) {
                echo "<img src='{$row_imagem['image_data']}' alt='Imagem da pergunta'>";
            }
            echo "<p class='questao'>" . $row['text_question'] . "</p>";
            echo "<ul>";
            echo "<li class='opcao'><label><input type='radio' name='q" . $row['cod_question'] . "' value='A'>" . $row['option_a'] . "</label></li>";
            echo "<li class='opcao'><label><input type='radio' name='q" . $row['cod_question'] . "' value='B'>" . $row['option_b'] . "</label></li>";
            echo "<li class='opcao'><label><input type='radio' name='q" . $row['cod_question'] . "' value='C'>" . $row['option_c'] . "</label></li>";
            echo "<li class='opcao'><label><input type='radio' name='q" . $row['cod_question'] . "' value='D'>" . $row['option_d'] . "</label></li>";
            echo "<li class='opcao'><label><input type='radio' name='q" . $row['cod_question'] . "' value='E'>" . $row['option_e'] . "</label></li>";
            echo "</ul>";
            echo "</div>";
            
            // Incrementa o contador de questões
            $contador_questao++;
        }
        echo "<input type='hidden' name='ano_prova' value='2023'>";
        echo "<input type='hidden' name='semestre_prova' value='1'>";
        echo "<input type='submit' value='Enviar Respostas'>";
        echo "</form>";
    } else {
        echo "Nenhuma questão encontrada no banco de dados.";
    }

    mysqli_close($conexao);
    ?>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $('.hamburger-menu').click(function() {
            $('aside').toggleClass('close')
        })

        $('.menu').click(function() {
            $(this).siblings('.menu').removeClass('active')
            $(this).addClass('active')

            $(this).next().siblings('.menu-dropdown').children('.sub-menu').slideUp()
            $(this).next('.menu-dropdown').children('.sub-menu').slideToggle()

            $(this).next().siblings('.menu-dropdown').children('.sub-menu').children('.menu').removeClass('active')
        })
  
        document.getElementById('openPopup').addEventListener('click', function() {
    document.getElementById('popup').style.display = 'block';
  });
 
  document.getElementById('closePopup').addEventListener('click', function() {
    document.getElementById('popup').style.display = 'none';
  });
  var sec=0
var min=0
var hr=0

var interval

function twoDigits(digit){
    if(digit<10){
        return('0'+digit)
    }else{
        return(digit)
    }
}

function start(){
    watch()
    interval= setInterval(watch,1000)


}

function pause(){
    clearInterval(interval)

}

function stop(){
    clearInterval(interval)
    sec=0
    min=0
    window.alert("You've stopped at: "+document.getElementById('watch').innerText)
    document.getElementById('watch').innerText='00:00:00'

}

function watch(){
    sec++
    if(sec==60){
        min++
        sec=0
        if(min==60){
            min=0
            hr++
        }
    }
    document.getElementById('watch').innerText=twoDigits(hr)+':'+twoDigits(min)+':'+twoDigits(sec)
}
    </script>

<script src="../../java.js"></script>

</body>
</html>
