const express = require('express');     //Includo il pacchetto express
const mysql = require('mysql2');

const app = express();                  //Inizializzo il server Express

app.use(express.json());
app.use(express.urlencoded({ extended: true}));

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
        if (errore)
            console.log("Errore di connessione al database ;(");
        else
            console.log("Sei connesso con successo al database xD")
    });
})

//Restituisci tutte le SIM
app.get("/sim", (req, res) => {
    let query = "SELECT simID, codice, telefono, operatore, credito, nominativo FROM Sim;";

    connessione.query(query, (errore, risultato) => {
        if (errore)
            res.status(500).json(errore);
        else
            res.status(200).json(risultato)
    })
})

//Restituisci la sim con ID non predefinito, es... ../sim/3
app.get("/sim/:id", (req, res) => {
    let simID = req.params.id;

    let query = `SELECT simID, codice, telefono, operatore, credito, nominativo 
                    FROM Sim 
                    WHERE simID = ${simID}`;

    connessione.query(query, (errore, risultato) => {
        if (errore)
            res.status(500).json(errore);
        else{  
            let elemento = risultato[0];

            if(!elemento)
                res.status(404).json();
            else
                res.status(200).json(elemento)
                        
        }
            
    })
})

app.post("/sim", (req, res) => {
    let nuovaSim = req.body;

    let sql = `INSERT INTO Sim (codice, telefono, operatore, credito, nominativo) VALUES
                ('${nuovaSim.codice}', '${nuovaSim.telefono}', '${nuovaSim.operatore}', 
                ${nuovaSim.credito}, '${nuovaSim.nominativo}');`;

    connessione.query(sql, (errore, risultato) => {
        if(errore)
            res.status(500).json(errore.sqlMessage);
        else{
            if(risultato.affectedRows > 0){
                nuovaSim.simID = risultato.insertId;
                res.status(201).json(nuovaSim);
            }
            else
                res.status(400).json();
        }
            
    })
})

