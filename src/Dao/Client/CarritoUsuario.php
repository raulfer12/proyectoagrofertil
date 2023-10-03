<?php

namespace Dao\Client;

class CarritoUsuario extends \Dao\Table
{
    public static function comprobarProductEnCarritoUsuario($UsuarioId, $ProductoId)
    {
        $sqlstr = "SELECT * FROM carritocompraclienteregistrado
        WHERE UsuarioId = :UsuarioId AND ProductoId = :ProductoId;";
        return self::obtenerUnRegistro($sqlstr, array("UsuarioId"=>intval($UsuarioId), "ProductoId"=>$ProductoId));
    }

    public static function insertarProductCarritoUsuario($UsuarioId, $ProductoId, $ProdCantidad, $ProdPrecioVenta)
    {
        $insstr = "INSERT INTO carritocompraclienteregistrado
        VALUES (:UsuarioId, :ProductoId, :ProdCantidad, :ProdPrecioVenta, NOW())";
        return self::executeNonQuery($insstr, array("UsuarioId"=>intval($UsuarioId),
        "ProductoId"=>$ProductoId, "ProdCantidad"=>$ProdCantidad, "ProdPrecioVenta"=>$ProdPrecioVenta));
    }

    public static function sumarProductInventarioAnonimo($ProductoId, $ProdCantidad)
    {
        $updstr = "UPDATE Productos SET ProductoStock = ProductoStock + :ProdCantidad WHERE ProductoId = :ProductoId";
        return self::executeNonQuery($updstr, array("ProductoId"=>intval($ProductoId), "ProdCantidad"=>$ProdCantidad));
    }

    public static function restarProductInventarioUsuario($ProductoId, $ProdCantidad)
    {
        $updstr = "UPDATE Productos SET ProductoStock = ProductoStock - :ProdCantidad WHERE ProductoId = :ProductoId";
        return self::executeNonQuery($updstr, array("ProductoId"=>intval($ProductoId), "ProdCantidad"=>$ProdCantidad));
    }

    public static function deleteProductCarritoUsuario($UsuarioId, $ProductoId)
    {
        $delsql = "DELETE FROM carritocompraclienteregistrado
        WHERE UsuarioId = :UsuarioId AND ProductoId = :ProductoId;";
        return self::executeNonQuery(
            $delsql,
            array("UsuarioId" => intval($UsuarioId), "ProductoId"=>intval($ProductoId))
        );
    }

    public static function getProductsCarritoUsuario($UsuarioId)
    {
        $sqlstr = "SELECT cr.*, p.ProductoNombre, (cr.ProdCantidad * cr.ProductoPrecioVenta) as 'TotalProducto',
            m.MediaDoc, m.MediaPath
            FROM agrofertil.carritocompraclienteregistrado cr
            INNER JOIN agrofertil.productos p on cr.ProductoId = p.ProductoId
            INNER JOIN agrofertil.media m on m.ProductoId = p.ProductoId
            WHERE UsuarioId = :UsuarioId
            GROUP BY cr.ProductoId;";
        $sqlParams=[
            "UsuarioId" => $UsuarioId
        ];
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }

    public static function getTotalCarrito($UsuarioId)
    {
        $sqlstr = "SELECT SUM(cr.ProdCantidad * cr.ProductoPrecioVenta) as 'Total'
        FROM carritocompraclienteregistrado cr
        INNER JOIN productos p on cr.ProductoId = p.ProductoId
        WHERE UsuarioId = :UsuarioId";
        return self::obtenerUnRegistro($sqlstr, array("UsuarioId"=>intval($UsuarioId)));
    }
}
?>
