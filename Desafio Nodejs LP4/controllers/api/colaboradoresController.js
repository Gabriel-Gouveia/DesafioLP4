import express from "express";
import bodyParser from "body-parser";
import * as dao from "../../DAO/colaboradorDAO.js";
import middlewareAutenticacao from "../services/authenticationMiddleware.js";

const router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());

router.get('/consultar/:id', (req, res) => {

    let id = parseInt(req.params.id);
    dao.consultarUm(id)
        .then(colaborador => {
            if (colaborador == null) {
                res.send("Colaborador não encontrado para o id " + id).status(404);
            }

            // https://sabe.io/blog/javascript-check-if-object-is-empty#:~:text=There%20are%20a%20few%20ways%20to%20check%20if,of%20a%20given%20object%27s%20own%20enumerable%20key-value%20pairs.
            else if (Object.entries(colaborador).length === 0) {
                res.send("Colaborador não encontrado para o id " + id).status(404);
            }
            else {
                res.send(colaborador).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.get('/consultarPorDepartamento/:id', (req, res) => {
    
    let id = parseInt(req.params.id);
    dao.consultarPorDepartamento(id)
        .then(colaboradores => {
            if (colaboradores == null) {
                res.send("O departamento não possui colaboradores ou o ID estava errado.").status(404);
            }

            else if (Object.entries(colaboradores).length === 0) {
                res.send("O departamento não possui colaboradores ou o ID estava errado.").status(404);
            }
            else {
                res.send(colaboradores).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.get('/consultar', (req, res) => {
    dao.consultarTodos()
        .then(colaboradores => {
            if (colaboradores == null) {
                res.send("Não existem colaboradores no banco de dados").status(500);
            }

            else if (Object.entries(colaboradores).length === 0) {
                res.send("Não existem colaboradores no banco de dados").status(200);
            }

            else {
                res.send(colaboradores).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.post('/inserir', (req, res) => {
    let colaborador = {
        RE: req.body.RE,
        NOME: req.body.NOME,
        NASCIMENTO: req.body.NASCIMENTO,
        CPF: req.body.CPF,
        RG: req.body.RG,
        CARGO: req.body.CARGO,
        ID_DEPARTAMENTO: req.body.ID_DEPARTAMENTO,
        DATA_ENTRADA: req.body.DATA_ENTRADA,
        TELEFONE: req.body.TELEFONE,
        ANOS_EMPRESA: req.body.ANOS_EMPRESA,
        ENDERECO: req.body.ENDERECO,
        IDADE: req.body.IDADE,
        SALARIO: req.body.SALARIO,
        ID_BENEFICIO: req.body.ID_BENEFICIO,
        ID_TREINAMENTO: req.body.ID_TREINAMENTO,
        ID_FEEDBACK: req.body.ID_FEEDBACK,
        ID_PLANOEVOLUCAO: req.body.ID_PLANOEVOLUCAO
    };

    dao.inserir(colaborador)
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
        RE: req.body.RE,
        NOME: req.body.NOME,
        NASCIMENTO: req.body.NASCIMENTO,
        CPF: req.body.CPF,
        RG: req.body.RG,
        CARGO: req.body.CARGO,
        ID_DEPARTAMENTO: req.body.ID_DEPARTAMENTO,
        DATA_ENTRADA: req.body.DATA_ENTRADA,
        TELEFONE: req.body.TELEFONE,
        ANOS_EMPRESA: req.body.ANOS_EMPRESA,
        ENDERECO: req.body.ENDERECO,
        IDADE: req.body.IDADE,
        SALARIO: req.body.SALARIO,
        ID_BENEFICIO: req.body.ID_BENEFICIO,
        ID_TREINAMENTO: req.body.ID_TREINAMENTO,
        ID_FEEDBACK: req.body.ID_FEEDBACK,
        ID_PLANOEVOLUCAO: req.body.ID_PLANOEVOLUCAO
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
