<?php
require 'config.php';

if (isset($_GET['token']) && !empty($_GET['token'])) {
    $token = $_GET['token'];

    $sql = $pdo->prepare("SELECT *FROM usuario_token WHERE hash =:hash AND used = 0 AND expirado_em > NOW()");
    $sql->bindValue(":hash", $token);
    $sql->execute();

    if ($sql->rowcount() > 0) {

        $sql = $sql->fetch();
        $id = $sql['id_usuario'];
        if (isset($_POST['senha']) && !empty($_POST['senha'])) {
            $senha = md5($_POST['senha']);

            $sql = $pdo->prepare("UPDATE usuarios SET senha = :senha WHERE id_usuario = :id_usuario");
            $sql->bindValue(":senha", $senha);
            $sql->bindValue(":id_usuario", $id);
            $sql->execute();

            $sql = $pdo->prepare("UPDATE usuario_token SET used = 1 WHERE hash = :hash");
            $sql->bindValue(":hash", $token);
            $sql->execute();

            echo 'Senha alterada com sucesso...';
            exit;
        }
        ?>
        <form method="POST">
            Digite a nova senha:
            <input type="password" name="senha" placeholder="nova senha..."/>
            <input type="submit" value="enviar"/>
        </form>

        <?php
    } else {
        echo 'Token usado ou invalido';
    }
}
