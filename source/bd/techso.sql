DROP DATABASE IF EXISTS TechSolutions;

CREATE DATABASE TechSolutions;

USE TechSolutions;

CREATE TABLE tbUsuarios(
    cod_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(30),
    email_usuario VARCHAR(50),
    user_id INT NOT NULL,
    
    celular CHAR(11),
    senha VARCHAR(255),
    data_nasc DATE,
    data_cadastro DATETIME,
    login DATETIME,
    dt_alteracao DATETIME
);
INSERT INTO tbUsuarios (nome_usuario, email_usuario, celular, senha, data_nasc, data_cadastro, login, dt_alteracao)
VALUES ('Nome do Usuário', 'email@exemplo.com', '12345678901', 'senha123', '2000-01-01', NOW(), NOW(), NOW());


CREATE TABLE tbQuestions (
    cod_question INT AUTO_INCREMENT PRIMARY KEY,
    text_question TEXT,
    option_a VARCHAR(255),
    option_b VARCHAR(255),
    option_c VARCHAR(255),
    option_d VARCHAR(255),
    option_e VARCHAR(255),
    correct_option VARCHAR(255),
    materia VARCHAR(30),
    exam_year INT,
    semestre CHAR(1) CHECK(semestre IN ('1','2'))
);

CREATE TABLE tbUserAnswers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    question_id INT NOT NULL,
    user_answer CHAR(1),
    is_correct BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES tbUsuarios(cod_usuario),
    FOREIGN KEY (question_id) REFERENCES tbQuestions(cod_question)
);

CREATE TABLE tbResults (
    cod_resultado INT AUTO_INCREMENT PRIMARY KEY,
    cod_usuario INT,
    exam_year INT,
    semestre CHAR(1) CHECK(semestre IN ('1','2')),
    total_questoes INT,
    pontuacao_percent DECIMAL(5,2),
    maior_taxa_acerto VARCHAR(255),
    menor_taxa_acerto VARCHAR(255),
    questoes_corretas INT,
    questoes_erradas INT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cod_usuario) REFERENCES tbUsuarios(cod_usuario)
);

CREATE TABLE tbImagens (
    cod_image INT AUTO_INCREMENT PRIMARY KEY,
    cod_question INT,
    image_data VARCHAR(255),
    materia VARCHAR(30),
    FOREIGN KEY (cod_question) REFERENCES tbQuestions(cod_question)
);

CREATE TABLE tbImagensPerfil (
    cod_image_perfil INT AUTO_INCREMENT PRIMARY KEY,
    cod_usuario INT,
    image_data LONGBLOB,
    FOREIGN KEY (cod_usuario) REFERENCES tbUsuarios(cod_usuario)
);

-- INSERT TABLE tbQUESTIONS PROVA 2024 1 SEMESTRE
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        1,
        'Com base no texto e com o auxílio do mapa, é correto afirmar que', 
        'A) Amazônia Internacional é administrada pelo Instituto Brasileiro de Geografia e Estatística (IBGE).', 
        'B) Os estados da Região Norte do Brasil estão totalmente inseridos na Amazônia Legal.', 
        'C) O estado do Maranhão, por pertencer à Região Norte, faz parte da Amazônia Legal.', 
        'D) A bacia hidrográfica do Amazonas engloba todos os rios da América do Sul.', 
        'E) O Bioma Amazônia se estende da Venezuela até o sul da Argentina.', 
        'B) Os estados da Região Norte do Brasil estão totalmente inseridos na Amazônia Legal.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        2,
        'A Amazônia Legal', 
        'A) Abrange todos os estados da Região Centro-Oeste do Brasil.', 
        'B) Localiza-se totalmente no hemisfério sul da Terra.', 
        'C) Engloba a maior parte do Bioma Amazônia.', 
        'D) Inclui todas as reservas indígenas existentes no Brasil.', 
        'E) Avança sobre o polígono das secas, no Nordeste brasileiro.', 
        'C) Engloba a maior parte do Bioma Amazônia.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        3,
        'Ela está subdivida em', 
        'A) Floresta aciculifoliada, mata de transição e mata ciliar.', 
        'B) Mata de igapó, mata de várzea e mata de terra firme.', 
        'C) Restinga, campos limpos e mata dos cocais.', 
        'D) Pantanal, cerrado e floresta de araucária.', 
        'E) Caatinga, campos sujos e manguezais.', 
        'B) Mata de igapó, mata de várzea e mata de terra firme.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        4,
        'Considerando o tipo de vegetação, é correto afirmar que o Bioma Amazônia se caracteriza, principalmente, por apresentar', 
        'A) Gramíneas e plantas arbustivas; árvores de pequeno e médio porte, com folhas transformadas em espinhos para diminuir a transpiração e caules suculentos que armazenam água.', 
        'B) Plantas, que se desenvolvem em solos lamacentos e salgados, com troncos finos, cujas raízes se adaptam à fixação e se elevam à superfície para permitir a respiração.', 
        'C) Plantas herbáceas e arbustivas que compõem os campos; árvores de médio porte, geralmente com troncos grossos e retorcidos, folhas de superfície reduzida e raízes profundas.', 
        'D) Árvores de médio e grande porte, com folhas largas e perenes; vários tipos de flores e frutos; além de diversos tipos de arbustos, trepadeiras, cipós e planta epífitas.', 
        'E) Gramíneas; plantas herbáceas; leguminosas; algumas árvores de pequeno porte; além da presença de matas ciliares e algumas árvores decíduas.', 
        'D) Árvores de médio e grande porte, com folhas largas e perenes; vários tipos de flores e frutos; além de diversos tipos de arbustos, trepadeiras, cipós e planta epífitas.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        5,
        'Segundo a letra da canção,', 
        'A) A falta de mobilização dos povos originários para proteger os biomas mencionados resulta do curto período de convivência com a floresta.', 
        'B) A destruição da Floresta Amazônica gera prejuízos à vida animal e à vegetal, amenizando os impactos na vida e na cultura daqueles que a habitam.', 
        'C) Os povos originários aliaram-se recentemente aos guardiões da floresta, quando houve um recrudescimento trágico do desmatamento.', 
        'D) A Amazônia é alvo de exploração pelo caráter único de suas riquezas, ação facilitada pela ausência de medidas efetivas de proteção.', 
        'E) Os ataques à Floresta Amazônica, além de esporádicos, acarretam consequências reversíveis e restritas à fauna local.', 
        'D) A Amazônia é alvo de exploração pelo caráter único de suas riquezas, ação facilitada pela ausência de medidas efetivas de proteção.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        6,
        'Sobre os recursos gramaticais utilizados na construção do texto, é correto afirmar que', 
        'A) Os termos “porém” (v. 5), “pois” (v. 8) e “todavia” (v. 9) têm o mesmo sentido.', 
        'B) Os pronomes “seus” (v. 24) e “eles” (v. 25) se referem à mesma ideia, mencionada anteriormente no texto.', 
        'C) Os dois-pontos, utilizados nos versos 4 e 9, introduzem uma justificativa para os fatos apresentados.', 
        'D) O vocábulo “que”, nos versos 7 e 8, retoma “mundo” e “vida” respectivamente.', 
        'E) Os pronomes “seu” (v. 17) e “deles” (v. 21) antecipam uma informação posteriormente apresentada no texto.', 
        'B) Os pronomes “seus” (v. 24) e “eles” (v. 25) se referem à mesma ideia, mencionada anteriormente no texto.',
        'Português',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        7,
        'Na letra dessa canção, ocorre',
        'A) Metáfora no trecho “contra trator, corrente, motosserra”, verso 03, pois os objetos listados simbolizam a superação da floresta contra as ameaças externas.', 
        'B) Antítese entre “beleza” e “valor”, verso 6, pois são termos de sentido oposto.', 
        'C) Paronomásia no excerto “tanta insânia e tanta insônia”, verso 12, pois se aproximam termos com sons semelhantes e sentidos diferentes.', 
        'D) Paradoxo em “nos últimos e trágicos decênios”, verso 19, pois o conceito de “trágico” anula a ideia de novidade, expressa pelo termo “últimos”.', 
        'E) Personificação na passagem “eles não pensam”, verso 25, pois se atribui a capacidade de pensar a seres inanimados.', 
        'C) Paronomásia no excerto “tanta insânia e tanta insônia”, verso 12, pois se aproximam termos com sons semelhantes e sentidos diferentes.',
        'Português',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        8,
        'Com relação a todos os animais citados, é correto afirmar que',
        'A) Realizam as trocas gasosas por meio de um par de pulmões do tipo alveolar com paredes muito delgadas.',
        'B) Conseguem manter a temperatura corporal constante apesar de alterações da temperatura ambiental.',
        'C) Dependem de oxigênio, que é usado na oxidação de moléculas orgânicas, como a glicose, a fim de obter energia.',
        'D) Apresentam fecundação externa, com desenvolvimento indireto por meio de fase larval, seguida de metamorfose.',
        'E) Possuem bexiga natatória, que é um órgão responsável pela manutenção do equilíbrio hidrostático.',
        'C) Dependem de oxigênio, que é usado na oxidação de moléculas orgânicas, como a glicose, a fim de obter energia.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        9,
        'De acordo com o texto, é correto afirmar que',
        'A) A floresta Amazônica brasileira tem 670 milhões de hectares.',
        'B) A maior floresta tropical do mundo está localizada totalmente em território brasileiro.',
        'C) O Brasil pode comprar créditos de carbono para custear a Floresta Amazônica.',
        'D) Países que emitem gases do efeito estufa em excesso podem adquirir créditos de carbono como forma de compensação.',
        'E) Cada tonelada de gases do efeito estufa não emitida, como dióxido de carbono e metano, equivale a 1 crédito de carbono.',
        'D) Países que emitem gases do efeito estufa em excesso podem adquirir créditos de carbono como forma de compensação.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        10,
        'Considere os números destacados em negrito no texto e assinale a alternativa que apresenta, em notação científica, o seu produto.',
        'A) 1,0 × 10¹⁴',
        'B) 1,0 × 10¹³',
        'C) 1,0 × 10¹²',
        'D) 1,0 × 10¹¹',
        'E) 1,0 × 10¹⁰',
        'D) 1,0 × 10¹¹',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        11,
        'De acordo com o texto, a quantidade de créditos de carbono gerada pela parte brasileira da Floresta Amazônica seria, aproximadamente, de',
        'A) 402 milhões.',
        'B) 402 bilhões.',
        'C) 670 milhões.',
        'D) 12 060 bilhões.',
        'E) 12 060 milhões.',
        'E) 12 060 milhões.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        12,
        'De acordo com a representação, é correto afirmar que',
        'A) As missões jesuíticas não só demarcavam os limites entre as possessões espanhola e portuguesa, mas também garantiam a posse da Amazônia para a Espanha.',
        'B) A ocupação da América Portuguesa ocorreu na costa atlântica, em detrimento da região da Amazônia, que permaneceu despovoada até o final do século XVII.',
        'C) A integração da Amazônia ao território da colônia portuguesa está relacionada à presença de missões jesuíticas e de expedições para escravização de indígenas.',
        'D) As expedições de apresamento se estabeleceram na Amazônia Espanhola, e, de lá, partiram para o leste a fim de escravizar os indígenas que viviam na colônia portuguesa.',
        'E) A presença de missões jesuíticas portuguesas na Amazônia indica que essa região pertencia a Portugal, de acordo com os tratados internacionais vigentes no período colonial.',
        'C) A integração da Amazônia ao território da colônia portuguesa está relacionada à presença de missões jesuíticas e de expedições para escravização de indígenas.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        13,
        'Logo, é correto afirmar que a distância (em linha reta), em quilômetros, entre o ponto P e o acampamento A, é igual a',
        'A) 18.',
        'B) 20.',
        'C) 26.',
        'D) 28.',
        'E) 32.',
        'B) 20.',
        'História',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        14,
        'Com base no texto, o gênero textual abordado cumpre a função social de',
        'A) Colocar em destaque a revolução promovida pela tecnologia digital, já que essa mudança padroniza e limita a forma de aprender do estudante.',
        'B) Debater sobre os movimentos migratórios, cada vez maiores no nosso país, os quais prejudicam o surgimento de culturas novas na sociedade.',
        'C) Discutir as mudanças no núcleo familiar devido à dedicação exclusiva dos responsáveis a atividades profissionais, prejudicando a comunicação com as gerações mais jovens.',
        'D) Valorizar as identidades construídas ao longo do tempo, ao perceber que muitas pessoas passaram pelo mundo, deixando ensinamentos e experiências.',
        'E) Visualizar as mudanças laborais, uma vez que está cada vez mais fácil conseguir um trabalho formal na área de caça, pesca e apreensão de animais em áreas protegidas.',
        'D) Valorizar as identidades construídas ao longo do tempo, ao perceber que muitas pessoas passaram pelo mundo, deixando ensinamentos e experiências.',
        'Português',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        15,
        'De acordo com o texto, os ensinamentos e as histórias dos povos da Região Amazônica são transmitidos por meio de fontes',
        'A) Escritas.',
        'B) Iconográficas.',
        'C) Materiais.',
        'D) Orais.',
        'E) Arqueológicas.',
        'D) Orais.',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        16,
        'A formação da imagem da Lua, vista por Naiá, é justificada pelo fenômeno óptico da',
        'A) Refração da luz, proveniente da Lua, no fundo do lago.',
        'B) Ilusão de óptica criada pelo movimento das águas do lago.',
        'C) Reflexão dos raios de luz, provenientes da Lua, pela superfície do lago.',
        'D) Absorção dos raios de luz, provenientes da Lua, pela superfície do lago.',
        'E) Projeção holográfica dos raios de luz, provenientes da Lua, na superfície do lago.',
        'C) Reflexão dos raios de luz, provenientes da Lua, pela superfície do lago.',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        17,
        'Essas adaptações podem ser comparadas ao uso de',
        'A) Pés de pato por mergulhadores.',
        'B) Sinalizadores em barcos de passeio.',
        'C) Toucas de natação por competidores olímpicos.',
        'D) Coletes salva-vidas infláveis por pessoas que não sabem nadar.',
        'E) Roupas de neoprene por surfistas durante as competições no mar.',
        'D) Coletes salva-vidas infláveis por pessoas que não sabem nadar.',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        18,
        'Sobre esse estado da federação, é correto afirmar que nele se encontra o ponto',
        'A) Central Geodésico do território brasileiro, localizado em sua capital.',
        'B) Mais ocidental do território brasileiro, a nascente do Rio Moa.',
        'C) Mais setentrional do território brasileiro, a nascente do Rio Ailã.',
        'D) Mais oriental do território brasileiro, a Ponta do Seixas.',
        'E) Mais meridional do território brasileiro, o Arroio Chuí.',
        'B) Mais ocidental do território brasileiro, a nascente do Rio Moa.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        19,
        'Segundo o Texto',
        'A) Os anciões indígenas decidiram expor seus conhecimentos por meio de ideogramas devido à limitação cultural dos não indígenas.',
        'B) O povo Yanomami garante bem-estar social duradouro para as próximas gerações ao seguir os padrões de vida dos brancos.',
        'C) A exploração da caça e da pesca realizada pelos Yanomami é fruto do contato com o saber trazido pelos brancos colonizadores.',
        'D) A forma de divulgação da cultura dos povos originários para o restante da sociedade deve restringir-se à oralidade.',
        'E) O equilíbrio na relação entre natureza e homem é base e garantia da manutenção da cultura Yanomami.',
        'E) O equilíbrio na relação entre natureza e homem é base e garantia da manutenção da cultura Yanomami.',
        'História',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        20,
        'Assinale a alternativa que apresenta uma reescrita correta e coerente do trecho sublinhado no texto.',
        'A) Acredito que, caso vivamos em cidades, seríamos infelizes, já que haveria o fim da floresta e, então, não deixarão lugar onde poderemos viver distante deles.',
        'B) Como fomos viver em cidades, somos infelizes, pois os brancos acabam com a floresta e não deixaram lugar onde pudéssemos viver distante deles.',
        'C) E reconheço que, caso fôssemos viver em suas cidades, seríamos infelizes; eles acabariam, pois, com a floresta e não deixariam lugar onde pudéssemos viver distante deles.',
        'D) Ainda que fôssemos viver nas cidades dos brancos, não seremos felizes, pois eles acabaram com a floresta e não deixariam lugar onde poderíamos viver distante deles.',
        'E) Afirmo até que, ao irmos viver nas cidades, seremos infelizes, posto que eles acabam com a floresta e não deixam lugar onde pudemos viver distante deles.',
        'C) E reconheço que, caso fôssemos viver em suas cidades, seríamos infelizes; eles acabariam, pois, com a floresta e não deixariam lugar onde pudéssemos viver distante deles.',
        'Português',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        21,
        'A leitura é representada, no texto, pela metáfora:',
        'A) “Viver longe deles”.',
        'B) “Nos tornar brancos”.',
        'C) “Pensar coisas da floresta”.',
        'D) “Fixar os olhos em peles de papel”.',
        'E) “Desenhar na língua dos brancos”.',
        'D) “Fixar os olhos em peles de papel”.',
        'Português',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        22,
        'Segundo o texto:',
        'A) Os habitantes da Amazônia estabelecem relações harmônicas entre si e com a floresta e, por isso, não experienciam os principais problemas enfrentados pelas populações urbanas.',
        'B) Chico Mendes se dedicou a refletir sobre a sua relação com a floresta, desconsiderando causas sociais, como a questão fundiária.',
        'C) O fato de ter sido alfabetizado tardiamente afetou a compreensão de Chico Mendes, que não soube se posicionar sobre as questões sociais e ambientais de seu entorno.',
        'D) As vivências e práticas na floresta proporcionaram a Chico Mendes uma série de saberes os quais o levaram a formular uma teoria ambiental, que, mais tarde, foi comprovada por outras pessoas.',
        'E) Chico Mendes passou toda a sua vida isolado na floresta, sem estabelecer contatos com outras partes do Brasil e do mundo e, por isso, não foi bem sucedido em sua luta.',
        'D) As vivências e práticas na floresta proporcionaram a Chico Mendes uma série de saberes os quais o levaram a formular uma teoria ambiental, que, mais tarde, foi comprovada por outras pessoas.',
        'Português',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        23,
        'Entre os diversos mecanismos sugeridos para explicar como a derrubada da Floresta Amazônica contribuiria para o aumento da incidência da doença citada na pesquisa, é correto afirmar que',
        'A) A destruição completa do ambiente natural de reprodução dos insetos transmissores, decorrente do efeito estufa e da diminuição da camada de ozônio, favoreceria a proliferação das bactérias que causam essa doença, levando ao aumento do número de casos.',
        'B) O aumento da migração humana para fazendas, assentamentos e garimpos nas áreas desmatadas, junto com a adaptação dos insetos transmissores aos novos habitats, contribuiria para o aumento da transmissão dos parasitas causadores dessa doença.',
        'C) O desmatamento teria ocasionado a diminuição das superfícies aquáticas e o aparecimento de várias espécies de caramujos, hospedeiros das larvas dos insetos transmissores dessa doença.',
        'D) Os insetos transmissores, conhecidos popularmente como barbeiros, e outras várias espécies diferentes, após o desmatamento, teriam ficado altamente eficientes para a transmissão dessa doença.',
        'E) As condições ambientais nas regiões desmatadas da floresta, tais como temperaturas muito baixas e baixos índices pluviométricos, junto com a ausência dos insetos transmissores, teriam aumentado a incidência dessa doença.',
        'B) O aumento da migração humana para fazendas, assentamentos e garimpos nas áreas desmatadas, junto com a adaptação dos insetos transmissores aos novos habitats, contribuiria para o aumento da transmissão dos parasitas causadores dessa doença.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        24,
        'Uma expressão algébrica que relaciona o número de denúncias (N) em função do dia do mês (D) é',
        'A) N = 2D + 3.',
        'B) N = D + 3.',
        'C) N = 3D + 1',
        'D) N = D + 2.',
        'E) N = 2D + 1.',
        'A) N = 2D + 3.',
        'Matemática',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        25,
        'Com base apenas nos dados fornecidos para as usinas de Balbina e de Belo Monte, localizadas na região Amazônica, é possível avaliar a crítica, presente no texto, à instalação da hidrelétrica de Balbina como',
        'A) Incoerente, dado que 3 000 km² de área alagada não causam um impacto ambiental significativo para ser considerado um desastre.',
        'B) Coerente, já que são fornecidos apenas dados relativos à área alagada, que não são suficientes para analisar o impacto ambiental da usina de Balbina.',
        'C) Incoerente, uma vez que a usina de Belo Monte alaga uma região maior e tem potencial energético menor do que a usina de Balbina.',
        'D) Coerente, visto que a usina de Balbina alaga uma área maior e tem potencial energético menor do que a usina de Belo Monte.',
        'E) Incoerente, na medida em que o potencial energético de ambas as usinas é similar.',
        'D) Coerente, visto que a usina de Balbina alaga uma área maior e tem potencial energético menor do que a usina de Belo Monte.',
        'Português',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        26,
        'De acordo com o texto, os “paliteiros” mencionados se formaram',
        'A) Devido à instalação de indústrias madeireiras na Zona Franca de Manaus.',
        'B) Pela ação dos garimpeiros ilegais que poluíam as águas do rio Amazonas.',
        'C) Em consequência do aquecimento global, que impacta a flora e a fauna amazônicas.',
        'D) Pela ação de madeireiros que atuavam no município de Presidente Figueiredo.',
        'E) Em consequência da inundação do reservatório da usina hidrelétrica de Balbina.',
        'E) Em consequência da inundação do reservatório da usina hidrelétrica de Balbina.',
        'Português',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        27,
        'Dessa forma, o fator η de capacidade da usina hidrelétrica de Balbina é de, aproximadamente,',
        'A) 0,08.',
        'B) 0,32.',
        'C) 0,40.',
        'D) 2,50.',
        'E) 3,13.',
        'B) 0,32.',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        28,
        'É possível concluir corretamente que, em exatamente três quintos dos anos apresentados no gráfico, o desmatamento registrado ano a ano foi',
        'A) maior que 5 000 km².',
        'B) maior que 6 000 km².',
        'C) igual a 4 000 km².',
        'D) menor que 2 000 km².',
        'E) menor que 3 000 km².',
        'E) menor que 3 000 km².',
        'Matemática',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( 
        29,
        'Analise o conjunto de dados apresentados no gráfico e assinale a alternativa que apresenta a sua amplitude total.',
        'A) 9 069',
        'B) 8 061',
        'C) 7 023',
        'D) 3 555',                     
        'E) 2 283',
        'B) 8 061',
        'Matemática',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        30,
        'Os compostos mencionados são gases',
        'A) que protegem a Terra da radiação infravermelha.',
        'B) que protegem a Terra da radiação ultravioleta.',
        'C) do efeito estufa, os quais amenizam a temperatura global.',
        'D) do efeito estufa, os quais destroem a camada de ozônio.',
        'E) do efeito estufa, os quais potencializam o aquecimento global.',
        'E) do efeito estufa, os quais potencializam o aquecimento global.',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        31,
        'A evapotranspiração desempenha um papel fundamental como regulador no clima porque, conforme a água evapora, ela',
        'A) contribui na formação de arco-íris por meio da refração dos raios solares, e consequentemente aquece o ambiente.',
        'B) produz gás hidrogênio, um gás combustível que pode liberar calor para o ambiente, e consequentemente o aquecer.',
        'C) libera átomos de hidrogênio e oxigênio no ambiente, consequentemente o resfriando.',
        'D) consome oxigênio do ambiente, consequentemente o resfriando.',
        'E) absorve calor do ambiente, e consequentemente o resfria.',
        'E) absorve calor do ambiente, e consequentemente o resfria.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        32,
        'Com base no texto, é correto afirmar que os rios voadores',
        'A) despejam milhões de metros cúbicos de água por segundo no oceano Índico.',
        'B) tornam-se afluentes do rio Amazonas e deságuam nas bacias hidrográficas do sul do Brasil.',
        'C) são um dos responsáveis pelas chuvas em alguns estados brasileiros e em alguns países fronteiriços ao Brasil.',
        'D) derivam de árvores da Mata Tropical Atlântica, encravadas no alto da Cordilheira dos Andes e no Chaco paraguaio.',
        'E) nascem no oceano Atlântico e percorrem todo o litoral ocidental brasileiro até atingir as áreas situadas no centro-sul do Brasil.',
        'C) são um dos responsáveis pelas chuvas em alguns estados brasileiros e em alguns países fronteiriços ao Brasil.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        33,
        'Embora ninguém consiga promover grandes mudanças sozinho, algumas atitudes podem fazer a diferença na preservação do meio ambiente e da biodiversidade, como',
        'A) Evitar comprar de pequenos produtores de hortifrúti que, por produzirem em menor escala, aumentam as áreas desmatadas e, consequentemente, o impacto ambiental.',
        'B) Comprar móveis e papéis cuja matéria-prima não seja de reflorestamento ou de empresas sem certificação de fonte legal e sustentável.',
        'C) Aumentar o consumo de itens descartáveis, como guardanapos, papéis, pratos e canudos, evitando a reciclagem de produtos usados.',
        'D) Aumentar o consumo de carne bovina, pois, na criação extensiva de gado, as florestas são derrubadas para dar espaço ao pasto.',
        'E) Plantar árvores nativas, com autorização de órgãos responsáveis, para ajudar no reflorestamento de áreas urbanas e rurais.',
        'E) Plantar árvores nativas, com autorização de órgãos responsáveis, para ajudar no reflorestamento de áreas urbanas e rurais.',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        34,
        'Assinale a alternativa que apresenta um projeto cujo objetivo é semelhante ao apresentado no texto.',
        'A) GASTROMOTIVA: utiliza o alimento como ferramenta de transformação social por meio da educação, da inclusão e do combate ao desperdício.',
        'B) CONSERV: remunera produtores locais que preservam vinte mil hectares de floresta e de cerrado.',
        'C) AMPARA: protege animais que foram abandonados e foram vítimas de maus-tratos.',
        'D) MÃE CANGURU: ajuda mães solo em situação de vulnerabilidade social.',
        'E) MORAR PRIMEIRO: dá moradia social para a população de rua.',
        'B) CONSERV: remunera produtores locais que preservam vinte mil hectares de floresta e de cerrado.',
        'Sociologia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        35,
        'A implantação dos SAFs é uma intervenção que visa a',
        'A) facilitar a implantação de projetos agropecuários que reduzam o tamanho da floresta e aumentem a extensão dos pastos.',
        'B) atender ao interesse de madeireiros que buscam aumentar sua renda com a venda de madeira ilegal para o exterior.',
        'C) minimizar a devastação da Floresta Amazônica, aliando o aumento de renda à redução de danos ambientais.',
        'D) colaborar com a ampliação das malhas rodoviária e ferroviária da Amazônia para facilitar o escoamento de produtos da floresta.',
        'E) apoiar o grande proprietário para que este possa ter facilidades na regularização fundiária e agregar terras indígenas ao seu patrimônio.',
        'C) minimizar a devastação da Floresta Amazônica, aliando o aumento de renda à redução de danos ambientais.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        36,
        'No período colonial, eram chamados de “drogas do sertão” os produtos nativos ou aclimatados que tinham origem na região Norte, onde se localizam atualmente os estados do Amazonas, do Pará e do Maranhão. Eram especiarias, castanhas, frutas, ervas, sementes, tintas e animais originários da Amazônia, como o peixe-boi e as tartarugas. O início da exploração desses produtos',
        'A) estimulou o fluxo migratório de nordestinos, que buscavam alternativas à seca; e de escravizados das regiões Sul e Sudeste que, na floresta, refugiaram-se em comunidades quilombolas.',
        'B) permitiu a integração da Amazônia ao restante da colônia, já que incentivou a abertura de estradas e ferrovias que a ligavam a diferentes partes do território nacional.',
        'C) enfraqueceu o controle e a fiscalização das fronteiras, impondo dificuldades ao Exército no monitoramento eficiente da área.',
        'D) promoveu o desenvolvimento da pecuária e o surgimento de um cinturão verde que combinava segurança jurídica, controle ambiental e inovações tecnológicas.',
        'E) combinou as necessidades portuguesas de conter a presença estrangeira na colônia e de suprir parte da demanda europeia por especiarias, já que o comércio com o Oriente estava em declínio.',
        'E) combinou as necessidades portuguesas de conter a presença estrangeira na colônia e de suprir parte da demanda europeia por especiarias, já que o comércio com o Oriente estava em declínio.',
        'História',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        37,
        'De acordo com o texto, é correto afirmar que',
        'A) as plantas são uma única fábrica de produtos químicos.',
        'B) os químicos avaliam as atividades biológicas de substâncias naturalmente presentes nas plantas.',
        'C) as moléculas estudadas apresentam uma estrutura igual em qualquer planta estudada.',
        'D) alguns químicos procuram isolar e determinar a estrutura das moléculas; e outros procuram produzi-las em laboratório.',
        'E) os biólogos participam do isolamento, da determinação das estruturas moleculares e da análise das atividades biológicas dessas estruturas.',
        'D) alguns químicos procuram isolar e determinar a estrutura das moléculas; e outros procuram produzi-las em laboratório.',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        38,
        'Sobre o contexto histórico a que o texto se refere, é correto afirmar que',
        'A) a insuficiência de mão de obra na Amazônia coincidiu com uma seca severa no Nordeste brasileiro, entre 1877 e 1879, e produziu uma grande migração de agricultores pobres do sertão em direção à Amazônia, atraídos pela dinâmica econômica do Ciclo da Borracha.',
        'B) o aumento da procura internacional por borracha provocou o declínio da atividade extrativista do látex na Amazônia, que não resistiu à concorrência dos produtores de borracha sintética do Sudeste brasileiro.',
        'C) a política de fortalecimento da indústria nacional, implementada por Getúlio Vargas, permitiu a instalação das primeiras empresas produtoras de bicicletas em território nacional e incentivou a demanda pela borracha produzida na Amazônia.',
        'D) o ápice do Ciclo da Borracha na Amazônia coincidiu com a introdução de capitais estrangeiros no Brasil, no governo de Juscelino Kubitschek, para estimular o setor de transporte, principalmente para a instalação da indústria automobilística na região metropolitana de São Paulo.',
        'E) a alta demanda de látex da Amazônia, no período chamado de Ciclo da Borracha, deve-se à dinâmica da indústria nacional de pneus que, além de produzir para o mercado interno, também exportava seus produtos para Estados Unidos, França, Argentina e México.',
        'A) a insuficiência de mão de obra na Amazônia coincidiu com uma seca severa no Nordeste brasileiro, entre 1877 e 1879, e produziu uma grande migração de agricultores pobres do sertão em direção à Amazônia, atraídos pela dinâmica econômica do Ciclo da Borracha.',
        'História',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        39,
        'A relação ecológica entre a cutia e a castanheira-do-brasil, tal como descrita no texto, é denominada',
        'A) comensalismo.',
        'B) predatismo.',
        'C) mutualismo.',
        'D) parasitismo.',
        'E) competição.',
        'C) mutualismo.',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        40,
        'Para estimar o volume do tronco de uma árvore, pode-se utilizar a relação V = (H ·π · r^2)÷3, na qual V indica o volume do tronco, H a altura da árvore e r é o raio da base da árvore. Utilizando as medidas fornecidas no texto e a relação matemática dada, é correto estimar o volume mínimo do tronco de uma castanheira, em m³, em cerca de',
        'A) 100π÷3.',
        'B) 200π÷3.',
        'C) 400π÷3.',
        'D) 500π÷3.',
        'E) 800π÷3.',
        'B) 200π÷3.',
        'Matemática',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        41,
        'Com base no texto, é correto afirmar que as castanheiras possuem',
        'A) frutos esféricos, muito duros e secos, que se abrem espontaneamente no alto das árvores, liberando as amêndoas do interior das sementes.',
        'B) estruturas reprodutivas, denominadas ouriços, com cascas suculentas e ricas em substâncias nutritivas necessárias à germinação das sementes.',
        'C) amêndoas ricas em proteínas, em carboidratos e em outras substâncias que ajudam a manter uma dieta saudável e a fortalecer a imunidade do organismo.',
        'D) sementes com substâncias tóxicas responsáveis por causar inúmeros problemas à saúde humana, como depressão, fadiga e estresse.',
        'E) sementes conhecidas como ouriços, que caem das árvores e servem de alimento para as cutias, as quais comem sua casca nutritiva.',
        'C) amêndoas ricas em proteínas, em carboidratos e em outras substâncias que ajudam a manter uma dieta saudável e a fortalecer a imunidade do organismo.',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        42,
        'Suponha que um fruto caia de uma castanheira-do-brasil, a partir do repouso, de uma altura de 45 metros do chão, em uma queda livre de qualquer força dissipativa, e assuma que a aceleração gravitacional é igual a 10 m/s². Pode-se determinar a sua velocidade ao atingir o chão por meio da equação v = √(2 ⋅ g ⋅ H), em que a velocidade (v) depende da altura de queda (H) e da aceleração gravitacional (g). Assinale a alternativa que apresenta a velocidade, em m/s, com que o fruto de uma castanheira-do-brasil atingiria o chão.',
        'A) 30.',
        'B) 25.',
        'C) 10.',
        'D) 9.',
        'E) 3.',
        'A) 30.',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        43,
        'Assinale a alternativa que apresenta a fórmula do principal componente do sal mencionado no texto.',
        'A) CaO.',
        'B) Na2O.',
        'C) CaC2.',
        'D) CaCO3',
        'E) NaC2.',
        'D) CaCO3',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        44,
        'Quando o petróleo é extraído, ele é separado em diferentes frações por meio de um processo denominado destilação fracionada. Dessas frações, obtêm-se combustíveis como gás natural, gás liquefeito de petróleo, gasolina e diesel. Esses combustíveis são de origem',
        'A) fóssil, portanto de fonte renovável.',
        'B) fóssil, portanto de fonte não renovável.',
        'C) não fóssil, portanto de fonte não renovável.',
        'D) animal, portanto de fonte renovável.',
        'E) vegetal, portanto de fonte renovável.',
        'B) fóssil, portanto de fonte não renovável.',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        45,
        'A tirinha utiliza a ironia para evidenciar que apenas o esforço, em determinadas situações, não traz resultados favoráveis ao indivíduo, levando-o à decepção vivenciada por outros. Para evitar esse desfecho, sem negligenciar os projetos de vida, deve-se',
        'A) ignorar experiências anteriores cujos resultados foram bem-sucedidos.',
        'B) permanecer dentro do que é conhecido, evitando entrar em contato com a inovação.',
        'C) imaginar cenários otimistas e sonhar com a realização de seus projetos por outros indivíduos.',
        'D) elaborar planos de ação, considerando os possíveis obstáculos à concretização de objetivos.',
        'E) confiar nos instintos e aceitar, indiscriminadamente, qualquer opinião dada por indivíduos da mesma área de atuação.',
        'D) elaborar planos de ação, considerando os possíveis obstáculos à concretização de objetivos.',
        'Português',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        46,
        'De acordo com o texto, assinale a alternativa correta.',
        'A) Qualquer animal que usa toxinas para se defender ou para subjugar uma presa possui, além de glândulas de veneno, estruturas especializadas, como dentes e ferrões.',
        'B) Os animais venenosos, como o peixe baiacu, são incapazes de injetar toxina, mas podem causar o envenenamento ao serem ingeridos por seus predadores.',
        'C) Algumas serpentes, como a cascavel e a jararaca, não são animais peçonhentos, pois produzem ou modificam algum veneno e não possuem estruturas inoculadoras.',
        'D) As rãs da família Dendrobatidae são venenosas, porque produzem potentes toxinas que são inoculadas nos predadores por meio de ferrões ao serem pressionadas.',
        'E) As aranhas e os escorpiões são animais peçonhentos, porque, quando pressionados ou atacados, eliminam, passivamente por contato, substâncias tóxicas sobre suas presas.',
        'B) Os animais venenosos, como o peixe baiacu, são incapazes de injetar toxina, mas podem causar o envenenamento ao serem ingeridos por seus predadores.',
        'Ciências',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        47,
        'A Cabanagem, uma das chamadas Revoltas Regenciais, ocorreu em meados do século XIX, na província do Grão-Pará. De modo geral, essa revolta se caracterizou',
        'A) pela insatisfação dos donos de minas de ouro com a cobrança de impostos e com a instalação de Casas de Fundição pela administração portuguesa da colônia.',
        'B) pela combinação entre as reivindicações populares por melhores condições de sobrevivência e o desejo de ascensão política de grupos locais de médio e alto poder econômico.',
        'C) pela tentativa de separar o Brasil de Portugal, instalar o regime monárquico e abolir a escravidão, em consonância com as ideias renascentistas.',
        'D) pela exigência da realização de eleições diretas ao cargo de presidente da República, suspensas durante o período da ditadura civil-militar.',
        'E) pelas demandas trabalhistas como melhores salários, jornada de trabalho de oito horas, direito a férias e fim do trabalho infantil, entre outras.',
        'B) pela combinação entre as reivindicações populares por melhores condições de sobrevivência e o desejo de ascensão política de grupos locais de médio e alto poder econômico.',
        'História',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        48,
        'Podemos partir do exemplo citado para inferir corretamente que a interpretação dos fenômenos da natureza',
        'A) não tem aplicações práticas no cotidiano dos povos que a realizam.',
        'B) está associada a grupos sociais biologicamente mais desenvolvidos do que os demais.',
        'C) está intrinsecamente relacionada à vivência e à cultura dos povos que a estruturam.',
        'D) não tem relação com o cotidiano vivenciado pelos povos que a desenvolvem.',
        'E) é realizada sem fundamentos teóricos ou observações da realidade.',
        'C) está intrinsecamente relacionada à vivência e à cultura dos povos que a estruturam.',
        'Sociologia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        49,
        'O trecho faz referência à',
        'A) Rodovia dos Tamoios, instalada sobre a antiga trilha aberta pelos indígenas tamoios do litoral norte paulista e do Rio de Janeiro.',
        'B) Estrada Real, conjunto de caminhos organizados para facilitar o trânsito de metais e pedras preciosas em direção aos portos do Rio de Janeiro.',
        'C) Rodovia Transamazônica, planejada nos anos da ditadura civil-militar com o objetivo de integrar a região Norte ao restante do país.',
        'D) Estrada Velha de Santos, usada por carros de boi para o transporte de mercadorias entre o porto de Santos e a cidade de São Paulo.',
        'E) Rodovia BR–116, a maior estrada totalmente pavimentada do Brasil, que percorre 10 estados e se encerra no Rio Grande do Sul, já na fronteira com o Uruguai.',
        'C) Rodovia Transamazônica, planejada nos anos da ditadura civil-militar com o objetivo de integrar a região Norte ao restante do país.',
        'Geografia',
        2024,
        1
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        50,
        'A respeito dessa charge, pode-se concluir corretamente que',
        'A) o conhecimento da Carta Magna, promulgada em 1988, é fundamental na luta pelos direitos de povos originários.',
        'B) o gesto e os adereços da personagem expressam a submissão dos povos da América Latina ao processo de aculturação.',
        'C) os povos originários usam permanentemente a violência como ferramenta para modificar a organização sociopolítica imposta pelos não indígenas.',
        'D) a luta armada pela defesa dos direitos dos povos originários da Amazônia é garantida pela Carta de Direitos Humanos.',
        'E) os braços abertos da personagem representam o acolhimento da cultura do colonizador.',
        'A) o conhecimento da Carta Magna, promulgada em 1988, é fundamental na luta pelos direitos de povos originários.',
        'História',
        2024,
        1
    );

-- INSERT TABLE tbIMAGENS PROVA 2024 1 SEMESTRE
    INSERT INTO tbImagens (cod_question, image_data, materia)
        VALUES 
            (1, 'imgs/txtQ1.png', 'Matemática'),
            (1, 'imgs/mapaQ1.PNG', 'Matemática'),
            (3, 'imgs/txtQ3.PNG', 'Matemática'),
            (5, 'imgs/txtQ5-7.PNG', 'Matemática'),
            (9, 'imgs/txtQ9-11.PNG', 'Matemática'),
            (12, 'imgs/mapaQ12.PNG', 'Matemática'),
            (13, 'imgs/txtQ13-15.PNG', 'Matemática'),
            (16, 'imgs/txtQ16-17.PNG', 'Matemática'),
            (19, 'imgs/txtQ19-21.PNG', 'Matemática'),
            (22, 'imgs/txtQ22.PNG', 'Matemática'),
            (23, 'imgs/txtQ23.PNG', 'Matemática'),
            (24, 'imgs/tabelaQ24.PNG', "Matemática"),
            (25, 'imgs/txtQ25-27.PNG', 'Matemática'),
            (28, 'imgs/grafQ28-29.PNG', "Matemática"),
            (30, 'imgs/txtQ30.PNG', 'Matemática'),
            (32, 'imgs/txtQ32.PNG', 'Matemática'),
            (34, 'imgs/txtQ34.PNG', 'Matemática'),
            (35, 'imgs/txtQ35.PNG', 'Matemática'),
            (37, 'imgs/txtQ37.PNG', 'Matemática'),
            (38, 'imgs/txtQ38.PNG', 'Matemática'),
            (39, 'imgs/txtQ39-42.PNG', "Matemática"),
            (43, 'imgs/txtQ43.PNG', 'Matemática'),
            (45, 'imgs/imgQ45.PNG', 'Matemática'),
            (46, 'imgs/txtQ46.PNG', 'Matemática'),
            (48, 'imgs/txtQ48.PNG', 'Matemática'),
            (49, 'imgs/txtQ49.PNG', 'Matemática'),
            (50, 'imgs/imgQ50.PNG', 'Matemática');

-- INSERT TABLE tbQUESTIONS PROVA 2023 1 SEMESTRE
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'51',
        'Os pronomes são importantes elementos textuais, pois auxiliam na construção de sentido do texto, evitando a repetição de informações e estabelecendo conexões entre os envolvidos no ato comunicativo. Isso ocorre com os pronomes destacados no texto, os quais se referem, respectivamente, a',
        'A) leitor; leitores e autor; oxigênio; e oceanos.',
        'B) oceano; autores; oxigênio; e ameaças.',
        'C) leitor; humanidade; clima; e Terra.',
        'D) leitores e autor; leitor; parte; e importância.',
        'E) autor e leitores; humanidade; parte do oxigênio; e ameaças.',
        'A) leitor; leitores e autor; oxigênio; e oceanos.',
        'Português',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'52',
        'Para alcançar o objetivo comunicativo de um texto, várias estratégias são utilizadas. Elas são escolhidas levando-se em consideração os elementos formadores do ato de comunicação, como o público-alvo, o contexto social, o código de composição e o canal de circulação da mensagem. Com base nessas informações, assinale a alternativa que apresenta uma análise correta sobre o texto lido.',
        'A) O uso recorrente do presente do indicativo evidencia que as ações realizadas são atemporais, ou seja, verdadeiras e imutáveis independentemente do momento em que estamos.',
        'B) O texto, embora informativo, traz frases longas e linguagem difícil que o tornam inacessível a um público leigo, já que é destinado a pesquisadores acadêmicos.',
        'C) Perguntas dirigidas ao leitor e linguagem coloquial são utilizadas a fim de conquistar atenção para as informações desenvolvidas e despertar o pensamento reflexivo.',
        'D) A narração predomina no texto, e o narrador procura facilitar a construção das imagens relacionadas às ações dos oceanos expostas por ele.',
        'E) A hashtag (#), utilizada pelo autor, fere a gramática normativa adequada ao gênero desenvolvido, pois o texto deve circular em canais de comunicação formais como revistas científicas.',
        'C) Perguntas dirigidas ao leitor e linguagem coloquial são utilizadas a fim de conquistar atenção para as informações desenvolvidas e despertar o pensamento reflexivo.',
        'Português',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'53',
        'Gênero textual é um conceito adotado para definir os textos que circulam em nossa sociedade. Cada gênero cumpre uma função diferente e deve se adequar ao contexto comunicativo em que está inserido. Analisando o texto apresentado, conclui-se corretamente que se trata de',
        'A) notícia, por narrar as tentativas de salvar os oceanos das inúmeras ameaças geradas pela poluição.',
        'B) entrada de enciclopédia, por expor dados objetivos, em linguagem denotativa, sobre a crise climática.',
        'C) crônica, por tecer comentários pessoais em linguagem coloquial sobre a realidade de mares e oceanos.',
        'D) anúncio publicitário, por tentar convencer os consumidores a comprarem produtos feitos de materiais reutilizáveis.',
        'E) campanha social, por apresentar informações a fim de mobilizar o público sobre a necessidade de proteger os oceanos.',
        'E) campanha social, por apresentar informações a fim de mobilizar o público sobre a necessidade de proteger os oceanos.',
        'Português',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'54',
        'De acordo com o texto, é correto afirmar que',
        'A) os oceanos se dividem em três tipos: os fechados, os continentais e os abertos.',
        'B) os mares são mais profundos que os oceanos, cujas profundezas são conhecidas.',
        'C) os termos “oceanos” e “mares” são sinônimos, pois representam territórios com formas e tamanhos similares.',
        'D) os mares concentram todas as águas existentes no planeta Terra, daí o nome Planeta Azul.',
        'E) os oceanos se diferenciam dos mares, pois aqueles têm maiores extensões que estes.',
        'E) os oceanos se diferenciam dos mares, pois aqueles têm maiores extensões que estes.',
        'Geografia',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'55',
        'Cada alternativa apresenta um resumo biográfico. Assinale aquela em que se identifica a mesma mensagem positiva defendida pelo Aquaman em filmes, conforme descrito no texto.',
        'A) Getúlio Dornelles Vargas, presidente do Brasil. Entre suas realizações, instituiu uma série de direitos aos trabalhadores, como carteira profissional, salário-mínimo, 13o salário e férias remuneradas, motivo pelo qual passou a ser chamado de “o pai dos pobres”.',
        'B) Maria Esther Andion Bueno, conhecida como “rainha do tênis”. Maior nome do tênis brasileiro, foi eleita a melhor tenista latino-americana do século XX, sendo considerada um exemplo de como superar dificuldades para obter sucesso.',
        'C) César Augusto Cielo Filho, nadador brasileiro. Recordista e vencedor de diversas competições, conquistou a medalha de ouro nos 50 metros livre nos Jogos Olímpicos, prova mais rápida da natação. Está entre os atletas brasileiros com mais medalhas em Campeonatos Mundiais de qualquer esporte.',
        'D) Isabel Cristina Leopoldina Augusta Micaela Gabriela Rafaela Gonzaga, a Princesa Isabel. Foi a responsável pela assinatura das leis do Ventre Livre e Áurea que, respectivamente, libertava os filhos de escravizados nascidos no Brasil e abolia a escravidão no país.',
        'E) Bruno da Cunha Araújo Pereira, indigenista brasileiro, dedicou-se à proteção dos povos indígenas e da Floresta Amazônica, combatendo ações ilegais de invasores, como garimpeiros e madeireiros, a fim de promover a garantia de direitos a esses povos, como saúde, educação e autonomia.',
        'E) Bruno da Cunha Araújo Pereira, indigenista brasileiro, dedicou-se à proteção dos povos indígenas e da Floresta Amazônica, combatendo ações ilegais de invasores, como garimpeiros e madeireiros, a fim de promover a garantia de direitos a esses povos, como saúde, educação e autonomia.',
        'História',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'56',
        'Entre os peixes mais velozes do mundo, encontra-se o marlim-negro, que pode atingir a velocidade máxima de 129 km/h. Considere que o Aquaman esteja em uma missão. Para passar despercebido pelo sistema de monitoração por sonar de um navio, o herói precisa nadar na mesma velocidade máxima que esse peixe. Admitindo que o consumo de calorias é diretamente proporcional à velocidade, para manter a velocidade mencionada, o Aquaman gasta, em milhões de quilocalorias, por segundo, aproximadamente,',
        'A) 2,9.',
        'B) 5,6.',
        'C) 10,3.',
        'D) 20,1.',
        'E) 37,1.',
        'A) 2,9.',
        'Matemática',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'57',
        'O gasto calórico mencionado no texto está relacionado, entre outros fatores, à força de arrasto, que é uma força de resistência que atrapalha o movimento de um corpo em um fluido. A força de arrasto, por sua vez, é diretamente proporcional à densidade do fluido. Sabendo que a densidade da água do oceano aumenta com a profundidade, a maneira mais eficiente para que o Aquaman reduza seu gasto calórico, sem diminuir a sua velocidade, é nadar',
        'A) mais próximo ao fundo do oceano.',
        'B) mais próximo à superfície do oceano.',
        'C) batendo os pés e os braços ao mesmo tempo.',
        'D) no ponto médio entre o fundo e a superfície do oceano.',
        'E) batendo apenas os pés, mas mantendo os braços junto ao corpo.',
        'B) mais próximo à superfície do oceano.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'58',
        'As relações alimentares entre os diversos organismos de um ecossistema costumam ser representadas por meio de diagramas denominados teias alimentares, ou redes alimentares. Essas teias são compostas de diversas cadeias interligadas por meio de setas, que unem os componentes da comunidade entre si, evidenciando suas relações quanto aos diferentes níveis tróficos. Considerando a teia alimentar representada, é correto afirmar que',
        'A) as lulas são consumidores terciários, pois se alimentam de leões-marinhos, orcas e pinguins.',
        'B) os seres do zooplâncton constituem o primeiro nível trófico e formam a base das cadeias alimentares aquáticas.',
        'C) as focas apresentam diferentes hábitos alimentares e ocupam diferentes níveis tróficos.',
        'D) os peixes pequenos e o krill pertencem ao mesmo nível trófico, pois se alimentam diretamente do fitoplâncton.',
        'E) o extermínio dos pinguins ocasionará a diminuição da população de orcas, pois estas se alimentam daqueles mamíferos.',
        'C) as focas apresentam diferentes hábitos alimentares e ocupam diferentes níveis tróficos.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'59',
        'Em relação aos seres vivos da teia alimentar marinha apresentada, é correto afirmar que',
        'A) os seres do zooplâncton e os copépodes são macroscópicos, vivem em suspensão na água e produzem seu próprio alimento.',
        'B) os seres do fitoplâncton são vegetais que sobrevivem nas regiões escuras dos oceanos sem a incidência de raios solares.',
        'C) a baleia-azul é um mamífero sem dentes, que filtra a água do mar de onde retira grandes quantidades de alimento.',
        'D) os peixes pequenos e as lulas competem com a baleia azul e com as focas pelo seu alimento.',
        'E) os pinguins se alimentam principalmente de copépodes e de peixes pequenos.',
        'C) a baleia-azul é um mamífero sem dentes, que filtra a água do mar de onde retira grandes quantidades de alimento.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'60',
        'Na narrativa apresentada, o personagem Armandinho demonstra ter uma habilidade importante para a vida em sociedade ao expressar',
        'A) humildade, já que não se importa com os mais necessitados.',
        'B) vergonha, porque deve caminhar na rua diante dos colegas.',
        'C) empatia, pois se conscientiza sobre e realidade daqueles em condições diferentes da sua.',
        'D) acanhamento, porque deve usar tênis velho na rua diante de outras crianças.',
        'E) autonomia, pois, diante do constrangimento de ver crianças descalças, ele doa seu tênis.',
        'C) empatia, pois se conscientiza sobre e realidade daqueles em condições diferentes da sua.',
        'Português',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'61',
        'Examinando a charge, é correto afirmar que ela representa',
        'A) a hostilidade do ambiente marinho ao ser humano, mas que abriga em segurança a vida de peixes e plantas.',
        'B) o cenário apocalíptico de um vazamento nuclear e as consequências de uma sociedade sem ONGs de proteção ambiental.',
        'C) o resultado de uma sociedade ambientalmente sustentável, que propõe soluções viáveis para a convivência entre os seres vivos.',
        'D) a poluição de mares e rios, que coloca em risco a manutenção da vida nesses ambientes e gera a necessidade de intervenções protetivas.',
        'E) a urgência com que o curso dos rios deve ser alterado para garantir a sobrevivência de peixes e humanos atingidos pela poluição do ar e das águas.',
        'D) a poluição de mares e rios, que coloca em risco a manutenção da vida nesses ambientes e gera a necessidade de intervenções protetivas.',
        'Geografia',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'62',
        'Leia a definição de tsunâmi, extraída do site da Comissão Brasileira de Sítios Geológicos (SIGEP). Dentre as origens desse fenômeno, é correto citar',
        'A) o aquecimento anormal das águas do oceano Atlântico.',
        'B) os movimentos de rotação e de translação do planeta Terra.',
        'C) as ações de correntes marítimas frias de origem equatorial.',
        'D) os tremores sísmicos no assoalho oceânico e/ou vulcanismo.',
        'E) os deslocamentos dos oceanos existentes no núcleo interno do nosso planeta.',
        'D) os tremores sísmicos no assoalho oceânico e/ou vulcanismo.',
        'Geografia',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'63',
        'Sobre o processo de absorção física de sequestro de carbono, é correto afirmar que ocorre, predominantemente,',
        'A) próximo à costa, devido ao aumento de temperatura que ocorre em águas rasas.',
        'B) em águas profundas, devido à circulação da água que promove o transporte de nutrientes pelos oceanos.',
        'C) próximo à costa, devido às alterações na salinidade da água, resultantes do grande volume de precipitações.',
        'D) em águas profundas, devido à alteração na densidade da água, promovida pela variação de temperatura e de salinidade da água.',
        'E) em águas profundas, devido à circulação da água junto a outras com substâncias como NaCl, O2, CO2 e CaCO3, em temperatura constante.',
        'D) em águas profundas, devido à alteração na densidade da água, promovida pela variação de temperatura e de salinidade da água.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'64',
        'No processo de absorção biológico do sequestro de carbono, há',
        'A) a retirada de dióxido de carbono da água pelo fitoplâncton por meio da fotossíntese, formando glicose.',
        'B) animais marinhos que convertem carbonato de cálcio em bicarbonato para a formação de conchas.',
        'C) a formação de recifes de corais, devido à alteração na salinidade pela presença de cloreto de sódio.',
        'D) o transporte de nutrientes para o zooplâncton a fim de realizar a fotossíntese e construir suas conchas.',
        'E) a preservação na salinidade da água devido à formação de gelo, à ebulição, à precipitação e à descarga fluvial.',
        'A) a retirada de dióxido de carbono da água pelo fitoplâncton por meio da fotossíntese, formando glicose.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'65',
        'Sobre o fenômeno descrito no texto, é correto afirmar que',
        'A) o grande cinturão de algas sargaços se deve a uma combinação de vários fatores, dentre os quais estão o aumento da taxa de gás carbônico produzido pela fotossíntese e o excesso de carboidratos liberados por animais, como filhotes de tartarugas e centenas de espécies de peixes.',
        'B) a grande quantidade de algas sargaços flutuante no oceano recebe o nome de floresta tropical dourada por ser uma vegetação densa, formada por caules, raízes e folhas entrelaçadas, com dezenas de metros de comprimento, que servem como habitat de muitos organismos marinhos.',
        'C) as algas sargaços, em grande quantidade, podem causar alguns problemas na navegação ao prejudicar as hélices e os motores dos navios, além de emitir mau cheiro devido à decomposição dessas algas acumuladas nas praias.',
        'D) as algas sargaços são utilizadas como matéria-prima na fabricação de papel, antibióticos, cosméticos e sabão; na fermentação alcoólica para a produção de vinho e saquê; e na reciclagem do lixo.',
        'E) as algas sargaços provocam o fenômeno denominado maré vermelha, responsável pela mortandade de peixes, de gaivotas e de outros animais, devido às substâncias tóxicas eliminadas na água.',
        'C) as algas sargaços, em grande quantidade, podem causar alguns problemas na navegação ao prejudicar as hélices e os motores dos navios, além de emitir mau cheiro devido à decomposição dessas algas acumuladas nas praias.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'66',
        'A partir das informações apresentadas, pode-se concluir corretamente que',
        'A) o sequestro de carbono ocorre quando crustáceos e ostras fazem os processos de descalcificação, acelerando os efeitos das mudanças climáticas.',
        'B) a eliminação de metais pesados nos ecossistemas aquáticos marinhos é pouco prejudicial aos animais marinhos, em decorrência de seus resistentes e especializados sistemas de filtração e excreção de impurezas.',
        'C) a poluição dos oceanos causada por substâncias tóxicas utilizadas nas atividades de mineração é benéfica para as cadeias alimentares dos ecossistemas de mangues e recifes.',
        'D) a pesca predatória ocorre quando a remoção de uma espécie de peixe é feita em um ritmo maior do que a taxa de reprodução da espécie para repor sua população.',
        'E) os plásticos, dentre os diversos tipos de poluentes que afetam os mares, têm a grande vantagem de permanecer pouco tempo no ambiente.',
        'D) a pesca predatória ocorre quando a remoção de uma espécie de peixe é feita em um ritmo maior do que a taxa de reprodução da espécie para repor sua população.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'67',
        'O oceano é um corpo contínuo de água salgada que recobre mais de 70% da superfície terrestre. Sua importância para a vida no planeta Terra é significativa. Porém, todos os dias são despejados nesse corpo d’água milhões de litros de esgotos sanitários não tratados. Esse despejo constitui-se em uma grande ameaça para a vida marinha, bem como para as pessoas que vivem e tiram seu sustento dessas águas. A melhor forma de minimizar esse impacto é',
        'A) despejar os esgotos sanitários nos rios interiores.',
        'B) lançar os esgotos sanitários nos lençóis freáticos.',
        'C) armazenar os esgotos sanitários nas lagoas costeiras.',
        'D) jogar os esgotos sanitários nos lagos das usinas hidrelétricas.',
        'E) tratar os esgotos sanitários antes de despejá-los no oceano.',
        'E) tratar os esgotos sanitários antes de despejá-los no oceano.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'68',
        'A poluição marinha é um problema cada vez mais grave em todo o mundo, à medida que aumenta sistematicamente todos os anos por conta do descarte irregular de diferentes tipos de resíduos e por conta da falta de medidas sustentáveis. No entanto, esse problema pode ser revertido ou, pelo menos, amenizado por meio de medidas mais responsáveis do ponto de vista ambiental. Assinale a alternativa que apresenta ações as quais indivíduos e empresas deveriam adotar para evitar a poluição marinha.',
        'A) A utilização de microplásticos na produção de artigos de higiene pessoal, roupas e cosméticos, porque essas partículas, lançadas ao mar pelos esgotos, servem de alimentos para os seres vivos marinhos.',
        'B) O descarte do lixo reciclável em locais inadequados, pois isso facilita o retorno da matéria-prima à cadeia produtiva a fim de se transformar no mesmo produto ou em produtos diferentes dos originais.',
        'C) A substituição de copos, talheres, canudos e garrafas descartáveis por produtos reutilizáveis a fim de preservar os ecossistemas durante sua vida útil e também após o descarte.',
        'D) A utilização de sacolinhas plásticas para empacotar as compras no supermercado, pois não prejudicam o meio ambiente e são recicladas para a alimentação da fauna marinha.',
        'E) O estímulo à produção de objetos descartáveis a fim de diminuir o consumo de recursos naturais e de reduzir o volume de lixo no ambiente.',
        'C) A substituição de copos, talheres, canudos e garrafas descartáveis por produtos reutilizáveis a fim de preservar os ecossistemas durante sua vida útil e também após o descarte.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'69',
        'Entre as consequências das Grandes Navegações, estão',
        'A) o domínio espanhol nos oceanos Atlântico e Pacífico; e a imposição de condições políticas, comerciais e geográficas específicas para as colônias.',
        'B) a colonização da Antártida; e a descoberta de territórios desabitados no hemisfério Sul, como a Oceania.',
        'C) a assinatura do Tratado de Madri; e a disputa pelas ilhas do Pacífico, travada entre Portugal e Espanha.',
        'D) o avanço da Inglaterra sobre os territórios conquistados pelos portugueses; e a Guerra dos Cem Anos.',
        'E) a assinatura do Tratado de Tordesilhas; e a chegada dos portugueses ao território do atual Brasil.',
        'E) a assinatura do Tratado de Tordesilhas; e a chegada dos portugueses ao território do atual Brasil.',
        'História',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'70',
        'Há milhares de anos, o transporte marítimo tem sido fundamental para o comércio. Hoje a maior parte do comércio internacional é feita por vias marítimas. Os gráficos apresentam a participação dos meios de transporte no comércio mundial. Esses dados são obtidos de acordo com o uso de cada um deles no translado das exportações. Analisando os gráficos, o percentual do comércio mundial realizado por meio de transporte marítimo,',
        'A) em 2010, foi maior que o dobro da soma dos percentuais do transporte aéreo e dos outros transportes.',
        'B) em 2010, foi igual ao triplo daquele registrado pelos outros meios de transporte.',
        'C) de 2010 para 2019, aumentou 10,5%, ultrapassando aquele efetuado por meio do transporte aéreo.',
        'D) em 2019, foi superior ao quíntuplo daquele registrado por meio de transporte aéreo.',
        'E) em 2019, foi 14% menor que a soma dos percentuais do transporte aéreo e dos outros transportes.',
        'A) em 2010, foi maior que o dobro da soma dos percentuais do transporte aéreo e dos outros transportes.',
        'Geografia',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'71',
        'De acordo com o texto, é correto afirmar que',
        'A) glândula tireoide sintetiza hormônios sem a utilização do micronutriente iodo, a fim de garantir a manutenção da temperatura corporal e a ocorrência de bócio ou papo.',
        'B) os hormônios T3 e T4, produzidos pela tireoide, prejudicam o crescimento físico e neurológico, assim como a manutenção do fluxo normal de energia no corpo.',
        'C) a iodação do sal para consumo humano no Brasil deve ser suspensa, principalmente para crianças e idosos, a fim de manter a baixa prevalência de DDI.',
        'D) o uso de sal de cozinha iodado e o alto consumo de alimentos de origem marinha, além de leite, ovos e algumas frutas, estão entre as causas do aumento dos casos de DDI.',
        'E) uma criança com deficiência de iodo pode apresentar, em seu desenvolvimento, baixo crescimento dos ossos e deficiência intelectual.',
        'E) uma criança com deficiência de iodo pode apresentar, em seu desenvolvimento, baixo crescimento dos ossos e deficiência intelectual.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'72',
        'O texto menciona a obtenção de um produto usado no preparo de alimentos. Esse produto é obtido por processo',
        'A) físico, denominado vaporização.',
        'B) físico, denominado filtração.',
        'C) físico, denominado decantação.',
        'D) químico, denominado evaporação.',
        'E) químico, denominado ebulição.',
        'A) físico, denominado vaporização.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'73',
        'No preparo de um alimento, foi adicionado 1,5 g de NaCl. De acordo com o valor estabelecido pela Anvisa para a iodação do sal de cozinha, a quantidade mínima de iodo, em mg, adicionada ao alimento, foi',
        'A) 0,01.',
        'B) 0,02.',
        'C) 1,50.',
        'D) 3,00.',
        'E) 4,50.',
        'B) 0,02.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'74',
        'A partir das informações dadas para o elemento iodo, pode-se afirmar, corretamente, que apresenta',
        'A) 53 prótons.',
        'B) 53 nêutrons.',
        'C) 74 elétrons.',
        'D) 74 prótons.',
        'E) 127 nêutrons.',
        'A) 53 prótons.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'75',
        'O humor dos quadrinhos está relacionado a duas possíveis interpretações para a palavra “pressão”: no sentido denotativo, refere-se à força aplicada pela coluna de água sobre o peixe-gota; e no, sentido conotativo, representa',
        'A) a aparência do peixe-gota quando ele está dentro da água.',
        'B) o aspecto harmonioso do peixe-gota quando ele está fora d’água.',
        'C) a aparência gelatinosa que o peixe-gota assume para afastar seus predadores.',
        'D) a necessidade de se adequar a padrões de beleza impostos pela sociedade.',
        'E) a dilatação sofrida por um corpo quando ele se encontra no fundo do oceano.',
        'D) a necessidade de se adequar a padrões de beleza impostos pela sociedade.',
        'Português',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'76',
        'De acordo com o texto, é correto afirmar que',
        'A) a importância dos trabalhadores nos oceanos é mínima, uma vez que todas as tarefas são realizadas efetivamente por máquinas e equipamentos modernos.',
        'B) os benefícios proporcionados pelos oceanos devem ser apropriados pela Organização das Nações Unidas, que é a responsável pela fiscalização desse ambiente.',
        'C) as riquezas existentes nos oceanos devem ser exploradas por empresas privadas, a fim de impedir que empresas estatais se apropriem desses bens.',
        'D) o conhecimento que se tem sobre os oceanos deve ser disseminado entre as pessoas devido à importância que esse ambiente possui.',
        'E) o entendimento sobre os oceanos deve ficar armazenado nas universidades públicas para beneficiar as empresas petrolíferas.',
        'D) o conhecimento que se tem sobre os oceanos deve ser disseminado entre as pessoas devido à importância que esse ambiente possui.',
        'Geografia',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'77',
        'Segundo o texto,',
        'A) o historiador francês Michel Gras chamava o mar Mediterrâneo de “cimento líquido” porque ele era uma barreira intransponível para os povos europeus.',
        'B) embora estabelecessem contatos comerciais, os vários povos que habitavam o continente europeu se mantiveram incomunicáveis pelo mar Mediterrâneo.',
        'C) os diferentes povos que habitavam a Europa utilizavam preferencialmente as rotas terrestres para seus deslocamentos pelo continente.',
        'D) o mar Mediterrâneo foi largamente navegado pelos povos antigos, que estabeleceram contatos e miscigenaram suas culturas.',
        'E) devido à sua forte interação, os vários povos antigos mantiveram a pureza de suas tradições e de suas culturas.',
        'D) o mar Mediterrâneo foi largamente navegado pelos povos antigos, que estabeleceram contatos e miscigenaram suas culturas.',
        'História',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'78',
        'Considere um mergulho no qual o mergulhador encontra-se a 40 metros abaixo da superfície do mar. Nessa situação, a pressão do gás no interior do cilindro deve ser ajustada, em atm, para o valor de',
        'A) 3.',
        'B) 4.',
        'C) 5.',
        'D) 6.',
        'E) 7.',
        'C) 5.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'79',
        'Para evitar essa “doença”, a atitude mais cautelosa que um mergulhador deve tomar é',
        'A) mergulhar o mais fundo possível antes de retornar à superfície.',
        'B) realizar exames médicos para checar a pressão sanguínea antes de mergulhar.',
        'C) subir até a metade do caminho e aumentar a velocidade de subida na metade final.',
        'D) subir rapidamente até o nível do mar para diminuir a pressão o mais rápido possível.',
        'E) subir lentamente até o nível do mar para que a pressão varie o mínimo possível ao longo do tempo.',
        'E) subir lentamente até o nível do mar para que a pressão varie o mínimo possível ao longo do tempo.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'80',
        'No contexto da Segunda Revolução Industrial, o desenvolvimento dos navios a vapor',
        'A) provocou um processo de ruralização da população mundial, antes concentrada nas grandes cidades, por permitir o contato rápido entre partes distantes do globo.',
        'B) diminuiu o tempo do transporte de matérias-primas e mercadorias, barateou o preço do frete e possibilitou a expansão dos mercados consumidores ao ligar diferentes partes do globo.',
        'C) concentrou a produção industrial nas manufaturas dos países periféricos do continente africano e possibilitou o aproveitamento da oferta de mão de obra barata e qualificada.',
        'D) favoreceu o desenvolvimento do ramo do turismo e, associado à conquista de direitos trabalhistas como férias pelos operários escravizados, foi responsável pelo aumento da circulação de pessoas nos cinco continentes.',
        'E) reorientou a economia inglesa, que passou a se dedicar majoritariamente à produção de insumos para a indústria naval, em detrimento da produção de tecidos e outras mercadorias que caracterizaram a Primeira Revolução Industrial.',
        'B) diminuiu o tempo do transporte de matérias-primas e mercadorias, barateou o preço do frete e possibilitou a expansão dos mercados consumidores ao ligar diferentes partes do globo.',
        'História',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'81',
        'Se um golfinho emitir ondas sonoras com frequência de 100 000 Hz, ele será capaz de perceber objetos que tenham dimensões, em metros, a partir de',
        'A) 0,014.',
        'B) 0,070.',
        'C) 0,010.',
        'D) 0,200.',
        'E) 1,000.',
        'A) 0,014.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'82',
        'Além de possibilitar a identificação de objetos em regiões de pouca iluminação, o sistema de ecolocalização tem um tempo de resposta curto, o que permite aos animais, como o golfinho, movimentarem-se com agilidade, facilitando a obtenção de alimentos e a fuga de predadores. Considerando a velocidade de propagação da onda sonora na água, o intervalo de tempo entre um golfinho emitir uma onda sonora, esta refletir em um peixe localizado a 140 metros de distância e o golfinho detectar o seu eco é, em segundos, de',
        'A) 0,1.',
        'B) 0,2.',
        'C) 0,3.',
        'D) 0,4.',
        'E) 0,5.',
        'B) 0,2.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'83',
        'Assim como diversos outros aspectos das culturas africanas, o culto a Iemanjá existe no Brasil devido',
        'A) aos processos de deslocamentos populacionais que levaram milhares de brasileiros para o continente africano na segunda metade do século XVI.',
        'B) ao isolamento geográfico entre os dois territórios, separados por um imenso oceano que impediu os contatos entre as duas margens.',
        'C) à intolerância religiosa, que responsabiliza Iemanjá pelos processos históricos que possibilitaram a escravização de africanos.',
        'D) ao período imperial do Brasil que, quando governado por Iemanjá, anexou partes importantes do território africano.',
        'E) à escravização e ao tráfico de mão-de-obra africana para a realização dos mais diferentes trabalhos no Brasil.',
        'E) à escravização e ao tráfico de mão-de-obra africana para a realização dos mais diferentes trabalhos no Brasil.',
        'História',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'84',
        'Os trechos apresentados retratam um cenário caracterizado',
        'A) pela diversidade sociocultural, resultando em uma sociedade próspera.',
        'B) pela pobreza, reforçada pelas imagens do urubu e da sujeira.',
        'C) pelo uso recorrente da lama como matéria-prima para a indústria.',
        'D) pelo desenvolvimento urbano e socioambiental.',
        'E) pela riqueza de oportunidades ao indivíduo.',
        'B) pela pobreza, reforçada pelas imagens do urubu e da sujeira.',
        'Português',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'85',
        'Sobre os textos, é correto afirmar que',
        'A) são escritos em terceira pessoa, sem envolvimento do eu lírico nas ações representadas.',
        'B) as “asas” dos urubus, diferentemente das “asas” do eu lírico, representam restrição.',
        'C) as preposições “de” e “a”, na passagem “da lama ao caos”, indicam respectivamente origem e destino.',
        'D) “quanto” pode ser substituído por “embora” na passagem “quanto mais miséria tem”.',
        'E) o gerúndio em “pintando” e “segurando” expressa ações concluídas no passado.',
        'C) as preposições “de” e “a”, na passagem “da lama ao caos”, indicam respectivamente origem e destino.',
        'Português',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'86',
        'No texto, houve um erro de impressão, uma vez que, no lugar da mancha, deveria ter sido impresso um número. Admita que esse número é a solução da equação: 4(n + 6) = 5n – (28 – 3n). Assinale a alternativa que apresenta o valor que deveria estar no lugar onde aparece .',
        'A) 26',
        'B) 13',
        'C) 11',
        'D) 8',
        'E) 4',
        'B) 13',
        'Matemática',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'87',
        'De acordo com o texto, é possível estimar que o comprimento médio dos cabos submarinos é, em quilômetros, igual a aproximadamente',
        'A) 3,0×10^4.',
        'B) 3,0×10^3.',
        'C) 3,0×10^2.',
        'D) 3,0×10^1.',
        'E) 3,0×10^0.',
        'B) 3,0×10^3.',
        'Geografia',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'88',
        'Em relação aos ecossistemas citados no texto, é correto afirmar que são',
        'A) divididos basicamente em três espécies, sendo o mangue branco o mais conhecido, pois é utilizado como tintura para couros.',
        'B) importantes elementos facilitadores dos processos erosivos que ocorrem nas regiões costeiras, em função de ações das correntes marítimas.',
        'C) ambientes costeiros que apresentam raízes aéreas e que existem exclusivamente nos estados do Amapá e de Santa Catarina.',
        'D) áreas de proteção permanente, além de serem fundamentais para a reprodução de diversas espécies de peixes e crustáceos.',
        'E) encontrados nas regiões litorâneas do Brasil, principalmente nos estados de Tocantins e Goiás.',
        'D) áreas de proteção permanente, além de serem fundamentais para a reprodução de diversas espécies de peixes e crustáceos.',
        'Ciências',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'89',
        'O evento histórico retratado no mapa é',
        'A) o Bloqueio Continental, decretado por Napoleão Bonaparte em 1806.',
        'B) a Guerra da Argélia, que culminou na independência do país africano em 1962.',
        'C) o ataque do Terceiro Estado contra Luís XVI, na Revolução Francesa, em 1789.',
        'D) o Desembarque de tropas dos países aliados na Normandia, litoral da França, em 1944.',
        'E) a Guerra Franco-Prussiana, que colocou fim ao processo de Unificação Alemã em 1871.',
        'D) o Desembarque de tropas dos países aliados na Normandia, litoral da França, em 1944.',
        'História',
        2023,
        '1'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
    	'90',
        'No último quadro da tirinha, é possível observar um grupo de peixes de tamanhos diversos, duas plantas aquáticas e duas conchas de formatos diferentes. Considere que você irá retirar do aquário um único peixe, uma única planta e uma única concha nessa ordem. Diante disso, então o total de maneiras de realizar essa ação é',
        'A) 96.',
        'B) 32.',
        'C) 12.',
        'D) 10.',
        'E) 4.',
        'B) 32.',
        'Matemática',
        2023,
        '1'
    );

-- INSERT TABLE tbIMAGENS PROVA 2023 1 SEMESTRE
    INSERT INTO tbImagens (cod_question, image_data)
        VALUES 
            (51, 'imgs/txtQ1-3.PNG'),
            (54, 'imgs/txtQ4.PNG'),
            (55, 'imgs/txtQ5-6.PNG'),
            (58, 'imgs/txtQ8-9.PNG'),
            (60, 'imgs/txtQ10.PNG'),
            (61, 'imgs/txtQ11.PNG'),
            (62, 'imgs/txtQ12.PNG'),
            (63, 'imgs/txtQ13-14.PNG'),
            (65, 'imgs/txtQ15.PNG'),
            (66, 'imgs/txtQ16.PNG'),
            (69, 'imgs/txtQ19.PNG'),
            (70, 'imgs/txtQ20.PNG'),
            (71, 'imgs/txtQ21-22.PNG'),
            (73, 'imgs/txtQ23.PNG'),
            (74, 'imgs/txtQ24.PNG'),
            (75, 'imgs/txtQ25.PNG'),
            (76, 'imgs/txtQ26.PNG'),
            (77, 'imgs/txtQ27.PNG'),
            (78, 'imgs/txtQ28.PNG'),
            (79, 'imgs/txtQ29.PNG'),
            (80, 'imgs/txtQ30.PNG'),
            (81, 'imgs/txtQ31-32.PNG'),
            (82, 'imgs/txtQ32.PNG'),
            (83, 'imgs/txtQ33.PNG'),
            (84, 'imgs/txtQ34-35.PNG'),
            (86, 'imgs/txtQ36-37.PNG'),
            (88, 'imgs/txtQ38.PNG'),
            (88, 'imgs/txtQ38-2.PNG'),
            (89, 'imgs/txtQ39.PNG'),
            (90, 'imgs/txtQ40.PNG');

-- INSERT TABLE tbQUESTIONS PROVA 2023 2 SEMESTRE
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        91,
        'Os termos em destaque no texto podem ser substituídos, correta e respectivamente, por',
        'A) um pouco, contribuição, salientes, apropriada.',
        'B) metade, ascendência, respeitáveis, inata.',
        'C) um pouco, origem, diferentes, particular.',
        'D) metade, força, discretos, inerente.',
        'E) ora, origem, diferentes, genérica.',
        'C) um pouco, origem, diferentes, particular.',
        'Português',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        92,
        'O termo “crônica”, no segundo parágrafo do texto, refere-se',
        'A) ao período de longa duração da viola caipira antes de seu desaparecimento.',
        'B) à biografia dos reis portugueses responsáveis pela educação musical popular.',
        'C) ao texto jornalístico desenvolvido para comentar o conflito entre indígenas e portugueses.',
        'D) à brevidade do próprio texto, cuja concisão se deve à origem popular do tema.',
        'E) aos elementos históricos ligados à incorporação da viola em nossa cultura.',
        'E) aos elementos históricos ligados à incorporação da viola em nossa cultura.',
        'Português',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        93,
        'De acordo com o texto, é correto afirmar que',
        'A) os bandeirantes, que exploraram o interior de São Paulo, impuseram a vestimenta e o estilo musical europeus aos povos nativos.',
        'B) a viola caipira foi trazida pelos portugueses ao Brasil durante a Revolução Industrial, período de formação da cidade de São Paulo.',
        'C) o conceito de cultura caipira é anterior à Colonização, uma vez que se origina nos hábitos dos povos indígenas.',
        'D) o caipira, cuja cultura fora menosprezada por ser tachada como atrasada, tornou-se símbolo da identidade paulista.',
        'E) a técnica e o ritmo da música caipira são simples por serem resultado da junção das culturas indígena, africana e portuguesa.',
        'D) o caipira, cuja cultura fora menosprezada por ser tachada como atrasada, tornou-se símbolo da identidade paulista.',
        'Português',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        94,
        'O encontro que, segundo o texto, gerou a cultura caipira ocorreu devido',
        'A) às diferentes ondas migratórias que, das regiões norte e centro-oeste, trouxeram novos artistas e instrumentos, promovendo grande miscigenação cultural no início do século XX.',
        'B) à atuação dos bandeirantes, que realizavam expedições ao interior para escravizar populações indígenas e procurar metais preciosos no período colonial.',
        'C) ao dialeto falado pelos portugueses da corte que, quando chegaram ao Brasil, desenvolveram uma linguagem própria, traduzida no ritmo sofisticado da viola caipira.',
        'D) ao processo de industrialização, na década de 1960, em que a viola caipira virou símbolo de modernidade e foi adotada pelos membros da burguesia.',
        'E) ao uso que os bandeirantes deram ao instrumento trazido ao Brasil pelos negros escravizados no continente africano, no início do século XVI.',
        'B) à atuação dos bandeirantes, que realizavam expedições ao interior para escravizar populações indígenas e procurar metais preciosos no período colonial.',
        'Português',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        95,
        'O som gerado por uma viola caipira provém da vibração de uma ou mais de suas cordas, o que forma um padrão vibracional que perturba o ar, produzindo uma onda sonora. Os diferentes sons que podem ser produzidos ao tocar uma viola decorrem de diferentes frequências emitidas pelo instrumento: quanto menor for a frequência, mais grave será o som percebido. Diferentes frequências são produzidas conforme a variação de alguns parâmetros, sendo um deles o comprimento: quanto maior o comprimento da corda vibrando, menor será a frequência. Considere a imagem. Assinale a alternativa que apresenta o ponto na imagem em que um violeiro deve pressionar a corda para que seja gerado o som mais agudo na viola.',
        'A) A',
        'B) B',
        'C) C',
        'D) D',
        'E) E',
        'A) A',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        96,
        'De acordo com o texto, é correto afirmar que',
        'A) a receita original da coxinha tem origem francesa, data do século XIX e se manteve inalterada até os dias atuais.',
        'B) o formato do alimento é resultado da tentativa falha de evidenciar, na forma, os ingredientes principais: batata e galinha.',
        'C) a gênese da coxinha é incerta, sua receita sofreu modificações no decorrer dos anos, e é um alimento popular em São Paulo.',
        'D) o salgadinho, apesar de ser feito com ingredientes acessíveis e populares, é símbolo da elite industrial paulista.',
        'E) a atribuição da origem da coxinha à família real é estratégia de marketing para aumentar o preço da iguaria popular.',
        'C) a gênese da coxinha é incerta, sua receita sofreu modificações no decorrer dos anos, e é um alimento popular em São Paulo.',
        'Português',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        97,
        'O texto selecionado é híbrido, pois contém características de tipologias textuais diferentes. Ele é expositivo, por apresentar ao leitor informações sobre a origem da coxinha; e é também',
        'A) argumentativo, por expor evidências históricas irrefutáveis sobre a origem aristocrática desse prato.',
        'B) injuntivo, por fornecer comandos que podem ser seguidos na receita do alimento.',
        'C) narrativo, por contar a trajetória do alimento, desde a sua invenção até à chegada ao Brasil.',
        'D) descritivo, por caracterizar as impressões sensoriais de quem prova uma coxinha.',
        'E) prescritivo, por enfatizar a criatividade dos cozinheiros no preparo das coxinhas.',
        'B) injuntivo, por fornecer comandos que podem ser seguidos na receita do alimento.',
        'Português',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        98,
        'Um aluno, do curso de Gastronomia da Etec Santa Ifigênia, deseja seguir as instruções do último parágrafo do texto. Contudo, ao procurar em sua cozinha, ele notou que possui cinco coxas de galinha a menos do que o indicado. Desse modo ele decide reduzir proporcionalmente os ingredientes. Se originalmente usam-se 840 g de pão ralado, para a quantidade de coxas de galinha que o estudante dispõem, será necessária uma quantidade de pão ralado, em gramas, igual a',
        'A) 210.',
        'B) 350.',
        'C) 490.',
        'D) 630.',
        'E) 770.',
        'C) 490.',
        'Matemática',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        99,
        'O texto retrata, no segundo parágrafo, a coxinha como uma inovação. De acordo com o mesmo parágrafo, é correto afirmar que, dentre as competências mobilizadas pela cozinheira para a criação da coxinha, estão',
        'A) paciência e empatia, visto que a idealizadora da receita estava preocupada com o bem-estar do menino.',
        'B) zelo e responsabilidade, na medida em que se sensibilizou com as restrições alimentares do garoto.',
        'C) disciplina e perseverança, uma vez que a tentativa e o erro eram estimuladores do seu processo criativo.',
        'D) persistência e determinação, dado que o fracasso era uma opção aceitável dentro do contexto.',
        'E) iniciativa e empreendedorismo, pois a experimentação de novas ideias criou um produto.',
        'E) iniciativa e empreendedorismo, pois a experimentação de novas ideias criou um produto.',
        'Português',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        100,
        'Conforme as informações do texto, é correto afirmar que a devoção a Nossa Senhora Aparecida',
        'A) foi trazida ao país pela princesa Isabel, herdeira da família imperial, que presenteou a santa com uma coroa de ouro e um manto de veludo azul escuro.',
        'B) marca a divisão de classes presente na sociedade brasileira na medida em que está restrita aos representantes das classes baixas.',
        'C) foi imposta pelos poderes político e religioso, por meio de decretos papais e projetos de lei, embora não tivesse apelo popular.',
        'D) é um fenômeno inexpressivo na história do Brasil, tendo sido ignorada pelas autoridades desde o período colonial.',
        'E) iniciou-se no Brasil colônia, atravessou o período imperial e se manteve viva na República.',
        'E) iniciou-se no Brasil colônia, atravessou o período imperial e se manteve viva na República.',
        'História',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        101,
        'Assinale a alternativa que apresenta ações que impactam positivamente o meio ambiente.',
        'A) A recuperação de áreas degradadas e o esgotamento dos recursos naturais.',
        'B) A destruição da camada de ozônio e a utilização de energia eólica.',
        'C) A utilização de produtos biodegradáveis e a reciclagem de materiais.',
        'D) A potencialização do efeito estufa e a modificação de habitat.',
        'E) A diminuição de mananciais e a extinção de espécies.',
        'C) A utilização de produtos biodegradáveis e a reciclagem de materiais.',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        102,
        'De acordo com o cartum, o aprimoramento do intelecto pressupõe que o indivíduo',
        'A) deite e procrastine.',
        'B) saia de sua zona de conforto.',
        'C) tenha empatia para com o próximo.',
        'D) conte com a causalidade do destino.',
        'E) alimente-se de forma saudável e pratique atividades físicas.',
        'B) saia de sua zona de conforto.',
        'Sociologia',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        103,
        'Entre as substâncias monitoradas pela CETESB, temos o',
        'A) SO2, formado por átomos de 3 elementos químicos.',
        'B) O3, formado por 3 átomos de 1 elemento químico.',
        'C) NO2, formado por átomos de 3 elementos químicos.',
        'D) NO e o NO2, que diferem por 1 elemento químico.',
        'E) CO, que, diferentemente do CO2, é formado por 2 elementos químicos.',
        'B) O3, formado por 3 átomos de 1 elemento químico.',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        104,
        'A partir das informações apresentadas no texto, pode-se concluir corretamente que',
        'A) a Yersinia pestis é o agente causador de doenças como a febre amarela, a poliomielite e muitas outras enfermidades.',
        'B) a epidemia de peste bubônica, na cidade de Santos, foi controlada pela ação de antígenos antivirais específicos, produzidos por organismos vacinados.',
        'C) a produção do soro antipestoso, utilizado para eliminar as pulgas parasitas dos ratos contaminados, acabou com o surto da peste bubônica na cidade de Santos.',
        'D) aprevenção contra casos de envenenamentos por animais e contra doenças comuns no Brasil, como tuberculose e verminoses, é feita através de vacinação da população.',
        'E) o soro é obtido de um animal que recebe o antígeno e, posteriormente, tem parte do seu sangue retirado para extração dos anticorpos.',
        'E) o soro é obtido de um animal que recebe o antígeno e, posteriormente, tem parte do seu sangue retirado para extração dos anticorpos.',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        105,
        'De acordo com o texto, é correto afirmar que',
        'A) os esgotos provenientes do oceano Atlântico são transportados para Santos e São Vicente por canos que passam pela Ponte Pênsil.',
        'B) o médico Saturnino de Brito construiu a Ponte Pênsil, que liga Santos a São Vicente, com o propósito de eliminar o vírus que causava a peste bubônica.',
        'C) a Ponte Pênsil foi construída para sustentar os encanamentos responsáveis pelo carregamento do esgoto colhido nas cidades de São Vicente e de Santos.',
        'D) a usina hidrelétrica de Itaipu, em São Vicente, foi a responsável pela construção da Ponte Pênsil, encarregada de enviar água para movimentar suas turbinas.',
        'E) os municípios do Japuí e dos Barbosas passaram a ter uma ligação terrestre por meio da Ponte Pênsil, pois, anteriormente, a ligação entre eles era realizada por intermédio de barcos.',
        'C) a Ponte Pênsil foi construída para sustentar os encanamentos responsáveis pelo carregamento do esgoto colhido nas cidades de São Vicente e de Santos.',
        'História',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        106,
        'O texto faz referência ao período histórico em que a cidade de São Paulo',
        'A) permaneceu como capital do Brasil e uma das cidades mais importantes do mundo, sendo o principal centro de missionação católica e destacando-se por sua arquitetura arrojada.',
        'B) foi visitada por Mem de Sá, governador-geral do Brasil, que ordenou a transferência da população da vila de Santo André da Borda do Campo para os arredores do colégio, denominado “Colégio de São Paulo de Piratininga”.',
        'C) consolidou-se como metrópole industrial, concentrando o parque industrial brasileiro na capital e em sua região metropolitana, principalmente a partir da década de 1950, com a chegada das indústrias automobilísticas.',
        'D) permaneceu como uma vila pobre e isolada do litoral, sendo a única vila no interior do Brasil, mantendo-se por meio de lavouras de subsistência cultivadas por mulheres e crianças.',
        'E) vivenciou a expansão da produção do café, inicialmente na região da Avenida Paulista e depois nas regiões de Cidade Ademar, Santo Amaro, Butantã, Morumbi e Casa Verde.',
        'C) consolidou-se como metrópole industrial, concentrando o parque industrial brasileiro na capital e em sua região metropolitana, principalmente a partir da década de 1950, com a chegada das indústrias automobilísticas.',
        'História',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        107,
        'Considere que densidade (d) é a razão entre a massa (m) e o volume (V) de uma amostra: d = m / V. Quando coletarmos 1 kg de água do Oceano Atlântico, necessitaremos de um recipiente cujo volume mínimo, em cm3, deverá ser aproximadamente de',
        'A) 1 030,0.',
        'B) 103,0.',
        'C) 350,0.',
        'D) 970,9.',
        'E) 97,0.',
        'D) 970,9.',
        'Matemática',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        108,
        'Os sais são formados por cátions (íons positivos) e ânions (íons negativos). Saiba que as representações dos íons presentes nos sais citados no texto são: Cátions: Na+, K+ e Mg2+ Ânion: Cl– Assinale a alternativa que apresenta a fórmula correta para os sais presentes no texto.',
        'A) NaCl, KCl, MgCl',
        'B) NaCl, KCl, MgCl2',
        'C) NaCl, KCl, Mg2Cl',
        'D) ClNa, ClK, Cl2Mg',
        'E) ClNa, ClK, ClMg',
        'B) NaCl, KCl, MgCl2',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        109,
        'O linguado é um animal bentônico, que vive sob areia e cascalho no fundo do mar, ficando apenas com os olhos para fora. Por isso, ele consegue visualizar o chão ao seu redor e imitar os locais onde vive, mudando sua própria cor. Essa importante adaptação do linguado, que lhe permite tornar-se praticamente invisível, recebe o nome de',
        'A) protocooperação.',
        'B) comensalismo.',
        'C) camuflagem.',
        'D) inquilinismo.',
        'E) predatismo.',
        'C) camuflagem.',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        110,
        'Relacionando os quadrinhos com o fenômeno descrito, pode-se dizer que são formadas',
        'A) marés baixas quando a Lua sai de sua órbita para se afastar da Terra.',
        'B) marés altas quando a Lua sai de sua órbita para se aproximar da Terra.',
        'C) marés altas nas regiões da Terra em que é dia, porque essas regiões estão mais próximas do Sol.',
        'D) marés baixas nas regiões da Terra em que é noite, porque essas regiões estão mais distantes do Sol.',
        'E) marés altas em regiões da Terra que estão mais próximas da Lua ao longo do movimento de rotação da Terra.',
        'E) marés altas em regiões da Terra que estão mais próximas da Lua ao longo do movimento de rotação da Terra.',
        'Geografia',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        111,
        'De acordo com os textos, é correto afirmar que',
        'A) a Sabesp é produto da união entre empresas públicas e privadas que atuavam na coleta de esgotos.',
        'B) a Sabesp obteve a adesão de outros estados, conseguindo expandir o tratamento de água para regiões próximas a São Paulo.',
        'C) a Sabesp contribuiu na prevenção da mortalidade infantil por meio não só da produção e da distribuição de água potável, mas também da coleta de esgoto.',
        'D) o Sistema Cantareira é responsável pela distribuição de água potável em todo o estado de São Paulo.',
        'E) as ETAs são fábricas produtoras de água destilada que, posteriormente, é tratada para ser, então, distribuída.',
        'C) a Sabesp contribuiu na prevenção da mortalidade infantil por meio não só da produção e da distribuição de água potável, mas também da coleta de esgoto.',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        112,
        'Suponha que a média de adesão relatada no texto seja mantida e que a Sabesp hoje atenda 375 municípios. Entre as alternativas dadas, assinale a que apresenta o menor número inteiro que corresponde ao tempo necessário, em anos, para a empresa conseguir ultrapassar a adesão de mais da metade desses municípios.',
        'A) 1,00',
        'B) 1,25',
        'C) 1,50',
        'D) 1,75',
        'E) 2,00',
        'E) 2,00',
        'Matemática',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        113,
        'Dessa forma, ao fim de um dia, a Sabesp terá tratado um volume, em litros, de aproximadamente',
        'A) 1,0 × 10^7.',
        'B) 1,0 × 10^8.',
        'C) 1,0 × 10^9.',
        'D) 1,0 × 10^10.',
        'E) 1,0 × 10^11.',
        'D) 1,0 × 10^10.',
        'Matemática',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        114,
        'Nessa última etapa, os flocos de sujeira são separados usando uma propriedade específica da matéria denominada',
        'A) ponto de fusão, pois os flocos são fundidos e retirados quando se depositam no fundo dos tanques.',
        'B) ponto de fusão, pois os flocos formam vapores que serão eliminados no ar.',
        'C) solubilidade, pois os flocos são dissolvidos e separados na filtração.',
        'D) solubilidade, pois os flocos formados irão para a superfície dos tanques e serão retirados com peneiras.',
        'E) densidade, pois os flocos formados irão para o fundo dos tanques e serão aspirados lentamente.',
        'E) densidade, pois os flocos formados irão para o fundo dos tanques e serão aspirados lentamente.',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        115,
        'A partir da leitura do texto, podemos concluir corretamente que',
        'A) a higiene bucal, quando realizada com eficiência diariamente, ocasiona um elevado índice de proliferação de bactérias e de formação de placas bacterianas.',
        'B) a ação de bactérias na degradação dos carboidratos aumenta a acidez bucal, que é fundamental para o processo de proteção e de mineralização dos dentes.',
        'C) o flúor, adicionado à água potável, atua na digestão dos resíduos alimentares que ficam na cavidade bucal quando a higienização não é realizada corretamente.',
        'D) a fluoretação da água aumenta a desmineralização do esmalte dos dentes, reduzindo o aparecimento de cáries, por isso é um processo importante na saúde bucal.',
        'E) o flúor é usado na prevenção de cáries, pois fortalece o esmalte dos dentes, formando um material resistente à acidez decorrente da ação de bactérias.',
        'E) o flúor é usado na prevenção de cáries, pois fortalece o esmalte dos dentes, formando um material resistente à acidez decorrente da ação de bactérias.',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        116,
        'De acordo com o texto, é correto afirmar que',
        'A) as promessas de limpeza do rio Tietê ocorrem desde o século XIX.',
        'B) faz menos de vinte anos que o rio Tietê começou a ser poluído.',
        'C) o rio Tietê possui 122 quilômetros, sendo que, destes, 71 estão poluídos.',
        'D) o trecho morto do rio Tietê aumentou 41 quilômetros entre os anos de 2018 e 2019.',
        'E) as promessas de limpeza do rio Tietê já ocorriam em 1940 devido a pressões populares.',
        'D) o trecho morto do rio Tietê aumentou 41 quilômetros entre os anos de 2018 e 2019.',
        'Geografia',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        117,
        'O museu apresentado no texto foi fundado para celebrar',
        'A) a anexação do território do Acre.',
        'B) a vitória do Império do Brasil na Guerra do Paraguai.',
        'C) a chegada da Família Real Portuguesa ao Rio de Janeiro.',
        'D) o extermínio dos povos indígenas do Planalto Paulista.',
        'E) a Proclamação da Independência do Brasil.',
        'E) a Proclamação da Independência do Brasil.',
        'História',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        118,
        'De acordo com o infográfico, assinale a alternativa que apresenta, corretamente, uma atividade relacionada à pergunta “Como ser um cidadão mais participativo?”.',
        'A) Trabalhar com carteira assinada como atendente em uma pizzaria.',
        'B) Produzir lanches saudáveis para vender na escola.',
        'C) Ser estagiário remunerado em uma empresa de distribuição de alimentos.',
        'D) Visitar e conversar com pacientes internados em hospitais.',
        'E) Atuar profissionalmente na elaboração de jogos on-line.',
        'D) Visitar e conversar com pacientes internados em hospitais.',
        'Sociologia',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        119,
        'Tendo como base a linguagem verbal e não verbal, é correto afirmar que',
        'A) a charge aborda a oposição entre mobilidade e imobilidade, sendo esta representada pela imagem de uma expressão figurada.',
        'B) a tirinha ironiza o trânsito nos centros urbanos, insinuando que apenas uma intervenção divina é capaz de solucionar o problema.',
        'C) o cartum demonstra, por meio da linguagem não verbal, que as bicicletas não são veículos viáveis para a mobilidade urbana.',
        'D) a charge tematiza a impossibilidade de solucionar a falta de mobilidade nos grandes centros urbanos.',
        'E) o cartum representa a dificuldade de vivenciar plenamente a cidade devido à falta de automóveis.',
        'A) a charge aborda a oposição entre mobilidade e imobilidade, sendo esta representada pela imagem de uma expressão figurada.',
        'Português',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        120,
        'Sobre a linguagem verbal utilizada no texto, é correto concluir que',
        'A) “enquanto” é um conectivo de alternância e pode ser substituído por “ou”.',
        'B) “isso” é um pronome indefinido e aponta para o passado do leitor.',
        'C) as reticências utilizadas expressam a continuidade de uma enumeração não concluída.',
        'D) “que” é um conectivo de comparação e está subordinado ao termo “melhor”.',
        'E) “para” é uma preposição final utilizada, no texto, para indicar o destino da personagem.',
        'D) “que” é um conectivo de comparação e está subordinado ao termo “melhor”.',
        'Português',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        121,
        'O texto menciona a necessidade de uma obra de infraestrutura para atender à demanda da produção de café, que',
        'A) perdia espaço para o tabaco como principal produto de exportação do Brasil no período mencionado.',
        'B) era voltado para o mercado interno, consumido principalmente nos estados da região Centro-Oeste.',
        'C) entrava no país pelo porto de Santos, vindo da Etiópia, e era distribuído nos entrepostos e armazéns do interior de São Paulo.',
        'D) ocupava posição irrelevante na pauta de exportações brasileiras, sendo consumido em países pequenos, como Guiana Francesa e Suriname.',
        'E) era enviado principalmente para os Estados Unidos e para diferentes países da Europa, sendo o principal produto de exportação do Brasil.',
        'E) era enviado principalmente para os Estados Unidos e para diferentes países da Europa, sendo o principal produto de exportação do Brasil.',
        'História',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        122,
        'No início da década de 1970, eram necessárias aproximadamente 2 horas para realizar o trajeto entre a estação Valongo e a estação da Luz. Nesse percurso, o trem se locomovia com uma velocidade escalar média, aproximadamente, de',
        'A) 69,5 km/h',
        'B) 54,5 km/h',
        'C) 39,5 km/h',
        'D) 34,5 km/h',
        'E) 24,5 km/h',
        'C) 39,5 km/h',
        'Matemática',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        123,
        'No estado de São Paulo, durante a segunda metade do século XIX, grandes ferrovias foram construídas. O principal motivo desse empreendimento foi o escoamento da produção do café até às proximidades do porto de Santos. Atualmente, um dos principais produtos exportados pelo porto de Santos é',
        'A) semicondutor.',
        'B) óleo de palma.',
        'C) fertilizante.',
        'D) trigo.',
        'E) soja.',
        'E) soja.',
        'Geografia',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        124,
        'Com base no texto, é correto afirmar que',
        'A) as outras ferrovias paulistas nomeavam suas estações seguindo um padrão estabelecido pelo governo federal desde 1808.',
        'B) as outras ferrovias paulistas copiaram o modelo abecedário da Companhia Paulista de Estradas de Ferro, utilizado por esta desde o século XVII.',
        'C) a estação Nipônica foi assim nomeada como uma homenagem aos imigrantes japoneses que vieram ao Brasil no século XIX para participar da construção de ferrovias.',
        'D) o nome de cada estação da linha citada estava ligado tanto a eventos históricos vinculados ao estado de São Paulo quanto a correntes imigratórias e à localização geográfica.',
        'E) o nome das estações coincide com o nome das cidades que se formaram ao seu redor, pois elas mantiveram suas denominações e, portanto, não houve trocas de nomes até os dias de hoje.',
        'D) o nome de cada estação da linha citada estava ligado tanto a eventos históricos vinculados ao estado de São Paulo quanto a correntes imigratórias e à localização geográfica.',
        'História',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        125,
        'Com base nos textos, é correto afirmar que',
        'A) a realização do nosso projeto de vida passa pelas revoluções industriais, que ajudaremos a construir, para que nossa caminhada tenha sentido.',
        'B) o estabelecimento dos próprios caminhos e o esforço para fazer o nosso melhor são ações fundamentais para empreender qualquer projeto de vida.',
        'C) um projeto de vida bem estruturado é como um barco sem instrumentos de navegação e sem cinemas que nos permitam assistir a filmes sem roteiros previamente traçados.',
        'D) toda revolução é um retrocesso e a única possível é aquela que faz nossa caminhada seguir além do túmulo, ou seja, quando transformamos o regime social de nosso país em um império.',
        'E) nossa realização como pessoa necessita de retrocessos para que possamos nos desvencilhar de qualquer caminho pré-estabelecido e, assim, construirmos nossos sonhos sem as amarras da sociedade.',
        'B) o estabelecimento dos próprios caminhos e o esforço para fazer o nosso melhor são ações fundamentais para empreender qualquer projeto de vida.',
        'Sociologia',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        126,
        'Em 1968, o Prof. Dr. Euryclides de Jesus Zerbini, cirurgião cardiologista, realizou no Hospital das Clínicas de São Paulo, com sucesso, o primeiro transplante cardíaco em humano no Brasil. No caso de cardiopatias de alta complexidade, o transplante de coração surge como a forma mais indicada para que o paciente volte a ter uma vida com qualidade. No entanto, apesar de as cardiopatias estarem associadas a alguns fatores que não podem ser modificados, como a hereditariedade, o sexo e a idade, outros fatores podem e devem ser modificados pelas mudanças no estilo de vida e pelo uso de medicamentos. Assim, para o paciente que já tem predisposição ou que tem esse tipo de problema, é importante',
        'A) manter o nível elevado de pressão arterial e deixar de realizar exames preventivos periodicamente.',
        'B) não só evitar as atividades físicas, como também reduzir o consumo de água ao longo do dia.',
        'C) manter o consumo elevado de sal, e aumentar o consumo de bebida alcoólica.',
        'D) controlar o excesso de peso, e tomar as medicações quando indicadas.',
        'E) comer alimentos ricos em carboidratos, óleos e gorduras; e excluir legumes, verduras e cereais.',
        'D) controlar o excesso de peso, e tomar as medicações quando indicadas.',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        127,
        'Segundo o texto,',
        'A) o chamado triângulo, formado pelas ruas São Bento, Direita e Quinze de Novembro, foi excluído dos planos de reforma do centro, uma vez que ali se localizava a Igreja de Nossa Senhora do Rosário dos Homens Pretos, considerada um símbolo de atraso.',
        'B) a reforma do centro da cidade tinha o objetivo de preservar os elementos mais significativos do passado colonial, exaltando a presença negra em São Paulo e sua contribuição para o desenvolvimento cultural da cidade.',
        'C) a demolição da Igreja de Nossa Senhora do Rosário dos Homens Pretos era parte do objetivo de eliminar do centro da cidade qualquer elemento considerado atrasado, que lembrasse o passado colonial.',
        'D) embora São Paulo possuísse símbolos modernos, ela só passou a ser considerada moderna, como as cidades dos países civilizados, quando Antônio da Silva Prado criou o cargo de prefeito em 1911.',
        'E) a criação do cargo de prefeito interrompeu os esforços de modernização da capital, a remodelação dos espaços e do aparelhamento urbano, especialmente no centro da cidade.',
        'C) a demolição da Igreja de Nossa Senhora do Rosário dos Homens Pretos era parte do objetivo de eliminar do centro da cidade qualquer elemento considerado atrasado, que lembrasse o passado colonial.',
        'História',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        128,
        'A região triangular, mencionada no texto, expandiu-se ao longo do tempo. Entretanto ela permanece sendo conhecida como Triângulo Histórico de São Paulo e sua configuração atual é mostrada no mapa. Ao considerar o polígono demarcado pelas linhas pretas no mapa, matematicamente, ele seria descrito como um',
        'A) triângulo.',
        'B) quadrilátero.',
        'C) heptágono.',
        'D) undecágono.',
        'E) dodecágono.',
        'D) undecágono.',
        'Matemática',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        129,
        'No mapa da questão anterior, é possível traçar um triângulo ao utilizar como vértices o Pateo do Collegio, o Largo São Bento e o Largo São Francisco. Sobre esse polígono, considere que a distância, em linha reta, entre o Pateo do Collegio e o Largo São Francisco é de 500 m; entre o Pateo do Collegio e o Largo São Bento é de 500 m; e entre o Largo São Francisco e o Largo São Bento é de 800 m. Logo, sobre o triângulo traçado, é possível concluir que ele é',
        'A) isósceles e acutângulo.',
        'B) escaleno e acutângulo.',
        'C) isósceles e obtusângulo.',
        'D) escaleno e obtusângulo.',
        'E) isósceles e retângulo.',
        'C) isósceles e obtusângulo.',
        'Matemática',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        130,
        'Considerando os seres vivos citados no texto, podemos afirmar que',
        'A) as borboletas e as libélulas liberam pela respiração o gás oxigênio, o qual é fundamental para a sobrevivência das ninfeias.',
        'B) os ciprestes e os pinheiros são plantas conhecidas como gimnospermas, pois formam sementes não envolvidas por frutos.',
        'C) todos os vegetais descritos nos espaços de visitação são aclorofilados, portanto incapazes de realizar fotossíntese e de produzir seu próprio alimento.',
        'D) as espécies pau-brasil e imbuia são plantas arbustivas, de dois a seis metros de altura, que estão ameaçadas de extinção, pois não possuem vasos condutores de seiva.',
        'E) a presença de bichos-preguiça e bugios no Jardim Botânico é prejudicial ao equilíbrio do ecossistema, pois são carnívoros e competem entre si pelo alimento escasso.',
        'B) os ciprestes e os pinheiros são plantas conhecidas como gimnospermas, pois formam sementes não envolvidas por frutos.',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        131,
        'De acordo com o texto, é correto afirmar que',
        'A) essa árvore nasceu no século XX, de acordo com o Instituto de Pesquisas Tecnológicas.',
        'B) o prefeito Firmiano Pinto resolveu cortar essa árvore em 1909, mas foi impedido pela imprensa paulista.',
        'C) Dom Pedro I se dirigia a essa árvore para chorar e lamentar a ida de milhares de paulistas para lutarem na Guerra do Paraguai.',
        'D) essa árvore foi trazida do Paraguai durante a Guerra para servir de apoio psicológico para as mães que tinham perdido seus filhos no conflito.',
        'E) a árvore, que dá nome a uma estrada localizada no município de São Paulo, está protegida, hoje em dia, pelo poder público, que proíbe seu corte.',
        'E) a árvore, que dá nome a uma estrada localizada no município de São Paulo, está protegida, hoje em dia, pelo poder público, que proíbe seu corte.',
        'História',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        132,
        'A descoberta descrita no texto evidencia corretamente que',
        'A) as espécies existentes há milhões de anos eram iguais às atuais.',
        'B) os seres vivos se transformam em fósseis quando são totalmente decompostos após sua morte.',
        'C) as partes duras dos animais, como dentes, ossos, vértebras e carapaças, não são passíveis de fossilização.',
        'D) os registros paleontológicos revelam informações as quais permitem os estudos sobre seres vivos de determinadas épocas.',
        'E) as partes moles dos animais e dos vegetais são rapidamente fossilizadas devido à presença de bactérias e fungos decompositores.',
        'D) os registros paleontológicos revelam informações as quais permitem os estudos sobre seres vivos de determinadas épocas.',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        133,
        'Um turista pretende visitar três dos destinos listados, sendo que sua primeira parada será o Museu do Café, e os outros dois destinos serão escolhidos de forma aleatória. O número máximo de roteiros diferentes, levando em conta a ordem de visitação aos pontos turísticos, corresponde a',
        'A) 15.',
        'B) 30.',
        'C) 36.',
        'D) 42.',
        'E) 210.',
        'B) 30.',
        'Matemática',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        134,
        'O avião que transportará a equipe de Araraquara voará deste município, em linha reta, em direção ao município de Jundiaí no sentido',
        'A) Noroeste.',
        'B) Nordeste.',
        'C) Sudoeste.',
        'D) Sudeste.',
        'E) Norte.',
        'D) Sudeste.',
        'Geografia',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        135,
        'De acordo com os dados apresentados, é correto afirmar que o destino turístico que possui a melhor avaliação média, considerando os dois sites, é',
        'A) Aparecida.',
        'B) Campos do Jordão.',
        'C) Eldorado.',
        'D) Ilhabela.',
        'E) Olímpia.',
        'A) Aparecida.',
        'Geografia',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        136,
        'O produto dessas fontes, a água mineral, é um exemplo de',
        'A) substância composta.',
        'B) substância simples.',
        'C) substância pura.',
        'D) mistura destilada.',
        'E) mistura.',
        'E) mistura.',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        137,
        'Assinale a alternativa que completa correta e respectivamente as lacunas do texto.',
        'A) diminui; aumentar',
        'B) diminui; diminuir',
        'C) diminui; se manter igual',
        'D) aumenta; diminuir',
        'E) aumenta; aumentar',
        'A) diminui; aumentar',
        'Matemática',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        138,
        'Segundo o texto,',
        'A) a presença de meninas nas partidas de futebol de sua infância foi o impulso necessário para o alto rendimento da atleta na vida adulta.',
        'B) o futebol feminino gozava de melhores condições no passado, pois as meninas eram aceitas nas partidas dos meninos.',
        'C) a atleta enfrentou dificuldades relacionadas às condições financeiras de sua família e ao fato de que, em sua infância, não havia muitas meninas com quem pudesse jogar.',
        'D) a atleta considera o futebol profissional um esporte democrático, pois, sem condições financeiras e sem ajuda, ela encontrou facilidade para praticá-lo.',
        'E) para ser bem sucedida no esporte que escolheu, bastou a atleta acreditar em seu potencial e se empenhar nos treinos.',
        'C) a atleta enfrentou dificuldades relacionadas às condições financeiras de sua família e ao fato de que, em sua infância, não havia muitas meninas com quem pudesse jogar.',
        'Português',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        139,
        'Assinale a alternativa que completa correta e respectivamente as lacunas do texto.',
        'A) aquecer; expandir; diminuindo',
        'B) resfriar; expandir; diminuindo',
        'C) aquecer; expandir; aumentando',
        'D) resfriar; contrair; aumentando',
        'E) aquecer; contrair; diminuindo',
        'A) aquecer; expandir; diminuindo',
        'Ciências',
        2023,
        '2'
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre)
    VALUES (
        140,
        'Nos quadrinhos dados, o humor é utilizado para criticar o uso constante de alguns recursos tecnológicos que podem levar à perda da autonomia. Uma atitude possível para combater esse processo na sociedade atual é',
        'A) a utilização do celular como ferramenta de comunicação por todos, garantindo, assim, igualdade entre os indivíduos.',
        'B) a substituição do celular por computadores pessoais portáteis, já que oferecem mais recursos de verificação de informação.',
        'C) o ensino da resiliência nas escolas, pois o entendimento da realidade do próximo acarreta a necessidade de contatos interpessoais virtuais e físicos.',
        'D) o uso constante de linguagem informal e acessível, pois o desconhecimento linguístico impede a concretização de uma comunicação efetiva fora da internet.',
        'E) a valorização do autoconhecimento e do senso crítico, competências capazes de gerar um indivíduo questionador, atento à realidade e independente.',
        'E) a valorização do autoconhecimento e do senso crítico, competências capazes de gerar um indivíduo questionador, atento à realidade e independente.',
        'Sociologia',
        2023,
        '2'
    );

-- INSERT TABLE tbIMAGENS PROVA 2023 2 SEMESTRE
    INSERT INTO tbImagens (cod_question, image_data)
        VALUES 
            (91, 'imgs2/txtQ1-3.PNG'),
            (95, 'imgs2/txtQ5.PNG'),
            (96, 'imgs2/txtQ6-9.PNG'),
            (100, 'imgs2/txtQ10.PNG'),
            (101, 'imgs2/txtQ11.PNG'),
            (102, 'imgs2/txtQ12.PNG'),
            (103, 'imgs2/txtQ13.PNG'),
            (104, 'imgs2/txtQ14-1.PNG'),
            (104, 'imgs2/txtQ14-2.PNG'),
            (105, 'imgs2/txtQ15.PNG'),
            (106, 'imgs2/txtQ16.PNG'),
            (106, 'imgs2/txtQ16-2.PNG'),
            (107, 'imgs2/txtQ17.PNG'),
            (108, 'imgs2/txtQ18.PNG'),
            (109, 'imgs2/txtQ19-20.PNG'),
            (110, 'imgs2/txtQ20.PNG'),
            (110, 'imgs2/txtQ20-1.PNG'),
            (111, 'imgs2/txtQ21-23.PNG'),
            (113, 'imgs2/txtQ23.PNG'),
            (114, 'imgs2/txtQ24.PNG'),
            (115, 'imgs2/txtQ25.PNG'),
            (116, 'imgs2/txtQ26.PNG'),
            (116, 'imgs2/txtQ26-1.PNG'),
            (117, 'imgs2/txtQ27.PNG'),
            (118, 'imgs2/txtQ28.PNG'),
            (119, 'imgs2/txtQ29-30.PNG'),
            (121, 'imgs2/txtQ31-32.PNG'),
            (124, 'imgs2/txtQ34.PNG'),
            (125, 'imgs2/txtQ35.PNG'),
            (127, 'imgs2/txtQ37-39.PNG'),
            (128, 'imgs2/txtQ38.PNG'),
            (130, 'imgs2/txtQ40.PNG'),
            (131, 'imgs2/txtQ41.PNG'),
            (132, 'imgs2/txtQ42.PNG'),
            (133, 'imgs2/txtQ43.PNG'),
            (134, 'imgs2/txtQ44.PNG'),
            (135, 'imgs2/txtQ45.PNG'),
            (136, 'imgs2/txtQ46.PNG'),
            (137, 'imgs2/txtQ47.PNG'),
            (138, 'imgs2/txtQ48.PNG'),
            (139, 'imgs2/txtQ49.PNG'),
            (140, 'imgs2/txtQ50.PNG');

-- INSERT TABLE tbQUESTIONS PROVA 2022 2 SEMESTRE
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        141,
        'Suponha que, no momento da entrevista, a unidade escolar mencionada no texto registrava um índice de evasão escolar de cerca de 30 % em relação aos alunos matriculados no início do ano letivo. Logo, o número de alunos matriculados no início do mesmo ano, nessa unidade escolar, era aproximadamente',
        'A) 1 200.',
        'B) 1 040.',
        'C) 980.',
        'D) 860.',
        'E) 630.',
        'D) 860.',
        'Matemática',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        142,
        'Sobre os tipos de desemprego citados, podemos afirmar corretamente que',
        'A) o desemprego estrutural é passageiro, pois quando a economia de um determinado país começa a melhorar os empregos retornam e as pessoas se reempregam.',
        'B) o desemprego estrutural está ligado à adoção de novas máquinas e robôs nas empresas que os adotam para substituir o trabalho humano.',
        'C) o desemprego conjuntural diminui em tempos de crise econômica e aumenta quando a economia mostra sinais de vitalidade.',
        'D) o desemprego conjuntural será zerado quando todas as máquinas e robôs forem destruídos pelos trabalhadores.',
        'E) o desemprego conjuntural e o desemprego estrutural são sinônimos, pois definem o mesmo tipo de desemprego.',
        'B) o desemprego estrutural está ligado à adoção de novas máquinas e robôs nas empresas que os adotam para substituir o trabalho humano.',
        'Matemática',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        143,
        'A técnica de controle biológico descrita no texto consiste na',
        'A) introdução de insetos prejudiciais à agricultura, uma vez que se alimentam de tecido vegetal.',
        'B) aplicação de inseticidas, a fim de diminuir o número de organismos causadores das pragas presentes em culturas de hortaliças e de árvores frutíferas.',
        'C) utilização de sementes previamente selecionadas e no emprego de fertilizantes, a fim de expandir as plantações de soja e de outras lavouras.',
        'D) utilização de inimigos naturais específicos, como predadores, a fim de combater os organismos causadores de danos às plantações.',
        'E) introdução de insetos parasitas na plantação, a fim de impedir que os seres causadores da praga cheguem à fase reprodutiva.',
        'D) utilização de inimigos naturais específicos, como predadores, a fim de combater os organismos causadores de danos às plantações.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        144,
        'Considere uma recomendação para adubação de 500 kg/ha, sendo o espaçamento entre os sulcos de 60 cm. A massa de adubo que deverá ser utilizada, em kg, em um sulco com 150 m de comprimento, é de',
        'A) 3,0.',
        'B) 4,5.',
        'C) 30,0.',
        'D) 450,0.',
        'E) 4 500,0.',
        'B) 4,5.',
        'Matemática',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        145,
        'No período abordado pelo texto, os humanos',
        'A) mostraram-se incapazes de suprir suas necessidades básicas de sobrevivência, o que os fez viver exclusivamente da caça, da pesca e da coleta.',
        'B) viviam de forma muito semelhante à dos demais animais, sem desenvolver técnicas capazes de melhorar a vida em sociedade.',
        'C) aprenderam a reconhecer e a cultivar vegetais comestíveis e ervas curativas e, consequentemente, desenvolveram a agricultura.',
        'D) desconheciam formas de exploração e utilização de recursos naturais, como vegetais comestíveis e ervas curativas.',
        'E) reuniram um conjunto de saberes e técnicas de trabalho e desenvolveram um modo de vida em sociedade.',
        'E) reuniram um conjunto de saberes e técnicas de trabalho e desenvolveram um modo de vida em sociedade.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        146,
        'No texto apresentado, o eu lírico tece reflexões sobre sua vida e sua realidade. Algumas delas evidenciam aspectos sociais relevantes, tais como',
        'A) a garantia da felicidade pelo acúmulo financeiro, como representado no verso 8.',
        'B) a visibilidade social da classe trabalhadora, como representado no verso 9. ',
        'C) as vantagens da utilização do transporte público, como representado no verso 12.',
        'D) a busca ininterrupta pela felicidade por meio do consumo constante, como representado no verso 22. ',
        'E) o potencial de transformação social das classes desfavorecidas, como representado no verso 24',
        'E) o potencial de transformação social das classes desfavorecidas, como representado no verso 24',
        'Português',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        147,
        'O rap é um estilo musical urbano caracterizado pela declamação ritmada de suas letras. Outra característica marcante desse gênero encontra-se na utilização de diferentes níveis de linguagem. Assinale a alternativa em que todas as palavras pertencem à linguagem coloquial.',
        'A) ser, ontem, menina, cê.',
        'B) cê, tô, pra, busão.',
        'C) pra, dim, horizonte, esperança.',
        'D) dim, chance, paz, latinha.',
        'E) sol, cruza, mamãe, amordaçado.',
        'B) cê, tô, pra, busão.',
        'Português',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        148,
        'Sobre a passagem “Tô com a paciência de quem junta latinha / Focado no que tenho, não no que vou ter ou tinha”, é correto afirmar que o eu lírico',
        'A) sente-se dividido entre o passado, marcado pela culpa, e o futuro, marcado pelo medo e pelas incertezas.',
        'B) está, apesar das condições sociais, paciente e procura se manter centrado no presente vivenciando cada dia isoladamente.',
        'C) encontra-se inquieto diante de suas condições sociais, revendo o passado para não errar no futuro, mas ignorando o presente.',
        'D) permanece, durante o seu trabalho, concentrado na realização de suas tarefas para evitar relembrar suas experiências passadas.',
        'E) recorre à coleta de materiais recicláveis como metáfora para a imprudência de vivenciar apenas o presente, sem se preocupar com o futuro.',
        'B) está, apesar das condições sociais, paciente e procura se manter centrado no presente vivenciando cada dia isoladamente.',
        'Português',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        149,
        'Nos versos 1 e 2, Emicida nos remete ao',
        'A) amanhecer e a um novo dia com gosto de frustação.',
        'B) amanhecer e à existência de uma nova interrogação.',
        'C) amanhecer e a uma nova oportunidade para sermos melhores.',
        'D) anoitecer e ao arrependimento do dia que se foi.',
        'E) anoitecer e à paralização dos sonhos.',
        'C) amanhecer e a uma nova oportunidade para sermos melhores.',
        'Português',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        150,
        'Considere que um mês tem, em média, uma duração de 4,5 semanas, assim, é correto afirmar que',
        'A) x > y > z.',
        'B) y > x > z.',
        'C) z > x > y.',
        'D) x > z > y.',
        'E) y > z > x.',
        'E) y > z > x.',
        'Matemática',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        151,
        'Com base nessas informações, são imóveis que estão fora da zona de ruído',
        'A) A e B.',
        'B) A e C.',
        'C) A e D.',
        'D) B e C.',
        'E) B e D.',
        'A) A e B.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        152,
        'Entre as principais características do sistema de produção mencionado no texto, podemos apontar corretamente',
        'A) a informatização, a substituição dos trabalhadores por robôs e o consequente aumento dos índices de desemprego.',
        'B) a redução da jornada de trabalho, a ampliação dos direitos trabalhistas e o incentivo ao ócio e à criatividade dos trabalhadores.',
        'C) a produção artesanal de mercadorias, realizada em espaços domésticos; e a utilização de mão de obra escravizada, proveniente da África.',
        'D) a linha de montagem automatizada, com a utilização de esteiras rolantes; e a especialização produtiva do trabalhador, que realizava parte das etapas da produção.',
        'E) a localização das fábricas, que privilegiava a criação de empregos nos países pobres; e o investimento na formação do trabalhador, que deveria conhecer todas as etapas do processo produtivo.',
        'D) a linha de montagem automatizada, com a utilização de esteiras rolantes; e a especialização produtiva do trabalhador, que realizava parte das etapas da produção.',
        'História',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        153,
        'As previsões de Malthus não se concretizaram, pois',
        'A) a população mundial diminuiu lenta e continuamente, até os dias de hoje e, portanto, a necessidade por alimentos também diminuiu no mesmo ritmo.',
        'B) os trabalhadores urbanos, na Revolução Industrial, dividiam seu tempo entre o trabalho em fábricas e em atividades ligadas à horticultura, cultivando seu próprio alimento e, dessa forma, acabando com a fome no mundo.',
        'C) novas tecnologias surgiram e foram incorporadas ao processo produtivo nos campos, fazendo aumentar a produção de alimentos, em função do desenvolvimento tecnológico proporcionado pela Revolução Industrial.',
        'D) as pessoas se dirigiram em grande quantidade, com o avanço da Revolução Industrial, para as zonas rurais atrás de emprego, causando um esvaziamento das cidades e aumentando a produção de gêneros alimentícios nos campos.',
        'E) os proprietários das fábricas, durante a Revolução Industrial, preocupados com a qualidade de vida de seus trabalhadores e de suas famílias, criaram um projeto de distribuição de cestas básicas para as famílias de trabalhadores sindicalizados, com o intuito de fidelizar a mão de obra.',
        'C) novas tecnologias surgiram e foram incorporadas ao processo produtivo nos campos, fazendo aumentar a produção de alimentos, em função do desenvolvimento tecnológico proporcionado pela Revolução Industrial.',
        'História',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        154,
        'Sobre os elementos coesivos destacados no texto, é correto afirmar que',
        'A) “para”, no segundo parágrafo, expressa ideia de finalidade, evidenciando o objetivo de um empreendedor tradicional, e tem sentido equivalente a “a fim de”.',
        'B) “para”, no terceiro parágrafo, é utilizado para indicar a direção de um projeto social e pode ser substituído pela expressão “defronte a”.',
        'C) “porém”, no terceiro parágrafo, expressa ideia de consequência, pois a geração de renda leva à redução de desigualdade social, e equivale a “entretanto”',
        'D) “e”, no terceiro parágrafo, apesar de ser normalmente utilizado para expressar sentido de adição, no texto é empregado como oposição, equivalendo a “mas”.',
        'E) “uma vez que”, no quarto parágrafo, corresponde a “porque”, pois explica a eficácia da atuação do empreendedor social diante de problemas muito complexos.',
        'A) “para”, no segundo parágrafo, expressa ideia de finalidade, evidenciando o objetivo de um empreendedor tradicional, e tem sentido equivalente a “a fim de”.',
        'Português',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        155,
        'Com base nas informações apresentadas no texto, é correto afirmar que',
        'A) os conceitos de empreendedorismo estão conectados essencialmente à aquisição de lucro monetário.',
        'B) a fragilidade do serviço social é resultado do financiamento contínuo e da complexidade do problema abordado.',
        'C) o empreendedorismo social pode ser voltado tanto à melhoria de uma comunidade quanto à obtenção de retorno financeiro.',
        'D) os empreendedores sociais privilegiam investimentos em ações nas bolsas de valores, que possibilitam compartilhar eventuais prejuízos.',
        'E) o conceito de serviço social é similar ao do empreendedorismo social, pois ambos são ações individuais voltadas à formação de agremiações políticas.',
        'C) o empreendedorismo social pode ser voltado tanto à melhoria de uma comunidade quanto à obtenção de retorno financeiro.',
        'Matemática',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        156,
        'Segundo as definições apresentadas no texto, são exemplos de empreendedorismo social as ações presentes em',
        'A) I apenas.',
        'B) II apenas.',
        'C) III apenas.',
        'D) I e II apenas.',
        'E) II e III apenas.',
        'D) I e II apenas.',
        'Matemática',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        157,
        'De acordo com o texto, os plásticos são',
        'A) produzidos diretamente do petróleo, formando pequenas moléculas que serão moldadas.',
        'B) compostos obtidos por reações que usam matéria-prima proveniente do petróleo.',
        'C) macromoléculas com propriedades variadas e não podem ser moldados.',
        'D) estruturas que estão sendo substituídas por outros materiais como o vidro.',
        'E) grandes moléculas que darão origem ao petróleo.',
        'B) compostos obtidos por reações que usam matéria-prima proveniente do petróleo.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        158,
        'Os plásticos podem ser moldados, pois “amolecem” com o calor, chegando a sofrer fusão em determinadas temperaturas. O quadro apresenta o ponto de fusão de alguns tipos de plásticos. Um técnico de laboratório aquece separada e simultaneamente amostras, com massas iguais, de cada um dos cinco plásticos do quadro, que estão à mesma temperatura inicial. O primeiro plástico que sofrerá fusão será o',
        'A) PS.',
        'B) PP.',
        'C) PE.',
        'D) PET.',
        'E) PVC.',
        'E) PVC.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        159,
        'Em uma usina de reciclagem, os plásticos são separados por diferença de densidade para, posteriormente, serem fundidos e remoldados em novos objetos. O quadro apresenta a densidade de alguns plásticos. Em um tanque com água, colocamos objetos maciços confeccionados com os plásticos mencionados. Os objetos que ficam flutuando na superfície da água são confeccionados com',
        'A) PET e PVC.',
        'B) PP e PE.',
        'C) PS e PVC.',
        'D) PET, PS e PVC.',
        'E) PE, PS e PET.',
        'B) PP e PE.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        160,
        'De acordo com o texto, é correto afirmar que',
        'A) as embalagens de latas de flandres, de vidros e de multilaminados vêm substituindo as embalagens PET.',
        'B) os plásticos são amplamente utilizados desde sua descoberta no Brasil, em 1941.',
        'C) o petróleo tem origem nos plásticos que passaram pelo processo de reciclagem.',
        'D) os plásticos não se deformam, mesmo quando expostos às altas temperaturas.',
        'E) o petróleo é a fonte de diversos tipos de matérias-primas e de combustíveis.',
        'E) o petróleo é a fonte de diversos tipos de matérias-primas e de combustíveis.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        161,
        'As latas de flandres, mencionadas no texto, são feitas de uma',
        'A) mistura revestida de estanho.',
        'B) substância pura revestida de aço.',
        'C) mistura revestida de ferro e carbono.',
        'D) substância composta revestida de ferro.',
        'E) substância simples revestida de estanho.',
        'A) mistura revestida de estanho.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        162,
        'Essa crise econômica',
        'A) ficou restrita aos Estados Unidos, pois, no início do século XX, as economias nacionais eram fechadas e, portanto, as crises eram localizadas.',
        'B) causou impactos duradouros na economia mundial, abalou os mercados financeiros ao redor do mundo e provocou a falência de inúmeras empresas e o desemprego.',
        'C) provocou o aumento da atividade industrial e do emprego nos países africanos, que não foram abalados pela crise provocada pelo mercado de ações nos Estados Unidos.',
        'D) demonstrou a força da economia brasileira, que investiu na modernização das lavouras, aumentando a produção e, consequentemente, a exportação do café.',
        'E) confirmou a independência dos mercados financeiros, uma vez que foi contornada sem a necessidade de intervenção dos governos na economia.',
        'B) causou impactos duradouros na economia mundial, abalou os mercados financeiros ao redor do mundo e provocou a falência de inúmeras empresas e o desemprego.',
        'História',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        163,
        'Com base nas informações do texto, pode-se concluir corretamente que',
        'A) os profissionais da área médica, que atuam no desenvolvimento de vacinas, desenvolvem imunidade a determinadas doenças e, por isso, não se contaminam, nem transmitem os agentes causadores da doença para seus pacientes.',
        'B) as vacinas, que são aprovadas pelas agências reguladoras, podem ser produzidas e aplicadas na população a fim de atuarem na prevenção das doenças através de anticorpos específicos produzidos pelo organismo humano.',
        'C) a pandemia pode ser definida como a concentração de casos de uma mesma doença em um determinado local sem provocar o alastramento em outras regiões.',
        'D) as vacinas possuem os anticorpos obtidos a partir dos agentes causadores da doença e são eficazes no tratamento dos pacientes contaminados.',
        'E) a vacina específica para Covid–19 demorou muito tempo para ser produzida, pois a bactéria causadora da doença era totalmente desconhecida.',
        'B) as vacinas, que são aprovadas pelas agências reguladoras, podem ser produzidas e aplicadas na população a fim de atuarem na prevenção das doenças através de anticorpos específicos produzidos pelo organismo humano.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        164,
        'A análise dos textos nos permite concluir corretamente que',
        'A) na Idade Média crianças e adolescentes, ao chegarem à vida adulta, desempenhariam as atividades reservadas ao seu grupo social; no Brasil do século XXI, os estudantes têm liberdade para fazer escolhas de acordo com seus desejos e objetivos.',
        'B) a lei garante que, no Brasil do século XXI, ao alcançar a vida adulta, crianças e adolescentes serão sustentados pelos programas sociais do Estado, independente de seu esforço, organização e planejamento pessoal.',
        'C) na Idade Média crianças e adolescentes podiam escolher entre ser militares, camponeses ou artesãos; no Brasil do século XXI, os estudantes têm opções de carreira limitadas pela BNCC.',
        'D) crianças e adolescentes, no Brasil do século XXI, assim como na Idade Média, não são reconhecidos e, por isso, devem se comportar de acordo com os desejos e objetivos dos adultos.',
        'E) na Idade Média os pais se preocupavam com o futuro de seus filhos, uma vez que era preciso ser artesão ou camponês para pertencer à aristocracia feudal.',
        'A) na Idade Média crianças e adolescentes, ao chegarem à vida adulta, desempenhariam as atividades reservadas ao seu grupo social; no Brasil do século XXI, os estudantes têm liberdade para fazer escolhas de acordo com seus desejos e objetivos.',
        'História',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        165,
        'Com relação aos tipos de alimentos, às orientações e aos problemas nutricionais, assinale o que for correto.',
        'A) Na promoção da alimentação saudável para diminuição de casos de obesidade e hipertensão, deve-se incentivar o consumo de alimentos industrializados e gordurosos na dieta da população.',
        'B) A celulose presente nas fibras de alimentos como grãos, verduras, legumes e frutas não é digerida pelo organismo humano, não fornece calorias, mas estimula o trânsito intestinal.',
        'C) Uma alimentação adequada apresenta grande consumo de frutas e outros vegetais, bem como a alta ingestão de gorduras saturadas, sal e carboidratos.',
        'D) O rótulo do alimento que contém a classificação Zero Lactose informa que esse alimento não tem valor calórico e é indicado para pacientes diabéticos.',
        'E) Os alimentos como arroz, macarrão e batatas devem ser retirados da dieta, pois não fornecem nenhuma vantagem ao organismo.',
        'B) A celulose presente nas fibras de alimentos como grãos, verduras, legumes e frutas não é digerida pelo organismo humano, não fornece calorias, mas estimula o trânsito intestinal.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        166,
        'Assinale a alternativa que completa, correta e respectivamente, a frase',
        'A) diminui, exotérmica, libera',
        'B) diminui, endotérmica, absorve',
        'C) aumenta, endotérmica, libera',
        'D) aumenta, endotérmica, absorve',
        'E) aumenta, exotérmica, libera',
        'E) aumenta, exotérmica, libera',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        167,
        'Sobre esta doença, pode-se afirmar corretamente que é',
        'A) contagiosa, ou seja, pode ser transmitida de pessoa para pessoa e também pelo consumo de água contaminada.',
        'B) limitada a regiões tropicais devido à falta de saneamento básico e à presença do protozoário causador desse tipo de enfermidade.',
        'C) prevenida com o tratamento da água e do esgoto; a higienização dos alimentos e das mãos; e a evitação de locais com água parada.',
        'D) evitada pela substituição de casas de pau a pique por casas de alvenaria, pois os insetos transmissores se reproduzem nas paredes das casas de barro.',
        'E) causada por um tipo de vírus transmitido pela picada de mosquitos contaminados e, entre seus principais sintomas, destacam-se a febre, as dores no corpo e as manchas vermelhas.',
        'E) causada por um tipo de vírus transmitido pela picada de mosquitos contaminados e, entre seus principais sintomas, destacam-se a febre, as dores no corpo e as manchas vermelhas.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        168,
        'Os processos físicos descritos são denominados, respectivamente, de',
        'A) floculação e decantação.',
        'B) decantação e filtração.',
        'C) filtração e cloração.',
        'D) floculação e filtração.',
        'E) decantação e cloração.',
        'B) decantação e filtração.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        169,
        'Considerando esse hemograma, pode-se concluir que Pedro tem',
        '(A) um processo infeccioso.',
        '(B) problemas na coagulação do sangue.',
        '(C) dificuldade no transporte de oxigênio no sangue.',
        '(D) hipersensibilidade do sistema imunológico a determinadas substâncias.',
        '(E) uma doença causada pela produção insuficiente ou má absorção de insulina.',
        '(C) dificuldade no transporte de oxigênio no sangue.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        170,
        'Assinale a alternativa que apresenta as expressões algébricas da área e do perímetro do painel decorativo de espelhos.',
        '(A) Área: 3xy Perímetro: 3x + y',
        '(B) Área: 3 + xy Perímetro: 3x y',
        '(C) Área: 6x + 2y Perímetro: 6x + 2y',
        '(D) Área: 3x y Perímetro: 6x + y 2',
        '(E) Área: 3x y Perímetro: 3x + y',
        '(D) Área: 3x y Perímetro: 6x + y 2',
        'Matemática',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        171,
        'No painel decorativo, a primeira fileira de baixo para cima é toda formada por espelhos retangulares de mesmo comprimento. Se o painel tiver um total de 3 metros de comprimento, então a medida do comprimento de cada espelho, em centímetros, é',
        '(A) 300.',
        '(B) 100.',
        '(C) 75.',
        '(D) 50.',
        '(E) 25.',
        '(C) 75.',
        'Matemática',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        172,
        'Assinale a alternativa que apresenta corretamente uma dessas práticas ambientais.',
        '(A) Jogar o lixo em valas e nas encostas para ser levado pela água da chuva até os pontos mais baixos, onde estão os canais de drenagem, os rios e os bueiros.',
        '(B) Impermeabilizar as vias públicas, os quintais e as calçadas, a fim de impedir que grande parte do volume de água precipitado pelas chuvas penetre no solo.',
        '(C) Permitir os processos de assoreamento, a erosão e a sedimentação nos rios, a fim de dificultar o transbordamento dos cursos de água.',
        '(D) Diminuir a eficiência dos sistemas de drenagem, que visam conter ou escoar o curso das enxurradas por meio de bocas-de-lobo, piscinões ou dutos.',
        '(E) Construir e preservar áreas verdes uma vez que a vegetação facilita o processo de infiltração da água da chuva no solo.',
        '(E) Construir e preservar áreas verdes uma vez que a vegetação facilita o processo de infiltração da água da chuva no solo.',
        'Geografia',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        173,
        'De acordo com o texto, é correto afirmar que “pejotização”',
        '(A) obriga os patrões a constituírem uma empresa para registrar seus funcionários em carteira de trabalho.',
        '(B) é uma norma constitucional que obriga os advogados a pagarem os custos dos processos trabalhistas.',
        '(C) é uma prática adotada por empresas que pretendem reduzir os custos sobre sua folha de pagamento e deriva da expressão “pessoa jurídica”.',
        '(D) transfere o pagamento de encargos previdenciários e trabalhistas para os governos municipais, de acordo com a Consolidação das Leis do Trabalho.',
        '(E) exige que os trabalhadores de entrega por aplicativos criem empresas cooperativadas para facilitar o registro em carteira dessa categoria pelas empresas contratantes.',
        '(C) é uma prática adotada por empresas que pretendem reduzir os custos sobre sua folha de pagamento e deriva da expressão “pessoa jurídica”.',
        'Português',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        174,
        'Dentre as alternativas, assinale aquela que melhor representa esse princípio.',
        '(A)',
        '(B)',
        '(C)',
        '(D)',
        '(E)',
        '(E)',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        175,
        'A partir da leitura do mapa, pode-se afirmar corretamente que',
        '(A) os bandeirantes, em suas expedições, respeitaram os limites territoriais definidos pelo Tratado de Tordesilhas, em 1494.',
        '(B) as bandeiras se originaram nos territórios espanhóis do atual Uruguai e, de lá, percorreram a América do Sul em todas as direções.',
        '(C) a ação das bandeiras contribuiu para a ampliação dos limites territoriais do Brasil para além daqueles definidos, em 1494, pelo Tratado de Tordesilhas.',
        '(D) o processo de colonização do Brasil se iniciou na região de Olinda e Recife, de onde partiram as principais rotas dos bandeirantes.',
        '(E) as fronteiras atuais do Brasil foram definidas no final do século XVIII, quando as expedições bandeirantes terminaram.',
        '(C) a ação das bandeiras contribuiu para a ampliação dos limites territoriais do Brasil para além daqueles definidos, em 1494, pelo Tratado de Tordesilhas.',
        'História',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        176,
        'Aplicando o conceito de densidade, a massa de alumínio, em gramas, que será reciclada de uma escultura que ocupa o volume de 50 cm^3, é',
        '(A) 2,7.',
        '(B) 13,5.',
        '(C) 27,0.',
        '(D) 135,0.',
        '(E) 270,0.',
        '(D) 135,0.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        177,
        'Com base na interpretação dos quadrinhos, pode-se concluir corretamente que',
        '(A) a emoção se liberta facilmente dos erros do passado e do medo de errar.',
        '(B) a razão supera o medo de errar depois de a emoção se libertar dos erros do passado.',
        '(C) a razão é a única responsável por guiar as ações de se libertar do passado e por errar no percurso da vida.',
        '(D) a emoção norteia as decisões futuras e a razão apenas analisa os erros do passado.',
        '(E) a razão e a emoção devem avançar juntas, libertando-se dos erros do passado e do medo de errar.',
        '(E) a razão e a emoção devem avançar juntas, libertando-se dos erros do passado e do medo de errar.',
        'Português',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        178,
        'De acordo com os textos, o trabalho infantil',
        '(A) foi liberado pela ONU para as crianças com menos de 14 anos durante a pandemia de COVID–19.',
        '(B) é coordenado pela UNICEF, que regulariza essa prática em todos os países do mundo.',
        '(C) é incentivado pelo Estado para que as crianças ajudem nas despesas de casa.',
        '(D) foi eliminado do Brasil, mas está em crescimento nos outros países do mundo.',
        '(E) é ilegal e dificulta a vida escolar e o desenvolvimento saudável da criança.',
        '(E) é ilegal e dificulta a vida escolar e o desenvolvimento saudável da criança.',
        'História',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        179,
        'Assinale a frase que é um contraponto ao posicionamento da personagem sobre o medo.',
        '(A) “Aprendi que a coragem não é a ausência do medo, mas o triunfo sobre ele”. (Nelson Mandela)',
        '(B) “Um dos efeitos do medo é perturbar os sentidos e fazer que as coisas não pareçam o que são”. (Miguel de Cervantes).',
        '(C) “O medo é, dos sentimentos humanos, o mais dissolvente, porque nos leva a fazer muita coisa que não queremos fazer, e deixar de fazer muita coisa que queríamos e necessitávamos fazer”. (Josué de Castro)',
        '(D) “O medo é a extrema ignorância em momento muito agudo”. (João Guimarães Rosa)',
        '(E) “Os homens se dividem em duas espécies: os que têm medo de viajar de avião e os que fingem que não têm”. (Fernando Sabino)',
        '(A) “Aprendi que a coragem não é a ausência do medo, mas o triunfo sobre ele”. (Nelson Mandela)',
        'Português',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        180,
        'Sobre a ação do sabão, é correto afirmar que',
        '(A) sua capacidade de interagir com as moléculas de água permite transformar a gordura em outras substâncias mais solúveis na água.',
        '(B) sua interação com as moléculas de gordura se deve à extremidade da sua estrutura denominada cabeça.',
        '(C) interage com as moléculas de água por meio da extremidade conhecida como cauda.',
        '(D) remove as moléculas de água presentes na nossa pele, mantendo sobre ela as de gordura.',
        '(E) está relacionada à capacidade de interação da sua estrutura tanto com água quanto com gordura.',
        '(E) está relacionada à capacidade de interação da sua estrutura tanto com água quanto com gordura.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        181,
        'Analisando o infográfico, podemos concluir corretamente que',
        '(A) o vírus está envolto por uma camada de gordura que ajuda a infectar as células humanas.',
        '(B) o material genético do vírus está localizado nas proteínas que ajudam a infectar as nossas células.',
        '(C) o sabão rompe a camada de gordura protetora do vírus, liberando seu material genético, que será levado pela água.',
        '(D) a parte da estrutura do sabão que interage com a água é denominada hidrofóbica.',
        '(E) a extremidade do sabão que quebra a membrana lipídica do vírus é denominada hidrofílica.',
        '(C) o sabão rompe a camada de gordura protetora do vírus, liberando seu material genético, que será levado pela água.',
        'Ciências',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        182,
        'Releia atentamente a passagem apresentada, observando o contexto de ocorrência dos termos em destaque. Assinale a alternativa que apresenta, respectivamente, sinônimos adequados às palavras destacadas.',
        '(A) rigorosamente, em cima das, certamente, especificidade e condicionamento',
        '(B) afetuosamente, por respeito às, ocasionalmente, temperamento e simpatia',
        '(C) avidamente, a respeito das, porventura, honestidade e qualidade',
        '(D) rispidamente, durante, às vezes, incapacidade e aparência',
        '(E) seriamente, acerca das, possivelmente, índole e habilidade',
        '(E) seriamente, acerca das, possivelmente, índole e habilidade',
        'Português',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        183,
        'O trecho apresentado mostra o personagem Harry Potter, protagonista de uma série de livros infantojuvenis, no momento de escolha de sua carreira. Com base nas informações do trecho, depreende-se corretamente que a escolha de uma profissão',
        '(A) não deve ser abordada pela escola a fim de não influenciar a decisão a ser feita pelos estudantes.',
        '(B) independe do desempenho e do desenvolvimento acadêmico do estudante durante sua vida escolar.',
        '(C) exige a intervenção de profissionais da educação para, por meio de coerção, impor opções adequadas socialmente aos jovens.',
        '(D) dispensa o acompanhamento das tendências de mercado de trabalho para, assim, elaborarem-se as disciplinas ofertadas aos estudantes.',
        '(E) pressupõe o auxílio da escola aos estudantes no processo de construção do autoconhecimento e de planejamento para alcançar seus objetivos.',
        '(E) pressupõe o auxílio da escola aos estudantes no processo de construção do autoconhecimento e de planejamento para alcançar seus objetivos.',
        'Português',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        184,
        'Considerando que exista um total de 12 N.I.E.M.s, a alternativa cujo esquema representa o percentual mais próximo do número mínimo de N.I.E.M.s que um estudante de Hogwarts deve ter cursado para estar apto a seguir a carreira de auror é',
        '(A)',
        '(B)',
        '(C)',
        '(D)',
        '(E)',
        '(A)',
        'Matemática',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        185,
        'Entre elas, é correto mencionar',
        '(A) a Greve Geral de 1917, encabeçada pelos escravos de ganho de São Paulo e Rio de Janeiro.',
        '(B) a greve de fome realizada por Nelson Mandela na prisão, em Joanesburgo, na África do Sul, em 1948.',
        '(C) a onda de rebeliões de escravizados que se iniciou nas fazendas de café na Amazônia e no Rio Grande do Sul.',
        '(D) a revolução do Haiti, que derrubou o governo colonial português e estabeleceu a primeira monarquia das Américas.',
        '(E) a formação de quilombos, comunidades estabelecidas por escravos fugidos em diferentes partes do Brasil.',
        '(E) a formação de quilombos, comunidades estabelecidas por escravos fugidos em diferentes partes do Brasil.',
        'História',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        186,
        'Os eventos descritos no texto',
        '(A) precipitaram a abolição da escravidão e a qualificação profissional dos libertos, que passaram a exercer profissões especializadas.',
        '(B) desorganizaram o núcleo urbano do Rio de Janeiro, impedindo a realização de obras públicas e, consequentemente, causando desemprego e precarização do trabalho.',
        '(C) provocaram a diminuição da população da colônia, que caiu pela metade no início do século XIX, em razão da instabilidade provocada pela chegada de grande número de imigrantes.',
        '(D) incentivaram a industrialização acelerada do Sudeste, especialmente de São Paulo, e a formação de uma classe operária influenciada por ideias trazidas por italianos e alemães.',
        '(E) promoveram uma modernização urbana que atraiu profissionais qualificados da Europa, mas não alteraram as estruturas escravistas da sociedade brasileira do século XIX.',
        '(E) promoveram uma modernização urbana que atraiu profissionais qualificados da Europa, mas não alteraram as estruturas escravistas da sociedade brasileira do século XIX.',
        'História',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        187,
        'De acordo com a reportagem, é correto afirmar que',
        '(A) as pessoas resgatadas do trabalho análogo ao escravo serão deportadas para seu país de origem.',
        '(B) o trabalho escravo foi legalmente extinto no Brasil no século XX, mas ainda resiste em alguns bairros periféricos da capital paulista.',
        '(C) a entrada de imigrantes é proibida no bairro do Bom Retiro, o que caracteriza a situação de trabalho análogo ao escravo desses imigrantes.',
        '(D) os trabalhadores resgatados apresentavam carteira assinada e cumpriam uma jornada de trabalho legal, de acordo com a legislação trabalhista brasileira.',
        '(E) um dos elementos que caracterizam o trabalho análogo ao escravo são as condições degradantes de trabalho, constatadas pela Operação Andrápodon.',
        '(E) um dos elementos que caracterizam o trabalho análogo ao escravo são as condições degradantes de trabalho, constatadas pela Operação Andrápodon.',
        'Português',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        188,
        'De acordo com o texto, é correto afirmar que os trabalhadores rurais',
        '(A) conseguiram o acesso aos direitos trabalhistas no ano de 1964.',
        '(B) são em maior número que os trabalhadores urbanos no Brasil de hoje.',
        '(C) tiveram os direitos trabalhistas equiparados aos dos trabalhadores urbanos em 1988.',
        '(D) foram reconhecidos como trabalhadores, a partir da Constituição de 1988.',
        '(E) têm a obrigação de participar do FGTS e da Previdência Privada.',
        '(C) tiveram os direitos trabalhistas equiparados aos dos trabalhadores urbanos em 1988.',
        'Português',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        189,
        'De acordo com a fábula,',
        '(A) o imperador esperava que os garotos percebessem a troca das sementes e as substituíssem para demonstrarem que eram astutos.',
        '(B) qualquer outro garoto merecia ser o imperador, pois suas plantas floresceram enquanto o vaso de Ping estava vazio.',
        '(C) o conselho do pai encorajou Ping a ser honesto e a apresentar seu resultado, mesmo que negativo.',
        '(D) devemos nos omitir, quando nossa ação não represente uma vitória, para sermos bem-sucedidos.',
        '(E) as sementes dos demais garotos brotaram mesmo queimadas e seus vasos tinham lindas flores.',
        '(C) o conselho do pai encorajou Ping a ser honesto e a apresentar seu resultado, mesmo que negativo.',
        'Português',
        2022,
        2
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (
        190,
        'Com base no texto, uma atitude semelhante à do personagem Ping é',
        '(A) ser desleal ao alcançar lucros financeiros.',
        '(B) ser empático às pessoas em situação de risco.',
        '(C) dizer a verdade independentemente das consequências.',
        '(D) esconder os fatos verdadeiros ao visar aos próprios interesses.',
        '(E) agir com rapidez e inteligência para ficar com o troco recebido a mais após uma compra.',
        '(C) dizer a verdade independentemente das consequências.',
        'Português',
        2022,
        2
    );

-- INSERT TABLE tbIMAGENS PROVA 2022 2 SEMESTRE
    INSERT INTO tbImagens (cod_question, image_data)
        VALUES
            (141, 'imgs/txtQ1.PNG'),
            (142, 'imgs/txtQ2.PNG'),
            (143, 'imgs/txtQ3.PNG'),
            (144, 'imgs/txtQ4.PNG'),
            (145, 'imgs/txtQ5.PNG'),
            (146, 'imgs/txtQ6-9.PNG'),
            (150, 'imgs/txtQ10-11.PNG'),
            (151, 'imgs/txtQ11.PNG'),
            (152, 'imgs/txtQ12.PNG'),
            (153, 'imgs/txtQ13.PNG'),
            (154, 'imgs/txtQ14-16.PNG'),
            (154, 'imgs/txtQ14.PNG'),
            (156, 'imgs/txtQ16.PNG'),
            (157, 'imgs/txtQ17-21.PNG'),
            (158, 'imgs/txtQ18.PNG'),
            (159, 'imgs/txtQ19.PNG'),
            (162, 'imgs/txtQ22.PNG'),
            (163, 'imgs/txtQ23.PNG'),
            (164, 'imgs/txtQ24.PNG'),
            (165, 'imgs/txtQ25.PNG'),
            (166, 'imgs/txtQ26.PNG'),
            (167, 'imgs/txtQ27.PNG'),
            (168, 'imgs/txtQ28.PNG'),
            (169, 'imgs/txtQ29.PNG'),
            (170, 'imgs/txtQ30-31.PNG'),
            (172, 'imgs/txtQ32.PNG'),
            (173, 'imgs/txtQ33.PNG'),
            (174, 'imgs/txtQ34.PNG'),
            (174, 'imgs/txtQ34-1.PNG'),
            (174, 'imgs/txtQ34A.PNG'),
            (174, 'imgs/txtQ34B.PNG'),
            (174, 'imgs/txtQ34C.PNG'),
            (174, 'imgs/txtQ34D.PNG'),
            (174, 'imgs/txtQ34E.PNG'),
            (175, 'imgs/txtQ35.PNG'),
            (175, 'imgs/txtQ35-1.PNG'),
            (176, 'imgs/txtQ36.PNG'),
            (177, 'imgs/txtQ37.PNG'),
            (178, 'imgs/txtQ38.PNG'),
            (179, 'imgs/txtQ39.PNG'),
            (180, 'imgs/txtQ40-41.jpg'),
            (182, 'imgs/txtQ42-44.PNG'),
            (184, 'imgs/txtQ44.PNG'),
            (185, 'imgs/txtQ45.PNG'),
            (186, 'imgs/txtQ46.PNG'),
            (187, 'imgs/txtQ47.PNG'),
            (188, 'imgs/txtQ48.PNG'),
            (189, 'imgs/txtQ49-50.PNG');

-- INSERT TABLE tbQUESTIONS PROVA 2020 1 SEMESTRE
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 1
        191,
        'Analise as alternativas e assinale a correta.',
        '(A) O número 6 056 529 316 217 não é primo, e por isso está distante do restante.',
        '(B) Como os números 37 e 73 são primos, então 16 e 61 também são.',
        '(C) O número 237 é um número primo, assim como o 37 e o 137.',
        '(D) Todo número primo é ímpar e só pode terminar em 1, 3, 7 ou 9.',
        '(E) Há apenas quatro números primos que são menores do que 10.',
        'E',
        'Matemática',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 2
        192,
        'Assim, na pele, entre os fatores que contribuem para a manutenção da temperatura corporal em dias frios, em ambientes abertos, destacam-se',
        '(A) a dilatação dos vasos sanguíneos periféricos e maior eliminação de oleosidade pelas glândulas sebáceas.',
        '(B) a dilatação dos vasos sanguíneos periféricos e maior eliminação de suor pelas glândulas sudoríparas.',
        '(C) a dilatação dos vasos sanguíneos periféricos e eliminação contínua de suor pelas glândulas sebáceas.',
        '(D) a contração dos vasos sanguíneos periféricos e menor eliminação de suor pelas glândulas sudoríparas.',
        '(E) a contração dos vasos sanguíneos periféricos e maior eliminação de suor pelas glândulas sebáceas.',
        'D',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 3
        193,
        'De acordo com o texto, é correto afirmar que',
        '(A) a subalimentação inexiste em países considerados subdesenvolvidos.',
        '(B) a subalimentação atinge principalmente os moradores das áreas urbanas.',
        '(C) o aumento da produção industrial acabará com o problema da subalimentação.',
        '(D) é possível acabar com o problema da subalimentação no mundo em que vivemos.',
        '(E) é a proteção militar dada pelos países pobres aos países ricos que causa a subalimentação.',
        'D',
        'Geografia',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 4
        194,
        'Analise-as e assinale a alternativa que apresenta apenas a afirmação correta sobre um dos sistemas representados.',
        '(A) No sistema 1, temos duas substâncias simples.',
        '(B) O sistema 1 é uma substância pura.',
        '(C) No sistema 1, temos cinco componentes.',
        '(D) O sistema 2 é uma mistura.',
        '(E) No sistema 2, temos dois componentes.',
        'A',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 5
        195,
        'Os depoimentos orais são considerados fontes',
        '(A) históricas, pois contêm informações e conhecimentos transmitidos de geração a geração ou a versão pessoal de indivíduos que testemunharam acontecimentos históricos.',
        '(B) etnográficas, pois são utilizadas para confirmar as diferenças culturais existentes no interior de uma mesma sociedade, fortalecendo os preconceitos e preservando os privilégios.',
        '(C) científicas, pois sua obtenção se dá por meio de entrevistas realizadas por repórteres profissionais, vinculados aos grandes portais de notícias.',
        '(D) epistemológicas, pois são documentos certificados por instituições extraoficiais, vinculadas a organismos diplomáticos internacionais.',
        '(E) mitológicas, pois as versões pessoais são ratificadas pelos cientistas, comprometendo a credibilidade dos testemunhos.',
        'A',
        'História',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 6
        196,
        ' Assinale a alternativa que completa correta e respectivamente as lacunas da frase.',
        '(A) maior; menor que',
        '(B) maior; igual',
        '(C) maior; maior que',
        '(D) menor; igual',
        '(E) menor; maior que',
        'B',
        'Matemática',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 7
        197,
        'A expressão responsável pela construção do humor no texto é',
        '(A) “não pago!”, repetida exaustivamente pela personagem com o intuito de criar, dessa forma, um eufemismo.',
        '(B) “Contra tudo e contra todos”, passagem generalizante e imprópria ao contexto humorístico, trata-se de uma ironia.',
        '(C) “paga ICM! Corro pra lá: Olha o fiscal me cobrando...”, passagem composta por verbos que se contradizem, formando, portanto, um paradoxo.',
        '(D) “herói cobrado retumbante”, devido à sua semelhança sonora com um conhecido verso do Hino Nacional Brasileiro, configurando uma paronomásia.',
        '(E) “Heroicamente! Denodadamente! Como um mártir”, expressões usadas para atingir a autoestima da personagem; trata-se de uma preterição.',
        'D',
        'Português',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 8
        198,
        'A figura matemática que é descrita tendo, obrigatoriamente, todos os elementos do cartão de visita citado é o',
        '(A) losango.',
        '(B) pentágono.',
        '(C) quadrado.',
        '(D) retângulo.',
        '(E) triângulo.',
        'A',
        'Matemática',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 9
        199,
        'Sobre esse esquema é correto afirmar que',
        '(A) os processos 1 e 2 são realizados pelos animais e vegetais na decomposição da matéria orgânica.',
        '(B) os processos 1 e 2 são realizados pelos animais e vegetais na produção de compostos orgânicos.',
        '(C) os processos 1 e 2 são realizados pelos animais na absorção e na eliminação do gás carbônico.',
        '(D) o processo 1 é realizado pelos animais na combustão da matéria orgânica.',
        '(E) o processo 1 é realizado pelos vegetais na produção da matéria orgânica.',
        'E',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 10
        200,
        'O crescimento do tipo de restaurante retratado no texto se deve ao',
        '(A) aumento significativo do desemprego, forçando milhões de trabalhadores e trabalhadoras a se alimentarem com refeições mais baratas e mais nutritivas servidas nesses restaurantes.',
        '(B) surgimento de um movimento denominado slow food, que defende a utilização de produtos alimentares artesanais de qualidade produzidos de forma que respeite o meio ambiente.',
        '(C) movimento mundial de valorização das alimentações locais como forma de prestigiar a comida feita nos vilarejos mais distantes e disponibilizadas por intermédio de restaurantes mundializados.',
        '(D) fenômeno da globalização, que atua como fator determinante na modificação dos hábitos alimentares, gerando transformações no estilo de vida de milhões de pessoas espalhadas pelo planeta.',
        '(E) resgate de uma modalidade de alimentação que surgiu no início do modo de produção capitalista no século XVI na Europa, baseada nas tabernas instaladas nas feiras comerciais como as de Flandres e de Champagne.',
        'D',
        'História',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 11
        201,
        'De acordo com o texto, é correto afirmar que',
        '(A) os carros elétricos, fabricados atualmente, usam baterias do tipo níquel cádmio.',
        '(B) as baterias de íons de lítio são maiores e mais pesadas que as baterias de hidreto de níquel.',
        '(C) as baterias de lítio apresentam efeito memória e, por isso devemos recarregá-las por completo.',
        '(D) aparelhos eletrônicos, fabricados atualmente, usam baterias menores e mais leves as quais não requerem tanta preocupação com sua carga e descarga.',
        '(E) as baterias atuais podem ficar expostas a altas temperaturas sem perderem sua capacidade de recarga e nem sofrerem decomposição.',
        'D',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 12
        202,
        'Sabendo que o lítio também é um metal alcalino, podemos afirmar que os átomos de lítio se ligam a átomos de cloro formando o composto cloreto de lítio, representado, corretamente, por',
        '(A) Li2Cl',
        '(B) Li2Cl2',
        '(C) ClLi2',
        '(D) Cl2Li2',
        '(E) LiCl',
        'E',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 13
        203,
        'Assinale a alternativa que apresenta, corretamente, as principais características do sistema de plantation.',
        '(A) Agricultura diversificada, voltada para a subsistência, pequenas propriedades rurais, mão de obra familiar.',
        '(B) Extrativismo, voltado para o mercado interno, médias propriedades, mão de obra imigrante.',
        '(C) Monocultura, voltada para o mercado externo, latifúndio e mão de obra escrava.',
        '(D) Produção agrícola diversificada, voltada para o mercado externo, latifúndio e mão de obra livre.',
        '(E) Produção mecanizada, voltada para o mercado interno, pequenas propriedades, mão de obra escrava.',
        'C',
        'Geografia',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 14
        204,
        'Assinale a alternativa que completa correta e respectivamente as lacunas da frase.',
        '(A) condução, convecção, irradiação',
        '(B) condução, irradiação, convecção',
        '(C) convecção, condução, irradiação',
        '(D) irradiação, condução, convecção',
        '(E) irradiação, convecção, condução',
        'D',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 15
        205,
        'Nessas condições, a menor temperatura que apareceria no texto em língua inglesa é',
        '(A) –482 ºF.',
        '(B) –212 ºF.',
        '(C) –148 ºF.',
        '(D) 148 ºF.',
        '(E) 148 ºF.',
        'C',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 16
        206,
        'Sobre esse esquema, podemos afirmar, corretamente, que os números I, II, III e IV representam, respectivamente,',
        '(A) veias cavas, veias pulmonares, artéria pulmonar, artéria aorta',
        '(B) veias cavas, veias pulmonares, artéria aorta, artéria pulmonar',
        '(C) artéria aorta, artéria pulmonar, veias cavas, veias pulmonares',
        '(D) artéria aorta, veias pulmonares, artéria pulmonar, veias cavas',
        '(E) veias pulmonares, veias cavas, artéria aorta, artéria pulmonar',
        'B',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 17
        207,
        'Assim como na agricultura, a atividade pecuária se diferencia em extensiva e intensiva. A pecuária intensiva é um sistema',
        '(A) tradicional de produção, em que os animais são criados em grandes áreas, o qual emprega técnicas arcaicas com objetivo de manter a produtividade.',
        '(B) tradicional de produção, em que predomina a utilização dos nutrientes do pasto como fonte de alimentos para os animais e utilização mínima de água.',
        '(C) tradicional de produção, em que, nos períodos mais secos, complementa-se a alimentação dos rebanhos com cactáceas, como a palma e proteinados de baixo custo.',
        '(D) moderno de produção, em que ocorrem investimentos em técnicas avançadas aplicadas nos rebanhos, tais como melhoramento genético e inseminação artificial.',
        '(E) moderno de produção, em que os animais são criados soltos e, como forma de suplementação, é feito o fornecimento de sal comum e de sal mineral aos rebanhos.',
        'D',
        'Geografia',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 18 --
        208,
        'Sobre o texto, analise as afirmações:',
        'a) O desmatamento da floresta põe em risco, para além de suas riquezas naturais, a continuidade de conhecimentos tradicionais.',
        'b) Apesar da biodiversidade existente na floresta Amazônica, o impacto gerado pelo seu desmatamento restringe-se às comunidades e aos povos locais.',
        'c) A não preservação do bioma Amazônia pode acarretar impactos no clima mundial e até mesmo na pesquisa médico-científica.',
        'd) O desmatamento da floresta põe em risco, para além de suas riquezas naturais, a continuidade de conhecimentos tradicionais e a não preservação do bioma Amazônica pode acarretar impactos no clima mundial e até mesmo na pesquisa médico-científica.',
        'e) O desmatamento da floresta põe em risco, para além de suas riquezas naturais, a continuidade de conhecimentos tradicionais, o impacto gerado pelo seu desmatamento restringe-se às comunidades e aos povos locais e a não preservação do bioma Amazônica pode acarretar impactos no clima mundial e até mesmo na pesquisa médico-científica.',
        'D',
        'Geografia',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES (  -- Questão 19 --
        209,
        'Observe os elementos de coesão destacados no texto. Analisando seu contexto de ocorrência, assim como suas funções sintático-semânticas, afirma-se corretamente que',
        'a) “não só” é uma locução adverbial utilizada para negar a expressão “os povos indígenas e as comunidades locais”.',
        'b) “não só... mas também”; “além disso” e “bem como” são locuções conjuntivas e expressam ideia de adição.',
        'c) “No entanto”, como conjunção adversativa, pode ser substituída, sem alterar o sentido original do período, por “porque”.',
        'd) “à medida que” está empregada inadequadamente no texto, pois deveria expressar proporção; logo, o correto seria “na medida em que”.',
        'e) “mas também” exerce função de conjunção adversativa no texto, uma vez que expressa oposição em relação à oração anterior: “... a floresta Amazônica é reconhecida...”.',
        'B',
        'Português',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 20 --
        210,
        'Para alcançar seu intento, o autor recorre a determinadas construções linguísticas, tal como',
        'a) a variação entre verbos no presente do indicativo e verbos no presente do subjuntivo com a finalidade de discernir entre dados concretos e hipotéticos sobre a floresta, respectivamente.',
        'b) o uso de verbos no presente e no pretérito perfeito do indicativo para retratar a realidade atual da floresta e seu uso tradicional no preparo de medicamentos, respectivamente.',
        'c) a recorrência de verbos no imperativo e de vocativos direcionados ao leitor, a fim de alcançar sua adesão ao processo de preservação ambiental.',
        'd) o uso predominante de linguagem denotativa na construção de narrativas sobre o processo de desmatamento da floresta a fim de fornecer informações acerca desse tópico.',
        'e) o uso predominante da linguagem conotativa na construção textual para garantir objetividade e imparcialidade aos dados retratados.',
        'B',
        'Português',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 21 --
        211,
        ' Assinale a alternativa cujo antecedente do pronome relativo está corretamente destacado.',
        'a) “...o desmatamento da Amazônia gradualmente desmonta os frágeis processos ecológicos que levaram anos para serem construídos e refinados.”',
        'b) “O conhecimento sobre o uso dessas plantas geralmente fica nas mãos de um curandeiro, que por sua vez repassa a tradição para um aprendiz...”',
        'c) “Além disso, de todas as florestas tropicais do mundo, a Amazônia é a única que ainda está conservada, em termos de tamanho e diversidade.”',
        'd) “Os cientistas acreditam que menos de 0,5% das espécies da flora foram detalhadamente estudadas...”',
        'e) “Ao mesmo tempo em que o bioma Amazônia está encolhendo lentamente em tamanho...”',
        'A',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 22 --
        212,
        ' De acordo com as informações do texto, é correto afirmar que',
        'a) X < 15.',
        'b) 15 < X < 20.',
        'c) 15 > X > 20.',
        'd) 15 < X > 20.',
        'e) X > 20.',
        'B',
        'Matemática',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 23 --
        213,
        ' Nessas condições, o número de carpas húngaras que o piscicultor vendeu foi igual a',
        'a) 250.',
        'b) 290.',
        'c) 820.',
        'd) 910.',
        'e) 950.',
        'a,b,c,d,e',
        'Matemática',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 24 --
        214,
        'De acordo com o texto, é correto afirmar que',
        'a) a atual luta dos indígenas mexicanos é pelo direito de utilizar sementes transgênicas de milho em larga escala para poder aumentar ainda mais a produção desse grão.',
        'b) a relação do povo mexicano com o milho é histórica, uma vez que esse grão é cultivado desde a época dos antigos povos que habitavam a região onde hoje se localiza o México.',
        'c) o Brasil é o país que mais consome milho no mundo, uma vez que esse grão foi encontrado em abundância pelos portugueses que aqui aportaram no século XVI.',
        'd) a dispersão das sementes de milho pela América Latina só foi possível em função da ação dos ventos que espalharam as sementes desse grão para todo o continente americano.',
        'e) o povo maia tinha no milho um deus cristão, responsável pela eliminação da fome e pela manutenção da vida desse povo, que conviveu em harmonia com os colonizadores espanhóis.',
        'B',
        'Geografia',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 25 --
        215,
        'Ainda de acordo com o texto, é correto afirmar que',
        'a) o maior número de variedades de milho se encontra no Brasil, onde é usado para extrair o etanol.',
        'b) o milho branco é a variedade mais rara encontrada no México e é utilizada para fazer canjica.',
        'c) a glicose que vem do amido de milho é também usada no revestimento de comprimidos.',
        'd) a palha do milho é utilizada na fabricação de cremes dentais e de pneus.',
        'e) os maias usavam o milho na produção da penicilina.',
        'C',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 26 --
        216,
        'Conclui-se, corretamente, que se trata de uma reação',
        'A) exotérmica, pois cedeu calor para o sistema.',
        'B) exotérmica, pois absorveu calor do sistema.',
        'C) endotérmica, pois cedeu calor para o sistema.',
        'D) endotérmica, pois absorveu calor do sistema.',
        'E) isotérmica, pois não houve troca de energia.',
        'A',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 27 --
        217,
        'Sabendo que a massa da solução referida no texto é 100 g e considerando o calor específico como 1 cal/g · ºC, a quantidade de calor trocada nesse processo é',
        'A) 60 calorias.',
        'B) 600 calorias.',
        'C) 2 200 calorias.',
        'D) 2 800 calorias.',
        'E) 5 000 calorias.',
        'B',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 28 --
        218,
        'Considere que, após uma determinada refeição, com o processo digestivo totalmente realizado, verificou-se que as substâncias absorvidas pelo sistema digestório, em maior quantidade foram os aminoácidos, que certamente foram obtidos dos alimentos, que predominavam nessa refeição, tais como',
        'A) batata e mandioca.',
        'B) arroz e salada de folhas.',
        'C) macarrão.',
        'D) polenta frita.',
        'E) contrafilé na brasa.',
        'E',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 29 --
        219,
        'Pouco antes da Revolução, a sociedade francesa estava dividida entre',
        'A) apoiadores de Napoleão e de Robespierre, importantes lideranças políticas conservadoras que lutavam pela manutenção da monarquia francesa.',
        'B) burguesia e trabalhadores rurais e urbanos, já que o clero e a nobreza não tinham participação significativa na política francesa no período pré-revolucionário.',
        'C) Girondinos e Sans Culottes, grupos rivais que disputavam a hegemonia política e representavam os diferentes interesses da burguesia na relação com o rei Luís XVI.',
        'D) Primeiro e Segundo Estados (clero e nobreza), que reuniam cerca de 3% da população, e Terceiro Estado, que abrigava a burguesia, os trabalhadores urbanos e rurais e pagava, sozinho, todas as taxas e os impostos diretos cobrados pela monarquia.',
        'E) Primeiro e Segundo Estados (clero e nobreza), que reuniam a minoria da população, mas pagavam, sozinhos, todas as taxas e os impostos diretos que financiavam os programas assistenciais que mantinham parte do Terceiro Estado.',
        'D',
        'História',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 30
        220,
        'Sobre o conteúdo reflexivo-filosófico do diálogo transcrito, depreende-se corretamente que',
        '(A) questiona as ações realizadas em vida para se alcançarem beleza e poder, uma vez que apenas os verdadeiros heróis, como Aquiles, são capazes de os manter na morte.',
        '(B) expõe a importância da guerra para conseguir reconhecimento, já que, sem alguém para se lembrar dos heróis, a morte lentamente apaga suas grandes obras.',
        '(C) critica a falta de objetividade de grandes líderes guerreiros, como Aquiles e Hermes, cuja atuação na Guerra de Troia levou milhares à morte.',
        '(D) reflete sobre a validade das ações dos seres humanos para alcançar reconhecimento e beleza, condições perdidas após a morte.',
        '(E) tem por objetivo criticar a vaidade excessiva de grandes líderes e intelectuais cuja morte aumenta ainda mais suas riquezas.',
        'D',
        'Português',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 31
        221,
        'São sinônimas dos termos destacados, respectivamente, as palavras',
        '(A) permanente e deteriorável.',
        '(B) fraca e perene.',
        '(C) débil e infinita.',
        '(D) inócua e vitalícia.',
        '(E) passageira e extinguível.',
        'E',
        'Português',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 32
        222,
        'Assinale a alternativa em que o excerto esteja corretamente transposto para o discurso indireto.',
        '(A) Menipo questionou Hermes sobre o paradeiro dos belos e belas, para, logo em seguida, exigir-lhe que o levasse até eles, posto que era novato aqui.',
        '(B) Menipo perguntou a Hermes onde estavam os belos e as belas, ordenando-lhe que o levasse até eles, pois ele era novato naquele lugar.',
        '(C) Hermes questiona a si mesmo onde estariam os belos e as belas, instigando-se para se levar até eles, uma vez que fora novo por lá.',
        '(D) Hermes perguntou a Menipo onde estavam os belos e as belas, suplicando-lhe para que o levasse até eles, embora fosse novato ali.',
        '(E) Menipo ordena a Hermes que estivessem todos, os belos e as belas, onde eles pudessem ser levados até ali, mesmo sendo novatos.',
        'B',
        'Português',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 33
        223,
        'Sabendo que todas as faces da embalagem de Carlos Rogério são polígonos regulares, pode-se afirmar que um ângulo interno de uma dessas faces mede',
        '(A) 108°',
        '(B) 180°',
        '(C) 360°',
        '(D) 405°',
        '(E) 540°',
        'A',
        'Matemática',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 34
        224,
        'Considerando as características descritas dos animais coletados, é correto afirmar que os animais do Grupo 1 e do Grupo 2 são, respectivamente,',
        '(A) Insetos e Aracnídeos',
        '(B) Crustáceos e Insetos',
        '(C) Aracnídeos e Insetos',
        '(D) Insetos e Crustáceos',
        '(E) Aracnídeos e Crustáceos',
        'C',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 35
        225,
        'Entretanto, o maior objetivo das negociações era',
        '(A) garantir os direitos portugueses de colonização sobre toda a área que se estende entre Angola e Moçambique, na África Austral, já que Portugal foi o primeiro país a se instalar nos territórios africanos.',
        '(B) resolver os conflitos entre as potências europeias, que tinham interesse em adquirir a maior extensão de territórios e possessões na África, continente rico em recursos naturais e em matérias-primas.',
        '(C) concretizar os planos de Martinho Lutero que, no contexto da Reforma Protestante, preconizou a conversão dos povos africanos ao cristianismo evangélico.',
        '(D) apoiar a expansão do Partido Nazista alemão com a anexação de novos territórios e, consequentemente, de novos cidadãos para a formação do III Reich.',
        '(E) impedir a participação dos países emergentes da América do Sul no comércio de longa distância de produtos como ouro, diamantes e marfim',
        'B',
        'História',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 36
        226,
        'Admita que os astronautas, ao utilizarem o veículo lunar, mantiveram velocidade constante igual à velocidade máxima. Assim sendo, a expectativa do tempo de uso do veículo, até o total esgotamento de suas baterias, seria de aproximadamente',
        '(A) 3 h.',
        '(B) 5 h.',
        '(C) 6 h.',
        '(D) 7 h.',
        '(E) 9 h.',
        'D',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 37
        227,
        'Considerando que o valor da aceleração da gravidade no planeta Terra seja 10 m/s2, o valor da aceleração da gravidade na Lua corresponde à',
        '(A) metade do valor da aceleração da gravidade da Terra.',
        '(B) terça parte do valor da aceleração da gravidade da Terra.',
        '(C) quarta parte do valor da aceleração da gravidade da Terra.',
        '(D) quinta parte do valor da aceleração da gravidade da Terra.',
        '(E) sexta parte do valor da aceleração da gravidade da Terra.',
        'E',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 38
        228,
        'As chuvas mencionadas no texto são esperadas, pois ajudam no plantio de',
        '(A) arroz, em um sistema agrícola chamado terraceamento.',
        '(B) azeitona, utilizando a técnica de rotação de culturas.',
        '(C) feijão, em sistema de pecuária intensiva.',
        '(D) uva, em sistema de pecuária extensiva.',
        '(E) mandioca, plantada com técnicas industriais.',
        'A',
        'Geografia',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 39
        229,
        'O texto se refere às chamadas sociedades',
        '(A) feudais.',
        '(B) fluviais.',
        '(C) nômades.',
        '(D) patriarcais.',
        '(E) pré-históricas.',
        'B',
        'História',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 40
        230,
        'Um paciente desidratado, em que é administrado 500 mL de soro na veia, receberá uma massa de sal correspondente a',
        '(A) 0,45 g.',
        '(B) 4,50 g.',
        '(C) 45,00 g.',
        '(D) 9,00 g.',
        '(E) 0,90 g.',
        'B',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 41
        231,
        'Desse modo, o sal derivado do ácido sulfídrico, na reação de neutralização total com hidróxido de cálcio, será',
        '(A) CaS: sulfeto de cálcio.',
        '(B) CaS: sulfato de cálcio.',
        '(C) CaS: sulfito de cálcio.',
        '(D) NaS: sulfato de sódio.',
        '(E) NaS: sulfeto de sódio.',
        'A',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 42
        232,
        'Considerando cada afirmações e tendo como referência a posição do planeta na imagem apresentada, o ímã que poderia substituir o interior da Terra é ',
        '(A)',
        '(B)',
        '(C)',
        '(D)',
        '(E)',
        'B',
        'Geografia',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 43
        233,
        'Admita que a menina dos quadrinhos esteja visitando a avó que mora em outra cidade. A fim de voltar da casa de sua avó para o prédio onde mora, usando a bota de 7 léguas da história, a menina dá 3 passos para leste e 4 passos para o norte. A figura representa de modo esquemático esse trajeto realizado pela garota. A distância entre a casa da avó e o prédio no qual a menina mora é, em quilômetros, igual a',
        '(A) 323,4.',
        '(B) 231,0.',
        '(C) 142,6.',
        '(D) 46,2.',
        '(E) 35,0',
        'B',
        'Matemática',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 44
        234,
        ' Pode-se, portanto, estimar que a légua brasileira é maior que a portuguesa em cerca de',
        '(A) 76%.',
        '(B) 68%.',
        '(C) 32%.',
        '(D) 24%.',
        '(E) 13%.',
        'C',
        'Matemática',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 45
        235,
        'Sobre a Ciência e as Grandes Navegações, é correto afirmar que',
        '(A) estavam ligadas ao desenvolvimento econômico das comunidades pesqueiras do litoral do mar Egeu.',
        '(B) o desenvolvimento científico era considerado um empecilho para os navegadores, pois estes acreditavam que a Terra era plana.',
        '(C) as viagens foram favorecidas por invenções, tais como as caravelas, navios rápidos, versáteis e de fácil manobra, que podiam navegar inclusive com ventos contrários.',
        '(D) os grandes cientistas do período se afastaram dessa empreitada, pois, sob comando da Igreja Católica, dedicaram-se às grandes questões teológicas de sua época.',
        '(E) a experiência dos povos americanos foi decisiva para o desenvolvimento científico de instrumentos de localização e de embarcações apropriadas para as viagens transoceânicas.',
        'C',
        'História',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 46
        236,
        'Assim, em relação a doenças como sarampo, caxumba, rubéola e poliomielite, pode-se afirmar corretamente que',
        '(A) o alto custo da produção de suas vacinas específicas, não coberto pelo sistema público de saúde, torna inacessível e impossível a prevenção dessas doenças para a população.',
        '(B) seus agentes infecciosos são vírus que, quando são enfraquecidos ou mortos para tratamento preventivo, estimulam uma resposta imunológica ativa no organismo humano.',
        '(C) seus agentes infecciosos são bactérias que, apesar de terem sido erradicadas da maioria dos países, afetam preferencialmente idosos e pessoas de vida sedentária.',
        '(D) a produção de vacinas específicas para cada uma delas é feita atualmente, em pequena escala, a partir da hiperimunização de cavalos.',
        '(E) seus agentes infecciosos foram eliminados totalmente da maioria dos países, tornando desnecessária a aplicação de medidas preventivas.',
        'B',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 47
        237,
        'A localização geográfica do cenário descrito no texto situa-se na região',
        '(A) Sul do Brasil e sofre a influência do clima semiárido.',
        '(B) Sul do Brasil e sofre a influência do clima subtropical.',
        '(C) Nordeste do Brasil e sofre a influência do clima semiárido.',
        '(D) Nordeste do Brasil e sofre a influência do clima subtropical.',
        '(E) Centro-Oeste do Brasil e sofre a influência do clima tropical de altitude.',
        'C',
        'Geografia',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 48
        238,
        'Esse instrumento simula o que acontece quando, devidamente protegidos, estamos observando, daqui da Terra, o Sol no momento em que ocorre um eclipse',
        '(A) lunar total, com a Lua se interpondo entre a Terra e o Sol.',
        '(B) lunar parcial, com a Terra se interpondo entre a Lua e o Sol.',
        '(C) solar total, com a Lua se interpondo entre a Terra e o Sol.',
        '(D) solar total, com a Terra se interpondo entre a Lua e o Sol.',
        '(E) solar parcial, com a Lua se interpondo entre a Terra e o Sol.',
        'C',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 49
        239,
        'Com base nessas informações, podemos afirmar corretamente que a quimioterapia atua',
        '(A) bloqueando a digestão celular realizada pelos lisossomos.',
        '(B) impedindo a respiração celular realizada pelas mitocôndrias.',
        '(C) dificultando a eliminação de substâncias tóxicas do organismo.',
        '(D) acelerando os processos de renovação celular dos tecidos sadios.',
        '(E) inibindo a ocorrência de mitoses responsáveis pela proliferação celular.',
        'E',
        'Ciências',
        2020,
        1
    );
    INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- Questão 50
        240,
        'Segundo o texto,',
        '(A) era considerado cidadão aquele que recusava a política, que não participava dos assuntos públicos e só se ocupava com a própria vida.',
        '(B) havia uma lei que obrigava gregos a se envolverem com os assuntos coletivos, sob pena de terem seus direitos e sua liberdade cerceados.',
        '(C) aqueles que se envolviam com a política eram tão idiotas quanto os que privilegiavam a vida privada, pois não percebiam que a política é o campo de atuação dos corruptos.',
        '(D) a liberdade estava intrinsecamente ligada à ideia de cidadania, pois só podia se considerar livre aquele que participasse da condução coletiva dos assuntos da cidade.',
        '(E) os direitos e os deveres eram construídos coletivamente pelos idiotas, enquanto os cidadãos viviam limitados ao mundo privado.',
        'C',
        'Sociologia',
        2020,
        1
    );

-- INSERT TABLE tbIMAGENS PROVA 2020 1 SEMESTRE
    INSERT INTO tbImagens (cod_question, image_data)
        VALUES
            (191, 'imgs/txtQ1.PNG'),
            (192, 'imgs/txtQ2.PNG'),
            (193, 'imgs/txtQ3.PNG'),
            (194, 'imgs/txtQ4.PNG'),
            (195, 'imgs/txtQ5.PNG'),
            (196, 'imgs/txtQ6.PNG'),
            (197, 'imgs/txtQ7.PNG'),
            (198, 'imgs/txtQ8.PNG'),
            (199, 'imgs/txtQ9.PNG'),
            (200, 'imgs/txtQ10.PNG'),
            (201, 'imgs/txtQ11-12.PNG'),
            (202, 'imgs/txtQ12.PNG'),
            (203, 'imgs/txtQ13.PNG'),
            (204, 'imgs/txtQ14-15.PNG'),
            (204, 'imgs/txtQ14.PNG'),
            (205, 'imgs/txtQ15.PNG'),
            (206, 'imgs/txtQ16.PNG'),
            (207, 'imgs/txtQ17.PNG'),
            (208, 'imgs/txtQ18-21.PNG'),
            (208, 'imgs/txtQ18-21-1.PNG'),
            (208, 'imgs/txtQ18-21-2.PNG'),
            (208, 'imgs/txtQ18.PNG'),
            (209, 'imgs/txtQ19.PNG'),
            (210, 'imgs/txtQ20.PNG'),
            (211, 'imgs/txtQ21.PNG'),
            (212, 'imgs/txtQ22.PNG'),
            (213, 'imgs/txtQ23.PNG'),
            (214, 'imgs/txtQ24-25.PNG'),
            (214, 'imgs/txtQ24-25-1.PNG'),
            (214, 'imgs/txtQ24-25-2.PNG'),
            (217, 'imgs/txtQ27.PNG'),
            (218, 'imgs/txtQ28.PNG'),
            (219, 'imgs/txtQ29.PNG'),
            (220, 'imgs/txtQ30-32.PNG'),
            (220, 'imgs/txtQ30.PNG'),
            (221, 'imgs/txtQ31.PNG'),
            (222, 'imgs/txtQ32.PNG'),
            (223, 'imgs/txtQ33.PNG'),
            (223, 'imgs/txtQ33-1.PNG'),
            (223, 'imgs/txtQ33-2.PNG'),
            (224, 'imgs/txtQ34.PNG'),
            (225, 'imgs/txtQ35.PNG'),
            (226, 'imgs/txtQ36-37.PNG'),
            (227, 'imgs/txtQ37.PNG'),
            (228, 'imgs/txtQ38.PNG'),
            (229, 'imgs/txtQ39.PNG'),
            (230, 'imgs/txtQ40-41.PNG'),
            (231, 'imgs/txtQ41.PNG'),
            (232, 'imgs/txtQ42.PNG'),
            (232, 'imgs/txtQ42-1.PNG'),
            (233, 'imgs/txtQ43.PNG'),
            (233, 'imgs/txtQ43-44.PNG'),
            (233, 'imgs/txtQ43.PNG'),
            (233, 'imgs/txtQ43-1.PNG'),
            (234, 'imgs/txtQ44.PNG'),
            (235, 'imgs/txtQ45.PNG'),
            (236, 'imgs/txtQ46.PNG'),
            (237, 'imgs/txtQ47.PNG'),
            (238, 'imgs/txtQ48.PNG'),
            (239, 'imgs/txtQ49.PNG'),
            (240, 'imgs/txtQ50.PNG');

-- INSERT TABLE tbQUESTIONS PROVA 2019 1 SEMESTRE
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (241,
                'Considerando os animais citados no texto, podemos afirmar que', 
                'A) todos possuem asas, corpo mole e segmentado.', 
                'B) as lacraias apresentam endoesqueleto calcário e patas articuladas.', 
                'C) os gafanhotos, os grilos e as aranhas possuem um par de antenas e quatro pares de patas.', 
                'D) as libélulas possuem exoesqueleto, três pares de patas e corpo segmentado em cabeça, tórax e abdome.', 
                'E) as baratas, as aranhas e os escorpiões apresentam glândulas de veneno, exoesqueleto e corpo não segmentado.', 
                'd',
                'Ciências',
                2019,
                1
                );

        --questão 2--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (242,
                'Assinale a alternativa que, corretamente, descreve o contexto em que surgiu a escrita na Mesopotâmia.', 
                'A) Os mesopotâmicos criaram a escrita como forma de se comunicar com os deuses, entalhando placas de argila que eram cuidadosamente depositadas no interior dos templos religiosos.', 
                'B) O surgimento da escrita foi vinculado à criação de um sistema de educação segundo o qual todas as crianças deveriam dominar o conhecimento das letras e dos cálculos.', 
                'C) As cidades da Mesopotâmia eram separadas por longas distâncias, percorridas a pé por mensageiros que levavam cartas e ofícios trocados entre os governantes.', 
                'D) A evolução da literatura oral gerou a necessidade de registrar os textos poéticos declamados pelos grandes oradores da Antiguidade clássica.', 
                'E) O desenvolvimento do comércio levou à criação da escrita, utilizada, inicialmente, para realizar registros contábeis e firmar contratos.', 
                'e',
                'História',
                2019,
                1
                );




        --questão 3--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (243,
                'Na cena transcrita, a personagem Escrava vê, na linguagem escrita, qual é a alternativa correta sobre o contexto em que surgiu a escrita na Mesopotâmia?', 
                'A) Os mesopotâmicos criaram a escrita como forma de se comunicar com os deuses, entalhando placas de argila que eram cuidadosamente depositadas no interior dos templos religiosos.', 
                'B) O surgimento da escrita foi vinculado à criação de um sistema de educação segundo o qual todas as crianças deveriam dominar o conhecimento das letras e dos cálculos.', 
                'C) As cidades da Mesopotâmia eram separadas por longas distâncias, percorridas a pé por mensageiros que levavam cartas e ofícios trocados entre os governantes.', 
                'D) A evolução da literatura oral gerou a necessidade de registrar os textos poéticos declamados pelos grandes oradores da Antiguidade clássica.', 
                'E) O desenvolvimento do comércio levou à criação da escrita, utilizada, inicialmente, para realizar registros contábeis e firmar contratos.', 
                'c',
                'História',
                2019,
                1
                );

        --questão 4--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (244,
                'Sobre o foco narrativo do trecho transcrito, é certo afirmar que se trata de um narrador', 
                'A) personagem, pois apresenta fatos que ocorreram com ele durante sua jornada pelo deserto.', 
                'B) personagem observador, pois ele narra eventos dos quais não participa, mas aos quais assiste.', 
                'C) observador, pois apresenta apenas as informações acessíveis pelos seus sentidos (o que ouviu ou viu).', 
                'D) onisciente, pois tem acesso aos pensamentos e sentimentos da personagem, expressos em discurso indireto.', 
                'E) personagem protagonista, pois relata fatos vivenciados por ele enquanto observava os trabalhos das personagens.', 
                'd',
                'Português',
                2019,
                1);

        --questão 5--
        INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (245,
                'Em Matemática, no estudo de funções, a parábola é uma curva que representa uma função polinomial',
                'A) constante e sua expressão geral é dada por f(x) = a, com a ≠ 0.',
                'B) de 1º grau e sua expressão geral é dada por f(x) = ax + b, com a ≠ 0.',
                'C) de 1º grau e sua expressão geral é dada por f(x) = ax2 + bx + c, com a ≠ 0.',
                'D) de 2º grau e sua expressão geral é dada por f(x) = ax + b, com a ≠ 0.',
                'E) de 2º grau e sua expressão geral é dada por f(x) = ax2 + bx + c, com a ≠ 0.',
                'e',
                'Matemática',
                2019,
                1
                );

        --questão 6--
       INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (246,
                'De acordo com o texto, assinale a alternativa correta.',
                'A) Mendeleev construía seus baralhos para jogar paciência.',
                'B) O baralho de Mendeleev continha os elementos químicos conhecidos na época.',
                'C) Na Tabela de Mendeleev, os elementos estão organizados em ordem crescente de número atômico.',
                'D) A Tabela Periódica, recebeu esse nome porque as propriedades dos elementos, na organização elaborada por Mendeleev, repetiam-se periodicamente.',
                'E) A Tabela Periódica, usada nos dias de hoje, ainda é igual à primeira tabela de Mendeleev com os elementos em ordem crescente de massas atômicas.',
                'd',
                2019,
                'Ciências',
                1
                );

        --questão 7--
        INSERT INTO tbQuestions (cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (247,
                'De acordo com o texto, por que os átomos foram descobertos',
                'A) pois havia sonhado com novos elementos químicos e passou a pesquisá-los.',
                'B) porque previa a descoberta de novos elementos químicos, o que realmente ocorreu posteriormente.',
                'C) que foram preenchidos por novos elementos, com características diferentes das previstas por ele.',
                'D) porque não existiam elementos que apresentassem as massas atômicas que deveriam ocupá-los.',
                'E) para serem preenchidos por elementos químicos que havia descoberto, pouco antes de sonhar com a tabela.',
                'b',
                2019,
                'Ciências',
                1
                );

        --questão 8--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (248,
                'O elemento químico, cujo nome é em homenagem a esse grande cientista, apresenta', 
                'A) número atômico igual a 258.', 
                'B) número de massa igual a 101.', 
                'C) estabilidade nuclear.', 
                'D) número de prótons igual a 101.', 
                'E) estabilidade na sua eletrosfera.', 
                'd',
                'Ciências',
                2019,
                1
                );

        --questão 9--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (249,
                'Assinale a alternativa que apresenta essa característica.', 
                'A) A grande extensão territorial do Império impediu a construção de qualquer sistema de ligação entre a capital e a periferia, fazendo com que somente a cidade de Roma dispusesse de estradas pavimentadas para a circulação de pessoas e bigas.', 
                'B) Em seu processo de expansão, o Império Romano fundou colônias nos cinco continentes e estabeleceu órgãos administrativos que, em escala reduzida, reproduziam a administração central e davam aos habitantes de todas as partes a sensação de viver na própria capital, a cidade de Roma.', 
                'C) Diferentes pontos do Império Romano estavam ligados à capital, a cidade de Roma, e entre si por milhares de quilômetros de estradas pavimentadas por onde circulavam, principalmente, os mensageiros do Império.', 
                'D) O processo de desintegração do Império Romano levou à construção de estradas que tinham o objetivo de facilitar a fuga dos habitantes da cidade de Roma, aterrorizados pela violência praticada pelos povos germânicos, que saquearam a cidade.', 
                'E) Devido à grande influência do catolicismo na formação do Império Romano, os habitantes da capital, a cidade Roma, financiaram a pavimentação de milhares de quilômetros de estradas que eram utilizadas para a peregrinação à Terra Santa.', 
                'c',
                'História',
                2019,
                1
                );

        --questão 10--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (250,
                'Um país que se candidate a membro desse bloco econômico deve necessariamente', 
                'A) ser republicano e possuir economia de mercado, porém submetida a controles constantes por parte do Fundo Monetário Internacional (FMI).', 
                'B) permanecer fiel à legislação do bloco e delegar suas questões de segurança nacional à Organização do Tratado do Atlântico Norte (OTAN).', 
                'C) possuir regime monarquista de governo, aceitar a política econômica do bloco e se comprometer a utilizar o Euro.', 
                'D) estar situado na Europa Ocidental e substituir sua Câmara de Deputados e seu Senado pelo Parlamento Europeu.', 
                'E) ter instituições estáveis que garantam a democracia, o Estado de direito e o respeito aos direitos humanos.', 
                'e',
                'Geografia',
                2019,
                1
                );


        --questão 11--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (251,
                'Dentre os fatores que dificultam a aceitação da Turquia como membro do bloco, podemos corretamente destacar o fato de esse país', 
                'A) dominar militarmente parte do território do Chipre, país membro da União Europeia.', 
                'B) adotar o Euro, mas não se submeter às ordens do Banco Central Europeu.', 
                'C) manter em seu território o povo Curdo, recusando-se a expulsá-lo.', 
                'D) ter seu território inteiramente no continente asiático.', 
                'E) ser uma república oficialmente islâmica.', 
                'a',
                'Geografia',
                2019,
                1
                );

        --questão 12--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (252,
                'Assinale a alternativa que contém o tempo que a Estrela da Morte demorou para se locomover do ponto A para o B.', 
                'A) 5,0 ×10^4s', 
                'B) 15,0 ×10^4s', 
                'C) 45,0 ×10^4s', 
                'D) √353 ×10^4s', 
                'E) √ 353 / 3 ×10^4s', 
                'a',
                'Ciências',
                2019,
                1
                );

        --questão 13--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (253,
                'Podemos dizer que a parte esquerda e a parte direita da imagem correspondem, nesta ordem, ao momento em que a Lua se encontra em seu', 
                'A) apogeu e perigeu.', 
                'B) afélio e periélio.', 
                'C) periélio e afélio.', 
                'D) perigeu e afélio.', 
                'E) perigeu e apogeu.', 
                'e',
                'Ciências',
                2019,
                1
                );

        --questão 14--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (254,
                'A bactéria chegou à Europa medieval', 
                'A) alojada no sangue de cachorros de caça importados pela casa real britânica, interessada em fomentar novos hábitos culturais no nascente Estado-nação.', 
                'B) devido aos fenômenos climáticos que, no século XVI, provocaram o brusco aquecimento do continente e diversas alterações no regime de chuvas.', 
                'C) pela rota do Mar do Norte, onde os navios pesqueiros portugueses realizavam a caça comercial de baleias infectadas desde o século VII.', 
                'D) alojada em ratos, instalados nos navios que realizavam as viagens de intercâmbio comercial entre o Ocidente e o Oriente a partir do século XII.', 
                'E) por meio de peregrinos que, da Terra Santa, caminhavam a Santiago de Compostela, na atual Espanha, fugindo da perseguição do Império Romano.', 
                'd',
                'História',
                2019,
                1
                );

        --questão 15--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (255,
                'O título da charge retoma o título da obra de Baudelaire, As Flores do Mal. O autor, para construir o humor em seu texto, utiliza-se de', 
                'A) metalinguagem, na representação das flores, que recitam versos compostos pelo poeta ao próprio Baudelaire.', 
                'B) saudosismo, nas falas das flores, pois elas representam costumes morais inerentes à sociedade francesa do século XIX.', 
                'C) metáfora, na representação do poeta como flores que apenas dizem verdades, indiferentes às regras morais da sociedade.', 
                'D) polissemia do substantivo “flores”, uma vez que podem se referir às próprias flores representadas na charge ou aos desejos moralmente rejeitados pelo poeta.', 
                'E) ambiguidade na locução adjetiva “do mal”, pois, no título original, a locução representa a temática dos poemas, mas, na charge, representa o conteúdo dos conselhos das flores.', 
                'e',
                'Português',
                2019,
                1
                );

        --questão 16--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (256,
                'Sobre os períodos apresentados, é correto afirmar que', 
                'A) o primeiro apresenta um desvio da norma culta, pois utiliza a terceira pessoa nos verbos “visualize” e “responda”, mas utiliza o pronome da segunda pessoa, “te”, sendo, contudo, adequado ao ambiente informal.', 
                'B) o segundo seria adequado ao diálogo formal das flores com o poeta se fosse “Que as maratonas sejam assistidas nos dias úteis!”, devido ao teor religioso das falas.', 
                'C) o terceiro apresenta o conteúdo adequado a hábitos de vida saudável para a personagem, representando a necessidade de abstenção de atitudes agradáveis.', 
                'D) os três apresentam análises críticas sobre o comportamento humano, utilizando a variedade culta da linguagem para expressar o discurso típico da poesia.', 
                'E) os três apresentam verbos conjugados no subjuntivo para expressar desejos do poeta que só podem ser verbalizados pelas Flores do Mal.', 
                'a',
                'Português',
                2019,
                1
                );

        --questão 17--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (257,
                'Assinale a alternativa que completa corretamente a frase com as falas transpostas.', 
                'A) caso lhe escreverem uma mensagem, visualizasse, mas não responderia; pois assistiria às maratonas de séries naqueles dias úteis enquanto comia bacon.', 
                'B) quando lhe escrevessem uma mensagem, visualizasse, mas não respondesse; que assistisse às maratonas de séries nos dias úteis; e que comesse bacon.', 
                'C) quando lhe escreveriam uma mensagem, visualizaria, mas não responderia; que assistiria às maratonas nestes dias úteis; e que comeria bacon.', 
                'D) se lhe escreverem uma mensagem, visualizá-la-ia, mas não a responderia; que assistisse às maratonas nos dias úteis; e que comeria bacon.', 
                'E) ao te escreverem uma mensagem, visualize, contudo sem responder; assiste às maratonas de séries nesses dias úteis; e comas bacon',
                'b',
                'Português',
                2019,
                1
                );

        --questão 18--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (258,
                'Assinale a alternativa que associa corretamente a medida mais eficiente para prevenir, respectivamente, ascaridíase e ancilostomíase.', 
                'A) IV e II.', 
                'B) II e I.', 
                'C) III e V.', 
                'D) I e III.', 
                'E) V e IV.', 
                'b',
                'Ciências',
                2019,
                1
                );

        --questão 19--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (259,
                'Suponha que a fragmentadora desse escritório só aceite uma folha por vez, sendo capaz de fazer sua função a uma velocidade de 3 metros por minuto. Sendo assim, para que um documento com 25 folhas seja fragmentado, levando em consideração que cada folha desse documento tem comprimento de 30 cm, o tempo mínimo para realizar a completa fragmentação desse documento é de', 
                'A) 1 min 40 s.', 
                'B) 2 min 20 s.', 
                'C) 2 min 30 s.', 
                'D) 3 min 50 s.', 
                'E) 3 min 40 s.',
                'c',
                'Matemática',
                2019,
                1
                );

        --questão 20--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (260,
                'De acordo com o texto, é correto afirmar sobre a planta citada que', 
                'A) possui ramos verdes, com folhas grandes e flores vistosas, sendo muito utilizada na alimentação de vários animais herbívoros.', 
                'B) a simples mastigação ou ingestão de um pedaço de suas flores e raízes é capaz de causar intoxicações graves.', 
                'C) a mastigação de suas folhas libera cristais de oxalato de cálcio que penetram nos tecidos resultando em lesões.', 
                'D) todas as suas células podem desencadear um processo alérgico e distúrbios cardíacos.', 
                'E) o suco vacuolar das células de suas folhas possui histamina, que atua na reorganização das membranas celulares dos tecidos foliares',
                'c',
                'Ciências',
                2019,
                1
                );

        --questão 21-- 
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (261,
                'Considerando as principais funções desse órgão, é correto afirmar que', 
                'A) a presença de uma epiderme queratinizada, do ponto de vista adaptativo, está diretamente relacionada à reserva nutritiva.', 
                'B) as glândulas sudoríparas são responsáveis pela produção do suor, ajudando a elevar a temperatura do corpo, ao ser eliminado.', 
                'C) a transpiração diminui em dias frios e os vasos sanguíneos da pele se dilatam, o que aumenta a perda de calor e mantém o corpo aquecido.', 
                'D) a transpiração aumenta em dias quentes e os vasos sanguíneos da pele se contraem, o que diminui a irradiação de calor para o meio, esfriando o corpo.', 
                'E) a exposição da pele aos raios ultravioleta pode causar vermelhidão, queimaduras e também estimula a produção de melanina, que a protege dos efeitos negativos da radiação',
                'e',
                'Ciências',
                2019,
                1
                );

        --questão 22--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (262,
                'Assinale a alternativa que apresenta as palavras que completam corretamente o texto.', 
                'A) absorver, condução, superior', 
                'B) absorver, convecção, inferior', 
                'C) refletir, condução, superior', 
                'D) refletir, condução, inferior', 
                'E) refratar, convecção, superior',
                'a',
                'Ciências',
                2019,
                1
                );

        --questão 23--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (263,
                'Assinale a alternativa que apresenta, corretamente, o nome e as principais características desse processo.',
                '(A) Fotossíntese: Produção de compostos orgânicos, como, por exemplo, os açúcares, a partir de moléculas de gás carbônico (CO2) e de água (H2O), na presença de energia luminosa.',
                '(B) Respiração: Transformação de energia luminosa em energia potencial química, armazenada nas moléculas de glicídios (açúcares) produzidas no processo.',
                '(C) Fermentação: Degradação completa de moléculas orgânicas liberando energia luminosa para a formação de moléculas de ATP (adenosina trifosfato).',
                '(D) Fotossíntese: Oxidação de compostos orgânicos na presença de energia luminosa, formando moléculas de gás carbônico (CO2), de água (H2O) e liberando energia química que será usada pelos seres vivos.',
                '(E) Respiração: Liberação de energia química a partir da combustão da matéria orgânica, principalmente glicose, na presença de energia luminosa, gás carbônico (CO2) e água (H2O).',
                'd',
                'Ciências',
                2019,
                1
                );


        --questão 24--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (264,
                'Na segunda estrofe, a faísca desencadeia uma transformação',
                '(A) química e exotérmica, pois há liberação de energia.',
                '(B) química e endotérmica, pois há absorção de energia.',
                '(C) física e exotérmica, pois há absorção de energia.',
                '(D) física e endotérmica, pois há liberação de energia.',
                '(E) física e sem variação de energia.',
                'a',
                'Ciências',
                2019,
                1
                );

        --questão 25--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (265,
                'O singular da palavra escrita em negrito, na segunda estrofe, significa',
                '(A) nesga de areia depositada paralelamente ao litoral.',
                '(B) porção do continente que se projeta para o oceano.',
                '(C) depressão alongada e estreita com laterais íngremes.',
                '(D) reentrância da costa com formato aproximadamente circular.',
                '(E) faixa estreita de terreno que conecta duas grandes extensões de terra.',
                'e',
                'Português',
                2019,
                1
                );


        --questão 26--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (266,
                'As palavras escritas em negrito, na quarta estrofe, podem ser substituídas correta e respectivamente pelos termos',
                '(A) leste e sul.',
                '(B) leste e norte.',
                '(C) leste e oeste.',
                '(D) oeste e norte.',
                '(E) oeste e sul.',
                'd',
                'Geografia',
                2019,
                1
                );


        --questão 27--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (267,
                'Considerando o gráfico dado, o trabalho total realizado no deslocamento de 8 m, em joules, corresponde a',
                '(A) 160.',
                '(B) 240.',
                '(C) 280.',
                '(D) 320.',
                '(E) 520.',
                'd',
                'Ciências',
                2019,
                1
                );

        --questão 28--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (268,
                'O poema faz referência a Palmares e à ideia de liberdade, os quais caracterizam',
                '(A) a execução de Tiradentes, líder da Inconfidência Mineira, movimento emancipacionista frustrado, ocorrido em Minas Gerais no século XVIII.',
                '(B) a demarcação de terras indígenas no Pará, garantidas pela Constituição Federal de 1988, promulgada após aproximadamente duas décadas de regime autoritário.',
                '(C) a demolição do Complexo Penitenciário do Carandiru, em São Paulo, onde, na segunda metade do século XX, ocorreu uma das maiores chacinas da história do estado.',
                '(D) o mais duradouro quilombo da história do Brasil, localizado em Alagoas, no qual se refugiaram milhares de escravos fugidos de cidades e fazendas ao longo do século XVII.',
                '(E) as comunidades pobres do Rio de Janeiro que, por volta de 1910, foram expulsas dos cortiços no centro da cidade, no processo de reformas urbanas conduzido por Pereira Passos.',
                'd',
                'Português',
                2019,
                1
                );

        --questão 29--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (269,
                'Quando ele unir as peças que apresentam os íons K+ e NO3-, estará representando um composto',
                '(A) iônico, denominado nitrato de potássio.',
                '(B) iônico, denominado potássico de nitrogênio.',
                '(C) molecular, denominado nitrato de potássio.',
                '(D) molecular, denominado potássio de nitrogênio.',
                '(E) metálico, denominado nitrato de potássio.',
                'a',
                'Ciências',
                2019,
                1
                );


        --questão 30--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (270,
                'Unindo as peças do quebra-cabeça de cátions e ânions, o aluno pode concluir, corretamente, que o cloreto de bário apresenta a fórmula',
                '(A) BaCl.',
                '(B) BaCl₂.',
                '(C) ClBa.',
                '(D) ClBa₂.',
                '(E) Ba₂Cl₂.',
                'b',
                'Ciências',
                2019, 
                1
                );

        --questão 31--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (271,
                'Assinale a alternativa que apresenta, corretamente, os números das peças do quebra-cabeça que representam a fórmula do principal componente desse tempero, na seguinte ordem: Cátion e Ânion.',
                '(A) 4, 3.',
                '(B) 5, 4.',
                '(C) 5, 2.',
                '(D) 3, 3.',
                '(E) 3, 4.',
                'e',
                'Ciências',
                2019,
                1
                );

        --questão 32--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (272,
                'Se, em dado momento, somente a lâmpada L4 tiver seu filamento rompido, apagando-se, é correto concluir que',
                '(A) só L₃ permanecerá acesa.',
                '(B) só L₁ e L₂ permanecerão acesas.',
                '(C) só L₁ e L₃ permanecerão acesas.',
                '(D) as demais lâmpadas permanecerão acesas.',
                '(E) nenhuma das lâmpadas permanecerá acesa.',
                'b',
                'Ciências',
                2019,
                1
                );

        --questão 33--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (273,
                'Considerando a teia alimentar representada na figura, pode-se afirmar corretamente que os organismos',
                '(A) II, III e IV são exclusivamente consumidores de primeira ordem.',
                '(B) V e VII são consumidores de primeira e segunda ordem.',
                '(C) IV e VII são exclusivamente decompositores.',
                '(D) III são consumidores de segunda e terceira ordem.',
                '(E) I são exclusivamente seres vivos parasitas.',
                'd',
                'Ciências',                
                2019,
                1
                );


        --questão 34--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (274,
                'Sabendo que o chuveiro de sua casa tem potência de 2 800 W, o estudante calculou que, no período avaliado, o consumo de energia em sua casa, devido ao uso do chuveiro, foi, aproximadamente, de',
                '(A) 90 kWh.',
                '(B) 105 kWh.',
                '(C) 125 kWh.',
                '(D) 140 kWh.',
                '(E) 155 kWh.',
                'c',
                'Ciências',
                2019,
                1
                );

        --questão 35--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (275,
                'Ao formular sua teoria, Montesquieu criticou o regime absolutista e defendeu a divisão do governo em três poderes – Executivo, Legislativo e Judiciário – como forma de',
                '(A) garantir a centralização do poder monárquico e a vontade absoluta dos reis, bem como defender os interesses das classes dominantes.',
                '(B) desestabilizar o governo e enfraquecer o Judiciário, bem como garantir a impunidade dos crimes cometidos pelos mais pobres.',
                '(C) evitar a concentração de poder e os abusos dos governantes, bem como proteger as liberdades individuais dos cidadãos.',
                '(D) estabilizar o governo e fortalecer o Executivo, bem como liberar as camadas subalternas da cobrança de impostos.',
                '(E) fortalecer o povo e eliminar os governos, bem como eliminar as formas de punição consideradas abusivas.',
                'c',
                'História',
                2019,
                1
                );


        --questão 36--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (276,
                'Nessas condições, pode-se afirmar que, no munícipio de São Paulo, para cada 3 eleitores registrados, existem',
                '(A) 75 habitantes.',
                '(B) 40 habitantes.',
                '(C) 30 habitantes.',
                '(D) 4 habitantes.',
                '(E) 3 habitantes.',
                'd',
                'Matemática',
                2019,
                1
                );

        --questão 37--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (277,
                'Identifique a alternativa em que o modo e o tempo desse verbo estão analisados correta e respectivamente.',
                '(A) Ajuda, presente do indicativo, ajudo, pretérito perfeito do indicativo.',
                '(B) Ajuda, presente do subjuntivo, ajudo, presente do subjuntivo.',
                '(C) Ajuda, pretérito do subjuntivo, ajudo, presente do indicativo.',
                '(D) Ajuda, imperativo afirmativo, ajudo, presente do indicativo.',
                '(E) Ajuda, imperativo afirmativo, ajudo, futuro do indicativo.',
                'd',
                'Português',
                2019,
                1
                );

        --questão 38--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (278,
                'O título da charge “democracinhas” é um neologismo composto pelo mesmo processo de formação presente no termo',
                '(A) desanuviar, derivação sufixal.',
                '(B) inativo, derivação parassintética.',
                '(C) girassol, composição por hibridismo.',
                '(D) fidalgo, composição por aglutinação.',
                '(E) televisão, derivação prefixal e sufixal.',
                'd',
                'Português',
                2019,
                1
                );


        --questão 39--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (279,
                'Assinale a alternativa que apresenta a análise correta da função morfológica dos termos destacados nas passagens.',
                '(A)',
                '(B)',
                '(C)',
                '(D)',
                '(E)',
                'a',
                'Português',
                2019,
                1
                );

        --questão 40--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (280,
                'Assinale a alternativa que apresenta o tempo mínimo e necessário para que todo o processo de votação seja finalizado nessa Zona Eleitoral.',
                '(A) 3 h 55 min',
                '(B) 3 h 45 min',
                '(C) 2 h 40 min',
                '(D) 2 h 25 min',
                '(E) 1 h 15 min',
                'b',
                'Matemática',
                2019,
                1
                );


        --questão 41--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (281,
                'O Tratado foi assinado após a derrota alemã na',
                '(A) Segunda Guerra Mundial e estabeleceu a divisão da Alemanha em dois países distintos; a construção do Muro de Berlim e a formação de uma Força Suprapartidária Permanente para fiscalizar as fronteiras e garantir a paz.',
                '(B) Guerra Franco-Prussiana e estabeleceu a perda dos territórios da Prússia e da Bavária; a fortificação dos postos da fronteira com a França e a criação de uma comissão para apurar os crimes de guerra.',
                '(C) Guerra Austro-Prussiana e estabeleceu a prestação de serviços sociais nas áreas devastadas pela guerra; a militarização das fronteiras da Alemanha e a implantação de políticas de austeridade fiscal, para combater a crise econômica alemã.',
                '(D) Guerra da Crimeia e estabeleceu a aplicação de multas aos soldados alemães acusados de crimes de guerra; o desenvolvimento da indústria armamentista e a criação de grupos paramilitares para patrulhar estradas.',
                '(E) Primeira Guerra Mundial e estabeleceu a perda de colônias alemãs na África e parte de seu território continental; a desmilitarização e o pagamento de uma alta indenização aos Aliados, o que agravou a crise econômica no país.',
                'e',
                'História',
                2019,
                1
                );


        --questão 42--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (282,
                'Dentre essas transformações e suas distribuições no território brasileiro, podemos citar corretamente',
                '(A) o surgimento do estado de Tocantins, desmembrado do estado de Goiás e incorporado à região Centro-Oeste.',
                '(B) a transformação dos antigos territórios federais de Rondônia, Roraima e Amapá em estados pertencentes à região Norte.',
                '(C) a incorporação do antigo território federal de Fernando de Noronha ao estado do Rio Grande do Norte, na região Nordeste.',
                '(D) a divisão do estado de Mato Grosso em duas novas unidades da federação, o Mato Grosso do Sul e o Mato Grosso, na região Sudeste.',
                '(E) o desmembramento do estado da Guanabara do estado do Rio de Janeiro quando da criação da cidade de Brasília, na região Sul.',
                'b',
                'Geografia',
                2019,
                1
                );

        --questão 43--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (283,
                'Entre as características da presença holandesa em Pernambuco, pode-se citar, corretamente',
                '(A) a valorização da cultura muçulmana, a implementação da monocultura do café e a abolição da escravidão, considerada pelos holandeses um símbolo do atraso civilizatório brasileiro.',
                '(B) a intolerância religiosa e a perseguição a cristãos e muçulmanos, o estímulo à mineração de ouro e prata e o descaso pelo patrimônio público, que não resistiu às intempéries e ao vandalismo.',
                '(C) a implementação do regime absolutista, a perseguição a intelectuais e artistas e a deterioração dos equipamentos urbanos, cuja manutenção dependia dos investimentos diretos da Coroa portuguesa.',
                '(D) o princípio da isonomia, o incentivo a pesquisas sobre geologia e astronomia e o desenvolvimento de uma cultura própria, na qual se destaca a miscigenação de elementos das três religiões monoteístas.',
                '(E) a tolerância religiosa, o incentivo a pesquisas sobre a fauna e a  ora tropicais e o desenvolvimento da arquitetura, no qual se destacam a drenagem de áreas alagadiças e a construção da primeira ponte de grande porte do Brasil.',
                'e',
                'História',
                2019,
                1
                );


        --questão 44--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (284,
                'Com suas observações, foi capaz de deduzir corretamente que o desnível do terreno era de',
                '(A) 6,0 m.',
                '(B) 8,0 m.',
                '(C) 10,0 m.',
                '(D) 12,0 m.',
                '(E) 14,0 m.',
                'a',
                'Matemática',
                2019,
                1
                );

        --questão 45--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (285,
                'Sobre esse país é correto afirmar que',
                '(A) foi a única colônia europeia na América a não adotar mão de obra escrava.',
                '(B) era colônia holandesa e tornou-se um país independente em meados da década de 1970.',
                '(C) sua língua oficial é o inglês, mas o espanhol é bastante utilizado, assim como alguns dialetos locais.',
                '(D) é banhado pelo Oceano Pacífico e seu relevo é marcado pela existência da Cordilheira dos Andes, que corta o país de norte a sul.',
                '(E) seu principal produto de exportação é a banana, o que torna sua economia estável devido às pequenas variações no mercado de commodities.',
                'b',
                'Geografia',
                2019,
                1
                );

        --questão 46--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (286,
                'Sobre as várias etapas do processo de imunização descritas no texto é correto afirmar que',
                '(A) a pessoa picada por cobra venenosa deverá tomar soro, pois este contém os antígenos específicos que irão neutralizar o veneno.',
                '(B) a aplicação de soro ou vacina em uma vítima de picada de cobra são processos indiferentes porque ambos possuem anticorpos.',
                '(C) os anticorpos específicos produzidos contra o veneno da cobra, e injetados na vítima, permanecem ativos no sangue durante toda a vida do receptor.',
                '(D) o soro não possui função preventiva, sendo usado apenas como forma de tratamento, pois contém anticorpos prontos para o uso em seres humanos.',
                '(E) a devolução das células sanguíneas aos animais é importante porque, como as hemácias atuam na defesa, isso impede a manifestação de processos infecciosos nos cavalos.',
                'd',
                'Ciências',
                2019,
                1
                );


        --questão 47--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (287,
                'Considerando y o valor do prêmio em 2017 e x o valor do prêmio em 2016, assinale a alternativa que apresenta a relação correta entre os dois valores.',
                '(A) y = x + 0,12',
                '(B) y = 1,12 x',
                '(C) y = 12 x',
                '(D) x = 1,12 y',
                '(E) x = y + 0,12',
                'b',
                'Matemática',
                2019,
                1
                );

        --questão 48--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (288,
                'Com base nas informações contidas no texto e assumindo que, em 2016, uma coroa sueca era equivalente a R$ 0,42, pode-se afirmar que o valor aproximado do Prêmio Nobel, para cada modalidade de premiação, em 2016 era, em milhões de reais, de cerca de',
                '(A) 3,33',
                '(B) 3,66',
                '(C) 3,78',
                '(D) 5,04',
                '(E) 7,92',
                'a',
                'Matemática',
                2019,
                1
                );

        --questão 49--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (289,
                'A altura da caixa, em centímetros, será igual a',
                '(A) 2,0',
                '(B) 2,3',
                '(C) 3,0',
                '(D) 3,3',
                '(E) 4,0',
                'c',
                'Matemática',
                2019,
                1
                );

        --questão 50--
        INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (290,
                'Sobre os tipos de rochas, podemos afirmar corretamente que aquelas formadas pela transformação de outras rochas existentes no interior da Terra, submetidas a enormes pressões e altas temperaturas, são conhecidas como',
                '(A) ígneas.',
                '(B) plutônicas.',
                '(C) magmáticas.',
                '(D) sedimentares.',
                '(E) metamórficas.',
                'e',
                'Geografia',
                2019,
                1
                );

-- INSERT TABLE tbIMAGENS PROVA 2019 1 SEMESTRE
        INSERT INTO tbImagens (cod_question, image_data)
        VALUES 
                (241, 'imgs/txtQ1.PNG'),
                (242, 'imgs/txtQ2_1.PNG'),
                (242, 'imgs/txtQ2_2.PNG'),
                (243, 'imgs/txtQ3-4.PNG'),
                (245, 'imgs/imgQ5.PNG'),
                (245, 'imgs/txtQ5.PNG'),
                (246, 'imgs/txtQ6-8.PNG'),
                (249, 'imgs/txtQ9_1.PNG'),
                (249, 'imgs/imgQ9.PNG'),
                (249, 'imgs/txtQ9_2.PNG'),
                (250, 'imgs/txtQ10.PNG'),
                (251, 'imgs/txtQ11.PNG'),
                (252, 'imgs/imgQ12.PNG'),
                (252, 'imgs/txtQ12.PNG'),
                (253, 'imgs/txtQ13_1.PNG'),
                (253, 'imgs/imgQ13.PNG'),
                (253, 'imgs/txtQ13_2.PNG'),
                (254, 'imgs/txtQ14.PNG'),
                (255, 'imgs/txtQ15-17.PNG'),
                (255, 'imgs/imgQ15-17.PNG'),
                (256, 'imgs/imgQ16.PNG'),
                (257, 'imgs/txtQ17.PNG'),
                (258, 'imgs/txtQ18.PNG'),
                (258, 'imgs/imgQ18.PNG'),
                (259, 'imgs/txtQ19.PNG'),
                (260, 'imgs/imgQ20.PNG'),
                (261, 'imgs/txtQ21.PNG'),
                (262, 'imgs/txtQ22_1.PNG'),
                (262, 'imgs/txtQ22_2.PNG'),
                (263, 'imgs/txtQ23_1.PNG'),
                (263, 'imgs/txtQ23_2.PNG'),
                (263, 'imgs/txtQ23_3.PNG'),
                (264, 'imgs/txtQ24_1.PNG'),
                (264, 'imgs/txtQ24_2.PNG'),
                (265, 'imgs/txtQ25-26.PNG'),
                (267, 'imgs/txtQ27.PNG'),
                (267, 'imgs/imgQ27.PNG'),
                (268, 'imgs/txtQ28.PNG'),
                (269, 'imgs/imgQ29-31.PNG'),
                (269, 'imgs/txtQ29.PNG'),
                (271, 'imgs/txtQ31_1.PNG'),
                (271, 'imgs/txtQ31_2.PNG'),
                (272, 'imgs/txtQ32_1.PNG'),
                (272, 'imgs/imgQ32.PNG'),
                (272, 'imgs/txtQ32_2.PNG'),
                (273, 'imgs/txtQ33.PNG'),
                (273, 'imgs/imgQ33.PNG'),
                (274, 'imgs/imgQ34.PNG'),
                (274, 'imgs/txtQ34.PNG'),
                (275, 'imgs/txtQ35_1.PNG'),
                (275, 'imgs/txtQ35_2.PNG'),
                (276, 'imgs/txtQ36.PNG'),
                (277, 'imgs/imgQ37-39.PNG'),
                (277, 'imgs/txtQ37.PNG'),
                (279, 'imgs/imgQ39.PNG'),
                (279, 'imgs/imgQ39_2.PNG'),
                (280, 'imgs/txtQ40.PNG'),
                (281, 'imgs/txtQ41.PNG'),
                (282, 'imgs/txtQ42.PNG'),
                (283, 'imgs/txtQ43.PNG'),
                (283, 'imgs/imgQ43.PNG'),
                (284, 'imgs/txtQ44.PNG'),
                (284, 'imgs/imgQ44.PNG'),
                (285, 'imgs/txtQ45.PNG'),
                (286, 'imgs/txtQ46.PNG'),
                (287, 'imgs/imgQ47-49.PNG'),
                (289, 'imgs/txtQ49.PNG'),
                (289, 'imgs/imgQ49.PNG'),
                (290, 'imgs/txtQ50.PNG');

-- INSERT TABLE tbQUESTIONS PROVA 2015 1 SEMESTRE
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (641, -- questão 1
                'Nessa micrografia, as estruturas celulares numeradas por 1 e 2 são denominadas, respectivamente,', 
                'A) núcleo e mitocôndrias.', 
                'B) parede celular e cloroplastos.', 
                'C) retículo endoplasmático e plastos.', 
                'D) complexo golgiense e ribossomos.', 
                'E) membrana plasmática e centríolos.', 
                'b',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (642, -- questão 2
                'Analisando as características da pintura apresentada, é correto concluir que se trata de uma obra', 
                'A) medieval e cavalheiresca.', 
                'B) medieval e teocêntrica.', 
                'C) classicista e modernista.', 
                'D) renascentista e antropocêntrica.', 
                'E) renascentista e ateísta.', 
                'd',
                'História',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (643, -- questão 3
                'Assim sendo, se a medida do maior lado da tela for de 40 cm, então, a medida do menor lado será, em centímetros, aproximadamente,', 
                'A) 22,94.', 
                'B) 24,72.', 
                'C) 28,54.', 
                'D) 36,26.', 
                'E) 64,72.', 
                'b',
                'Matemática',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (644, -- questão 4
                'Sobre o texto e a imagem, é correto afirmar que', 
                'A) a artista escolheu um objeto que pouco se relaciona com o elemento escolhido.', 
                'B) a bauxita é matéria-prima para obtenção desse elemento.', 
                'C) a finalidade era promover o refrigerante.', 
                'D) o elemento representado pela artista possui número atômico 355.', 
                'E) o elemento escolhido é mau condutor de corrente elétrica e térmica.', 
                'b',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (645, -- questão 5
                'A imagem produzida pela artista Ellen Brooks representa o elemento químico', 
                'A) antimônio.', 
                'B) arsênio.', 
                'C) astato.', 
                'D) argônio.', 
                'E) alumínio.', 
                'e',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (646, -- questão 6
                'Além dos aspectos descritos, pode-se afirmar que essa planta se caracteriza pela', 
                'A) ausência de raízes.', 
                'B) ausência de vasos condutores de seiva.', 
                'C) presença de flores, frutos e sementes.', 
                'D) presença de sementes comestíveis.', 
                'E) presença de frutos comestíveis.',
                'd',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (647, -- questão 7
                'Assinale a alternativa que apresenta corretamente a área mais utilizada no período colonial para o plantio de cana-de-açúcar e o seu tipo de solo predominante.', 
                'A) A zona da mata, com solo massapé, de cor escura.', 
                'B) O triângulo mineiro, com solo aluvial vermelho-amarelado.', 
                'C) O vale do Paraíba, com solo tchernozion bastante claro.', 
                'D) O vale do Ribeira, com solo terra roxa, muito avermelhado.', 
                'E) A campanha gaúcha, com predomínio do solo salmorão alaranjado.', 
                'a',
                'Geografia',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (648, -- questão 8
                'Sobre esse tema, podemos afirmar corretamente que', 
                'A) a rapidez da inovação tecnológica não induz ao aumento de consumo, pois as mercadorias produzidas há mais tempo não conseguiriam ser vendidas, levando a um colapso do mercado varejista.', 
                'B) a ampliação do consumo não leva a uma crise ambiental, pois a quantidade de matérias primas disponíveis no planeta aumenta na mesma proporção que a fabricação de produtos industriais.', 
                'C) o desenvolvimento tecnológico não gera o aumento da vida útil dos produtos, levando a um aumento considerável da produção e a consequente diminuição da retirada de matérias-primas da natureza.', 
                'D) o aumento do consumismo não impacta o meio ambiente, uma vez que, ao realizarmos o descarte de um determinado objeto, o meio ambiente cuida para que este retorne à natureza, reiniciando o ciclo.', 
                'E) ao praticar o consumismo, as pessoas não estão agindo coletivamente, pois não levam em conta o impacto que o consumo exagerado provoca sobre o meio ambiente, bem como suas consequências para o futuro da humanidade.', 
                'e',
                'Geografia',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (649, -- questão 9
                'Se todas essas lâmpadas fossem mantidas acesas durante meia hora, ao longo da apresentação, a energia utilizada por elas seria, em watt-hora,', 
                'A) 600.', 
                'B) 800.', 
                'C) 900.', 
                'D) 1 200.', 
                'E) 1 500.', 
                'a',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (650, -- questão 10
                'De acordo com as informações apresentadas, é correto concluir que o teatro grego da Antiguidade', 
                '(A) legitimava o exercício do poder centralizado dos reis absolutistas.', 
                '(B) contribuía para o exercício da cidadania no regime democrático.', 
                '(C) priorizava a abordagem de temas que favoreciam a aristocracia.', 
                '(D) excluía as discussões de temas reais, enfatizando temas mitológicos.', 
                '(E) evitava se utilizar de elementos cômicos para tratar de assuntos sérios.', 
                'b',
                'História',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (651, -- questão 11
                'Pode-se concluir que a doença retratada, no poema Pneumotórax, é conhecida como', 
                '(A) esquistossomose.', 
                '(B) toxoplasmose.', 
                '(C) leishmaniose.', 
                '(D) tuberculose.', 
                '(E) leptospirose.', 
                'd',
                'Português',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (652, -- questão 12
                'As expressões que completam corretamente a frase anterior, na ordem em que aparecem, são', 
                'A) repouso ... movimento com velocidade variável.', 
                'B) repouso ... movimento com velocidade constante.', 
                'C) movimento com velocidade variável ... repouso.', 
                'D) movimento com velocidade constante ... repouso.', 
                'E) movimento com velocidade variável ... movimento com velocidade variável.', 
                'a',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (653, -- questão 13
                'A sub-região nordestina que é a mais castigada pela seca retratada nesses romances é', 
                'A) o agreste.', 
                'B) o litoral.', 
                'C) o sertão.', 
                'D) o meio norte.', 
                'E) a zona da mata.', 
                'c',
                'Português',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (654, -- questão 14
                'A figura de linguagem predominante nesse poema é', 
                'A) hipérbole, pois a palavra estrela foi empregada para suavizar um termo.', 
                'B) pleonasmo, pois a palavra história apresenta o mesmo sentido de incidente.', 
                'C) sinestesia, pois a felicidade da estrela é tratada com indiferença pelo poeta.', 
                'D) catacrese, pois a palavra pena foi empregada inadequadamente, num sentido impróprio.', 
                'E) personificação, pois a lua vivencia uma situação que é própria dos seres humanos.', 
                'e',
                'Português',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (655, -- questão 15
                'Comparando as esponjas verdadeiras com o personagem Bob Esponja, é correto afirmar que', 
                'A) ambos possuem corpo quadrado, maciço e resistente.', 
                'B) ambos possuem sistema sensorial desenvolvido, a fim de reagir aos estímulos do meio ambiente.', 
                'C) ambos possuem estruturas locomotoras, que permitem a movimentação para a obtenção de alimento.', 
                'D) as esponjas verdadeiras, ao contrário do Bob Esponja, não possuem boca, pois são animais filtradores.', 
                'E) as esponjas verdadeiras, ao contrário do Bob Esponja, podem viver fora da água.', 
                'd',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (656, -- questão 16
                'Se a cada 30 mm da fita de um filme existe um único fotograma, em uma animação de 3 minutos de duração, a fita terá um comprimento aproximado, em metros, de', 
                'A) 70.', 
                'B) 90.', 
                'C) 130.', 
                'D) 150.', 
                'E) 220.', 
                'c',
                'Matemática',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (657, -- questão 17
                'É correto concluir que o discurso do personagem de Chaplin', 
                'A) incentiva jovens soldados para que se alistem nas fileiras do Exército alemão.', 
                'B) evidencia que os Estados Unidos estavam prestes a apoiar os países do Eixo.', 
                'C) critica o modelo político totalitário que vigorava durante a Segunda Guerra.', 
                'D) apoia o imperialismo defendido pela Tríplice Aliança na Primeira Guerra.', 
                'E) defende a democracia, apresentando argumentos do antissemitismo.', 
                'c',
                'História',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (658, -- questão 18
                'Sobre esse rio, é correto afirmar que ele', 
                'A) corta o continente africano de leste a oeste e tem sua nascente no monte Kilimanjaro.', 
                'B) nasce no coração da África Tropical e corre na direção leste, desaguando no oceano Índico.', 
                'C) corta o deserto do Saara no norte africano e corre na direção sul, desaguando no oceano Pacífico.', 
                'D) nasce no centro da África Equatorial e corre na direção oeste, desaguando no oceano Atlântico.', 
                'E) nasce no interior do continente africano e corre na direção norte, desaguando no mar Mediterrâneo.', 
                'e',
                'Geografia',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (659, -- questão 19
                'Pode-se afirmar que esse submarino, ao seguir o fluxo sanguíneo normal da veia citada no texto, será levado diretamente para', 
                'A) o fígado.', 
                'B) o coração.', 
                'C) os pulmões.', 
                'D) a artéria aorta.', 
                'E) o globo ocular.', 
                'b',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (660, -- questão 20
                'Nesse momento, considerando as quantidades de filme que os carretéis contêm e o tempo necessário para que o carretel R dê uma volta completa, é correto concluir que o carretel F gira em sentido', 
                'A) anti-horário e dá mais voltas que o carretel R.', 
                'B) anti-horário e dá menos voltas que o carretel R.', 
                'C) horário e dá mais voltas que o carretel R.', 
                'D) horário e dá menos voltas que o carretel R.', 
                'E) horário e dá o mesmo número de voltas que o carretel R.', 
                'd',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (661, -- questão 21
                'Assinale a alternativa que apresenta o padrão geométrico cuja repetição compõe a figura 1.', 
                'A) Opção A', 
                'B) Opção B',
                'C) Opção C',
                'D) Opção D',
                'E) Opção E',
                'e',
                'Matemática',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (662, -- questão 22
                'Entre esses materiais, temos', 
                'A) um tubo de ensaio.', 
                'B) um condensador.', 
                'C) uma proveta.', 
                'D) um béquer.', 
                'E) uma pipeta.', 
                'b',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (663, -- questão 23
                'Podemos afirmar que o trecho apresentado é, predominantemente,', 
                '(A) descritivo, pois defende uma tese baseada em argumentos expostos pelos moradores do vilarejo.', 
                '(B) descritivo, pois narra fatos históricos ocorridos em uma pequena cidade do interior.', 
                '(C) descritivo, pois representa, por meio de palavras, as características de ambientes e seres.', 
                '(D) narrativo, pois relata um fato fictício, por meio de verbos no pretérito perfeito do indicativo.', 
                '(E) narrativo, pois relata um fato verídico, por meio de verbos no presente do indicativo.', 
                'c',
                'Português',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (664, -- questão 24
                'A letra da música Vilarejo apresenta-nos um lugar', 
                'A) inóspito, tedioso, no qual seus habitantes precisam ser heróis para sobreviver.', 
                'B) misterioso, distante e belo onde os autores passaram a maior parte da adolescência.', 
                'C) idealizado e maravilhoso, onde a felicidade e a harmonia são vivenciadas em plenitude.', 
                'D) tranquilo e feliz, embora os estrangeiros vivam em comunidades isoladas.', 
                'E) selvagem e de natureza exuberante que fica na divisa entre a Palestina e Shangri-lá.', 
                'c',
                'Português',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (665, -- questão 25
                'Assinale a alternativa que apresenta corretamente o valor semântico, entre parênteses, expresso pela preposição em destaque.', 
                'A) Pra acalmar o coração / Lá o mundo tem razão. (posse)', 
                'B) Portas e janelas ficam sempre abertas / Pra sorte entrar. (finalidade)', 
                'C) Por cima das casas, cal / Frutas em qualquer quintal. (tempo)', 
                'D) Terra de heróis, lares de mãe. (oposição)', 
                'E) Em todas as mesas, pão. (causa)', 
                'b',
                'Português',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (666, -- questão 26
                'Analisando o conteúdo da letra, é correto relacionar a canção de Gonzaguinha ao período', 
                'A) do “milagre econômico”, durante o governo de Castelo Branco.', 
                'B) da instalação do regime militar, durante o governo de Figueiredo.', 
                'C) da abertura do regime militar, durante o governo de Costa e Silva.', 
                'D) da redemocratização do país, durante o governo de Ernesto Geisel.', 
                'E) da vigência do Ato Institucional número 5, durante o governo Médici.', 
                'e',
                'História',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (667, -- questão 27
                'A letra da música, respeitando a licença poética, retrata um fenômeno urbano presente nas grandes cidades que é a', 
                'A) expansão das favelas, pois a intenção do poder público é aumentar esse tipo de moradia, oferecendo infraestrutura adequada nas periferias mais distantes do centro.', 
                'B) falta de moradias, pois as grandes cidades estão saturadas e não possuem imóveis disponíveis, seja para compra, disponibilização, financiamento ou aluguel.', 
                'B) falta de moradias, pois as grandes cidades estão saturadas e não possuem imóveis disponíveis, seja para compra, disponibilização, financiamento ou aluguel.', 
    'D) violência urbana, 
                pois os governantes deixaram de investir na ampliação do número de policiais, fazendo explodir a criminalidade nas grandes cidades.', 
                'E) especulação imobiliária, pois alguns proprietários acumulam imóveis para utilizá-los futuramente, seja para construir ou para vender.', 
                'e',
                'Geografia',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (668, -- questão 28
                'Podemos afirmar que os termos “comida, diversão e arte”, nesse trecho, exercem sintaticamente a função de', 
                'A) complemento nominal.', 
                'B) sujeito composto.', 
                'C) objeto indireto.', 
                'D) objeto direto.', 
                'E) aposto.', 
                'd',
                'Português',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (669, -- questão 29
                'Refletindo sobre a letra da canção de Chico Science, é correto associá-la aos conceitos de', 
                'A) economia planificada e estatização.', 
                'B) luta de classes e globalização.', 
                'C) êxodo rural e imigração.', 
                'D) sedentarismo e colonização.', 
                'E) antropocentrismo e socialização.', 
                'b',
                'Sociologia',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (670, -- questão 30
                'A cobertura e as laterais da tenda descrita serão totalmente revestidas por lona. Para que isso ocorra, a quantidade mínima de lona que deverá ser usada é, em metros quadrados, igual a', 
                'A) 138.', 
                'B) 384.', 
                'C) 720.', 
                'D) 1 104.', 
                'E) 1 200.', 
                'd',
                'Matemática',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (671, -- questão 31
                'A quantidade de cabo utilizada para imobilizar as oito estacas, é, em metros,', 
                '(A) 16√2.', 
                '(B) 24√2.', 
                '(C) 32√2.', 
                '(D) 40√2.', 
                '(E) 48√2.', 
                'c',
                'Matemática',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (672, -- questão 32
                'Assim sendo, o raio do globo é, aproximadamente, em metros,', 
                '(A) 5,6.', 
                '(B) 6,3.', 
                '(C) 7,5.', 
                '(D) 8,2.', 
                '(E) 9,8.', 
                'a',
                'Matemática',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (673, -- questão 33
                'De acordo com as informações do texto, é correto afirmar que o Masp', 
                'A) reúne 19 obras pintadas por Chateaubriand.', 
                'B) foi doado pela Rainha Elizabeth II a São Paulo.', 
                'C) está aberto ao público de domingo a domingo.', 
                'D) tem a maior parte do seu acervo dedicada a artistas brasileiros.', 
                'E) passou por obras que modificaram o seu formato original.', 
                'e',
                'História',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (674, -- questão 34
                'Na imagem, temos representada uma molécula de glicose, cuja fórmula molecular é', 
                'A) C₅H₆O₇', 
                'B) C₆H₆O₆', 
                'C) C₆H₁₂O₆', 
                'D) C₁₂H₂₂O₁₁', 
                'E) C₁₂H₂₂O₁₂', 
                'c',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (675, -- questão 35
                'Com base apenas nos dados apresentados nessa tabela, pode-se afirmar corretamente que', 
                'A) a maioria das cidades citadas está situada no continente americano.', 
                'B) as cinco exposições na Ásia, dentre as dez mais populares, tiveram entrada franca.', 
                'C) a exposição mais visitada teve mais que o quádruplo de visitantes que a exposição brasileira menos visitada.', 
                'D) o Brasil aparece em quatro das dez exposições mais populares do ano passado, de acordo com o número diário de visitantes.', 
                'E) a exposição “Impressionismo: Paris e a Modernidade”, no Rio de Janeiro, ficou montada por menos tempo que a exposição “Dalí”, em Paris.', 
                'e',
                'Geografia',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (676, -- questão 36
                'De acordo com o texto, é correto o que se afirma em:', 
                'A) Os restauradores acreditavam que os químicos possuíam sensibilidade para tratar a obra de arte.', 
                'B) De acordo com Humphry, as guerras geraram um forte sentimento de preservação das obras artísticas.', 
                'C) Os químicos eram muito requisitados para restaurações, pois suas intervenções eram sempre perfeitas.', 
                'D) Os monumentos e obras artísticas destruídos pelas guerras mundiais foram um passo importante para a união da arte com a ciência.', 
                'E) De acordo com Poincaré, o cientista estuda a natureza porque ela é muito útil, não porque gosta; estuda-a porque é necessário e não porque ela é bela.', 
                'd',
                'História',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (677, -- questão 37
                'Assim sendo, pode-se concluir que a quantidade de visitantes que pagou meia entrada nesse dia foi de', 
                '(A) 600 pessoas.', 
                '(B) 650 pessoas.', 
                '(C) 700 pessoas.', 
                '(D) 750 pessoas.', 
                '(E) 800 pessoas.', 
                'a',
                'Matemática',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (678, -- questão 38
                'De acordo com a norma-padrão da língua portuguesa, está correta a alternativa:', 
                'A) Naquela região, muitos assinantes preferem o rádio à TV.', 
                'B) À partir das vinte e três horas, ninguém entrava no teatro.', 
                'C) Os funcionários do museu obedeceram os regulamentos.', 
                'D) Lembrou-se que levaria a mãe à Bienal na cidade de São Paulo.', 
                'E) Assistimos à diversos documentários sobre a Primeira Guerra.',
                'a',
                'Português',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (679, -- questão 39
                'De acordo com o texto, é correto afirmar que Mendeleev foi', 
                'A) opositor à construção da Tabela Periódica.', 
                'B) introduzido ao mundo das artes pela primeira esposa.', 
                'C) quem descobriu o elemento químico de número atômico 101.', 
                'D) merecidamente reconhecido, graças à sua audácia e ideias ousadas.', 
                'E) o nome dado a um composto químico para homenagear esse grande cientista.', 
                'd',
                'História',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (680, -- questão 40
                'A diferença entre os radioisótopos mencionados é de', 
                'A) 2 prótons.', 
                'B) 2 elétrons.', 
                'C) 2 nêutrons.', 
                'D) 157 nêutrons.', 
                'E) 159 nêutrons.', 
                'c',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (681, -- questão 41
                'Com base nessas informações, é correto afirmar que a intensidade da força exercida por um único homem é, em newtons,', 
                'A) 180.', 
                'B) 240.', 
                'C) 360.', 
                'D) 480.', 
                'E) 500.', 
                'b',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (682, -- questão 42
                'Assinale a alternativa que associa corretamente o agente modelador do relevo, o nome da erosão e sua ação.',
                'A) Opção A',
                'B) Opção B',
                'C) Opção C',
                'D) Opção D',
                'E) Opção E',
                'd',
                'Geografia',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (683, -- questão 43
                'Para que o móbile permaneça equilibrado, conforme a figura, a barra maior que sustenta todo o conjunto deve receber um fio que a pendure, atado ao ponto numerado por', 
                'A) 1.', 
                'B) 2.', 
                'C) 3.', 
                'D) 4.', 
                'E) 5.', 
                'c',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (684, -- questão 44
                'Sobre o contexto histórico em que viveu Aleijadinho, é correto afirmar que foi o período', 
                'A) da colonização e do ciclo do ouro.', 
                'B) da colonização e do ciclo do pau-brasil.', 
                'C) do Primeiro Reinado e do ciclo do açúcar.', 
                'D) do Segundo Reinado e do ciclo do café.', 
                'E) da Regência Una e do ciclo da borracha.', 
                'a',
                'História',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (685, -- questão 45
                'Se a escultura apresentada tem uma massa de bronze igual a 300 g, para que essa massa aumente sua temperatura em 2 ºC, deve absorver uma quantidade de calor, em calorias, igual a',
                'A) 6.',
                'B) 18.',
                'C) 27.',
                'D) 36.',
                'E) 54.',
                'e',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (686, -- questão 46
                'Entre as principais medidas recomendadas para prevenir essa doença, destaca-se o uso de preservativos, a realização de exames periódicos e a vacinação. Sobre os benefícios relacionados ao uso dessa vacina, é correto afirmar que', 
                'A) acarreta a imunização contra vários tipos de doenças sexualmente transmissíveis, como gonorreia e AIDS.', 
                'B) substitui o uso de pílulas anticoncepcionais e imuniza também contra o HIV, vírus causador da AIDS.', 
                'C) provoca o aumento na taxa de hemácias específicas que garantem a imunização contra o HPV.', 
                'D) possui os anticorpos específicos prontos para atuar no processo de combate ao HPV.', 
                'E) induz a produção de anticorpos específicos na proteção do organismo contra o HPV.', 
                'e',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (687, -- questão 47
                'Em um determinado período do século XX, os três países citados fizeram parte', 
                'A) do Mercado Comum Europeu (MCE), bloco que deu origem à atual União Europeia.', 
                'B) da União das Repúblicas Socialistas Soviéticas (URSS), que se desintegrou em 1991.', 
                'C) da Organização do Tratado do Atlântico Norte (OTAN), que existe até os dias de hoje.', 
                'D) do bloco de países capitalistas do leste europeu (CEI), que integravam a antiga Iugoslávia.', 
                'E) do Movimento dos Países Não Alinhados (MNA), que propunha uma terceira via econômica.', 
                'b',
                'História',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (688, -- questão 48
                'É correto afirmar que, no período histórico em que Baderna chegou ao Brasil, o governo enfrentava', 
                'A) a Revolução Praieira.', 
                'B) a Guerra de Canudos.', 
                'C) a Revolta da Vacina.', 
                'D) a Inconfidência Mineira.', 
                'E) o Quilombo dos Palmares.', 
                'a',
                'História',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (689, -- questão 49
                'Sobre o ser vivo apresentado na tirinha, é correto afirmar que', 
                'A) é pluricelular e microscópico.', 
                'B) realiza a reprodução por meio do processo de fagocitose.', 
                'C) apresenta tecidos especializados à obtenção de alimento.', 
                'D) é autótrofo, pois se alimenta de fungos, bactérias e de outros microrganismos.', 
                'E) forma pseudópodes ou falsos-pés, relacionados à movimentação e à obtenção de alimento.', 
                'e',
                'Ciências',
                2015,
                1
                );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
        VALUES (690, -- questão 50
            'Na cena criada por Quino, está presente a intertextualidade, pois',
            'A) o humor surge em consequência da falta de dedicação e de empenho da faxineira no momento de realizar as tarefas da casa.',
            'B) a dona da casa é uma pessoa que aprecia pintura e possui várias obras de artistas cubistas em sua residência.',
            'C) as alterações realizadas pela faxineira na pintura de Picasso mantiveram a ideia original proposta pelo pintor para Guernica.',
            'D) o cartunista reproduz a famosa pintura de Picasso, inserindo-a em um novo contexto que é a sala em desordem de uma residência.',
            'E) a faxineira irrita-se com a sujeira deixada pelos adolescentes da casa os quais frequentemente realizam festas para os amigos.',
            'd',
            'Português',
            2015,
            1
        );

-- INSERT TABLE tbIMAGENS PROVA 2015 1 SEMESTRE
    INSERT INTO tbImagens (cod_question, image_data)
        VALUES
            (641, 'imgs/txtQ1.PNG'),
            (642, 'imgs/txtQ2.PNG'),
            (643, 'imgs/txtQ3.PNG'),
            (644, 'imgs/txtQ4-5.PNG'),
            (646, 'imgs/txtQ6.PNG'),
            (647, 'imgs/txtQ7.PNG'),
            (648, 'imgs/txtQ8.PNG'),
            (649, 'imgs/txtQ9.PNG'),
            (649, 'imgs/txtQ9-1.PNG'),
            (650, 'imgs/txtQ10.PNG'),
            (651, 'imgs/txtQ11.PNG'),
            (651, 'imgs/txtQ11-1.PNG'),
            (652, 'imgs/txtQ12.PNG'),
            (652, 'imgs/txtQ12-1.PNG'),
            (652, 'imgs/txtQ12-2.PNG'),
            (653, 'imgs/txtQ13.PNG'),
            (654, 'imgs/txtQ14.PNG'),
            (655, 'imgs/txtQ15.PNG'),
            (656, 'imgs/txtQ16.PNG'),
            (656, 'imgs/txtQ16-1.PNG'),
            (657, 'imgs/txtQ17.PNG'),
            (658, 'imgs/txtQ18.PNG'),
            (659, 'imgs/txtQ19.PNG'),
            (659, 'imgs/txtQ19-1.PNG'),
            (660, 'imgs/txtQ20.PNG'),
            (661, 'imgs/txtQ21.PNG'),
            (661, 'imgs/txtQ21-1.PNG'),
            (662, 'imgs/txtQ22.PNG'),
            (663, 'imgs/txtQ23-25.PNG'),
            (663, 'imgs/txtQ23-25-1.PNG'),
            (666, 'imgs/txtQ26.PNG'),
            (667, 'imgs/txtQ27.PNG'),
            (668, 'imgs/txtQ28.PNG'),
            (669, 'imgs/txtQ29.PNG'),
            (670, 'imgs/txtQ30-31.PNG'),
            (671, 'imgs/txtQ31.PNG'),
            (672, 'imgs/txtQ32.PNG'),
            (673, 'imgs/txtQ33.PNG'),
            (674, 'imgs/txtQ34.PNG'),
            (674, 'imgs/txtQ34-1.PNG'),
            (675, 'imgs/txtQ35.PNG'),
            (676, 'imgs/txtQ36.PNG'),
            (677, 'imgs/txtQ37.PNG'),
            (679, 'imgs/txtQ39-40.PNG'),
            (680, 'imgs/txtQ40.PNG'),
            (681, 'imgs/txtQ41.PNG'),
            (681, 'imgs/txtQ41-1.PNG'),
            (682, 'imgs/txtQ42.PNG'),
            (683, 'imgs/txtQ43.PNG'),
            (684, 'imgs/txtQ44.PNG'),
            (685, 'imgs/txtQ45.PNG'),
            (685, 'imgs/txtQ45-1.PNG'),
            (686, 'imgs/txtQ46.PNG'),
            (687, 'imgs/txtQ47.PNG'),
            (687, 'imgs/txtQ47-1.PNG'),
            (688, 'imgs/txtQ48.PNG'),
            (689, 'imgs/txtQ49.PNG'),
            (690, 'imgs/txtQ50.PNG'),
            (690, 'imgs/txtQ50-1.PNG');

-- INSERT TABLE tbQUESTIONS PROVA 2015 2 SEMESTRE
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 1
        691,
        'De acordo com as características dessa crônica, é correto afirmar que se trata de um texto',
        'A) narrativo, pois conta um fato por meio das linguagens verbal e não verbal.',
        'B) narrativo, pois conta, em primeira pessoa, um fato que pode ser verídico ou fictício.',
        'C) narrativo, pois conta, em terceira pessoa, um fato que pode ser verídico ou fictício.',
        'D) descritivo, pois o autor argumenta a favor da eficiência do transporte aéreo.',
        'E) descritivo, pois o autor explora as características físicas das personagens.',
        'C',
        'Português',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 2
        692,
        'Segundo o texto, é correto afirmar que o narrador descreve “a estranha passageira” como uma mulher',
        'A) silenciosa, indiscreta e mal-humorada.',
        'B) discreta, elegante e mal-humorada.',
        'C) educada, tímida e impaciente.',
        'D) introvertida, agressiva e distraída.',
        'E) extrovertida, indelicada e indiscreta.',
        'B',
        'Português',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 3
        693,
        'Considerando o texto, é correto dizer que “a estranha passageira”',
        'A) exigiu que as aeromoças esclarecessem algumas dúvidas.',
        'B) omitiu do narrador o fato de nunca ter viajado de avião.',
        'C) era uma cliente assídua daquela companhia aérea.',
        'D) impossibilitou que o narrador desfrutasse do prazer da leitura.',
        'E) notou que alguns passageiros dispunham de assentos privilegiados.',
        'D',
        'Português',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 4
        694,
        'As formas verbais em destaque foram empregadas no modo indicativo e a respeito delas é correto afirmar que',
        'A) esquentara está no pretérito mais-que-perfeito e expressa incerteza sobre os fatos.',
        'B) esquentara está no pretérito imperfeito e expressa convicção sobre fatos futuros.',
        'C) percebi está no pretérito perfeito e expressa ação concluída no passado.',
        'D) apertava está no pretérito perfeito e expressa ação habitual e repetitiva.',
        'E) percebi está no pretérito imp',
        'C',
        'Português',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 5
        695,
        'Assinale a alternativa em que o verbo e o pronome, entre parênteses, substituem corretamente as expressões em destaque.',
        'A) O narrador transmitia calma e segurança à passageira. (transmitia-as)',
        'B) Ele não pôde ler o romance recém-adquirido. (ler-lhes)',
        'C) Antes da decolagem, os viajantes abriam jornais e revistas para se distrair. (abriam-os)',
        'D) Os outros passageiros fingiram ignorar os equívocos daquela senhora. (ignorar-lhes)',
        'E) A passageira arregalou os olhos ao descobrir a utilidade dos saquinhos. (arregalou-os)',
        'A',
        'Português',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 6
        696,
        'Esses trechos apresentam, respectivamente, os discursos',
        'A) direto, direto e direto.',
        'B) direto, direto e indireto.',
        'C) direto, indireto e direto.',
        'D) indireto, direto e indireto.',
        'E) indireto, direto e direto.',
        'B',
        'Português',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 7
        697,
        'Uma doença infecciosa que pode ser prevenida com o extermínio de mosquitos transmissores é',
        'A) a catapora.',
        'B) a caxumba.',
        'C) a malária.',
        'D) a meningite.',
        'E) o sarampo.',
        'C',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 8
        698,
        'De acordo com a distribuição da malha rodoviária federal pavimentada, pode-se afirmar corretamente que,',
        'A) em 2004, a região Sul contava com 22,2% da extensão dessa malha.',
        'B) em 2014, a extensão dessa malha na região Centro-Oeste era de 8 235 km.',
        'C) no período de 2004 a 2014, no Brasil, essa malha teve um crescimento de 19,7%.',
        'D) em 2004 e em 2014, a região Sudeste, apresenta a maior participação na extensão dessa malha.',
        'E) no período de 2004–2014, a região Norte, apesar da menor extensão, apresentou o maior crescimento dessa malha.',
        'C',
        'Geografia',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 9
        699,
        'Esse processo causa grandes transtornos à agricultura e à pecuária. A respeito das formigas cortadeiras, é correto afirmar que',
        'A) comem as plantas que cortam.',
        'B) possuem quatro pares de patas locomotoras.',
        'C) produzem seu próprio alimento por serem autótrofas.',
        'D) apresentam o corpo dividido em cabeça, tórax e abdome.',
        'E) realizam parasitismo quando interagem com os fungos do formigueiro.',
        'A',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 10
        700,
        'Nessas condições, a componente vertical da tração a que cada ponto de fixação das alças é submetido será, em newtons,',
        'A) 120.',
        'B) 150.',
        'C) 1 200.',
        'D) 1 500.',
        'E) 3 000.',
        'D',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 11
        701,
        'Entre os produtos que são transportados por minerodutos estão',
        'A) gás natural e gás liquefeito de petróleo.',
        'B) sal-gema e concentrado fosfático.',
        'C) óleo combustível e álcool.',
        'D) gasolina e biodiesel.',
        'E) querosene e nafta.',
        'B',
        'Geografia',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 12
        702,
        'Sobre o texto é correto afirmar que',
        'A) a oxiemoglobina se forma quando o sangue passa pelos capilares sanguíneos de todos os tecidos do corpo humano.',
        'B) a proteína hemoglobina encontra-se no interior dos glóbulos vermelhos e é responsável pela coagulação do sangue.',
        'C) o gás carbônico reage com substâncias orgânicas que se encontram no interior das células, a fim de liberar energia necessária aos processos vitais.',
        'D) as hemácias possuem a proteína hemoglobina, a qual se combina com o gás oxigênio do ar que chega aos alvéolos pulmonares.',
        'E) os glóbulos brancos e as substâncias orgânicas desempenham importante função no transporte dos gases respiratórios.',
        'D',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 13
        703,
        'Sobre o processo de respiração celular mencionado no texto, pode-se afirmar corretamente que as organelas citoplasmáticas, responsáveis pela oxidação das substâncias orgânicas, recebem o nome de',
        'A) lisossomos.',
        'B) mitocôndrias.',
        'C) ribossomos.',
        'D) centríolos.',
        'E) vacúolos.',
        'B',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 14
        704,
        'O gás transportado pela hemoglobina dos tecidos para o pulmão é o',
        'A) CO, denominado óxido de carbono.',
        'B) CO, denominado monóxido de carbono.',
        'C) CO₂, denominado dióxido de carbono.',
        'D) CO₂, denominado monóxido de carbono.',
        'E) CO₂, denominado trióxido de carbono.',
        'C',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 15
        705,
        'Assim sendo, o volume de areia, em metros cúbicos, é',
        'A) 9,44.',
        'B) 9,82.',
        'C) 10,24.',
        'D) 10,56.',
        'E) 10,78.',
        'D',
        'Matemática',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 16
        706,
        'Considere que uma encomenda de 2 metros cúbicos de areia fina foi orçada em R$ 450,00. Nessas condições, a distância entre o ponto de distribuição de areia e o local da entrega é, em quilômetros,',
        'A) 15.',
        'B) 30.',
        'C) 45.',
        'D) 60.',
        'E) 75.',
        'D',
        'Matemática',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 17
        707,
        'De acordo com o texto, é correto afirmar que',
        'A) a ocorrência de acidentes no Brasil é muito rara porque foi adotada uma legislação específica e rigorosa.',
        'B) o Brasil adotou uma legislação moderada em relação ao transporte de produtos químicos por via rodoviária.',
        'C) os rótulos de risco trazem os números ONU na linha superior, que identificam o produto de acordo com a listagem de produtos perigosos.',
        'D) a CETESB mantém um serviço de informações via telefone para auxiliar nas ocorrências envolvendo substâncias químicas nas estradas brasileiras.',
        'E) a ONU legisla sobre o transporte de produtos perigosos por meio de um comitê que relaciona os produtos perigosos à números, denominados número ONU.',
        'C',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 18
        708,
        'Pela análise do texto e dos painéis de segurança representados no caminhão, conclui-se corretamente que os números ONU',
        'A) 30 e 33 significam que o veículo transporta um único produto químico.',
        'B) 30 e 33 significam que o veículo transporta produtos químicos diferentes.',
        'C) 30 e 1993 significam que o veículo transporta produtos químicos diferentes.',
        'D) 1993 e 1999 significam que o veículo transporta um único produto químico.',
        'E) 1993 e 1999 significam que o veículo transporta produtos químicos diferentes.',
        'E',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 19
        709,
        'Completado o plano de voo, a aeronave estará sobre o estado',
        'A) da Bahia.',
        'B) de São Paulo.',
        'C) de Tocantins.',
        'D) de Minas Gerais.',
        'E) do Rio Grande do Sul.',
        'B',
        'Geografia',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 20
        710,
        'A água desse rio, na região do acidente, apresentou-se',
        'A) neutra, pela ionização do ácido na água.',
        'B) ácida, pela ionização do ácido na água.',
        'C) ácida, pela neutralização da água.',
        'D) básica, pela neutralização da água.',
        'E) básica, pela dissociação da base na água.',
        'D',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 21
        711,
        'Assinale a alternativa correta sobre o processo descrito no texto.',
        'A) O transporte de pólen entre os vegetais da caatinga depende exclusivamente de morcegos.',
        'B) Os morcegos da caatinga são aves noturnas que se alimentam do sangue de animais dessa região.',
        'C) As características das flores da caatinga não possuem relação com a polinização realizada pelos morcegos.',
        'D) Os grãos de pólen transportados pelos morcegos entre plantas de espécies diferentes caracterizam a autopolinização.',
        'E) A polinização cruzada ocorre entre uma planta e outra da mesma espécie, aumentando a variabilidade genética nos descendentes.',
        'D',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 22
        712,
        'Nesse processo de eletrização, os grãos e a esteira ficam carregados com cargas elétricas de sinais',
        'A) iguais, eletrizados por atrito.',
        'B) iguais, eletrizados por contato.',
        'C) opostos, eletrizados por atrito.',
        'D) opostos, eletrizados por contato.',
        'E) opostos, eletrizados por indução.',
        'C',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 23
        713,
        'Sobre essas plantas é correto afirmar que',
        'A) possuem raízes desenvolvidas, flores e frutos.',
        'B) são visíveis apenas com o auxílio de microscópio.',
        'C) desenvolvem estruturas especiais para a produção das sementes.',
        'D) têm pequeno porte e se caracterizam pela ausência de vasos condutores de seiva.',
        'E) parasitam outras plantas das quais retiram os nutrientes necessários para sua sobrevivência.',
        'A',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 24
        714,
        'É correto afirmar que, durante a subida da cápsula da câmara até a superfície, a velocidade média da Fênix 2 foi, aproximadamente,',
        'A) 0,7 km/h.',
        'B) 2,6 km/h.',
        'C) 3,4 km/h.',
        'D) 3,6 km/h.',
        'E) 4,4 km/h.',
        'D',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 25
        715,
        'Essa corrente é um dos fatores responsáveis',
        'A) pelo fenômeno das monções, na Ásia.',
        'B) pelo aquecimento da costa da Noruega, na Europa.',
        'C) pela existência do deserto do Atacama, na América do Sul.',
        'D) pela exuberância da flora na ilha de Madagascar, na África.',
        'E) pela imensa quantidade de chuvas no arquipélago do Havaí, na Oceania.',
        'A',
        'Geografia',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 26
        716,
        'Sobre essas embarcações, é correto afirmar que seu uso foi predominante no período',
        'A) contemporâneo, nas migrações dos chamados povos bárbaros.',
        'B) medieval, com a expansão do Império de Alexandre, o Grande.',
        'C) moderno, nas expedições portuguesas e espanholas.',
        'D) da Segunda Revolução Industrial, no século XX.',
        'E) da expansão do Império Romano, no século II.',
        'C',
        'História',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 27
        717,
        'O Canal do Panamá permite a interligação entre os oceanos',
        'A) Glacial Ártico e Índico.',
        'B) Atlântico e Pacífico.',
        'C) Índico e Pacífico.',
        'D) Índico e Atlântico.',
        'E) Pacífico e Glacial Ártico.',
        'B',
        'Geografia',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 28
        718,
        'Considere que entraram 100 kg da água do lago no aqueduto. Após essa massa de água ter percorrido o aqueduto, a energia cinética com que ela chegou ao reservatório foi, em joules, de',
        'A) 100.',
        'B) 200.',
        'C) 1 000.',
        'D) 2 000.',
        'E) 20 000.',
        'D',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 29
        719,
        'Esse deslocamento cotidiano é conhecido como migração',
        'A) sazonal.',
        'B) pendular.',
        'C) permanente.',
        'D) inter-regional.',
        'E) de transumância.',
        'B',
        'Geografia',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 30
        720,
        'Na cadeia alimentar descrita no texto, o peixe-leão comporta-se como',
        'A) produtor.',
        'B) decompositor.',
        'C) consumidor primário.',
        'D) consumidor secundário.',
        'E) consumidor primário e secundário.',
        'D',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 31
        721,
        'A expressão que completa de modo correto essa afirmação é',
        'A) maior volume.',
        'B) maior densidade.',
        'C) maior temperatura.',
        'D) menor calor específico.',
        'E) menor capacidade térmica.',
        'D',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 32
        722,
        'De acordo com os dados da tabela, sobre o transporte de africanos para o Brasil, é correto concluir que',
        'A) mais de 2 milhões de africanos embarcaram entre 1601 e 1800.',
        'B) a Amazônia não recebeu africanos escravizados no século XVIII.',
        'C) Bahia e Pernambuco eram o destino da maior parte dessas pessoas.',
        'D) o maior número de africanos destinados ao Sudeste embarcou no século XIX.',
        'E) a região Sudeste sempre foi o destino da maior parte das pessoas que embarcaram.',
        'C',
        'História',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 33
        723,
        'Assinale a alternativa que corresponde corretamente aos agentes e ao movimento referido.',
        'A) Cavaleiros transportando mercadorias do Pantanal.',
        'B) Bandeirantes à procura de índios, ouro e pedras preciosas.',
        'C) Tropeiros, com mulas, cavalos e bois, transportando mercadorias.',
        'D) Viajantes em cavalos e mulas, para transportar ouro e pedras preciosas.',
        'E) Navegantes em pequenas embarcações, para explorar a costa do sul do Brasil.',
        'B',
        'História',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 34
        724,
        'A análise da figura nos permite concluir corretamente que, nessa sequência,',
        'A) ocorre a troca de íons positivos por íons negativos na célula.',
        'B) para cada dois ânions que entram na célula, três cátions saem.',
        'C) o número de íons positivos que entram e saem da célula é igual.',
        'D) os íons de sódio entram na célula, enquanto os íons de potássio saem.',
        'E) a cada três íons de sódio que saem da célula, dois íons de potássio entram.',
        'D',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 35
        725,
        'O texto nos permite concluir corretamente que',
        'A) o citoplasma controla as concentrações dos íons, capturando íons sódio e bombeando-os para fora da célula.',
        'B) o transporte ativo permite fluxo de substâncias e íons do meio mais concentrado para o menos concentrado.',
        'C) a alta concentração de sódio dentro da célula é importante para a síntese proteica e para a respiração.',
        'D) o equilíbrio osmótico é mantido pelo bombeamento de íons de sódio do meio intracelular.',
        'E) a concentração de potássio é maior no meio extracelular do que no meio intracelular.',
        'A',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 36
        726,
        'Os íons, presentes no transporte ativo, formam com íons de cloro (cloreto) os compostos iônicos cloreto de sódio e cloreto de potássio, cujas fórmulas são, respectivamente:',
        'A) NaCl e KCl.',
        'B) NaCl₂ e KCl₂.',
        'C) Na₂Cl e K₂Cl.',
        'D) NaCl e K₂Cl.',
        'E) Na₂Cl e KCl.',
        'A',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 37
        727,
        'Nas condições apresentadas, cada ônibus equivale',
        'A) à retirada de 72 carros das ruas, pois transporta 72 passageiros.',
        'B) à retirada de 90 bicicletas das ruas, pois transporta 72 passageiros.',
        'C) a 54 carros em termos de área urbana ocupada.',
        'D) a 24 bicicletas em termos de área urbana ocupada.',
        'E) a 216 bicicletas em termos de área urbana ocupada.',
        'A',
        'Matemática',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 38
        728,
        'O acúmulo desses sedimentos nos rios e lagos constitui o processo denominado',
        'A) assoreamento.',
        'B) epirogênese.',
        'C) vulcanismo.',
        'D) tectonismo.',
        'E) orogênese.',
        'A',
        'Geografia',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 39
        729,
        'Assinale a alternativa que corresponde corretamente às informações e ao país citados no texto.',
        'A) Os Emirados Árabes, grandes exportadores de petróleo, têm o principal aeroporto internacional do mundo.',
        'B) Dubai é um país da Liga Árabe que está procurando se impor religiosamente aos demais da sua região.',
        'C) Os Emirados Árabes têm o segundo maior aeroporto internacional do mundo, depois da Inglaterra.',
        'D) Os Emirados Árabes, aliados de Irã e Iraque, estão sob intervenção militar dos Estados Unidos.',
        'E) Dubai é uma cidade da Arábia Saudita, foco de graves conflitos religiosos e econômicos.',
        'A',
        'Geografia',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 40
        730,
        'De acordo com as informações relativas ao esquema, o número máximo de estais que estão fixados do ponto A ao ponto B e que têm a outra extremidade na semirreta BC é',
        'A) 7.',
        'B) 9.',
        'C) 11.',
        'D) 13.',
        'E) 15.',
        'D',
        'Matemática',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 41
        731,
        'A distância entre os pontos E e C é, em metros,',
        'A) 6.',
        'B) 8.',
        'C) 10.',
        'D) 12.',
        'E) 14.',
        'C',
        'Matemática',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 42
        732,
        'Sabendo que Guarulhos segue o horário de Brasília (GMT –3, ou seja, menos três horas em relação ao meridiano central Greenwich), quando Carlos Frederico desembarcou em Londres, os relógios dessa cidade marcavam',
        'A) 6 horas.',
        'B) 9 horas.',
        'C) 11 horas.',
        'D) 17 horas.',
        'E) 20 horas.',
        'B',
        'Geografia',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 43
        733,
        'A figura de linguagem predominante nesse trecho da letra da música é',
        'A) eufemismo, pois o eu lírico se revolta contra a tristeza e a dor da separação.',
        'B) catacrese, pois a palavra trem foi empregada em sentido próprio para designar meio de transporte.',
        'C) hipérbole, pois faz referência aos inúmeros trens que chegam e que partem da estação.',
        'D) antítese, pois há referência aos encontros e às despedidas, situações opostas que fazem parte da vida.',
        'E) anáfora, pois o compositor evita repetir vocábulos a fim de dar mais fluidez e lirismo aos versos.',
        'D',
        'Português',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 44
        734,
        'A prosperidade e desenvolvimento da Europa nesse período podem ser atribuídos, principalmente,',
        'A) às guerras e conflitos com países americanos.',
        'B) à disputa por hegemonia com os Estados Unidos.',
        'C) às excelentes condições de trabalho nas fábricas.',
        'D) aos empréstimos obtidos de países como o Japão.',
        'E) à corrida imperialista, explorando recursos de colônias.',
        'E',
        'História',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 45
        735,
        'Admitindo-se que não haja atrito entre as laterais da caixa de creme dental, em que se desenhou o vagão, e a caixa de papelão, para se obter o efeito de levitação e ainda um pequeno movimento horizontal do vagão sempre para a esquerda, em relação à figura desenhada, a disposição dos ímãs permanentes, no interior da caixa de papelão, deve ser a que se encontra representada em:',
        'A) Opção A',
        'B) Opção B',
        'C) Opção C',
        'D) Opção D',
        'E) Opção E',
        'A',
        'Ciências',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 46
        736,
        'Nessas condições, o ângulo de inclinação desse trecho da rua Baldwin é mais próximo de',
        'A) 12°',
        'B) 15°',
        'C) 19°',
        'D) 21°',
        'E) 24°',
        'B',
        'Matemática',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 47
        737,
        'De acordo com o texto, o serviço de transporte de passageiros nos trens de longo percurso modificou-se, entre as décadas de 1970 e 1990, em consequência da',
        'A) ausência de iniciativas que beneficiassem o setor ferroviário.',
        'B) concorrência com o setor aeroviário iniciada em 1945.',
        'C) expansão dos serviços de transporte hidroviários.',
        'D) criação de novas linhas e serviços ferroviários.',
        'E) falta de incentivos à indústria automobilística.',
        'D',
        'História',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 48
        738,
        'A função de linguagem predominante nesse texto é',
        'A) fática, pois a mensagem está centrada no canal, objetivando prolongar o contato.',
        'B) metalinguística, pois influencia o interlocutor, de forma apelativa, indutiva.',
        'C) referencial, pois transmite uma informação objetiva, expõe dados da realidade.',
        'D) conativa, pois a mensagem busca influenciar o receptor, de forma apelativa.',
        'E) poética, pois a mensagem está centrada na elaboração da linguagem.',
        'C',
        'Português',
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 49
        739,
        'Considerando a letra da música, conclui-se corretamente que o jongo',
        'A) não é acompanhado por instrumentos musicais.',
        'B) não se difundiu para além da região de Angola.',
        'C) era um castigo imposto a africanos rebeldes.',
        'D) é de origem angolana e era cantado à noite.',
        'E) é uma forma de luta semelhante à capoeira.',
        'D',
        'História',        
        2015,
        2
    );
    INSERT INTO tbQuestions(cod_question, text_question, option_a, option_b, option_c, option_d, option_e, correct_option, materia, exam_year, semestre) 
    VALUES ( -- questão 50
        740,
        'Considerando a charge e as consequências e transtornos que os grandes congestionamentos causam, é correto concluir que',
        'A) a irritação pela qual passam os motoristas nos congestionamentos nas grandes cidades pode ser resolvida pelo uso do telefone celular durante o ato de dirigir, pois isso diminui o risco de acidentes.',
        'B) o problema dos congestionamentos das grandes cidades se resolve com a desapropriação de áreas públicas para a expansão da malha viária e o estreitamento das ruas e avenidas.',
        'C) o uso do automóvel permitiu a contração do perímetro urbano das grandes cidades, em função da construção de grandes avenidas, viadutos e anéis viários em seu entorno.',
        'D) os círculos publicitários abrem nas grandes cidades empresas especializadas na fabricação de veículos, explorando o status que o automóvel naturalmente oferece.',
        'E) o aumento da frota de automóveis em circulação nas grandes cidades gera acréscimo nas despesas governamentais com a saúde pública.',
        'E',
        'Geografia',        
        2015,
        2
    );

-- INSERT TABLE tbIMAGENS PROVA 2015 2 SEMESTRE
    INSERT INTO tbImagens (cod_question, image_data)
        VALUES
            (691, 'imgs2/txtQ1-6.PNG'),
            (696, 'imgs2/txtQ6.PNG'),
            (697, 'imgs2/txtQ7.PNG'),
            (698, 'imgs2/txtQ8.PNG'),
            (699, 'imgs2/txtQ9.PNG'),
            (699, 'imgs2/txtQ9-1.PNG'),
            (700, 'imgs2/txtQ10.PNG'),
            (700, 'imgs2/txtQ10-1.PNG'),
            (701, 'imgs2/txtQ11.PNG'),
            (701, 'imgs2/txtQ11-1.PNG'),
            (702, 'imgs2/txtQ12-14.PNG'),
            (705, 'imgs2/txtQ15.PNG'),
            (706, 'imgs2/txtQ16.PNG'),
            (707, 'imgs2/txtQ17-18.PNG'),
            (709, 'imgs2/txtQ19.PNG'),
            (710, 'imgs2/txtQ20.PNG'),
            (711, 'imgs2/txtQ21.PNG'),
            (712, 'imgs2/txtQ22.PNG'),
            (712, 'imgs2/txtQ22-1.PNG'),
            (713, 'imgs2/txtQ23.PNG'),
            (714, 'imgs2/txtQ24.PNG'),
            (715, 'imgs2/txtQ25.PNG'),
            (716, 'imgs2/txtQ26.PNG'),
            (716, 'imgs2/txtQ26-1.PNG'),
            (717, 'imgs2/txtQ27.PNG'),
            (718, 'imgs2/txtQ28.PNG'),
            (718, 'imgs2/txtQ28-1.PNG'),
            (719, 'imgs2/txtQ29.PNG'),
            (720, 'imgs2/txtQ30.PNG'),
            (721, 'imgs2/txtQ31.PNG'),
            (722, 'imgs2/txtQ32.PNG'),
            (723, 'imgs2/txtQ33.PNG'),
            (724, 'imgs2/txtQ34-36.PNG'),
            (724, 'imgs2/txtQ34-36-1.PNG'),
            (724, 'imgs2/txtQ34-36-2.PNG'),
            (727, 'imgs2/txtQ37.PNG'),
            (728, 'imgs2/txtQ38.PNG'),
            (729, 'imgs2/txtQ39.PNG'),
            (730, 'imgs2/txtQ40-41.PNG'),
            (732, 'imgs2/txtQ42.PNG'),
            (732, 'imgs2/txtQ42-1.PNG'),
            (733, 'imgs2/txtQ43.PNG'),
            (733, 'imgs2/txtQ43-1.PNG'),
            (734, 'imgs2/txtQ44.PNG'),
            (735, 'imgs2/txtQ45.PNG'),
            (735, 'imgs2/txtQ45-1.PNG'),
            (736, 'imgs2/txtQ46.PNG'),
            (737, 'imgs2/txtQ47.PNG'),
            (738, 'imgs2/txtQ48.PNG'),
            (739, 'imgs2/txtQ49.PNG'),
            (740, 'imgs2/txtQ50.PNG');