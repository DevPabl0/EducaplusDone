    
                                        <!-- \\\\\\ ESTÁ EM DESENVOLVIMENTO ////// -->


<?php
require('../../source/includes/connect.php');

// Verifica se a conexão com o banco de dados foi estabelecida com sucesso
if (!$conexao) {
    die("Falha na conexão com o banco de dados: " . mysqli_connect_error());
}

$r_usuario = [];
$ano_prova = $_POST['ano_prova'] ?? null;
$semestre_prova = $_POST['semestre_prova'] ?? null;
$user_id = $_SESSION['id'] ?? null; 

// Verifica se o formulário foi submetido via método POST e se foram fornecidos o ano e semestre da prova
if ($_SERVER["REQUEST_METHOD"] == "POST" && $ano_prova !== null && $semestre_prova !== null && $user_id !== null) {
    // Processamento do formulário
    foreach ($_POST as $questao => $resposta) {
        // Verifica se a resposta é uma questão válida (começa com 'q')
        if (substr($questao, 0, 1) == 'q') {
            $r_usuario[$questao] = $resposta;
        }
    }

    // Seleciona as perguntas correspondentes ao ano e semestre da prova
    $sql = "SELECT * FROM tbQuestions WHERE exam_year = $ano_prova AND semestre = '$semestre_prova'";
    $result = mysqli_query($conexao, $sql);

    if ($result && mysqli_num_rows($result) > 0) {
        $pontuacao = 0;
        $total_questoes = mysqli_num_rows($result);
        $acertos = 0;
        $erros = 0;
        $nao_respondidas = 0;
        $questoes_erradas = [];
        $questoes_corretas = [];

        // Calcula a pontuação do usuário e contabiliza as respostas corretas, incorretas e não respondidas
        while ($row = mysqli_fetch_assoc($result)) {
            $questao_id = 'q' . $row['cod_question'];
            
            if (isset($r_usuario[$questao_id])) {
                if (strtolower($r_usuario[$questao_id]) === strtolower($row['correct_option'])) {
                    $pontuacao++;
                    $acertos++;
                    $questoes_corretas[$row['cod_question']] = $row['correct_option'];
                } else {
                    $erros++;
                    $questoes_erradas[$row['cod_question']] = [
                        'texto_questao' => $row['text_question'],
                        'resposta_errada' => $r_usuario[$questao_id],
                        'resposta_correta' => $row['correct_option']
                    ];
                }
            } else {
                $nao_respondidas++;
            }
        }

        // Calcula a pontuação em porcentagem e arredonda para uma casa decimal
        $pontuacao_percent = round(($pontuacao / $total_questoes) * 100, 1);
        
        // Insere os resultados na tabela tbResults
        $sql_insert = "INSERT INTO tbResults (cod_usuario, exam_year, semestre, total_questoes, pontuacao_percent, questoes_corretas, questoes_erradas) 
                VALUES ('$user_id', '$ano_prova', '$semestre_prova', '$total_questoes', '$pontuacao_percent', '$acertos', '$erros')";
        $result_insert = mysqli_query($conexao, $sql_insert);

        if (!$result_insert) {
            echo "Erro ao inserir resultados na tabela tbResults: " . mysqli_error($conexao);
        }
        
        // Exibe resultados
        echo "Pontuação do usuário: $pontuacao de $total_questoes questões corretas. ";
        echo "Isso equivale a $pontuacao_percent% de acertos.";

        echo "<br><br>";
        echo "Número de questões corretas: $acertos<br>";
        echo "Número de questões erradas: $erros<br>";
        echo "Número de questões não respondidas: $nao_respondidas";

        echo "<br><br>";
        echo "Respostas incorretas e suas respectivas respostas corretas:<br>"; // 0
        foreach ($questoes_erradas as $questao_id => $respostas) {
            echo "- Questão incorreta: {$respostas['texto_questao']} - Resposta selecionada: {$respostas['resposta_errada']}<br>";
            echo "  Resposta correta: {$respostas['resposta_correta']}<br>";
        }

    } else {
        echo "Nenhuma pergunta encontrada para o ano $ano_prova e semestre $semestre_prova.";
    }
} else {
    echo "Erro: Ano e/ou semestre da prova e/ou ID do usuário não foram fornecidos.";
}

// Fecha a conexão com o banco de dados
mysqli_close($conexao);
?>
