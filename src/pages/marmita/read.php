<?php

require_once '../../config.php';
require_once '../../../src/actions/marmita.php';
require_once '../../../src/modules/messages.php';
//require_once '../partials/header.php';

$marmitas = readMarmitaAction($conn);

?>
<div class="container">
    <div class="row">
        <a href="../../../"><h1>Marmitas - Read</h1></a>
        <a class="btn btn-success text-white" href="./create.php">New</a>
    </div>
    <div class="row flex-center">
        <?php if(isset($_GET['message'])) echo(printMessage($_GET['message'])); ?>
    </div>

    <table class="table-marmitas">
        <tr>
            <th>NOME</th>
            <th>TAMANHO</th>
            <th>PRECO</th>
        </tr>
        <?php foreach($marmitas as $row): ?>
        <tr>
            <td class="marmita-nome"><?=htmlspecialchars($row['nome'])?></td>
            <td class="marmita-tamanho"><?=htmlspecialchars($row['tamanho'])?></td>
            <td class="marmita-preco"><?=htmlspecialchars($row['preco'])?></td>
            <td>
                <a class="btn btn-primary text-white" href="./edit.php?id=<?=$row['idMarmita']?>">Edit</a>
            </td>
            <td>
                <a class="btn btn-danger text-white" href="./delete.php?id=<?=$row['idMarmita']?>">Remove</a>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>
<?php //require_once '../partials/footer.php'; ?>