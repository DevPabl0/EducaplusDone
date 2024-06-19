let menu = document.querySelector('#menu-btn');
let navegation = document.querySelector('.navegation');

menu.onclick = () =>{
    menu.classList.toggle('fa-times');
    navegation.classList.toggle('active');
}



const myObserver = new IntersectionObserver((abacate) =>{
    abacate.forEach((abacatizinho) =>{
        if(abacatizinho.isIntersecting){
            abacatizinho.target.classList.add('show');
        }
        else{
         abacatizinho.target.classList.remove('show')   
        }
    })
})

const elements = document.querySelectorAll('.hidden');

elements.forEach((Element)=> myObserver.observe(Element))

// console.log(lastone);

// document.querySelector('form').addEventListener('submit', function(event) {
//     event.preventDefault(); // impede o envio do formulário

//     var nome = document.getElementById('name').value;
//     var email = document.getElementById('email').value;
//     var celular = document.getElementById('number').value;
//     var senha = document.getElementById('password').value;
//     var confirmaSenha = document.getElementById('confirmPassword').value;

//     var mensagemErro = document.getElementById('mensagemErro');
//     mensagemErro.textContent = ''; // limpa qualquer mensagem de erro anterior

//     // Validação do nome
//     if(nome.length < 3) {
//         mensagemErro.textContent = 'O nome deve ter pelo menos 3 caracteres.';
//         return;
//     }

//     // Validação do email
//     var regexEmail = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
//     if(!regexEmail.test(email)) {
//         mensagemErro.textContent = 'Por favor, insira um endereço de e-mail válido.';
//         return;
//     }

//     // Validação do celular
//     var regexCelular = /^\(\d{2}\) \d{4}-\d{4}$/;
//     if(!regexCelular.test(celular)) {
//         mensagemErro.textContent = 'Por favor, insira um número de celular válido no formato (xx) xxxx-xxxx.';
//         return;
//     }

//     // Validação da senha
//     if(senha.length < 6) {
//         mensagemErro.textContent = 'A senha deve ter pelo menos 6 caracteres.';
//         return;
//     }

//     // Confirmação da senha
//     if(senha !== confirmaSenha) {
//         mensagemErro.textContent = 'As senhas não coincidem.';
//         return;
//     }

//     // Se todas as validações passarem, o formulário pode ser enviado
//     this.submit();
// });
