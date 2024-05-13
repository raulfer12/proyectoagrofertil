<?php

namespace Controllers;

class Carrito extends \Controllers\PublicController
{
    private $Items = array();
    private $Total = 0.00;
    private $Subtotal = 0.00;

    public function run() :void
    {
        /*$UsuarioId = \Utilities\Security::getUserId();
    
            if($this->isPostBack())
            {
                $this->_loadPostData();
            }
    
            if(empty($UsuarioId))
            {
                \Utilities\Site::redirectToWithMsg("index.php?page=sec_login",
                "Es necesario iniciar sesión para continuar");
            }*/
            
        if(!$this->isPostBack())
        {
            if(!\Utilities\Security::isLogged())
            {
                $this->mostarProductsCarritoAnonimo();
            }
            else
            {
                $this->mostarProductsCarritoUsuario();
            }
        }
        else
        {
            if(!\Utilities\Security::isLogged())
            {
                $this->eliminarProductCarritoAnonimo();
            }
            else
            {
                $this->eliminarProductCarritoUsuario();
            }
        }

        if(isset($_POST['btnEliminar']))
        {
            if(!\Utilities\Security::isLogged())
            {
                $this->eliminarProductCarritoAnonimo();
            }
            else
            {
                $this->eliminarProductCarritoUsuario();
            }
        }

        $layout = "layout.view.tpl";

        if(\Utilities\Security::isLogged())
        {
            $layout = "privatelayout.view.tpl";
            \Utilities\Nav::setNavContext();
        }

        $allViewData= get_object_vars($this);
        \Views\Renderer::render("carrito", $allViewData, $layout);
    }

    private function mostarProductsCarritoAnonimo()
    {
        $this->Items = \Dao\Client\CarritoAnonimo::getProductsCarritoAnonimo(session_id());

        //Reformatear valor desde la base con decimales
        foreach($this->Items as $key => $value)
        {
            $this->Items[$key]["ProductoPrecioVenta"] = number_format($value["ProductoPrecioVenta"], 2);
           // $this->Items[$key]["TotalProduct"] = number_format($value["TotalProduct"], 2);

            $precioSinImpuesto = \Utilities\CalculoPrecios::CalcularPrecioSinImpuesto($value["ProductoPrecioVenta"]);

            $this->Items[$key]["ProdPrecioSinImpuesto"] = number_format($precioSinImpuesto, 2);
            $this->Items[$key]["ProdImpuesto"] = number_format(($value["ProductoPrecioVenta"] - $precioSinImpuesto), 2);
            $this->Subotal += $precioSinImpuesto;
            $this->Total += $value["TotalProducto"];
        }

        $this->Subtotal = number_format($this->Subtotal, 2);
        $this->Total = number_format($this->Total, 2);
    }

    private function eliminarProductCarritoAnonimo()
    {
        $ProductoId = isset($_POST["ProductoId"])?$_POST["ProductoId"]:"";
        $ProdCantidad = isset($_POST["ProdCantidad"])?$_POST["ProdCantidad"]:"";

        if(!empty($ProductoId) && !empty($ProdCantidad))
        {
            $resultDelete = \Dao\Client\CarritoAnonimo::deleteProductCarritoAnonimo(session_id(), $ProductoId);
            $resultUpdate = \Dao\Client\CarritoAnonimo::sumarProductInventarioAnonimo($ProductoId, $ProdCantidad);

            if($resultDelete && $resultUpdate)
            {
                \Utilities\Site::redirectToWithMsg("index.php?page=carrito", "Producto Eliminado con Éxito");
            }
        }
    }

    private function mostarProductsCarritoUsuario()
    {
        $UsuarioId = \Utilities\Security::getUserId();

        $this->Items = \Dao\Client\CarritoUsuario::getProductsCarritoUsuario($UsuarioId);

        foreach($this->Items as $key => $value)
        {
            $this->Items[$key]["ProductoPrecioVenta"] = number_format($value["ProductoPrecioVenta"], 2);
            $this->Items[$key]["TotalProducto"] = number_format($value["TotalProducto"], 2);

            $precioSinImpuesto = \Utilities\CalculoPrecios::CalcularPrecioSinImpuesto($value["ProductoPrecioVenta"]);

            $this->Items[$key]["ProdPrecioSinImpuesto"] = number_format($precioSinImpuesto, 2);
            $this->Items[$key]["ProdImpuesto"] = number_format(($value["ProductoPrecioVenta"] - $precioSinImpuesto), 2);
            $this->Subotal += $precioSinImpuesto;
            $this->Total += $value["TotalProducto"];
        }

        $this->Subtotal = number_format($this->Subtotal, 2);
        $this->Total = number_format($this->Total, 2);
    }

    private function eliminarProductCarritoUsuario()
    {
        $UsuarioId = \Utilities\Security::getUserId();
        $ProductoId = isset($_POST["ProductoId"])?$_POST["ProductoId"]:"";
        $ProdCantidad = isset($_POST["ProdCantidad"])?$_POST["ProdCantidad"]:"";

        if(!empty($ProductoId) && !empty($ProdCantidad))
        {
            $resultDelete = \Dao\Client\CarritoUsuario::deleteProductCarritoUsuario($UsuarioId, $ProductoId);
            $resultUpdate = \Dao\Client\CarritoUsuario::sumarProductInventarioAnonimo($ProductoId, $ProdCantidad);

            if($resultDelete && $resultUpdate)
            {
                \Utilities\Site::redirectToWithMsg("index.php?page=carrito", "Producto Eliminado con Éxito");
            }
        }
    }
}
