import express from "express";
import bodyParser from "body-parser";
import cors from "cors";
import colaboradoresController from './controllers/api/colaboradoresController.js';
import beneficiosController from './controllers/api/beneficiosController.js';
import treinamentosController from './controllers/api/treinamentosController.js';
import planoEvolucaoController from './controllers/api/planoEvolucaoController.js';
import grupoTreinosController from './controllers/api/grupoTreinosController.js';
import historicosController from './controllers/api/historicoController.js';
import departamentosController from './controllers/api/departamentoController.js';
import feedbacksController from './controllers/api/feedbackController.js';
import loginController from './controllers/api/loginController.js';
import checkAuthentication from './controllers/services/checkAuthentication.js';

const app = express();

const version = 'v1';

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

const prefixo = '/api/' + version;

app.use(prefixo + '/auth', loginController);
app.use(prefixo + '/colaboradores', colaboradoresController);
app.use(prefixo + '/beneficios', beneficiosController);
app.use(prefixo + '/treinamentos', treinamentosController);
app.use(prefixo + '/planos', planoEvolucaoController);
app.use(prefixo + '/grupos', grupoTreinosController);
app.use(prefixo + '/historicos', historicosController);
app.use(prefixo + '/departamentos', departamentosController);
app.use(prefixo + '/feedbacks', feedbacksController);
app.use(prefixo + '/verifyAuth', checkAuthentication);


app.listen(4444, erro => {
    if (erro){
        console.log("Ocorreu um erro");
    }
    else{
        console.log("Servidor iniciado com sucesso!");
    }
});