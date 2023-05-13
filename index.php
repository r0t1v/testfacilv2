<?php
# Database config
# ------------------------------------------------------------------------------
$DB_SERVER = '127.0.0.1:3306';
$DB_USERNAME = 'root';
$DB_PASSWORD = '';
$DB = 'faciltech';

$CONNECTION_DB = mysqli_connect($DB_SERVER,$DB_USERNAME,$DB_PASSWORD,$DB);
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Teste - faciltech</title>
    </head>
    <body>
        <table>
            <tr>
                <th>[Nome do banco]</th>
                <th>[Verba]</th>
                <th>[Data de inclusao do contrato mais antigo deste agrupamento]</th>
                <th>[Data de inclusao do contrato mais novo deste agrupamento]</th>
                <th>[Soma do valor dos contratos neste agrupamento]</th>
            </tr>
            <?php
            $QuerySQL = "SELECT a.nome, b.verba, SUM(d.valor), MIN(d.data_inclusao), MAX(d.data_inclusao) FROM Tb_banco AS a, Tb_convenio AS b, Tb_convenio_servico AS c, Tb_contrato AS d WHERE b.convenio=c.convenio AND d.convenio_servico=c.convenio AND a.codigo=b.banco";
            $QueryExec = mysqli_query($CONNECTION_DB,$QuerySQL);
            
            for($i=0; $i<mysqli_num_rows($QueryExec); $i++){
                $DataAssoc = mysqli_fetch_assoc($QueryExec);
                echo '<tr>
                        <td>'.$DataAssoc['nome'].'</td>
                        <td>'.$DataAssoc['verba'].'</td>
                        <td>'.$DataAssoc['SUM(d.valor)'].'</td>
                        <td>'.$DataAssoc['MIN(d.data_inclusao)'].'</td>
                        <td>'.$DataAssoc['MAX(d.data_inclusao)'].'</td>
                        </tr>';
            }
            ?>
        </table>
    </body>
</html>