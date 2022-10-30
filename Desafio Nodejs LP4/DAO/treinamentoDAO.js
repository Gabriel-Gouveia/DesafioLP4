import database from './database.js'

export function inserir(dados) {
    return database.insert(dados).into('TREINAMENTO');
}

export function consultarTodos() {
    return database.select().table('TREINAMENTO');
}

export function consultarUm(id) {
    return database.select().where({ ID: id }).table('TREINAMENTO');
}

export function deletar(id) {
    return database.where({ ID: id }).delete().table('TREINAMENTO');
}

export function alterar(json) {
    return database.where({ ID: json.ID })
        .update(json)
        .table('TREINAMENTO');
}