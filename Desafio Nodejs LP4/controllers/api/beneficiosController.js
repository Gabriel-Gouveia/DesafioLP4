import express from "express";
import bodyParser from "body-parser";
import * as dao from "../../DAO/beneficioDAO.js";
import middlewareAutenticacao from "../services/authenticationMiddleware.js";

const router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());

router.get('/consultar/:id', (req, res) => {

    let id = parseInt(req.params.id);
    dao.consultarUm(id)
        .then(beneficio => {
            if (beneficio == null) {
                res.send("Beneficio não encontrado para o id " + id).status(404);
            }

            else if (Object.entries(beneficio).length === 0) {
                res.send("Beneficio não encontrado para o id " + id).status(404);
            }
            else {
                res.send(beneficio).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.get('/consultar', (req, res) => {

    dao.consultarTodos()
        .then(beneficios => {
            if (beneficios == null) {
                res.send("Não existem beneficios no banco de dados").status(500);
            }

            else if (Object.entries(beneficios).length === 0) {
                res.send("Não existem beneficios no banco de dados").status(200);
            }

            else {
                res.send(beneficios).status(200);
            }
        })
        .catch(erro => {
            console.log(erro);
            res.send(erro);
        });
});

router.post('/inserir', (req, res) => {
    let beneficio = {
        ID: req.body.ID,
        RE_COLABORADOR: req.body.RE_COLABORADOR,
        VR: req.body.VR,
        VA: req.body.VA,
        VT: req.body.VT,
        CONVENIO_MEDICO: req.body.CONVENIO_MEDICO,
        CONVENIO_ODONTO: req.body.CONVENIO_ODONTO,
        GYMPASS: req.body.GYMPASS,
        AUXILIO_CRECHE: res.body.AUXILIO_CRECHE,
        PREVIDENCIA_PRIVADA: req.body.PREVIDENCIA_PRIVADA
    };

    dao.inserir(beneficio)
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
        VR: req.body.VR,
        VA: req.body.VA,
        VT: req.body.VT,
        CONVENIO_MEDICO: req.body.CONVENIO_MEDICO,
        CONVENIO_ODONTO: req.body.CONVENIO_ODONTO,
        GYMPASS: req.body.GYMPASS,
        AUXILIO_CRECHE: req.body.AUXILIO_CRECHE,
        PREVIDENCIA_PRIVADA: req.body.PREVIDENCIA_PRIVADA
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
