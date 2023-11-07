<?php

$envSettings = [];
    if (file_exists(dirname(__FILE__).'/.env')) {  /*bij deze regel pak je zegmaar de file zelf*/
        $envSettings = parse_ini_file(dirname(__FILE__).'/.env'); /*bij deze lees je hem*/
    }

   $schema=$envSettings["DB_SCHEMA_NAME"];
   $user=$envSettings["DB_USER"];
   $password=$envSettings["DB_PASSWORD"];
   $host=$envSettings["DB_HOST"];
    ?>