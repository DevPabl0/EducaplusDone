<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simulado do Vestibulinho ETEC 2024 - 1° Semestre</title>
</head>
<body>
    <?php
    require('../../../source/includes/connect.php'); 
        if(!$conexao) {
            die("Falha na conexão com o banco de dados: " . mysqli_connect_error());
        }

            // Seleciona as questões do banco de dados
        $sql = "SELECT * FROM etec_questions ORDER BY RAND() LIMIT 50";
        $result = $conexao->query($sql);

                // Verifica se há questões
        if ($result->num_rows > 0) {
            echo "<form method='post' action='../../SubPags/calcular_pontuacao.php'>";
            // Exibe as questões com o formulário para seleção de respostas
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<h2>Pergunta:</h2>";
                echo "<p>" . $row['question_text'] . "</p>";
                echo "<ul>";
                echo "<li><input type='radio' name='" . $row['id'] . "' value='A'>" . $row['option_a'] . "</li>";
                echo "<li><input type='radio' name='" . $row['id'] . "' value='B'>" . $row['option_b'] . "</li>";
                echo "<li><input type='radio' name='" . $row['id'] . "' value='C'>" . $row['option_c'] . "</li>";
                echo "<li><input type='radio' name='" . $row['id'] . "' value='D'>" . $row['option_d'] . "</li>";
                echo "<li><input type='radio' name='" . $row['id'] . "' value='E'>" . $row['option_e'] . "</li>";
                echo "</ul>";
            }
            echo "<input type='submit' value='Enviar Respostas'>";
            echo "</form>";
        } else {
            echo "Nenhuma questão encontrada no banco de dados.";
        }

        mysqli_close($conexao);
    ?>
    <h2>Simulado do Vestibulinho ETEC 2024 - 1° Semestre</h2>
    
</body>
</html>
