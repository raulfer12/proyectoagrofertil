<?php

namespace Utilities;

class Validators {

    static public function isLetter($valor)
    {
        return preg_match("/^[a-zA-ZÁÉÍÓÚÜÑáéíóúüñ\s]*$/", $valor);
    }
    
    static public function IsEmpty($valor)
    {
        return preg_match("/^\s*$/", $valor) && true;
    }

    static public function IsValidEmail($valor)
    {
        return preg_match("/^([a-z0-9_\.-]+\@[\da-z\.-]+\.[a-z\.]{2,6})$/", $valor) && true;
    }

    static public function IsValidPassword($valor){
        return preg_match("/^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,32}$/", $valor) && true;
    }

    public static function ValidarDinero($valor)
    {
        return preg_match("/^[0-9]+(\.[0-9]{1,2})?$/", $valor);
    }

    public static function ValidarNumeros($valor)
    {
        return preg_match("/^[0-9]*$/", $valor);
    }

    private function __construct()
    {}
    private function __clone()
    {}
}
?>
