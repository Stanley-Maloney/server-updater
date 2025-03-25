const { exec } = require("child_process");
const express = require("express");

const app = express();
const PORT = 3000;

// Função para rodar o script de atualização
const updateSystem = () => {
    console.log("🔄 Iniciando atualização...");
    exec("bash update.sh", (error, stdout, stderr) => {
        if (error) {
            console.error(`❌ Erro: ${error.message}`);
            return;
        }
        if (stderr) {
            console.error(`⚠️ Erro: ${stderr}`);
            return;
        }
        console.log(`✅ Saída: ${stdout}`);
    });
};

// Criar rota para atualizar manualmente
app.get("/update", (req, res) => {
    updateSystem();
    res.send("🔄 Atualização iniciada! Confira o terminal.");
});

// Iniciar servidor
app.listen(PORT, () => console.log(`🚀 Servidor rodando em http://localhost:${PORT}`));
