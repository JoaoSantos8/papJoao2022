<?php
include_once("includes/body.inc.php");
global $con;
drawTop(HOME);
$sql="select *
 from jogadorclubes 
inner join jogadores  
inner join clubes
where ClubeId=jogadorClubeClubeId";
$res=mysqli_query($con,$sql);
$dados=mysqli_fetch_array($res);
?>
    <section class="page-title" style="background-image:url(images/background/background.png);">
    <div class="auto-container">
        <h1>Detalhes do Clube</h1>
    </div>
</section>
	<!--End Main Header -->
	<div style="padding-top: 50px; padding-bottom: 50px;">
		<div class="text-center"><img src="<?php echo $dados['clubeLogoURL'] ?>"></div><p><p>
		<div class="text-center">
			<font class="text-center" color="black"><b>Nome Completo do Clube:</b></font><font class="texto">&nbsp;&nbsp;&nbsp;<?php echo $dados['clubeNome'] ?></font><p>
			<font class="text-center" color="black"><b>Ano De Fundação do clube:</b></font><font class="texto">&nbsp;&nbsp;&nbsp;<?php echo $dados['clubeAnoFundacao'] ?></font><p>
			<font class="text-center" color="black"><b>Fundador do Clube:</b></font><font class="texto">&nbsp&nbsp;&nbsp;<?php echo $dados['clubeFundadores'] ?></font><p>
			<font class="text-center" color="black"><b>Estádio:</b></font><font class="texto">&nbsp&nbsp;&nbsp;<?php echo $dados['clubeEstadio'] ?></font><p>
		</div></div>
    <div style="padding-top: 30px">

        <div class="TabelaJogadores">
            <table class="table" style="border-top-left-radius:10px; border-top-right-radius:10px; border-bottom-left-radius:10px; border-bottom-right-radius:10px;">
                <thead style=" background-color:#7c7b7b;">
                <tr>
                    <th scope="col" style="border-top-left-radius:10px; border: 0px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px; padding-top: 5px; vertical-align: middle"><font color="white" ><div style="width: 100%;">Número de jogador</div></font></th>
                    <th scope="col" text-align="center" style="padding-right: 10px; padding-left: 10px; padding-bottom: 5px; padding-top: 5px; border: 0px;  vertical-align: middle;"><font color="white"><div style="width: 100%;">Foto</div></font></th>
                    <th scope="col" text-align="center" style="border: 0px; vertical-align: middle;"><font color="white"><div style="width: 100%;">Nome do jogador</div></font></th>
                    <th scope="col" text-align="center" style="border-top-right-radius:10px; border: 0px; vertical-align: middle;"><font color="white"><div style="width: 100%;">Idade</div></font></th>
                </tr>
                </thead>
                <tbody>
                <?php
                while($dados=mysqli_fetch_array($res)){
                    ?>
                    <tr>
                        <td align="center"><font color="black" size="4px"><?php echo $dados['jogadorClubeNumero'] ?></font></td>
                        <td align="center"><img src="<?php echo $dados['jogadorFotoURL'] ?>"></td>
                        <td align="center"><font color="black" size="4px"><?php echo $dados['jogadorNome'] ?></font></td>
                        <td align="center"><font color="black" size="4px"><?php echo idade($dados['jogadorDataNascimento']);?></font></td>
                    </tr>
                    <?php
                }
                ?>
                </tbody>
            </table>
        </div>
    </div>
<?php
drawBottom();
?>