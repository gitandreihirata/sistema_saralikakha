<?php

function findMarmitaDb($conn, $id) {
    $idMarmita = mysqli_real_escape_string($conn, $id);
    $marmita;

    $sql = "SELECT * FROM marmitas  WHERE idMarmita = ?";
    $stmt = mysqli_stmt_init($conn);

    if(!mysqli_stmt_prepare($stmt, $sql))
        exit('SQL error');

    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);

    $marmita = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt));

    mysqli_close($conn);
    return $marmita;
}

function createMarmitaDb($conn, $nome, $tamanho, $preco) {
    $nome = mysqli_real_escape_string($conn, $nome);
    $tamanho = mysqli_real_escape_string($conn,  $tamanho);
    $preco = mysqli_real_escape_string($conn,  $preco);

    if($nome && $tamanho && $preco) {
        $sql = "INSERT INTO marmitas (nome, tamanho, preco) VALUES (?, ?, ?)";
        $stmt = mysqli_stmt_init($conn);

        if(!mysqli_stmt_prepare($stmt, $sql))
            exit('SQL error');

        mysqli_stmt_bind_param($stmt, 'sss', $nome, $tamanho, $preco);
        mysqli_stmt_execute($stmt);
        mysqli_close($conn);
        return true;
    }
}

function readMarmitaDb($conn) {
    $marmitas = [];

    $sql = "SELECT * FROM marmitas";
    $result = mysqli_query($conn, $sql);

    $result_check = mysqli_num_rows($result);

    if($result_check > 0)
        $marmitas = mysqli_fetch_all($result, MYSQLI_ASSOC);

    mysqli_close($conn);
    return $marmitas;
}

function updateMarmitaDb($conn, $id, $nome, $tamanho, $preco) {
    if($idMarmita && $nome && $tamanho && $preco) {
        $sql = "UPDATE marmitas SET nome = ?, tamanho = ?, preco = ? WHERE idmarmita = ?";
        $stmt = mysqli_stmt_init($conn);

        if(!mysqli_stmt_prepare($stmt, $sql))
            exit('SQL error');

        mysqli_stmt_bind_param($stmt, 'sssi', $nome, $tamanho, $preco, $id);
        mysqli_stmt_execute($stmt);
        mysqli_close($conn);
        return true;
    }
}

function deleteMarmitaDb($conn, $id) {
    $idMarmita = mysqli_real_escape_string($conn, $id);

    if($idMarmita) {
        $sql = "DELETE FROM marmitas WHERE idMarmitas = ?";
        $stmt = mysqli_stmt_init($conn);

        if(!mysqli_stmt_prepare($stmt, $sql))
            exit('SQL error');

        mysqli_stmt_bind_param($stmt, 'i', $id);
        mysqli_stmt_execute($stmt);
        return true;
    }
}
