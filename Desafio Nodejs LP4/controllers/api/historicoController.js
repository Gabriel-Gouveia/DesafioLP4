import express from "express";
import bodyParser from "body-parser";
import * as dao from "../../DAO/historicoDAO.js";
import middlewareAutenticacao from "../services/authenticationMiddleware.js";

const router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());

router.get('/consultar/:id', (req, res) => {

    let id = parseInt(req.params.id);
    dao.consultarUm(id)
        .then(historico => {
            if (historico == null) {
                res.send("Histórico não encontrado para o id " + id).status(404);
            }

            else if (Object.entries(historico).length === 0) {
                res.send("Histórico não encontrado para o id " + id).status(404);
            }
            else {
                res.send(historico).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.get('/consultarPorRE/:id', (req, res) => {

    let id = parseInt(req.params.id);
    dao.consultarUmRE(id)
        .then(historico => {
            if (historico == null) {
                res.send("Histórico não encontrado para o RE " + id).status(404);
            }

            else if (Object.entries(historico).length === 0) {
                res.send("Histórico não encontrado para o RE " + id).status(404);
            }
            else {
                res.send(historico).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.get('/consultar', (req, res) => {
    dao.consultarTodos()
        .then(historicos => {
            if (historicos == null) {
                res.send("Não existem históricos no banco de dados").status(500);
            }

            else if (Object.entries(historicos).length === 0) {
                res.send("Não existem históricos no banco de dados").status(200);
            }

            else {
                res.send(historicos).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.post('/inserir', (req, res) => {
    let historico = {
        ID: req.body.ID,
        RE_COLABORADOR: req.body.RE_COLABORADOR,
        ID_DEPARTAMENTO: req.body.ID_DEPARTAMENTO,
        NOME_DEPARTAMENTO: req.body.NOME_DEPARTAMENTO,
        CARGO: req.body.CARGO,
        DATA_INICIO: req.body.DATA_INICIO,
        DATA_FIM: req.body.DATA_FIM,
        TEMPO_TOTAL: req.body.TEMPO_TOTAL
    };

    dao.inserir(historico)
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
        RE_COLABORADOR: req.body.RE_COLABORADOR,
        ID_DEPARTAMENTO: req.body.ID_DEPARTAMENTO,
        NOME_DEPARTAMENTO: req.body.NOME_DEPARTAMENTO,
        CARGO: req.body.CARGO,
        DATA_INICIO: req.body.DATA_INICIO,
        DATA_FIM: req.body.DATA_FIM,
        TEMPO_TOTAL: req.body.TEMPO_TOTAL
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
