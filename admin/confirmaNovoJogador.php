<?php
include_once ("includes/body.inc.php");
global $con;
$nome=addslashes($_POST['nomeJogador']);


if($_FILES['fotoJogador']['name']==''){
    $urlImagem='images/semImagem.png';
}else{
    $urlImagem='images/jogadores/'.$_FILES['fotoJogador']['name'];
    copy($_FILES['fotoJogador']['tmp_name'],'../'.$urlImagem);
}



$sql="Insert into jogadores values(0,'$nome','$urlImagem')";
mysqli_query($con,$sql);
header("location:listaJogadores.php");
?>
