<?php

namespace Dao\Client;

class Checkout extends \Dao\Table
{

    public static function insertarVenta($VentaCantidadTotal, $ClienteDireccion, $ClienteTelefono, $UsuarioId)
    {
        $insstr = "INSERT INTO ventas VALUES
        (
            0,
            NOW(),
            0.15,
            'PND',
            :VentaCantidadTotal,
            :ClienteDireccion,
            :ClienteTelefono,
            :UsuarioId
        );";

        return self::executeNonQuery
        (
            $insstr,
            array(
                "VentaCantidadTotal"=>$VentaCantidadTotal,
                "ClienteDireccion"=>$ClienteDireccion,
                "ClienteTelefono"=>$ClienteTelefono,
                "UsuarioId"=>intval($UsuarioId)
            )
        );
    }

    public static function insertarDetalleVenta($ProductoId, $VentasProdCantidad, $VentasProdPrecioVenta)
    {
        $VentaId = self::obtenerUnRegistro("Select max(VentaId) as VentaId from ventas;", array());
        $VentaId = $VentaId["VentaId"];
        $insstr = "INSERT INTO ventasproductos
        VALUES (:ProductoId, :VentaId, :VentasProdCantidad, :VentasProdPrecioVenta);";
        return self::executeNonQuery($insstr, array("ProductoId"=>intval($ProductoId),
        "VentaId"=>intval($VentaId), "VentasProdCantidad"=>intval($VentasProdCantidad),
        "VentasProdPrecioVenta"=>floatval($VentasProdPrecioVenta)));
    }

    public static function deleteAllCarritoUsuario($UsuarioId)
    {
        $delsql = "DELETE FROM carritocompraclienteregistrado WHERE UsuarioId = :UsuarioId;";
        return self::executeNonQuery($delsql, array("UsuarioId" => $UsuarioId));
    }

    public static function getProductsCarritoUsuario($UsuarioId)
    {
        $sqlstr = "SELECT cr.*, p.ProductoNombre, (cr.ProdCantidad * cr.ProductoPrecioVenta)
        as 'TotalProducto', m.MediaDoc, m.MediaPath FROM carritocompraclienteregistrado cr
        INNER JOIN productos p on cr.ProductoId = p.ProductoId INNER JOIN media m on m.ProductoId = p.ProductoId
        WHERE UsuarioId = :UsuarioId GROUP BY cr.ProductoId;";
        return self::obtenerRegistros($sqlstr, array("UsuarioId"=>intval($UsuarioId)));
    }
}
?>
