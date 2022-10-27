import express from "express";
import bodyParser from "body-parser";
import * as dao from "../../DAO/departamentoDAO.js";
import middlewareAutenticacao from "../services/authenticationMiddleware.js";

const router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());

router.get('/consultar/:id', (req, res) => {

    let id = parseInt(req.params.id);
    dao.consultarUm(id)
        .then(departamento => {
            if (departamento == null) {
                res.send("Departamento não encontrado para o id " + id).status(404);
            }

            else if (Object.entries(departamento).length === 0) {
                res.send("Departamento não encontrado para o id " + id).status(404);
            }
            else {
                res.send(departamento).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.get('/consultar', (req, res) => {
    dao.consultarTodos()
        .then(departamentos => {
            if (departamentos == null) {
                res.send("Não existem departamentos no banco de dados").status(500);
            }

            else if (Object.entries(departamentos).length === 0) {
                res.send("Não existem departamentos no banco de dados").status(200);
            }

            else {
                res.send(departamentos).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.post('/inserir', (req, res) => {
    let departamento = {
        ID: req.body.ID,
        NOME: req.body.NOME,
        RESPONSAVEL: req.body.RESPONSAVEL,
        RE_RESPONSAVEL: req.body.RE_RESPONSAVEL,
        EXISTE: req.body.EXISTE
    };

    dao.inserir(departamento)
        .then(id => {
            if (TryParseInt(id.charAt(2), -1) == -1) {
                res.send("Ocorreu um erro ao inserir esse objeto.").status(500);
            }

            else {
                res.send("Sucesso").status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.put('/alterar', middlewareAutenticacao, (req, res) => {

    dao.alterar({
        ID: req.body.ID,
        NOME: req.body.NOME,
        RESPONSAVEL: req.body.RESPONSAVEL,
        RE_RESPONSAVEL: req.body.RE_RESPONSAVEL,
        EXISTE: req.body.EXISTE
    })
        .then(rows => {
            if (rows <= 0) {
                res.send("Não foi encontrado registro para ser alterado").status(404);
            }

            else {
                res.send("Alterado com sucesso").status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.delete('/deletar/:id', middlewareAutenticacao, (req, res) => {
    dao.deletar(parseInt(req.params.id))
        .then(rows => {
            if (rows > 0) {
                res.send("Deletado!").status(200);
            } else {
                res.send("Não foi encontrado esse ID no banco").status(400);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

function TryParseInt(str, defaultValue) {
    var retValue = defaultValue;
    if (str !== null) {
        if (str.length > 0) {
            if (!isNaN(str)) {
                retValue = parseInt(str);
            }
        }
    }
    return retValue;
}

export default router;
