import express from "express";
import bodyParser from "body-parser";
import * as dao from "../../DAO/feedbackDAO.js";
import middlewareAutenticacao from "../services/authenticationMiddleware.js";

const router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());

router.get('/consultar/:id', (req, res) => {

    let id = parseInt(req.params.id);
    dao.consultarUm(id)
        .then(feedback => {
            if (feedback == null) {
                res.send("Feedback não encontrado para o id " + id).status(404);
            }

            else if (Object.entries(feedback).length === 0) {
                res.send("Feedback não encontrado para o id " + id).status(404);
            }
            else {
                res.send(feedback).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.get('/consultar', (req, res) => {
    dao.consultarTodos()
        .then(feedbacks => {
            if (feedbacks == null) {
                res.send("Não existem feedbacks no banco de dados").status(500);
            }

            else if (Object.entries(feedbacks).length === 0) {
                res.send("Não existem feedbacks no banco de dados").status(200);
            }

            else {
                res.send(feedbacks).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.post('/inserir', (req, res) => {
    let feedback = {
        ID: req.body.ID,
        RE_COLABORADOR: req.body.RE_COLABORADOR,
        RE_GESTOR: req.body.RE_GESTOR,
        PONTOS_FORTES: req.body.PONTOS_FORTES,
        PONTOS_FRACOS: req.body.PONTOS_FRACOS,
        ACOES_ESPERADAS: req.body.ACOES_ESPERADAS,
        METAS: req.body.METAS,
        DATA_FEEDBACK: req.body.DATA_FEEDBACK.substring(0, 10),
        PRAZO_CUMPRIMENTO: req.body.PRAZO_CUMPRIMENTO
    };

    dao.inserir(feedback)
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
        RE_GESTOR: req.body.RE_GESTOR,
        PONTOS_FORTES: req.body.PONTOS_FORTES,
        PONTOS_FRACOS: req.body.PONTOS_FRACOS,
        ACOES_ESPERADAS: req.body.ACOES_ESPERADAS,
        METAS: req.body.METAS,
        DATA_FEEDBACK: req.body.DATA_FEEDBACK.substring(0, 10),
        PRAZO_CUMPRIMENTO: req.body.PRAZO_CUMPRIMENTO,
        PONTOS_FORTES_MARKDOWN: PONTOS_FORTES_MARKDOWN,
        PONTOS_FRACOS_MARKDOWN: PONTOS_FRACOS_MARKDOWN,
        ACOES_MARKDOWN: ACOES_MARKDOWN,
        METAS_MARKDOWN: METAS_MARKDOWN
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
