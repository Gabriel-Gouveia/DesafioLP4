import express from "express";
import bodyParser from "body-parser";
import * as dao from "../../DAO/treinamentoDAO.js";
import middlewareAutenticacao from "../services/authenticationMiddleware.js";

const router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());

router.get('/consultar/:id', (req, res) => {

    let id = parseInt(req.params.id);
    dao.consultarUm(id)
        .then(treinamento => {
            if (treinamento == null) {
                res.send("Treinamento não encontrado para o id " + id).status(404);
            }

            else if (Object.entries(treinamento).length === 0) {
                res.send("Treinamento não encontrado para o id " + id).status(404);
            }
            else {
                res.send(treinamento).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.get('/consultar', (req, res) => {
    dao.consultarTodos()
        .then(treinamentos => {
            if (treinamentos == null) {
                res.send("Não existem treinamentos no banco de dados").status(500);
            }

            else if (Object.entries(treinamentos).length === 0) {
                res.send("Não existem treinamentos no banco de dados").status(200);
            }

            else {
                res.send(treinamentos).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.post('/inserir', (req, res) => {
    let treinamento = {
        ID: req.body.ID,
        NOME: req.body.NOME,
        DESCRICAO: req.body.DESCRICAO,
        AREA: req.body.AREA,
        DATA_CADASTRO: req.body.DATA_CADASTRO,
        CARGA_HORARIA: req.body.CARGA_HORARIA,
        STATUS: req.body.STATUS,
        INSCRITOS: req.body.INSCRITOS,
        ULTIMA_MODIFICACAO: req.body.ULTIMA_MODIFICACAO,
        NOTA: req.body.NOTA
    };

    dao.inserir(treinamento)
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
        DESCRICAO: req.body.DESCRICAO,
        AREA: req.body.AREA,
        DATA_CADASTRO: req.body.DATA_CADASTRO,
        CARGA_HORARIA: req.body.CARGA_HORARIA,
        STATUS: req.body.STATUS,
        INSCRITOS: req.body.INSCRITOS,
        ULTIMA_MODIFICACAO: req.body.ULTIMA_MODIFICACAO,
        NOTA: req.body.NOTA
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
