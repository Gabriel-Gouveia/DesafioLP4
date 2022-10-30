import database from './database.js'

export function inserir(dados) {
    return database.insert(dados).into('FEEDBACK');
}

export function consultarTodos() {
    return database.select().table('FEEDBACK');
}

export function consultarUm(id) {
    return database.select().where({ ID: id }).table('FEEDBACK');
}

export function deletar(id) {
    return database.where({ ID: id }).delete().table('FEEDBACK');
}

export function alterar(json) {
    return database.where({ ID: json.ID })
        .update(json)
        .table('FEEDBACK');
}