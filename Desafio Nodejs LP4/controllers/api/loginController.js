import express from "express";
import bodyParser from "body-parser";
//import cors from 'cors';
import * as dao from "../../DAO/loginDAO.js";
import jwt from "jsonwebtoken";

const JWTSecret = 'hvnfidsuhcsadghcbj325rfs62y$#@¨%#&TG$RDF#DFv3fex';
const router = express.Router();

//router.use(cors());
router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());



router.post("/login", (req, res) => {

    dao.consultaUsuarios()
        .then(dados => {
            var { RE, SENHA } = req.body;

            if (RE != undefined) {
                var user = dados.find(u => u.RE == RE);
                if (user != undefined) {
                    if (user.SENHA == SENHA) {
                        jwt.sign({ RE: user.RE, ROLE: user.ROLE, ID_DEPARTAMENTO: user.ID_DEPARTAMENTO },
                            JWTSecret,
                            { expiresIn: "6h" },
                            (erro, token) => {
                                user.ID_DEPARTAMENTO;
                                if (erro) {
                                    res.status(400);
                                    res.json({ erro: "Deu algum erro!" });
                                } else {
                                    res.status(200);
                                    res.json({ token: token });
                                }
                            });
                    } else {
                        res.status(401);
                        res.json({ err: "Credenciais inválidas!" });
                    }
                } else {
                    res.status(404);
                    res.json({ err: "O RE enviado não existe na base de dados!" });
                }
            } else {
                res.status(400);
                res.json({ err: "O RE enviado é inválido!" });
            }
        });
});

export default router;