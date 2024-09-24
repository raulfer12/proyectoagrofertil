<?php
class Conexion{
    static public function conectar(){
        $link = new PDO("mysql:host=localhost; dbname=u993299577_agrofertil",
        "u993299577_oscarflores",
        "@groFertil2024");

        $mitz="America/Mexico_City";
        $tz=(new DateTime('now', new DateTimeZone($mitz)))->format('P');
        $link->exec("SET time_zone='$tz';");

        $link->exec("set names utf8");

        return $link;
    }
}
?>