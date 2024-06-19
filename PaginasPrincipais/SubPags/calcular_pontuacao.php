<?php
     session_start();
     require('../../source/includes/connect.php');
   
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultados</title>
    <link rel="stylesheet" href="../../style.css">
    <!-- IMPORT BOXICONS -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

   
   
</head>
<body>
    <?php if(isset($_SESSION['logstatus'])) { ?>
    <aside class="close">
        
        <div class="head">
            <div class="logo">
                <a href="#" class="logo">Educa<span>Plus</span><i class='bx bx-pen bx-flip-vertical bx-tada' style='color:#0095f7' ></i></a>
            </div>
            <i class='bx bx-menu hamburger-menu'></i>
        </div>

        <div class="nav">
            <div class="menu active">
            <a href="../principal.php"><i class='bx bxs-home'></i>
                <span>Home</span></a>
                </div>
            <div class="menu">
                <i class="bx bx-task"></i>
                <span>Provas</span>
                <i class="bx bx-chevron-down"></i>
            </div>

            <div class="menu-dropdown">
                <div class="sub-menu">
                <span class="menu"><a href="../../PaginasPrincipais/Provas/2015/prova1.php">ETEC 2015 1° Semestre</span></a>
                    <span class="menu"><a href="../../PaginasPrincipais/Provas/2015/prova2.php">ETEC 2015 2° Semestre</span></a>
                    <span class="menu"><a href="../../PaginasPrincipais/Provas/2019/prova1.php">ETEC 2019 1° Semestre</span></a>
                    <!-- <span class="menu"><a href="../../PaginasPrincipais/Provas/2019/prova2.php">ETEC 2019 2° Semestre</span></a> SEM QUESTOES -->
                    <span class="menu"><a href="../../PaginasPrincipais/Provas/2020/prova1.php">ETEC 2020 1° Semestre</span></a>
                    <span class="menu"><a href="../../PaginasPrincipais/Provas/2022/prova2.php">ETEC 2022 1° Semestre</span></a>
                    <span class="menu"><a href="../../PaginasPrincipais/Provas/2023/prova1.php">ETEC 2023 1° Semestre</span></a>
                    <span class="menu"><a href="../../PaginasPrincipais/Provas/2023/prova2.php">ETEC 2023 2° Semestre</span></a>
                    <span class="menu"><a href="../../PaginasPrincipais/Provas/2024/prova1.php">ETEC 2024 1° Semestre</span></a>
                </div>
            </div>

            <div class="menu">
                <i class='bx bx-question-mark'></i>
                <span>Questões</span>
                <i class="bx bx-chevron-down"></i>

            </div>

            <div class="menu-dropdown">
                <div class="sub-menu">
                <span class="menu">  <a href="../materias/matematica.php"> MATEMÁTICA</span></a>
                <span class="menu">  <a href="../materias/portu.php"> PORTUGUÊS</span></a>
                <span class="menu"><a href="../materias/ciencias.php"> CIÊNCIA</span></a>
                <span class="menu"><a href="../materias/historia.php"> HISTÓRIA</span></a>
                <span class="menu"> <a href="../materias/geografia.php"> GEOGRAFIA</span></a>
                <span class="menu">   <a href="../materias/cienciashumanas.php"> CIÊNCIAS HUMANAS</span></a>
                </div>
            </div>

            <div class="menu">
            <a href="../desempenho.php"> <i class='bx bx-bar-chart-alt'></i>
                <span>Desempenho</span></a>
            </div>

            <div class="menu">
            
            <a href="../configuracoes.php"> <i class="bx bx-cog"></i>
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
                echo '<img src="../../source/img/perfil-padrao.png" alt="profile">';
            }
        }
          ?>
                <div class="info">
                    <span class="name">
                      <h1>
                      <span><?php echo ucwords($_SESSION['user']); ?></span></h1>
                                      
                    </span>
             
                </div>
            </div>
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
    <a href="../../source/includes/logout.php"> <button type="submit" class="btnlogout">Sair</button></a>
    <a href="calcular_pontuacao.php"> <button class="bai" type="submit">Não</button></a>

    </div>
    </div>

        </div>


        </div>
        </div>
        </div>

    </aside>
  


<?php
if (!$conexao) {
    die("Falha na conexão com o banco de dados: " . mysqli_connect_error());
}
$r_usuario = [];
$ano_prova = $_POST['ano_prova'] ?? null;
$semestre_prova = $_POST['semestre_prova'] ?? null;
$user_id = $_SESSION['id'] ?? null;

if ($_SERVER["REQUEST_METHOD"] == "POST" && $ano_prova !== null && $semestre_prova !== null && $user_id !== null) {

    foreach ($_POST as $questao => $resposta) {
  
        if (substr($questao, 0, 1) == 'q') {
            $r_usuario[$questao] = $resposta;
        }
    }
    $sql = "SELECT * FROM tbQuestions WHERE exam_year = $ano_prova AND semestre = '$semestre_prova'";
    $result = mysqli_query($conexao, $sql);
    if ($result && mysqli_num_rows($result) > 0) {
        $pontuacao = 0;
        $total_questoes = mysqli_num_rows($result);
        $acertos = 0;
        $erros = 0;
        $nao_respondidas = 0;

        // Primeiro, vamos percorrer todas as questões e calcular a pontuação, acertos, erros e não respondidas
        while ($row = mysqli_fetch_assoc($result)) {
            $questao_id = 'q' . $row['cod_question'];
            $resposta_usuario = $r_usuario[$questao_id] ?? null;
    
            if ($resposta_usuario !== null) {
                if (strtolower($resposta_usuario) === strtolower($row['correct_option'])) {
                    $pontuacao++;
                    $acertos++;
                } else {
                    $erros++;
                }
            } else {
                $nao_respondidas++;
            }
        }
        $pontuacao_percent = round(($pontuacao / $total_questoes) * 100, 1);
        $sql_insert = "INSERT INTO tbResults (cod_usuario, exam_year, semestre, total_questoes, pontuacao_percent, questoes_corretas, questoes_erradas) 
                VALUES ('$user_id', '$ano_prova', '$semestre_prova', '$total_questoes', '$pontuacao_percent', '$acertos', '$erros')";
        $result_insert = mysqli_query($conexao, $sql_insert);

        if (!$result_insert) {
            echo "Erro ao inserir resultados na tabela tbResults: " . mysqli_error($conexao);
        }

        // Agora, vamos exibir a seção de desempenho
        echo "<section class='dese'>";
        echo "<div class='princi'>";
        echo "<h1> Desempenho geral no simulado </h1>";
        echo "<div class='config-container'>";
        echo "<div class='config-box'>";
        echo "<h4>Pontuação total: $pontuacao de $total_questoes questões corretas. </h4>";
        echo "<div class='acerto'>";
        echo "<h4> Porcentagem de acertos: $pontuacao_percent% </h4>";
        echo "</div>";
        echo "</div>";
        echo "<div class='acerto'>";
        echo "Quantidade de questões corretas: $acertos";
        echo "</div>";
        echo "<div class='erro'>";
        echo "Quantidade de questões erradas: $erros";
        echo "</div>";
        echo "<div class='matuniversal'>";
        echo "Quantidade de questões não respondidas: $nao_respondidas";
        echo "</div>";
        echo "<div class='matuniversal'>";
        echo "<p>Matéria com a maior taxa de acerto: Português</p>";
        echo "</div>";
        echo "<div class='matuniversal'>";
        echo "<p>Matéria com a menor taxa de acerto: Matemática</p>";
        echo "</div>";
        echo "</section>";
    } else {
        echo "Nenhuma pergunta encontrada para o ano $ano_prova e semestre $semestre_prova.";
    }
} else {
    echo "Erro: Ano e/ou semestre da prova e/ou ID do usuário não foram fornecidos.";
}
echo "</div>";
echo "</div>";
echo "</section>";


        // Finalmente, vamos percorrer novamente todas as questões e exibir as questões e respostas
        mysqli_data_seek($result, 0); // Voltar ao início do conjunto de resultados
        while ($row = mysqli_fetch_assoc($result)) {
            $questao_id = 'q' . $row['cod_question'];
            $resposta_usuario = $r_usuario[$questao_id] ?? null;
    
            echo "<div class='container-respostas'>";
            echo "<p class='questao'>Questão: {$row['text_question']}</p>";
            echo "<p style='font-size: 1.2em;'> {$row['option_a']}</p>";
            echo "<p style='font-size: 1.2em;'> {$row['option_b']}</p>";
            echo "<p style='font-size: 1.2em;'> {$row['option_c']}</p>";
            echo "<p style='font-size: 1.2em;'> {$row['option_d']}</p>";
            echo "<p style='font-size: 1.2em;'> {$row['option_e']}</p>";
            echo "<p style='font-size: 1.2em;'>Resposta do usuário: <strong>$resposta_usuario</strong></p>";

            if ($resposta_usuario !== null) {
                if (strtolower($resposta_usuario) === strtolower($row['correct_option'])) {
                    echo "<p style='color: green;'>Correção: Resposta correta!</p>";
                } else {
                    echo "<p style='color: red;'>Correção: Resposta incorreta. A resposta correta é: {$row['correct_option']}</p>";
                }
            } else {
                echo "<p style='color: orange;'>Correção: sem resposta. A resposta correta é: {$row['correct_option']}</p>";
            }
            echo "</div>";
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

   </script>

 <script src="../java.js"></script>
</body>
   

</html>
