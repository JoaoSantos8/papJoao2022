<?php
include_once ("includes/body.inc.php");
global $con;
$nome=addslashes($_POST['nomeClube']);


if($_FILES['logoClube']['name']==''){
    $urlImagem='images/semImagem.png';
}else{
    $urlImagem='images/ClubesNovo/'.$_FILES['logoClube']['name'];
    copy($_FILES['logoClube']['tmp_name'],'../'.$urlImagem);
}



$sql="Insert into clubes values(0,'$nome','$urlImagem')";
mysqli_query($con,$sql);
header("location:listaClubes.php");
?>
