const express = require('express');     //Includo il pacchetto express
const mysql = require('mysql2');

const app = express();                  //Inizializzo il server Express

const port = 4001;
const host = "127.0.0.1"
const connessione = mysql.createConnection(
    {
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'toor',
        database: 'its_31_gestione_telefonia'
    }
);


app.listen(port, host, () => {
    console.log(`Sono in ascolto all'indirizzo: http://${host}:${port}`);  
    
    connessione.connect(errore => {
        if(errore)
            console.log("Errore di connessione ;(");
        else
            console.log("Sei connesso con successo! xD")
    });
})
