<?php
    require('../source/includes/connect.php');
  
   
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/freeps2/a7rarpress@main/swiper-bundle.min.css">
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
             <a href="principal.php"><i class='bx bxs-home'></i>
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

            <div class="menu">
            <a href="desempenho.php"> <i class='bx bx-bar-chart-alt'></i>
                <span>Desempenho</span></a>
            </div>

            <div class="menu">
            
            <a href="configuracoes.php"> <i class="bx bx-cog"></i>
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
    <div class="banner-container">
  <div class="banner">
    <img src="../source/img/undraw_join_re_w1lh.svg" alt="">
   
    <div>
    <h1>Bem vindo, <?php echo ucwords($_SESSION['user']); ?></h1>
      <div class="details-text">Bem vindo ao nosso site de educação! Estamos muito felizes por ter você conosco. Aqui, você encontrará uma variedade de recursos e materiais de aprendizado para ajudá-lo em sua jornada educacional. Explore, aprenda e cresça conosco. Desejamos a você uma experiência de aprendizado incrível e produtiva!</div>
    </div>
  </div>
</div>

    <h1 class="center">Comece agora:</h1> 

    <div class="slide-container swiper">
            <div class="slide-content">
                <div class="card-wrapper swiper-wrapper">
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>

                            <div class="card-image">
                               <img src="" alt="" class="card-img">
                            </div>
                        </div>

                        <div class="card-content">
                            <h2 class="name">ETEC 2023
</h2>
                            <p class="description">A prova ETEC 2023 foi caracterizada por questões de literatura. Os alunos que tinham uma compreensão profunda dos textos obtiveram um desempenho superior.</p>

                            <a href="../PaginasPrincipais/Provas/2023/prova1.php"><button class="button">ETEC 2023</button></a>


                        </div>
                    </div>
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>

                            <div class="card-image">
                                   <img src="" alt="" class="card-img">
                            </div>
                        </div>

                        <div class="card-content">
                            <h2 class="name"> ETEC 2022
</h2>
                            <p class="description">A prova ETEC 2022 foi marcada por questões complexas de matemática e ciências. Os estudantes que dominavam esses assuntos obtiveram uma pontuação acima da média.</p>

                            <a href="../PaginasPrincipais/Provas/2022/prova1.php"><button class="button">ETEC 20242</button></a>


                        </div>
                    </div>
                 
                      
                
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>

                            <div class="card-image">
                                    <img src="" alt="" class="card-img">
                            </div>
                        </div>

                        <div class="card-content">
                            <h2 class="name">ETEC 2019
</h2>
                            <p class="description">A prova ETEC 2019 foi notável por suas questões de história e geografia. Os alunos que tinham um conhecimento sólido dessas disciplinas se destacaram.</p>

                            <a href="../PaginasPrincipais/Provas/2019/prova1.php"><button class="button">ETEC 2024</button></a>

                        </div>
                    </div>
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>

                            <div class="card-image">
                                    <img src="" alt="" class="card-img">
                            </div>
                        </div>

                        <div class="card-content">
                            <h2 class="name">ETEC 2020
</h2>
                            <p class="description">A prova ETEC 2020 foi distinta por suas questões de matemática aplicada. Os alunos que conseguiram aplicar conceitos matemáticos tiveram um desempenho notável.</p>

                            <a href="../PaginasPrincipais/Provas/2020/prova1.php"><button class="button">ETEC 2023</button></a>

                        </div>
                    </div>
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>

                            <div class="card-image">
                                    <img src="" alt="" class="card-img">
                            </div>
                        </div>

                        <div class="card-content">
                            <h2 class="name">ETEC 2015
</h2>
                            <p class="description">A prova ETEC 2015 foi caracterizada por questões de ciências naturais. Os alunos que tinham um bom entendimento de biologia, física e química obtiveram um desempenho excelente.</p>

                            <a href="../PaginasPrincipais/Provas/2023/prova1.php"><button class="button">ETEC 2023</button></a>

                        </div>
                    </div>
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>

                            <div class="card-image">
                                    <img src="https://tinypic.host/images/2022/12/19/img_avatar.png" alt="" class="card-img">
                            </div>
                        </div>

                        <div class="card-content">
                            <h2 class="name">ETEC 2024 
</h2>
                            <p class="description">A prova ETEC 2024 foi marcada por perguntas de raciocínio lógico. Os alunos que dominaram conceitos matemáticos e aplicaram a lógica corretamente tiveram um bom desempenho.</p>

                            <a href="../PaginasPrincipais/Provas/2024/prova1.php"><button class="button">ETEC 2024</button></a>
                        </div>
                    </div>
                   
                </div>
            </div>

            <div class="swiper-button-next swiper-navBtn"></div>
            <div class="swiper-button-prev swiper-navBtn"></div>
            <div class="swiper-pagination"></div>
        </div>
        
    </body>

    <!-- Swiper JS -->
   <script src="//cdn.jsdelivr.net/gh/freeps2/a7rarpress@main/swiper-bundle.min.js"></script>

    <!-- JavaScript -->
      <!--Uncomment this line-->
    <script src="//cdn.jsdelivr.net/gh/freeps2/a7rarpress@main/script.js"></script>
</div>


<h1 class="center">Faça questões por matéria: </h1> 


    
  <div class="secao azul">
    <h2> <i class="fa-solid fa-book"></i> Português</h2>
    <div class="topicos">
    <a href="../PaginasPrincipais/materias/portu.php"><button class="button-28" role="button">Começar</button></a>
  
    </div>
  </div>

  <div class="secao vermelho">
    <h2> <i class="fa-solid fa-calculator"></i> Matemática</h2>
    <div class="topicos">
    <a href="../PaginasPrincipais/materias/matematica.php"><button class="button-28" role="button">Começar</button></a>

    </div>
  </div>
  

  <div class="secao verde">
  
    <h2>  <i class="fa-solid fa-earth-americas"></i> Geografia</h2>
    <div class="topicos">
    <a href="../PaginasPrincipais/materias/geografia.php"><button class="button-28" role="button">Começar</button></a>

    </div>
  </div>

  <div class="secao laranja">
    <h2><i class="fa-solid fa-flask"></i> Ciências</h2>
    <div class="topicos">
    <a href="../PaginasPrincipais/materias/ciencias.php"><button class="button-28" role="button">Começar</button></a>

    </div>
  </div>

  <div class="secao amarelo">
    <h2><i class="fa-solid fa-landmark"></i> História</h2>
    <div class="topicos">
    <a href="../PaginasPrincipais/materias/historia.php"><button class="button-28" role="button">Começar</button></a>

    </div>
  </div>
  
  <div class="secao amarelo">
    <h2><i class="fa-solid fa-landmark"></i> Ciências Humanas</h2>
    <div class="topicos">
    <a href="../PaginasPrincipais/materias/cienciashumanas.php"><button class="button-28" role="button">Começar</button></a>

    </div>
  </div>

  







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




<?php } else {
    include '../source/includes/connect.php';
    loginRedirectError();
} ?>

<script src="java.js"></script>
</body>
</html>