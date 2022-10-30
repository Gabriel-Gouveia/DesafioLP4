import database from './database.js'

export function consultaUsuarios() {
  return database.select().table('USUARIOS');
}