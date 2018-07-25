<?php
	// защита от запростов с дургих сайтов
		if (strpos($_SERVER['HTTP_REFERER'], 'http://' . $_SERVER['HTTP_HOST']) === false)
			exit();
	// проверка на сесию админа
		session_start();
		if ($_SESSION['admin'] != 'admin')
			exit();

	//подключение БД
		require_once '../conf.php';
		require_once '../db.php';
	//подключение библиотек
		require_once './core.php';

    $dbColumns = array( 'engine', 'browser', 'platform', 'version', 'grade' );

    /* db таблица используется */
    $dbTable = $_GET['table'];
	
    /*
     * Пажинация
     */
    $dbLimit = '';
    if ( isset($_GET['iDisplayStart']) && $_GET['iDisplayLength'] != '-1' ) {
        $dbLimit = 'LIMIT ' . intval($_GET['iDisplayStart']) . ', ' 
					. intval($_GET['iDisplayLength']);
    }
	
    /*
     * Сортировка
     */
    $dbOrder = '';
    if ( isset($_GET['iSortCol_0']) ) {
        $dbOrder = 'ORDER BY ';
        for ( $i = 0; $i < intval($_GET['iSortingCols']); $i++) {
            if ( $_GET[ 'bSortable_' . intval($_GET['iSortCol_' . $i]) ] == 'true' ) {
                $dbOrder .= $dbColumns[ intval( $_GET['iSortCol_'.$i] ) ];
				if($_GET['sSortDir_' . $i] === 'asc')
					$dbOrder .= ' ASC, ';
				else
					$dbOrder .= ' DESC, ';
            }
        }
        $dbOrder = substr_replace( $dbOrder, '', -2 );
        if ( $dbOrder == 'ORDER BY' )
            $dbOrder = '';
    }
     
    /*
     * Фильтр
     */
    $dbWhere = "";
    if(isset($_GET['sSearch']) && $_GET['sSearch'] != '') {
        $dbWhere = 'WHERE (';
		$sSearch = mysql_real_escape_string($_GET['sSearch']);
        for ( $i = 0; $i < count($aColumns); $i++ ) {
            if ( isset($_GET['bSearchable_' . $i]) && $_GET['bSearchable_' . $i] == 'true' )
                $dbWhere .= $aColumns[$i] . ' LIKE "%' . $sSearch . '%" OR ';
        }
        $dbWhere = substr_replace( $dbWhere, '', -3 );
        $dbWhere .= ')';
    }
     
    /*
     * Фильтр по индивидуальной колонке
     */
    for( $i = 0; $i < count($aColumns); $i++) {
        if( isset($_GET['bSearchable_' . $i]) && $_GET['bSearchable_' . $i] == 'true' && $_GET['sSearch_' . $i] != '' ) {
            if( $dbWhere == '' ) 
                $dbWhere = 'WHERE ';
            else
                $dbWhere .= ' AND ';
				
            $dbWhere .= $aColumns[$i] . ' LIKE "%' . mysql_real_escape_string($_GET['sSearch_' . $i]) . '%" ';
        }
    }
	echo 'SELECT SQL_CALC_FOUND_ROWS *
								FROM ' . DB_PREFIX . $dbTable
								. $sWhere
								. $sOrder
								. $sLimit;
	/*$rResult  = $db->select('SELECT SQL_CALC_FOUND_ROWS *
								FROM ' . DB_PREFIX . $$dbTable
								. $sWhere
								. $sOrder
								. $sLimit);
   
	$aResultFilterTotal  = $db->select("SELECT FOUND_ROWS()");
    $iFilteredTotal = $aResultFilterTotal[0];
     
	/*$aResultTotal  = $db->select("
        SELECT COUNT(`id`)
        FROM   $dbTable");*/
    $iTotal = $aResultTotal[0];
	
    $output = array(
        "sEcho" => intval($_GET['sEcho']),
        "iTotalRecords" => $iTotal,
        "iTotalDisplayRecords" => $iFilteredTotal,
        "aaData" => array()
    );
     
   /* while ($rResult)
    {
        $row = array();
        for ( $i=0 ; $i<count($aColumns) ; $i++ )
        {
            if ( $aColumns[$i] == "version" )
                $row[] = ($aRow[ $aColumns[$i] ]=="0") ? '-' : $aRow[ $aColumns[$i] ];
            else if ( $aColumns[$i] != ' ' )
                $row[] = $aRow[ $aColumns[$i] ];
        }
        $output['aaData'][] = $row;
    }*/
     
   // echo json_encode( $output );

	
	
	
$output = array(
	"sEcho"                => intval($_GET['sEcho']),
	"iTotalRecords" 	   => '',
	"iTotalDisplayRecords" => '',
	"aaData" 			   => array()
);
for($i = 0; $i < $_GET['iDisplayLength']; $i++) {
	$row = array();
	$row[] = 'Hello';
	$row[] = rand(0,15);
	$row[] = rand(0,150);
	$row[] = 'wqere';
	$output['aaData'][] = $row;
}
$i = rand($_GET['iDisplayLength'],150);
$output['iTotalRecords'] = $i;
$output['iTotalDisplayRecords'] = $i;

echo json_encode( $output );