const mysql = require('mysql2');
const connessione = mysql.createConnection(
    {
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'toor',
        database: 'its_31_02_rubrica_chiavi'
    }
);

connessione.connect(errore => {
    if(errore)
        console.log("Errore di connessione ;(");
    else
        console.log("Sei connesso con successo! xD")
});

let querySql = "SELECT nome, cognome, cod_fis, telefono, email FROM Contatto";

connessione.query(querySql, (errore, risultato) => {
    let elencoRisultato = [];

    if(errore)
        console.log("Errore", errore);
    else{
        for(let i=0; i<risultato.length; i++){
            let per = {
                nom: risultato[i].nome,
                cog: risultato[i].cognome,
                cfi: risultato[i].cod_fis,
                ema: risultato[i].email,
                tel: risultato[i].telefono
            }

            elencoRisultato.push(per);
        }

        console.log(elencoRisultato)
    }
})

connessione.end();