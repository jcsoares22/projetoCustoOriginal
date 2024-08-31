const express = require('express');
const Firebird = require('node-firebird');
const bodyParser = require('body-parser');

const app = express();
const PORT = 5000;

const options = {
  host: '192.168.2.102',
  port: 3050,
  database: 'E:/programas/Custo/DADOS.FDB',
  user: 'SYSDBA',
  password: 'pmpsyfwr',
  role: null,
  pageSize: 4096
};

app.use(bodyParser.json()); // Para interpretar JSON no corpo da requisição

// Rota para obter dados
app.get('/get_data', (req, res) => {
  Firebird.attach(options, (err, db) => {
    if (err) {
      console.error('Erro ao conectar ao banco de dados:', err.message);
      res.status(500).json({ error: 'Erro ao conectar ao banco de dados' });
      return;
    }

    db.query('SELECT * FROM PRODUTOS', (err, result) => {
      if (err) {
        console.error('Erro ao executar a query:', err.message);
        res.status(500).json({ error: 'Erro ao executar a query' });
        db.detach();
        return;
      }

      res.json(result);
      db.detach();
    });
  });
});

// Rota para salvar dados
app.post('/save_produto', (req, res) => {
  const {
    CODIGO, DESCRICAO, COR, VALOR_PRODUTO,
    FOTO, PERC_LUCRO, PERC_LUCRO2, PERC_LUCRO3,
    COD_MARKETPLACE, CUSTO_TOTAL, CUSTO_TOTAL_VENDA,
    FRETE, CUSTO_TOTAL_DESPESA, VLR1, VLR2,
    VLR3, 
  } = req.body;

  // Verificar se todos os dados necessários foram fornecidos
  if (
    CODIGO == null || !DESCRICAO || !COR || !VALOR_PRODUTO ||
    !FOTO || !PERC_LUCRO || !PERC_LUCRO2 || !PERC_LUCRO3 ||
    !COD_MARKETPLACE || !CUSTO_TOTAL || !CUSTO_TOTAL_VENDA ||
    !FRETE || !CUSTO_TOTAL_DESPESA || !VLR1 || !VLR2 ||
    !VLR3 
  ) {
    console.error('Dados insuficientes:', req.body);
    return res.status(400).json({ error: 'Dados insuficientes' });
  }

  Firebird.attach(options, (err, db) => {
    if (err) {
      console.error('Erro ao conectar ao banco de dados:', err.message);
      res.status(500).json({ error: 'Erro ao conectar ao banco de dados' });
      return;
    }

    // Ajustar a instrução SQL para corresponder à estrutura da tabela
    const sql = `
      INSERT INTO usuario (
        CODIGO, DESCRICAO, COR, VALOR_PRODUTO, FOTO,
        PERC_LUCRO, PERC_LUCRO2, PERC_LUCRO3, COD_MARKETPLACE,
        CUSTO_TOTAL, CUSTO_TOTAL_VENDA, FRETE, CUSTO_TOTAL_DESPESA,
        VLR1, VLR2, VLR3, 
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    // Verificar se o número de parâmetros corresponde ao número de colunas
    const parameters = [
      CODIGO, DESCRICAO, COR, VALOR_PRODUTO,
      FOTO, PERC_LUCRO, PERC_LUCRO2, PERC_LUCRO3,
      COD_MARKETPLACE, CUSTO_TOTAL, CUSTO_TOTAL_VENDA,
      FRETE, CUSTO_TOTAL_DESPESA, VLR1, VLR2,
      VLR3, 
    ];

    db.query(sql, parameters, (err, result) => {
      if (err) {
        console.error('Erro ao executar a query:', err.message);
        console.error('SQL:', sql);
        console.error('Parâmetros:', parameters);
        res.status(500).json({ error: 'Erro ao executar a query' });
        db.detach();
        return;
      }

      res.json({ message: 'Dados salvos com sucesso!' });
      db.detach();
    });
  });
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
