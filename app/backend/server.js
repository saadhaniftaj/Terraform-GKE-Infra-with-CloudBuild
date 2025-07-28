const express = require('express');
const { Pool } = require('pg');
const app = express();
const port = 3000;

const pool = new Pool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: 5432,
});

app.get('/health', (req, res) => res.status(200).send('OK'));

app.get('/data', async (req, res) => {
  try {
    const client = await pool.connect();
    await client.query('CREATE TABLE IF NOT EXISTS data (id SERIAL PRIMARY KEY, value TEXT)');
    await client.query('INSERT INTO data (value) VALUES ($1) ON CONFLICT DO NOTHING', ['Sample Data']);
    const result = await client.query('SELECT * FROM data');
    client.release();
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Database error' });
  }
});

app.listen(port, () => console.log(`Backend running on port ${port}`));
