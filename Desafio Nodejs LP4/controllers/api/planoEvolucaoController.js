import express from "express";
import bodyParser from "body-parser";
import * as dao from "../../DAO/planoEvolucaoDAO.js";
import middlewareAutenticacao from "../services/authenticationMiddleware.js";

const router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());

router.get('/consultar/:id', (req, res) => {

    let id = parseInt(req.params.id);
    dao.consultarUm(id)
        .then(plano => {
            if (plano == null) {
                res.send("Plano de evolução não encontrado para o id " + id).status(404);
            }

            else if (Object.entries(plano).length === 0) {
                res.send("Plano de evolução não encontrado para o id " + id).status(404);
            }
            else {
                res.send(plano).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.get('/consultar', (req, res) => {
    dao.consultarTodos()
        .then(planos => {
            if (planos == null) {
                res.send("Não existem planos de evolução no banco de dados").status(500);
            }

            else if (Object.entries(planos).length === 0) {
                res.send("Não existem planos de evolução no banco de dados").status(200);
            }

            else {
                res.send(planos).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.post('/inserir', (req, res) => {
    let plano = {
        ID: req.body.ID,
        RE_COLABORADOR: req.body.RE_COLABORADOR,
        DATA_INICIO_PLANO: req.body.DATA_INICIO_PLANO,
        DATA_FIM_PLANO: req.body.DATA_FIM_PLANO,
        METAS: req.body.METAS,
        ID_GRUPO_TREINAMENTO: req.body.ID_GRUPO_TREINAMENTO
    };

    dao.inserir(plano)
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
        DATA_INICIO_PLANO: req.body.DATA_INICIO_PLANO,
        DATA_FIM_PLANO: req.body.DATA_FIM_PLANO,
        METAS: req.body.METAS,
        ID_GRUPO_TREINAMENTO: req.body.ID_GRUPO_TREINAMENTO
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
