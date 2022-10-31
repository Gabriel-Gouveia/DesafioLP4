import jwt from "jsonwebtoken";

const JWTSecret = 'hvnfidsuhcsadghcbj325rfs62y$#@¨%#&TG$RDF#DFv3fex';

export default function middlewareAutenticacao(req, res, next) {
    const tokenLido = req.headers['authorization'];

    if (tokenLido == undefined) {
        res.status(401); //HTTP unauthorized 
        res.json({ error: "O token estava nulo!" });
    } else {
        const tokenDeVerdade = tokenLido.split(' ');

        jwt.verify(tokenDeVerdade[1], JWTSecret, (erro, dados) => {
            if (erro) {
                res.status(401);
                res.json({ erro: "Não autenticado (token inválido)" });
            }
            else {
                req.token = tokenDeVerdade[1];
                req.UsuarioLogado = { RE: dados.RE };
                req.Role = { ROLE: dados.ROLE };
                req.Departamento = { DEPARTAMENTO: dados.DEPARTAMENTO };
                next();
            }
        });
    }
}
