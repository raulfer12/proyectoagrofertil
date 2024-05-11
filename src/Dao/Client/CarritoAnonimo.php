<?php

namespace Dao\Client;

class CarritoAnonimo extends \Dao\Table
{
    public static function comprobarProductEnCarritoAnonimo($ClienteAnonimoId, $ProductoId)
    {
        $sqlstr = "SELECT * FROM carritocompraclienteanonimo
        WHERE ClienteAnonimoId = :ClienteAnonimoId AND ProductoId = :ProductoId;";
        return self::obtenerUnRegistro($sqlstr, array("ClienteAnonimoId"=>$ClienteAnonimoId,
        "ProductoId"=>$ProductoId));
    }

    public static function insertarProductCarritoAnonimo($ClienteAnonimoId, $ProductoId, $ProdCantidad,
    $ProdPrecioVenta)
    {
        $insstr = "INSERT INTO carritocompraclienteanonimo VALUES (:ClienteAnonimoId, :ProductoId, :ProdCantidad,
        :ProdPrecioVenta, NOW())";
        return self::executeNonQuery($insstr, array("ClienteAnonimoId"=>$ClienteAnonimoId, "ProductoId"=>$ProductoId,
        "ProdCantidad"=>$ProdCantidad, "ProdPrecioVenta"=>$ProdPrecioVenta));
    }

    public static function sumarProductInventarioAnonimo($ProductoId, $ProdCantidad)
    {
        $updstr = "UPDATE productos SET ProductoStock = ProductoStock + :ProdCantidad WHERE ProductoId = :ProductoId";
        return self::executeNonQuery($updstr, array("ProductoId"=>intval($ProductoId), "ProdCantidad"=>$ProdCantidad));
    }

    public static function restarProductInventarioAnonimo($ProductoId, $ProdCantidad)
    {
        $updstr = "UPDATE productos SET ProductoStock = ProductoStock - :ProdCantidad WHERE ProductoId = :ProductoId";
        return self::executeNonQuery($updstr, array("ProductoId"=>intval($ProductoId), "ProdCantidad"=>$ProdCantidad));
    }

    public static function deleteProductCarritoAnonimo($ClienteAnonimoId, $ProductoId)
    {
        $delsql = "DELETE FROM carritocompraclienteanonimo WHERE ClienteAnonimoId = :ClienteAnonimoId
        AND ProductoId = :ProductoId;";
        return self::executeNonQuery(
            $delsql,
            array("ClienteAnonimoId" => $ClienteAnonimoId, "ProductoId"=>$ProductoId)
        );
    }

    public static function deleteAllCarritoAnonimo($ClienteAnonimoId)
    {
        $delsql = "DELETE FROM carritocompraclienteanonimo WHERE ClienteAnonimoId = :ClienteAnonimoId;";
        return self::executeNonQuery($delsql, array("ClienteAnonimoId" => $ClienteAnonimoId));
    }

    public static function getProductsCarritoAnonimo($ClienteAnonimoId)
    {
        $sqlstr = "SELECT ca.*, p.ProductoNombre,
        m.MediaDoc, m.MediaPath FROM carritocompraclienteanonimo ca
        INNER JOIN productos p on ca.ProductoId = p.ProductoId
        INNER JOIN media m on m.ProductoId = p.ProductoId
        WHERE ClienteAnonimoId = :ClienteAnonimoId
        GROUP BY ca.ProductoId;";
        return self::obtenerRegistros($sqlstr, array("ClienteAnonimoId"=>strval($ClienteAnonimoId)));
    }

    /*public static function getTotalCarrito($ClienteAnonimoId)
    {
        $sqlstr = "SELECT SUM(ca.ProdCantidad * ca.ProductoPrecioVenta) as 'Total' FROM carritocompraclienteanonimo ca
        INNER JOIN productos p on ca.ProductoId = p.ProductoId
        WHERE ClienteAnonimoId = :ClienteAnonimoId";
        return self::obtenerUnRegistro($sqlstr, array("ClienteAnonimoId"=>$ClienteAnonimoId));
    }*/
}
?>
