<?php

require_once '../../config.php';
require_once '../../actions/marmita.php';
//require_once '../partials/header.php';

if (isset($_POST["nome"]) && isset($_POST["tamanho"]) && isset($_POST["preco"]))
    createUserAction($conn, $_POST["nome"], $_POST["tamanho"], $_POST["preco"]);

?>
<div class="container">
    <div class="row">
        <a href="../../../index.php"><h1>Marmitas - Create</h1></a>
        <a class="btn btn-success text-white" href="../../../index.php">Prev</a>
    </div>
    <div class="row flex-center">
        <div class="form-div">
            <form class="form" action="../../pages/marmita/create.php" method="POST">
                <label>Nome</label>
                <input type="text" name="nome" required/>
                <label>Tamanho</label>
                <input type="text" name="tamanho" required/>
                <label>Preco</label>
                <input type="text" name="preco" required/>

                <button class="btn btn-success text-white" type="submit">Save</button>
            </form>
        </div>
    </div>
</div>
<?php require_once '../partials/footer.php'; ?>
