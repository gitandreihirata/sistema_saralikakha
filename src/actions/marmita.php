<?php

require_once '../../database/dbMarmita.php';

function findMarmitaAction($conn, $idMarmita) {
    return findMarmitaDb($conn, $idMarmita);
}

function readMarmitaAction($conn) {
    return readMarmitaDb($conn);
}

function createMarmitaAction($conn, $nome, $tamanho, $preco) {
    $createMarmitaDb = createMarmitaDb($conn, $nome, $tamanho, $preco);
    $message = $createMarmitaDb == 1 ? 'success-create' : 'error-create';
    return header("Location: ./read.php?message=$message");
}

function updateMarmitaAction($conn, $idMarmita, $nome, $tamanho, $preco) {
    $updateMarmitaDb = updateMarmitaDb($conn, $idMarmita, $nome, $tamanho, $preco);
    $message = $updateMarmitaDb == 1 ? 'success-update' : 'error-update';
    return header("Location: ./read.php?message=$message");
}

function deleteMarmitaAction($conn, $idMarmita) {
    $deleteMarmitaDb = deleteMarmitaDb($conn, $idMarmita);
    $message = $deleteMarmitaDb == 1 ? 'success-remove' : 'error-remove';
    return header("Location: ./read.php?message=$message");
}
