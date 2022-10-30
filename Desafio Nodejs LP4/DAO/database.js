import knex from 'knex';

// Por favor, altere as configurações do banco:
const conexao = knex({
    client: 'mysql2', // Mantenha esse client
    connection: {
        host:'127.0.0.1', // Mantenha esse IP
        port: 3306, // Veja se a porta é a mesma para você, mas a porta é padrão.
        user: 'root',
        password: '1234',
        database: 'DesafioLP4' // Mantenha esse banco
    }
});

export default conexao;