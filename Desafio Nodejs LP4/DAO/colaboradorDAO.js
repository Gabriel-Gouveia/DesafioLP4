import database from './database.js'

export function inserir(dados) {
    return database.insert(dados).into('Colaborador');
}

export function consultarTodos() {
    return database.select().table('Colaborador');
}

export function consultarUm(id) {
    return database.select().where({ RE: id }).table('Colaborador');
}

export function consultarPorDepartamento(id) {
    return database.select().where({ ID_DEPARTAMENTO: id }).table('Colaborador');
}

export function deletar(id) {
    return database.where({ RE: id }).delete().table('Colaborador');
}

export function alterar(json) {
    return database.where({ RE: json.RE })
        .update(json)
        .table('Colaborador');
}