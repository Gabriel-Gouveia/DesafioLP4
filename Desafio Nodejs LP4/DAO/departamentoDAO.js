import database from './database.js'

export function inserir(dados) {
    return database.insert(dados).into('DEPARTAMENTO');
}

export function consultarTodos() {
    return database.select().table('DEPARTAMENTO');
}

export function consultarUm(id) {
    return database.select().where({ ID: id }).table('DEPARTAMENTO');
}

export function deletar(id) {
    return database.where({ ID: id }).delete().table('DEPARTAMENTO');
}

export function alterar(json) {
    return database.where({ ID: json.ID })
        .update(json)
        .table('DEPARTAMENTO');
}