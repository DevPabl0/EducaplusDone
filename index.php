<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>EducaPlus</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='style.css'>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://unpkg.com/scrollreveal"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
    <header class="header">
        <div id="menu-btn" class="fas fa-bars"></div>
        
        <a href="#" class="logo">Educa<span>Plus</span><i class='bx bx-pen bx-flip-vertical bx-tada' style='color:#352eab' ></i></a>
        <?php
            if(isset($_GET['deluser'])) { echo "<h2><span>Conta apagada com sucesso!!</span></h2>"; }  
        ?>
        <nav class="navegation">
            <a href="#home" class="active">Home</a>
            <a href="#about">Sobre nós</a>
            <a href="#faq">FAQ</a>

        </nav>

        <div class="button-2">
            <a href="PaginasPrincipais/SubPags/cadastro.php"><button class="button-29" role="button">Cadastre-se</button></a>
            <a href="PaginasPrincipais/SubPags/login.php"><button class="button-28" role="button">Login</button></a>

        </div>
    </header>
    <main>
        <section class="home hidden" id="home">
            
            <div class="content">
                <h2>
                    Bem-vindo ao Educa<span>Plus</span> - Moldando mentes brilhantes para um futuro brilhante!</h2>
                <p>No EducaPlus, nós oferecemos uma plataforma de simulados online que visa preparar os alunos para os desafios acadêmicos. Nossa plataforma é projetada para ajudar os alunos a se familiarizarem com o formato dos exames, aprimorar suas habilidades de resolução de problemas e aumentar sua confiança.</p>
                <button class="button-27">Saber Mais</button>
            </div>
          
            <div class="img">
                <!-- lembrar de por imagem aqui -->
                <img src="source/img/undraw_learning_re_32qv.svg" alt="homeimg" class="hidden">
            </div>



        </section>
        
        <section class="about hidden" id="about">
            <div class="about-img">
                <img src="source/img/undraw_about_us_page_re_2jfm.svg" alt="">
            </div>
            <div class="about-content">
                <h2 class="heading"> Sobre <span>Nós</span></h2>
               
                <p>Oferecemos uma plataforma de simulados online inovadora, projetada para familiarizar os estudantes com o formato dos exames. Nosso objetivo é aprimorar habilidades de resolução de problemas e fortalecer a confiança dos alunos. Conosco, você terá acesso a recursos que transformarão sua preparação acadêmica. Descubra mais sobre nossa missão e junte-se à comunidade Educa Plus para alcançar o sucesso acadêmico!</p>
             <button class="button-29">Ver mais</button>
            </div>
        </section>

        <section id="testimonials" class="hidden">
            <img src="source/img/undraw_publish_article_re_3x8h.svg" id="testimonial_chef" alt="">

            <div id="testimonials_content">
                <h2 class="section-title">
                    Depoimentos
                </h2>
                <h3 class="section-subtitle">
                    O que os usuários dizem:
                </h3>

                <div id="feedbacks">
                    <div class="feedback">
                        <img src="source/img/perfil-padrao.png" class="feedback-avatar" alt="">

                        <div class="feedback-content">
                            <p>
                                Maria de souza
                                <span>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                </span>
                            </p>
                            <p>
                            “Estou impressionada com o Educa Plus! Os simulados me ajudaram a ganhar confiança para os exames. Recomendo a todos os estudantes.”
                            </p>
                        </div>
                    </div>

                    <div class="feedback">
                        <img src="source/img/perfil-padrao.png" class="feedback-avatar" alt="">

                        <div class="feedback-content">
                            <p>
                                Pedro Silva
                                <span>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                </span>
                            </p>
                            <p>
                            “O Educa Plus é incrível! Os recursos de preparação são excelentes e me ajudaram a melhorar meus resultados. Não posso agradecer o suficiente!”

                            </p>
                        </div>
                    </div>

                    <div class="feedback">
                        <img src="source/img/perfil-padrao.png" class="feedback-avatar" alt="">

                        <div class="feedback-content">
                            <p>
                                Julhinha do grau
                                <span>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                </span>
                            </p>
                            <p>
                            “Como mãe, fico feliz em ver minha filha usando o Educa Plus. Ela está mais focada e preparada para os testes graças a essa plataforma.”
                            </p>
                        </div>
                    </div>
                </div>

                <button class="button-29">
                    Ver mais avaliações
                </button>
            </div>
        </section>

    <section class="wrapper hidden" id="faq" >
      <h1 class="heading" ><span>Perguntas frequentes</span></h1>
        <div class="faq">
            <button class="accordion">
                O que é EducaPlus?
                <i class="fa-solid fa-chevron-down"></i>
            </button>
        <div class="pannel">
            <p>
                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Laboriosam, inventore eum. Esse, harum qui officia et excepturi distinctio corporis quos? Laudantium unde ea aliquid vitae alias modi sequi qui nesciunt!
            </p>
        </div>
      </div>

      <div class="faq">
        <button class="accordion">
          Lorem
          <i class="fa-solid fa-chevron-down"></i>
        </button>
        <div class="pannel">
          <p>
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
            saepe molestiae distinctio asperiores cupiditate consequuntur dolor
            ullam, iure eligendi harum eaque hic corporis debitis porro
            consectetur voluptate rem officiis architecto.
          </p>
        </div>
      </div>

      <div class="faq">
        <button class="accordion">
          Lorem
          <i class="fa-solid fa-chevron-down"></i>
        </button>
        <div class="pannel">
          <p>
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
            saepe molestiae distinctio asperiores cupiditate consequuntur dolor
            ullam, iure eligendi harum eaque hic corporis debitis porro
            consectetur voluptate rem officiis architecto.
          </p>
        </div>
      </div>

      <div class="faq">
        <button class="accordion">
          lorem
          <i class="fa-solid fa-chevron-down"></i>
        </button>
        <div class="pannel">
          <p>
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
            saepe molestiae distinctio asperiores cupiditate consequuntur dolor
            ullam, iure eligendi harum eaque hic corporis debitis porro
            consectetur voluptate rem officiis architecto.
          </p>
        </div>
      </div>

      <div class="faq">
        <button class="accordion">
          Lorem
          <i class="fa-solid fa-chevron-down"></i>
        </button>
        <div class="pannel">
          <p>
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
            saepe molestiae distinctio asperiores cupiditate consequuntur dolor
            ullam, iure eligendi harum eaque hic corporis debitis porro
            consectetur voluptate rem officiis architecto.
          </p>
        </div>
      </div>

      <div class="faq">
        <button class="accordion">
          Lorem
          <i class="fa-solid fa-chevron-down"></i>
        </button>
        <div class="pannel">
          <p>
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
            saepe molestiae distinctio asperiores cupiditate consequuntur dolor
            ullam, iure eligendi harum eaque hic corporis debitis porro
            consectetur voluptate rem officiis architecto.
          </p>
        </div>
      </div>
    </div>
</section>

        
    </main>
    <footer>
        <div class="footer hidden">
        <div class="row">
       
        <a href="https://www.instagram.com/tech_solutions_plus?igsh=dmV3empnZ3NsbXR2"><i class="fa-brands fa-instagram"></i></a>
        <a href="#"><i class="fa-brands fa-youtube"></i></a>
        <a href="https://www.tiktok.com/@tech.solutions62?_t=8kXj6z3Oscg&_r=1"><i class="fa-brands fa-tiktok"></i></a>
      
        </div>
        
        <div class="row">
       <p> TechSolutions Copyright © 2024 - Todos direitos reservados </p> 
        </div>
        </div>
        </footer>

    <!-- javascript -->
    <script src="source/javascript/main.js"></script>
    <script>
        var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function () {
    this.classList.toggle("active");
    this.parentElement.classList.toggle("active");

    var pannel = this.nextElementSibling;

    if (pannel.style.display === "block") {
      pannel.style.display = "none";
    } else {
      pannel.style.display = "block";
    }
  });
}

    </script>
</body>
</html>