import express from "express";
import bodyParser from "body-parser";
import jwt from "jsonwebtoken";

const router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());

const JWTSecret = 'hvnfidsuhcsadghcbj325rfs62y$#@¨%#&TG$RDF#DFv3fex';

router.get('/checkAuthentication', (req, res) => {
    const tokenLido = req.headers['authorization'];

    if (tokenLido == undefined || tokenLido == null) {
        res.status(401); //HTTP unauthorized 
        res.json({ error: "O token estava nulo!" });
        res.send();
    } else {
        const tokenDeVerdade = tokenLido.split(' ');

        jwt.verify(tokenDeVerdade[1], JWTSecret, (erro, dados) => {
            if (erro) {
                res.status(401);
                res.json({ erro: "Não autenticado (token inválido)" });
                res.send();
            }
            else {
                res.json({ msg: "Tudo certo!", re: dados.RE, role: dados.ROLE, departamento: dados.ID_DEPARTAMENTO });
                res.send();
            }
        });
    }
});

export default router;
