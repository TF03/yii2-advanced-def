<?php
$headerScriptsHTML 	= '';
$footerScriptsHTML 	= '';
$cash_mod  			= 'headerScriptsHTML';
$cash_mod2 			= 'footerScriptsHTML';
$cash 				= cash_read($cash_mod);

if (!empty($cash) && CASH != 0) {

	$headerScriptsHTML = $cash;
	$footerScriptsHTML = cash_read($cash_mod2);
	unset($cash_mod, $cash, $cash_mod2);
}
else {
	
	$sqlCode = $db -> select("
				SELECT `name`, `code`, `method`
				FROM " . DB_PREFIX . "code_template 
				WHERE `en` = 1");
	foreach($sqlCode as $k=>$v) {
		if($v['method'] == 1)
			$headerScriptsHTML .= '
									<!-- ' . $v['name'] . ' -->
									' . $v['code'];
		elseif($v['method'] == 2)
			$footerScriptsHTML .= '
									<!-- ' . $v['name'] . ' -->
									' . $v['code'];
	}
	cash_add($cash_mod, 7200, $headerScriptsHTML);
	cash_add($cash_mod2, 7200, $footerScriptsHTML);
	unset($cash_mod, $cash, $cash_mod2, $sqlCode);
}