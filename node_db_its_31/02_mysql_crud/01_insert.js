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

let persona = {
    nom: "Mario",
    cog: "Rossi",
    cfi: "MRRRSU",
    ema: "mario@rossi.com",
    tel: "123456"
}

// Alt + 9 + 6 il backtick
let querySql = `INSERT INTO Contatto(nome, cognome, cod_fis, email, telefono) 
                VALUES ('${persona.nom}', '${persona.cog}', '${persona.cfi}', '${persona.ema}', '${persona.tel}')`; 

connessione.query(querySql, (errore, risultato) => {
    if(errore)
        console.log("Non completato ;(", errore);
    else
        console.log("Inserimento effettuato con successo ;)", risultato)
})

connessione.end();