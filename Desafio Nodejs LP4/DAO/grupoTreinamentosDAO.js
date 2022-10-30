import database from './database.js'

export function inserir(dados) {
    return database.insert(dados).into('GRUPO_TREINAMENTOS');
}

export function consultarTodos() {
    return database.select().table('GRUPO_TREINAMENTOS');
}

export function consultarUm(id) {
    return database.select().where({ ID: id }).table('GRUPO_TREINAMENTOS');
}

export function deletar(id) {
    return database.where({ ID: id }).delete().table('GRUPO_TREINAMENTOS');
}

export function alterar(json) {
    return database.where({ ID: json.ID })
        .update(json)
        .table('GRUPO_TREINAMENTOS');
}