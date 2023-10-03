<?php

namespace Dao\Mnt;

class Pedidos extends \Dao\Table
{
    public static function getAll()
    {
        return self::obtenerRegistros("SELECT v.*, u.UsuarioNombre FROM Ventas v
        INNER JOIN usuarios u on v.UsuarioId = u.UsuarioId
        WHERE VentaEst='PND';", array());
    }

    public static function getOne($VentaId)
    {
        $sqlstr = "SELECT v.*, u.UsuarioNombre FROM Ventas v
        INNER JOIN usuarios u on v.UsuarioId = u.UsuarioId
        WHERE VentaId=:VentaId;";
        return self::obtenerUnRegistro($sqlstr, array("VentaId"=>$VentaId));
    }

    public static function update($VentaId)
    {
        $updsql = "UPDATE ventas SET VentaEst = 'ENVIADO'
        WHERE VentaId=:VentaId;";
        return self::executeNonQuery(
            $updsql,
            array("VentaId" => $VentaId)
        );
    }

    public static function getProducts($VentaId)
    {
        $sqlstr = "SELECT vp.ProductoId, ProductoNombre, ProductoDescripcion, ProductoPrecioVenta, VentasProdCantidad
        FROM ventasproductos vp
        INNER JOIN Productos p ON vp.ProductoId = p.ProductoId
        WHERE vp.VentaId=:VentaId;";
        return self::obtenerRegistros($sqlstr, array("VentaId"=>$VentaId));
    }

    static public function searchPedidos($UsuarioBusqueda)
    {
        $sqlstr = "SELECT v.*, u.UsuarioNombre FROM Ventas v INNER JOIN usuarios u on v.UsuarioId = u.UsuarioId
        WHERE VentaId LIKE :UsuarioBusqueda
        OR VentaFecha LIKE :UsuarioBusqueda
        OR VentaISV LIKE :UsuarioBusqueda
        OR VentaEst LIKE :UsuarioBusqueda
        OR v.ClienteDireccion LIKE :UsuarioBusqueda
        OR v.ClienteTelefono LIKE :UsuarioBusqueda
        OR UsuarioNombre LIKE :UsuarioBusqueda;";
        
        return self::obtenerRegistros($sqlstr, array("UsuarioBusqueda"=>"%".$UsuarioBusqueda."%"));
    }
}
?>
