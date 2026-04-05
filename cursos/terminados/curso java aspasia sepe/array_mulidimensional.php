<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/html.html to edit this template
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>TODO write content</div>
        <?php
        $productos= array(
            array(1,"Figurita cisne",421.0),
            array(2,"Despertador",79.78,
            array(3,"Reloj de pared",625.5);
        ?>
        <table border="1" width="100%">
            <tr>
                <th>Id del producto</th>
                <th>Nombre</th>
                <th>Precio</th>
            </tr>
            <tr>
                <td><?php echo $productos[0][0];?></td>
                <td><?php echo $productos[0][1];?></td>
                <td><?php echo $productos[0][2];?></td>
            </tr>
            <tr>
                <td><?php echo $productos[1][0];?></td>
                <td><?php echo $productos[1][1];?></td>
                <td><?php echo $productos[1][2];?></td>
            </tr>            
            <tr>
                <td><?php echo $productos[2][0];?></td>
                <td><?php echo $productos[2][1];?></td>
                <td><?php echo $productos[2][2];?></td>
            </tr>
        </table>
    </body>
</html>
