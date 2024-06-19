<?php

  require('../source/includes/connect.php');


  
  // Verifica se o botão foi clicado
  if(isset($_POST['alterar_imagem'])) {
      // Verifica se um arquivo foi enviado
      if(isset($_FILES['nova_imagem'])) {
          // Verifica se não houve erro no upload
          if($_FILES['nova_imagem']['error'] === 0) {
              $cod_usuario = $_SESSION['id'];
              $imagem_temp = $_FILES['nova_imagem']['tmp_name'];
              
              // Prepara a imagem para ser armazenada no banco de dados
              $imagem_data = file_get_contents($imagem_temp);
              
              // Verifica se o usuário já possui uma imagem de perfil
              $sql = "SELECT cod_image_perfil FROM tbImagensPerfil WHERE cod_usuario = $cod_usuario";
              $result = $conexao->query($sql);
              
              if($result->num_rows > 0) {
                  // Se já existir uma imagem, atualiza-a
                  $row = $result->fetch_assoc();
                  $cod_imagem_perfil = $row['cod_image_perfil'];
                  
                  $sql = "UPDATE tbImagensPerfil SET image_data = ? WHERE cod_image_perfil = ?";
                  $stmt = $conexao->prepare($sql);
                  $stmt->bind_param("si", $imagem_data, $cod_imagem_perfil);
                  if($stmt->execute()) {
                      // echo "Imagem atualizada com sucesso!";
                  } else {
                      // echo "Erro ao atualizar imagem: " . $conexao->error;
                  }
              } else {
                  // Se não existir uma imagem, insere uma nova
                  $sql = "INSERT INTO tbImagensPerfil (cod_usuario, image_data) VALUES (?, ?)";
                  $stmt = $conexao->prepare($sql);
                  $stmt->bind_param("is", $cod_usuario, $imagem_data);
                  if($stmt->execute()) {
                      // echo "Imagem inserida com sucesso!";
                  } else {
                      // echo "Erro ao inserir imagem: " . $conexao->error;
                  }
              }
          } else {
              // echo "Erro no upload da imagem.";
          }
      } else {
          // echo "Nenhuma imagem selecionada.";
      }
  }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Configurações</title>
    <link rel="stylesheet" href="../style.css">
    <!-- IMPORT BOXICONS -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

   
</head>
<body>
  <?php if(isset($_SESSION['logstatus']))  ?>
  
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

            <div class="menu">
            <a href="desempenho.php"><i class='bx bx-bar-chart-alt'></i>
                <span>Desempenho</span></a>
            </div>

            <div class="menu active">
            
            <a href="configuracoes.php"><i class="bx bx-cog"></i>
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

    </aside>  <!-- LEFT MENU -->


    <section class="dese">
        <div class="princi">

          <h1>Configurações</h1>

          <div class="config-container">

            <div class="config-box">

              <h4>Avatar</h4>
              <h2></h2>
                <!-- <img src="img/" alt="img">
                <button class="button-27">Alterar imagem</button> -->
                <form method="post" enctype="multipart/form-data"><br><br>
                    <input type="file" name="nova_imagem"><br><br>
                    <button type="submit" name="alterar_imagem" class="button-27">Alterar imagem</button>
                </form>
            </div>
            <div class="config-box">
                <h4>Dados Pessoais</h4>
                <h2></h2>
                <div class="container-dados">
                <div class="dados">

                    <p>Nome: 
                    <?php
                  echo ucwords($_SESSION['user']); ?>                         
             
                    </p>
    
                </div>
                <div class="dados">
                    <p>Email: 
                    <?php
                        echo $_SESSION['email'];                          
                    ?>  
                    </p>
                </div>
                <div class="dados">
                    
                    <p>Telefone:
                       
                    <?php
                        echo $_SESSION['telefone'];                          
                  ?>
                </p>
    
                </div>
                <div class="dados">
                    
                    <p>Data de Cadastro:  
                <?php
                  echo $_SESSION['dt_cadastro'];                          
                ?>   
              </p>
    
                </div>
                </div>
               
                    
            
                 
                    

                <button class="button-27">Alterar senha</button>
                <button class="button-29">Salvar Alterações</button>
                </div>
            

              
            </div>
          </div>
        </div>
      </section>

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