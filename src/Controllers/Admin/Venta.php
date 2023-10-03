<?php
namespace Controllers\Admin;

use Dao\Security\Estados;

class Venta extends \Controllers\PrivateController
{
    public function __construct()
    {
        parent::__construct();
    }

    private $VentaId = 0;
    private $VentaFecha = "";
    private $VentaISV = "";
    private $VentaEst = "";
    private $VentaCantidadTotal = "";
    private $ClienteDireccion = "";
    private $ClienteTelefono = "";
    private $UsuarioNombre = "";
    private $Products = array();
    private $ProductTotal = "";

    private $mode_dsc = "";
    private $mode_adsc = array(
        "DSP" => "Visualizar Venta Código: %s, Nombre del Cliente: %s"
    );

    private $readonly = "";
    private $showaction= true;
    private $notDisplayIns= false;

    private $hasErrors = false;
    private $aErrors = array();

    public function run() :void
    {
        $this->mode = isset($_GET["mode"])?$_GET["mode"]:"";
        $this->VentaId = isset($_GET["VentaId"])?$_GET["VentaId"]:0;
        if (!$this->isPostBack())
        {
            $this->_load();
        }
    

        $dataview = get_object_vars($this);
        \Views\Renderer::render("admin/venta", $dataview);
    }

    private function _load()
    {
        $_data = \Dao\Mnt\Ventas::getOne($this->VentaId);
        $_products= \Dao\Mnt\Ventas::getProducts($this->VentaId);
        $_producttotal= \Dao\Mnt\Ventas::getTotal($this->VentaId);

        if ($_data && $_products && $_producttotal)
        {
            $this->VentaId = $_data["VentaId"];
            $this->VentaFecha = $_data["VentaFecha"];
            $this->VentaISV = $_data["VentaISV"];
            $this->VentaEst = $_data["VentaEst"];
            $this->VentaCantidadTotal = $_data["VentaCantidadTotal"];
            $this->ClienteDireccion = $_data["ClienteDireccion"];
            $this->ClienteTelefono = $_data["ClienteTelefono"];
            $this->UsuarioNombre = $_data["UsuarioNombre"];
            $this->Products = $_products;
            $this->ProductTotal = $_producttotal;
            $this->_setViewData();
        }
    }

    private function _setViewData()
    {
        $this->mode_dsc = sprintf(
            $this->mode_adsc[$this->mode],
            $this->VentaId,
            $this->UsuarioNombre
        );

        $this->notDisplayIns = ($this->mode=="INS") ? false : true;
        $this->readonly = ($this->mode =="DEL" || $this->mode=="DSP") ? "readonly":"";
        $this->showaction = !($this->mode == "DSP");
    }
}
?>
