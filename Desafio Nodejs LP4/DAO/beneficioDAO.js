import database from './database.js'

export function inserir(dados) {
    return database.insert(dados).into('BENEFICIO');
}

export function consultarTodos() {
    return database.select().table('BENEFICIO');
}

export function consultarUm(id) {
    return database.select().where({ ID: id }).table('BENEFICIO');
}

export function deletar(id) {
    return database.where({ ID: id }).delete().table('BENEFICIO');
}

export function alterar(json) {
    return database.where({ ID: json.ID })
        .update(json)
        .table('BENEFICIO');
}