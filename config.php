<?php

try {
    global $pdo;
    $pdo = new PDO("mysql:dbname=projeto_esquece_senha;host=localhost", "root", "");
} catch (PDOException $exc) {
    echo 'FALHA ' . $exc->getMessage();
    exit;
}


