<?php
namespace Controllers;

use Dao\Dao;

class VisualizarProducto extends \Controllers\PublicController
{
    private $ProductoId = 0;
    private $ProductoNombre = "";
    private $ProductoDescripcion = "";
    private $ProductoPrecioVenta = "";
    private $ProdCantidad = 1;
    private $ProductoStock = "";
    private $PrimaryMediaDoc = "";
    private $PrimaryMediaPath = "";
    private $AllProducMedia = array();
    private $Error = "";

    private $mode_dsc = "";

    public function run() :void
    {
        $this->ProductoId = isset($_GET["ProductoId"])?$_GET["ProductoId"]:0;
        
        if($this->isPostBack())
        {
            $this->_loadPostData();
        }

        $layout = "layout.view.tpl";

        if(\Utilities\Security::isLogged())
        {
            $layout = "privatelayout.view.tpl";
            \Utilities\Nav::setNavContext();
        }

        $this->_load();
        $dataview = get_object_vars($this);

        \Views\Renderer::render("VisualizarProducto", $dataview, $layout);
    }

    private function _load()
    {
        $_data = \Dao\Client\Productos::getOne($this->ProductoId);
        $_producMedia = \Dao\Client\Productos::getAllProducMedia($this->ProductoId);

        if ($_data) 
        {
            $this->ProductoId = $_data["ProductoId"];
            $this->ProductoNombre = $_data["ProductoNombre"];
            $this->ProductoDescripcion = $_data["ProductoDescripcion"];
            $precioFinal = ($_data["ProductoPrecioVenta"]);
            $this->ProductoPrecioVenta = number_format($precioFinal, 2);
            $this->ProductoStock = $_data["ProductoStock"];
            $this->PrimaryMediaDoc = $_data["MediaDoc"];
            $this->PrimaryMediaPath = $_data["MediaPath"];
        }

        if($_producMedia)
        {
            $this->AllProducMedia = $_producMedia;
        }
    }

    private function _loadPostData()
    {
        $this->ProductoPrecioVenta = isset($_POST["ProductoPrecioVenta"])?$_POST["ProductoPrecioVenta"]:"";
        $this->ProdCantidad = isset($_POST["ProdCantidad"])?$_POST["ProdCantidad"]:"";
        $this->ProductoPrecioVenta = floatval(str_replace(",","",$this->ProductoPrecioVenta));
        $this->ProductoStock = isset($_POST["ProductoStock"]) ? $_POST["ProductoStock"] : "";

        if(!\Utilities\Security::isLogged())
        {
            $this->addProducCarritoAnonimo();
        }
        else
        {
            $this->addProducCarritoUsuario();
        }
    }

    private function addProducCarritoAnonimo()
    {
        $_comprobar = \Dao\Client\CarritoAnonimo::comprobarProductEnCarritoAnonimo(session_id(), $this->ProductoId);

        if(empty($_comprobar))
        {
            if(!$this->validarCantidadDisponibleProduct())
            {
                $this->ingresarProductCarritoAnonimo();
            }
        }
        else
        {
            if(!$this->validarCantidadDisponibleProduct())
            {
                $resultUpdate =
                \Dao\Client\CarritoAnonimo::sumarProductInventarioAnonimo($this->ProductoId,
                $_comprobar["ProdCantidad"]);
                $resultDelete = \Dao\Client\CarritoAnonimo::deleteProductCarritoAnonimo(session_id(),
                $this->ProductoId);

                if($resultDelete && $resultUpdate)
                {
                    $this->ingresarProductCarritoAnonimo();
                }
            }
        }
    }

    private function addProducCarritoUsuario()
    {
        $UsuarioId = \Utilities\Security::getUserId();
        $_comprobar = \Dao\Client\CarritoUsuario::comprobarProductEnCarritoUsuario($UsuarioId, $this->ProductoId);

        if(empty($_comprobar))
        {
            if(!$this->validarCantidadDisponibleProduct())
            {
                $this->ingresarProductCarritoUsuario($UsuarioId);
            }
        }
        else
        {
            if(!$this->validarCantidadDisponibleProduct())
            {
                $resultUpdate = \Dao\Client\CarritoUsuario::sumarProductInventarioAnonimo($this->ProductoId,
                $_comprobar["ProdCantidad"]);
                $resultDelete = \Dao\Client\CarritoUsuario::deleteProductCarritoUsuario($UsuarioId, $this->ProductoId);
                if($resultDelete && $resultUpdate)
                {
                    $this->ingresarProductCarritoUsuario($UsuarioId);
                }
            }
        }
    }

    private function validarCantidadDisponibleProduct()
    {
        $error = false;
        if($this->ProdCantidad > $this->ProductoStock)
        {
            $this->Error =
            "No se cuenta con las suficientes unidades en existencia, unidades actuales: ".$this->ProductoStock;
            $error = true;
        }

        return $error;
    }

    private function ingresarProductCarritoAnonimo()
    {
        $resultInsert = \Dao\Client\CarritoAnonimo::insertarProductCarritoAnonimo(session_id(),
        $this->ProductoId, $this->ProdCantidad, $this->ProductoPrecioVenta);
        $resultUpdate =  \Dao\Client\CarritoAnonimo::restarProductInventarioAnonimo($this->ProductoId,
        $this->ProdCantidad);

        if($resultInsert && $resultUpdate)
        {
            \Utilities\Site::redirectToWithMsg("index.php?page=VisualizarProducto&ProductoId=".$this->ProductoId,
            "Producto Agregado al Carrito con Éxito");
        }
    }

    private function ingresarProductCarritoUsuario($UsuarioId)
    {
        $resultInsert = \Dao\Client\CarritoUsuario::insertarProductCarritoUsuario($UsuarioId, $this->ProductoId,
        $this->ProdCantidad, $this->ProductoPrecioVenta);
        $resultUpdate = \Dao\Client\CarritoUsuario::restarProductInventarioUsuario($this->ProductoId,
        $this->ProdCantidad);

        if($resultInsert && $resultUpdate)
        {
            \Utilities\Site::redirectToWithMsg("index.php?page=VisualizarProducto&ProductoId=".$this->ProductoId,
            "Producto Agregado al Carrito con Éxito");
        }
    }
}
