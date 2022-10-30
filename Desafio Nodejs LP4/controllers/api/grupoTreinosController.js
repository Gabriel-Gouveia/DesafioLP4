import express from "express";
import bodyParser from "body-parser";
import * as dao from "../../DAO/grupoTreinamentosDAO.js";
import middlewareAutenticacao from "../services/authenticationMiddleware.js";

const router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());

router.get('/consultar/:id', (req, res) => {

    let id = parseInt(req.params.id);
    dao.consultarUm(id)
        .then(grupo => {
            if (grupo == null) {
                res.send("Grupo de treinamentos não encontrado para o id " + id).status(404);
            }

            else if (Object.entries(grupo).length === 0) {
                res.send("Grupo de treinamentos não encontrado para o id " + id).status(404);
            }
            else {
                res.send(grupo).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.get('/consultar', (req, res) => {
    dao.consultarTodos()
        .then(grupos => {
            if (grupos == null) {
                res.send("Não existem grupos de treinamentos no banco de dados").status(500);
            }

            else if (Object.entries(grupos).length === 0) {
                res.send("Não existem grupos de treinamentos no banco de dados").status(200);
            }

            else {
                res.send(grupos).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.post('/inserir', (req, res) => {
    let grupo = {
        ID: req.body.ID,
        ID_PLANO_EVOLUCAO: req.body.ID_PLANO_EVOLUCAO,
        RE_COLABORADOR: req.body.RE_COLABORADOR,
        TREINAMENTO_1: req.body.TREINAMENTO_1,
        TREINAMENTO_2: req.body.TREINAMENTO_2,
        TREINAMENTO_3: req.body.TREINAMENTO_3,
        TREINAMENTO_4: req.body.TREINAMENTO_4,
        TREINAMENTO_5: req.body.TREINAMENTO_5,
        TREINAMENTO_6: req.body.TREINAMENTO_6,
        TREINAMENTO_7: req.body.TREINAMENTO_7,
        TREINAMENTO_8: req.body.TREINAMENTO_8,
        TREINAMENTO_9: req.body.TREINAMENTO_9,
        TREINAMENTO_10: req.body.TREINAMENTO_10,
        TREINAMENTO_11: req.body.TREINAMENTO_11,
        TREINAMENTO_12: req.body.TREINAMENTO_12,
        TREINAMENTO_13: req.body.TREINAMENTO_13,
        TREINAMENTO_14: req.body.TREINAMENTO_14,
        TREINAMENTO_15: req.body.TREINAMENTO_15,
        FEZ_TREINAMENTO_1: req.body.FEZ_TREINAMENTO_1,
        FEZ_TREINAMENTO_2: req.body.FEZ_TREINAMENTO_2,
        FEZ_TREINAMENTO_3: req.body.FEZ_TREINAMENTO_3,
        FEZ_TREINAMENTO_4: req.body.FEZ_TREINAMENTO_4,
        FEZ_TREINAMENTO_5: req.body.FEZ_TREINAMENTO_5,
        FEZ_TREINAMENTO_6: req.body.FEZ_TREINAMENTO_6,
        FEZ_TREINAMENTO_7: req.body.FEZ_TREINAMENTO_7,
        FEZ_TREINAMENTO_8: req.body.FEZ_TREINAMENTO_8,
        FEZ_TREINAMENTO_9: req.body.FEZ_TREINAMENTO_9,
        FEZ_TREINAMENTO_10: req.body.FEZ_TREINAMENTO_10,
        FEZ_TREINAMENTO_11: req.body.FEZ_TREINAMENTO_11,
        FEZ_TREINAMENTO_12: req.body.FEZ_TREINAMENTO_12,
        FEZ_TREINAMENTO_13: req.body.FEZ_TREINAMENTO_13,
        FEZ_TREINAMENTO_14: req.body.FEZ_TREINAMENTO_14,
        FEZ_TREINAMENTO_15: req.body.FEZ_TREINAMENTO_15
    };

    dao.inserir(grupo)
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
        ID_PLANO_EVOLUCAO: req.body.ID_PLANO_EVOLUCAO,
        RE_COLABORADOR: req.body.RE_COLABORADOR,
        TREINAMENTO_1: req.body.TREINAMENTO_1,
        TREINAMENTO_2: req.body.TREINAMENTO_2,
        TREINAMENTO_3: req.body.TREINAMENTO_3,
        TREINAMENTO_4: req.body.TREINAMENTO_4,
        TREINAMENTO_5: req.body.TREINAMENTO_5,
        TREINAMENTO_6: req.body.TREINAMENTO_6,
        TREINAMENTO_7: req.body.TREINAMENTO_7,
        TREINAMENTO_8: req.body.TREINAMENTO_8,
        TREINAMENTO_9: req.body.TREINAMENTO_9,
        TREINAMENTO_10: req.body.TREINAMENTO_10,
        TREINAMENTO_11: req.body.TREINAMENTO_11,
        TREINAMENTO_12: req.body.TREINAMENTO_12,
        TREINAMENTO_13: req.body.TREINAMENTO_13,
        TREINAMENTO_14: req.body.TREINAMENTO_14,
        TREINAMENTO_15: req.body.TREINAMENTO_15,
        FEZ_TREINAMENTO_1: req.body.FEZ_TREINAMENTO_1,
        FEZ_TREINAMENTO_2: req.body.FEZ_TREINAMENTO_2,
        FEZ_TREINAMENTO_3: req.body.FEZ_TREINAMENTO_3,
        FEZ_TREINAMENTO_4: req.body.FEZ_TREINAMENTO_4,
        FEZ_TREINAMENTO_5: req.body.FEZ_TREINAMENTO_5,
        FEZ_TREINAMENTO_6: req.body.FEZ_TREINAMENTO_6,
        FEZ_TREINAMENTO_7: req.body.FEZ_TREINAMENTO_7,
        FEZ_TREINAMENTO_8: req.body.FEZ_TREINAMENTO_8,
        FEZ_TREINAMENTO_9: req.body.FEZ_TREINAMENTO_9,
        FEZ_TREINAMENTO_10: req.body.FEZ_TREINAMENTO_10,
        FEZ_TREINAMENTO_11: req.body.FEZ_TREINAMENTO_11,
        FEZ_TREINAMENTO_12: req.body.FEZ_TREINAMENTO_12,
        FEZ_TREINAMENTO_13: req.body.FEZ_TREINAMENTO_13,
        FEZ_TREINAMENTO_14: req.body.FEZ_TREINAMENTO_14,
        FEZ_TREINAMENTO_15: req.body.FEZ_TREINAMENTO_15
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
