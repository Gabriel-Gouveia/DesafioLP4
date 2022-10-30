import database from './database.js'

export function inserir(dados) {
    return database.insert(dados).into('PLANO_EVOLUCAO');
}

export function consultarTodos() {
    return database.select().table('PLANO_EVOLUCAO');
}

export function consultarUm(id) {
    return database.select().where({ ID: id }).table('PLANO_EVOLUCAO');
}

export function deletar(id) {
    return database.where({ ID: id }).delete().table('PLANO_EVOLUCAO');
}

export function alterar(json) {
    return database.where({ ID: json.ID })
        .update(json)
        .table('PLANO_EVOLUCAO');
}