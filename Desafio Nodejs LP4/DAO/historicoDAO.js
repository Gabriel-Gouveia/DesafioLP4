import database from './database.js'

export function inserir(dados) {
    return database.insert(dados).into('HISTORICO');
}

export function consultarTodos() {
    return database.select().table('HISTORICO');
}

export function consultarUm(id) {
    return database.select().where({ ID: id }).table('HISTORICO');
}

export function deletar(id) {
    return database.where({ ID: id }).delete().table('HISTORICO');
}

export function alterar(json) {
    return database.where({ ID: json.ID })
        .update(json)
        .table('HISTORICO');
}