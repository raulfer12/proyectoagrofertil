<?php

namespace Dao\Client;

class Productos extends \Dao\Table
{
    public static function getProductsRecientes()
    {
        return self::obtenerRegistros("SELECT * FROM agrofertil.productos_agrofertil p
        INNER JOIN media_agrofertil m on p.ProductoId = m.ProductoId WHERE ProductoStock > 0 AND ProductoEst = 'ACT'
        GROUP BY p.ProductoId ORDER BY p.ProductoId DESC LIMIT 8;", array());
    }

    public static function getProductCount()
    {
        $sqlstr = "SELECT COUNT(ProductoId) as 'Total' FROM agrofertil.productos_agrofertil
        WHERE ProductoStock > 0 AND ProductoEst = 'ACT' ;";
        return self::obtenerUnRegistro($sqlstr, array());
    }

    public static function getProductsforPage($Inicio, $Limite)
    {
        $sqlstr = "SELECT * FROM agrofertil.productos_agrofertil p
        INNER JOIN media_agrofertil m on p.ProductoId = m.ProductoId WHERE ProductoStock > 0
        AND ProductoEst = 'ACT' GROUP BY p.ProductoId LIMIT :Inicio, :Limite;";
        return self::obtenerRegistrosIntParams($sqlstr, array("Inicio"=>$Inicio, "Limite"=>$Limite));
    }

    public static function getOne($ProductoId)
    {
        $sqlstr = "SELECT * FROM agrofertil.productos_agrofertil p
        INNER JOIN media_agrofertil m on p.ProductoId = m.ProductoId
        WHERE p.ProductoId = :ProductoId AND ProductoEst = 'ACT' GROUP BY p.ProductoId;";
        return self::obtenerUnRegistro($sqlstr, array("ProductoId"=>$ProductoId));
    }

    public static function getAllProducMedia($ProductoId)
    {
        $sqlstr = "SELECT * FROM media_agrofertil WHERE ProductoId=:ProductoId";
        return self::obtenerRegistros($sqlstr, array("ProductoId"=>$ProductoId));
    }

    static public function searchProductsCliente($UsuarioBusqueda, $Inicio, $Limite)
    {
        $sqlstr = "SELECT * FROM agrofertil.productos_agrofertil p
        INNER JOIN media_agrofertil m on p.ProductoId = m.ProductoId
        WHERE ProductoEst = 'ACT' AND ProductoStock > 0
        AND (p.ProductoNombre LIKE :UsuarioBusqueda) GROUP BY p.ProductoId LIMIT :Inicio, :Limite;";
        return self::obtenerRegistros($sqlstr, array("UsuarioBusqueda"=>"%".$UsuarioBusqueda."%",
         "Inicio"=>intval($Inicio), "Limite"=>intval($Limite)));
    }

    static public function searchProductsClienteCount($UsuarioBusqueda)
    {
        $sqlstr = "SELECT COUNT(ProductoId) as 'Total' FROM agrofertil.productos_agrofertil
        WHERE ProductoStock > 0 AND ProductoEst = 'ACT' AND (ProductoNombre LIKE :UsuarioBusqueda);";
        
        return self::obtenerUnRegistro($sqlstr, array("UsuarioBusqueda"=>"%".$UsuarioBusqueda."%"));
    }
}
?>
