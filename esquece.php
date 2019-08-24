<?php
require 'config.php';

if (isset($_POST['email']) && !empty($_POST['email'])){
    $email = addslashes($_POST['email']);

    $sql = $pdo->prepare("SELECT *FROM usuarios WHERE email = :email");
    $sql->bindValue(":email", $email);
    $sql->execute();

    if ($sql->rowcount() > 0) {

        $sql = $sql->fetch();
        $id = $sql['id_usuario'];
        $token = md5(time() . rand(0, 99999) . rand(0, 99999));

        $sql = $pdo->prepare("INSERT INTO usuario_token SET id_usuario = :id_usuario,hash = :hash,expirado_em = :expirado_em");
        $sql->bindValue(":id_usuario", $id);
        $sql->bindValue(":hash", $token);
        $sql->bindValue(":expirado_em", date('Y-m-d H:i', strtotime('+2 months')));
        $sql->execute();
        
        $mensagem = "http://localhost/esquece_senha/redifinir.php?token=".$token;
        $assunto = "Redifinir a Senha";
        
        $headers = 'From: paulojoao@unesc.net'."\r\n".'X-Mailer: PHP/'.phpversion();
        //mail($email, $assunto, $mensagem,$headers);
        ?><a href="<?php echo $mensagem;?>">clique no link para redefinir a sua senha</a><?php 
        exit; 
    } 
}
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <form method="POST">
            <input type="text" name="email" placeholder="email..."/>
            <input type="submit" value="enviar"/>
        </form>
    </body>
</html>
