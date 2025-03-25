<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $imagem_docker = $_POST['imagem_docker'];
    $aplicacao_externa = $_POST['aplicacao_externa'];

    // Fazer uma requisição para a aplicação externa
    $url = "http://frontend:3000/api/atualizar"; // URL do outro container
    $data = [
        "imagem_docker" => $imagem_docker,
        "aplicacao_externa" => $aplicacao_externa
    ];

    $options = [
        "http" => [
            "header"  => "Content-Type: application/json",
            "method"  => "POST",
            "content" => json_encode($data),
        ]
    ];

    $context = stream_context_create($options);
    $result = file_get_contents($url, false, $context);

    echo "<p>Resposta da aplicação externa: $result</p>";
}
?>

<form action="" method="post">
    <label for="imagem_docker">Imagem Docker:</label>
    <input type="text" id="imagem_docker" name="imagem_docker" value="<?php echo $imagem_docker; ?>">
    <br>
    <label for="aplicacao_externa">Aplicação Externa:</label>
    <input type="text" id="aplicacao_externa" name="aplicacao_externa" value="<?php echo $aplicacao_externa; ?>">
    <br>
    <input type="submit" value="Atualizar">
</form>
