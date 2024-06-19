<?php 
	include ('connect.php');
	if(isset($_GET['deluser'])) {
		DeletUser($conexao);
		logout($conexao);
		$deluser = true;
		redirect('../../index.php?deluser');
	} else {
		logout($conexao);
		IndexRedirect();
	}
	
?>