<?php
error_reporting(0);

Class MySQL
{
    var $CONN = "";
    var $CURDB = "";
    var $con = 0;
    var $server = 'localhost';
    var $user = 'root';
    var $pas = '123';
    var $dbase = '';
    var $i = 0;

    function error($text)
    {
        $no = mysql_errno();
        $msg = mysql_error();
        echo '[' . $text . '] ( ' . $no . ' : ' . $msg . ' )<BR>\n';
        exit;
    }


    function connect()
    {
        $conn = mysql_connect($this->server, $this->user, $this->pas);


        if (!$conn) {
            $this->error('Connection attempt failed');
        }

        $this->CONN = $conn;
        if ($this->dbase) {
            $this->set_db($this->dbase);
        }
        mysql_query("SET NAMES utf8");
        $this->con = 1;
        return 1;
    }

    function connect_other($server_other, $user_other, $pas_other, $dbase_other)
    {
        $conn = mysql_connect($server_other, $user_other, $pas_other);

        if (!$conn) {
            $this->error('Connection attempt failed');

        }

        $this->CONN = $conn;

        if ($dbase_other) {
            $this->set_db($dbase_other);
        }

        mysql_query("SET NAMES utf8");
        $this->con = 1;
        return 1;
    }


    function select($sql)
    {
        $this->i++;
        if ($this->con == 0) $this->connect();

        $res = mysql_query($sql, $this->CONN);

        if (!$res) {
            $sql_query_1 = 'SELECT failed in SQL: ' . $sql;
            $this->error($sql_query_1);
        }

        if (empty($res)) {
            return 0;
        }

        $count = 0;
        $data = array();
        while ($row = mysql_fetch_array($res, MYSQL_ASSOC)) {
            $data[$count] = $row;
            $count++;
        }
        mysql_free_result($res);
        return $data;
    }

    function select_id($sql)
    {
        $this->i++;

        if ($this->con == 0) $this->connect();
        $res = mysql_query($sql, $this->CONN);

        if (!$res) {
            $sql_query_1 = 'SELECT failed in SQL: ' . $sql;
            $this->error($sql_query_1);
        }

        if (empty($res)) {
            return 0;
        }

        $data = array();
        while ($row = mysql_fetch_array($res, MYSQL_ASSOC)) {
            $data[$row[id]] = $row;
        }
        mysql_free_result($res);
        return $data;
    }

    function execute($sql)
    {
        $this->i++;
        if ($this->con == 0) $this->connect();
        $res = mysql_query($sql, $this->CONN);
        if (!$res) {
            $this->error('EXEC failed in SQL: ' . $sql);
        }
        return $res;
    }

    function insert_id()
    {
        $this->i++;
        if ($this->con == 0) $this->connect();
        $res = mysql_insert_id($this->CONN);
        if (!$res) {
            return 0;
        }
        return $res;
    }

    function one_data($sql)
    {
        $this->i++;
        if ($this->con == 0) $this->connect();
        $res = mysql_query($sql, $this->CONN);
        if (!$res) {
            $this->error('SELECT failed in SQL: ' . $sql);
        }
        if (empty($res)) {
            return 0;
        }
        list($r) = mysql_fetch_row($res);
        mysql_free_result($res);
        return ($r);
    }

    function one_array($sql)
    {
        $this->i++;
        if ($this->con == 0) $this->connect();
        $res = mysql_query($sql, $this->CONN);
        if (!$res) {
            $this->error('SELECT failed in SQL: ' . $sql);
        }
        if (empty($res)) {
            return 0;
        }
        $r = mysql_fetch_array($res);
        mysql_free_result($res);
        return ($r);
    }

    function disconnect()
    {
        $res = mysql_close($this->CONN);
        $this->con = 0;
        return $res;
    }

    function set_db($dbname)
    {

        if (!$dbname || $this->CURDB == $dbname) {

            return;
        }

        if (!mysql_select_db($dbname, $this->CONN)) {
            $this->error("Dbase Select failed");
        }
        $this->CURDB = $dbname;
    }


}

$db = new MySQL;
$db->server = DB_SERVER;
$db->dbase = DB_NAME;
$db->user = DB_USER;
$db->pas = DB_PASS;

// подключение Memcache
if (CASH == 2) {
    $memcache = new Memcache;
    $memcache->connect('localhost', 11211);
//$memcache->addServer('localhost', 11211);

}