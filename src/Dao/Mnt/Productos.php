<?php

namespace Dao\Mnt;

class Productos extends \Dao\Table
{
    public static function getAll()
    {
        return self::obtenerRegistros("SELECT * FROM agrofertil.productos", array());
    }

    public static function getOne($ProductoId)
    {
        $sqlstr = "SELECT a.ProductoId, a.ProductoNombre, a.ProductoDescripcion, a.ProductoPrecioVenta,
        a.ProductoPrecioCompra, a.ProductoEst, a.ProductoStock, b.MediaId, b.MediaDoc, b.MediaPath
        FROM agrofertil.productos a
        LEFT JOIN media b ON a.ProductoId = b.ProductoId
        WHERE a.ProductoId=:ProductoId;";
        return self::obtenerUnRegistro($sqlstr, array("ProductoId"=>$ProductoId));
    }

    public static function insert($ProductoNombre, $ProductoDescripcion, $ProductoPrecioVenta,
    $ProductoPrecioCompra, $ProductoEst, $ProductoStock)
    {
        $insstr = "INSERT INTO agrofertil.productos (ProductoNombre, ProductoDescripcion, ProductoPrecioVenta,
        ProductoPrecioCompra, ProductoEst, ProductoStock)
        values (:ProductoNombre, :ProductoDescripcion, :ProductoPrecioVenta, :ProductoPrecioCompra, :ProductoEst,
        :ProductoStock);";
        return self::executeNonQuery(
            $insstr,
            array(
                "ProductoNombre"=>$ProductoNombre,
                "ProductoDescripcion"=>$ProductoDescripcion,
                "ProductoPrecioVenta"=>$ProductoPrecioVenta,
                "ProductoPrecioCompra"=>$ProductoPrecioCompra,
                "ProductoEst"=>$ProductoEst,
                "ProductoStock"=>$ProductoStock
            )
        );
    }

    public static function update($ProductoNombre, $ProductoDescripcion, $ProductoPrecioVenta,
    $ProductoPrecioCompra, $ProductoEst, $ProductoStock, $ProductoId)
    {
        $updsql = "UPDATE productos
        SET ProductoNombre=:ProductoNombre, ProductoDescripcion=:ProductoDescripcion,
        ProductoPrecioVenta=:ProductoPrecioVenta, ProductoPrecioCompra=:ProductoPrecioCompra,
        ProductoEst=:ProductoEst, ProductoStock=:ProductoStock
        WHERE ProductoId=:ProductoId;";
        return self::executeNonQuery(
            $updsql,
            array(
                "ProductoNombre"=>$ProductoNombre,
                "ProductoDescripcion"=>$ProductoDescripcion,
                "ProductoPrecioVenta"=>$ProductoPrecioVenta,
                "ProductoPrecioCompra"=>$ProductoPrecioCompra,
                "ProductoEst"=>$ProductoEst,
                "ProductoStock"=>$ProductoStock,
                "ProductoId"=>$ProductoId
            )
        );
    }

    public static function delete( $ProductoId)
    {
        $delsql = "delete from productos where ProductoId=:ProductoId;";
        return self::executeNonQuery(
            $delsql,
            array( "ProductoId" => $ProductoId)
        );
    }

    static public function searchproductos($ProductBusqueda)
    {
        $sqlstr = "SELECT * FROM productos
        WHERE ProductoNombre LIKE :ProductBusqueda
        OR ProductoPrecioVenta LIKE :ProductoBusqueda
        OR ProductoEst LIKE :ProductBusqueda;";
        
        return self::obtenerRegistros($sqlstr, array("ProductBusqueda"=>"%".$ProductBusqueda."%"));
    }
}
?>
