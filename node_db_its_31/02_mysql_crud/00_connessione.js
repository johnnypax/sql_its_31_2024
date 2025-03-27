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

