exports.getServiceAccount = () => {
    let serviceAccount = undefined;
    try {
        serviceAccount = require("./serviceAccountKey.json");
    } catch (error) {
        throw ('Falta o arquivo de credenciais do Firebase na pasta!');
    }    
    return serviceAccount;
}