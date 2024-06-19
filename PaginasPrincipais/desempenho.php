<?php
    require('../source/includes/connect.php');
  

    $cod_usuario = $_SESSION['id'];

    $sql = "SELECT questoes_corretas, questoes_erradas, pontuacao_percent FROM tbResults WHERE cod_usuario = $cod_usuario";
    $result = $conexao->query($sql);

   
    // Inicializar as variáveis
    $total_corretas = 0;
    $total_incorretas = 0;
    $media_percentual = 0;
    $total_simulados = 0;

 
    // Inicializar as variáveis
    $total_corretas = 0;
    $total_incorretas = 0;
    $media_percentual = 0;
    $total_simulados = 0;
    $taxa_acerto = 0;

    if ($result->num_rows > 0) {
        // Loop através de cada entrada do usuário
        while ($row = $result->fetch_assoc()) {
            // Obter os dados de desempenho de cada entrada
            $questoes_corretas = $row["questoes_corretas"];
            $questoes_erradas = $row["questoes_erradas"];
            $pontuacao_percent = $row["pontuacao_percent"];
            
            // Somar as questões corretas e incorretas
            $total_corretas += $questoes_corretas;
            $total_incorretas += $questoes_erradas;
            
            // Calcular a média do percentual de acerto
            $media_percentual += $pontuacao_percent;

            // Incrementar o número total de simulados
            $total_simulados++;
        }
        
        // Calcular a média do percentual de acerto
        if ($result->num_rows != 0) {
            $media_percentual /= $result->num_rows;
        }
        // Formatar o percentual para 2 dígitos após a vírgula
        $media_percentual = number_format($media_percentual, 2)."%";

        // Calcular a taxa de acerto
        $total_questoes = $total_corretas + $total_incorretas;
        if ($total_questoes != 0) {
            $taxa_acerto = ($total_corretas / $total_questoes) * 100;
        }
        $taxa_acerto = number_format($taxa_acerto, 2)."%";
    }



?>
        
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="../style.css">

    <!-- IMPORT BOXICONS -->
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
            <a href="principal.php"> <i class='bx bxs-home'></i>
                <span>Home</span></a>
                </div>
            <div class="menu">
                <i class="bx bx-task"></i>
                <span>Provas</span>
                <i class="bx bx-chevron-down"></i>
            </div>

            <div class="menu-dropdown">
                <div class="sub-menu">
                <span class="menu"><a href="../PaginasPrincipais/Provas/2015/prova1.php">ETEC 2015 1° Semestre</span></a>
                    <span class="menu"><a href="../PaginasPrincipais/Provas/2015/prova2.php">ETEC 2015 2° Semestre</span></a>
                    <span class="menu"><a href="../PaginasPrincipais/Provas/2019/prova1.php">ETEC 2019 1° Semestre</span></a>
                    <!-- <span class="menu"><a href="../PaginasPrincipais/Provas/2019/prova2.php">ETEC 2019 2° Semestre</span></a> SEM QUESTOES -->
                    <span class="menu"><a href="../PaginasPrincipais/Provas/2020/prova1.php">ETEC 2020 1° Semestre</span></a>
                    <span class="menu"><a href="../PaginasPrincipais/Provas/2022/prova2.php">ETEC 2022 1° Semestre</span></a>
                    <span class="menu"><a href="../PaginasPrincipais/Provas/2023/prova1.php">ETEC 2023 1° Semestre</span></a>
                    <span class="menu"><a href="../PaginasPrincipais/Provas/2023/prova2.php">ETEC 2023 2° Semestre</span></a>
                    <span class="menu"><a href="../PaginasPrincipais/Provas/2024/prova1.php">ETEC 2024 1° Semestre</span></a>
                </div>
            </div>

            <div class="menu">
                <i class='bx bx-question-mark'></i>
                <span>Questões</span>
                <i class="bx bx-chevron-down"></i>

            </div>

            <div class="menu-dropdown">
                <div class="sub-menu">
                  <span class="menu"><a href="../PaginasPrincipais/materias/matematica.php"> MATEMÁTICA</span></a>
                  <span class="menu"> <a href="../PaginasPrincipais/materias/portu.php"> PORTUGUÊS</span></a>
                  <span class="menu"><a href="../PaginasPrincipais/materias/ciencias.php"> CIÊNCIA</span></a>
                  <span class="menu"> <a href="../PaginasPrincipais/materias/historia.php"> HISTÓRIA</span></a>
                  <span class="menu"> <a href="../PaginasPrincipais/materias/geografia.php"> GEOGRAFIA</span></a>
                  <span class="menu"> <a href="../PaginasPrincipais/materias/cienciashumanas.php"> CIÊNCIAS HUMANAS</span></a>
                </div>
            </div>

            <div class="menu active">
            <a href="desempenho.php"> <i class='bx bx-bar-chart-alt'></i>
                <span>Desempenho</span></a>
            </div>

            <div class="menu">
            
            <a href="configuracoes.php"> <i class="bx bx-cog"></i>
                <span> Configurações </span></a>
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
                echo '<img src="data:image/jpeg;base64,'.base64_encode($row['image_data']).'" alt="profile" class="perfil" style="width: 50px; height: 40px; border-radius: 50%;">';
            } else {
                // Se o usuário não tiver uma imagem de perfil, exibe uma imagem padrão
                echo '<img src="../source/img/perfil-padrao.png" alt="profile">';
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

    </aside> <!-- LEFT MENU -->

    <section class="dese">
        <div class="princi">
            <h1>Desempenho</h1>

            <div class="config-container">
                <div class="config-box">
                    <h4>Médias percentual dos simulados: </h4>
                        <h1>
                            <?php echo $media_percentual;?>
                        </h1>
                </div> <!-- PERCENTUAL --> 

                <div class="acerto">
                    <p>Questões que acertei: 
                        <?php echo $total_corretas;?>
                    </p>                   
                </div> <!-- QUESTÕES ACERTADAS -->

                <div class="erro">
                    <p>Questões que errei: 
                        <?php echo $total_incorretas;?>
                    </p>
                </div> <!-- QUESTÕES ERRADAS -->

                <!-- <div class="matuniversal">
                    <p>Matéria com a maior taxa de acerto: Português

                    </p>
                </div> --> <!-- MATÉRIA > TAXA ACERTO -->

                <!-- <div class="matuniversal">
                    <p>Matéria com a menor taxa de acerto: Geografia

                    </p>
                </div> --> <!-- MATÉRIA < TAXA ACERTO -->

                <div class="matuniversal">
                    <p>Simulados feitos:
                        <?php echo $total_simulados; ?>
                    </p>
                </div> <!-- SIMULADOS FEITOS -->

                <div class="matuniversal">
                    <p>Taxa de acertos geral: 
                        <?php echo $taxa_acerto; ?>
                    </p>                    
                </div> <!-- TAXA DE ACERTO GERAL SIMLULADOS -->

                <!-- <div class="matuniversal">
                    <p>Matérias que você precisa revisar</p>
                    <h2></h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Disciplina</th>
                                <th>Conteúdo</th> 
                                <th>Qtd. de questões</th>
                                <th>% de erro</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Matemática</td>
                                <td>Trigonometria</td>
                                <td>25</td>
                                <td>65%</td>
                            </tr>
                        --><!-- Adicione mais linhas conforme necessário --> <!--
                        </tbody>
                    </table>
                </div> --> <!-- MATÉRIAS P/ REVISAR -->
                
            </div> <!-- TABELA DESEMPENHO -->
        </div> 
    </section> <!-- SEÇÃO DE DESEMPENHHO -->

    <!-- IMPORT CDNJS JQUERY -->
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
    </script>

    <script src="java.js"></script>
       
</body>
</html>