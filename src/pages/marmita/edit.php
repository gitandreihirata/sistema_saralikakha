<?php

require_once '../../config.php';
require_once '../../actions/marmita.php';
//require_once '../partials/header.php';

if (isset($_POST["idMarmita"], $_POST["nome"]) && isset($_POST["tamanho"]) && isset($_POST["preco"]))
    updateUserAction($conn, $_POST["idMarmita"], $_POST["nome"], $_POST["tamanho"], $_POST["preco"]);

$user = findUserAction($conn, $_GET['idMarmita']);

?>
<div class="container">
    <div class="row">
        <a href="../../../index.php"><h1>Marmitas - Edit</h1></a>
        <a class="btn btn-success text-white" href="../../../index.php">Prev</a>
    </div>
    <div class="row flex-center">
        <div class="form-div">
            <form class="form" action="../../pages/marmita/edit.php" method="POST">
                <input type="hidden" name="idMarmita" value="<?=$user['idMarmita']?>" required/>
                <label>Nome</label>
                <input type="text" name="nome" value="<?=htmlspecialchars($user['nome'])?>" required/>
                <label>Tamanho</label>
                <input type="text" name="tamanho" value="<?=htmlspecialchars($user['tamanho'])?>" required/>
                <label>Preco</label>
                <input type="text" name="preco" value="<?=htmlspecialchars($user['preco'])?>" required/>

                <button class="btn btn-success text-white" type="submit">Save</button>
            </form>
        </div>
    </div>
</div>
<?php //require_once '../partials/footer.php'; ?>
