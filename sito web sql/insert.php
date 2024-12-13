<?php
// Parametri di connessione al database
$host = 'localhost';
$dbname = 'SitoForm';
$user = 'root'; // Cambia questo con il tuo username MySQL
$password = ''; // Cambia questo con la tua password MySQL

// Connessione al database
try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Inserimento dei dati dal form
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $nome = $_POST['nome'];
        $email = $_POST['email'];

        // Query di inserimento
        $sql = "INSERT INTO Utenti (nome, email) VALUES (:nome, :email)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':email', $email);

        if ($stmt->execute()) {
            echo "Dati inseriti correttamente! <a href='index.html'>Torna indietro</a>";
        } else {
            echo "Errore durante l'inserimento dei dati.";
        }
    }
} catch (PDOException $e) {
    echo "Errore di connessione: " . $e->getMessage();
}
?>
