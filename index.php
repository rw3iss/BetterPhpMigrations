
<?php require_once('lib/migrations.php');
 global $migrations;

function run_action($action) {
	global $migrations;

 	switch($action) {
 		case 'install':
 			echo 'installing...';
 			$migrations->install();
 			break;
 		case 'run':
 			echo 'running...<br/>';
 			$is_valid = $migrations->validate_migrations();
 			if($is_valid)
 				$migrations->run_new_migrations();
 			break;
 		case 'uninstall':
 			echo 'uninstalling...';
 			$migrations->uninstall();
 			break;
 		case 'get_migrations_data':
 			echo '<b>Ran migrations:</b><br/>';
 			if(sizeof($migrations->migrationsData->ran_migrations) == 0) {
 				echo '&nbsp;&nbsp;(none)<br/>';
 			} else {
	 			foreach($migrations->migrationsData->ran_migrations as $m) {
	 				echo '&nbsp;&nbsp;' . $m . '<br/>';
	 			}	
 			}
 			$mDate = $migrations->migrationsData->last_migration_date;
 			echo '<b>Last migration date:</b> <br/>&nbsp;&nbsp;';
 			echo empty($mDate) ? '(none)' : $mDate;
 			echo '<br/>';
 			break;
 		case 'cleanup':
 			echo 'cleaning...';
 			$migrations->clean_migrations();
 			break;
 		default:
 			echo 'Action not supported: ' . $action;
 	}
}

 //running from command line?
 if(isset($argv[1])) {
 	$action = $argv[1];
 	run_action($action);
 	return;
 }

 //or handle action from browser?
 if(isset($_GET['action'])) {
 	$action = $_GET['action'];
 	run_action($action);
 	echo '<br/>';
 }

 //resume normal page logic

 $is_installed = $migrations->is_installed();
?>


<html>
<head>
	<title>PHP Migrations!</title>
</head>
<body>

<?php
 if($is_installed) {
	$all_migrations = $migrations->get_all_migrations();
	$new_migrations = $migrations->get_new_migrations();
	$has_new_migrations = sizeof($new_migrations) != 0;
?>
	<br/>
	<b>New migrations to run:</b><br/>
	<?php
		foreach($new_migrations as $i => $m) {
			echo $m . '<br/>';
		}

		if(!$has_new_migrations) {
			echo '(none)';
		}
	?>
	<br/>
	<br/>

	<?php 
	 if($has_new_migrations) {
	 ?>

	<br/>
	<form action="index.php" method="get">
		<input type="hidden" name="action" value="run"/>
		Run new migrations:<br/>
		<button type="submit">Run Migrations</button>
	</form>

	<?php
	}
	?>

	<br/>
	<form action="index.php" method="get">
		<input type="hidden" name="action" value="get_migrations_data"/>
		See which migrations have been run:<br/>
		<button type="submit">Get Migration Data</button>
	</form>

	<br/>
	<form action="index.php" method="get">
		<input type="hidden" name="action" value="cleanup"/>
		Make sure the database only contains migrations which actually exist:<br/>
		<button type="submit">Clean Migrations</button>
	</form>

	<br/>
	<form action="index.php" method="get">
		<input type="hidden" name="action" value="uninstall"/>
		Uninstall the migrations schema:<br/>
		<button type="submit" onlick="return confirm('Are you sure?');">Uninstall</button>
	</form>

<?php
} else {
?>
	<br/>

	<form action="index.php" method="get">
		<input type="hidden" name="action" value="install"/>
		<button type="submit">Install Migrations</button>
	</form>

<?php
}

?>


</body>
</html>