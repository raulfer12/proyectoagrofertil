<?php

    namespace Controllers\Admin;

    class Productos extends \Controllers\PrivateController
    {
        public function __construct()
        {
            
            $userInRole = \Utilities\Security::isInRol(
                \Utilities\Security::getUserId(),
                "ADMINISTRADOR"
            );
            
            parent::__construct();
        }
    
        private $ProductBusqueda = "";
        
        public function run() :void
        {
            $dataview = array();

            if ($this->isPostBack())
            {
                $this->ProductBusqueda = isset($_POST["ProductBusqueda"]) ? $_POST["ProductBusqueda"] : "";

                if(!empty($this->ProductBusqueda))
                {
                    $dataview["items"] = \Dao\Mnt\Productos::searchProductos($this->ProductBusqueda);
                    \Utilities\Context::setContext("ProductBusqueda", $this->ProductBusqueda);
                }
                else
                {
                    $dataview["items"] = \Dao\Mnt\Productos::getAll();
                }
            }
            else
            {
                $dataview["items"] = \Dao\Mnt\Productos::getAll();
            }
            
            \Views\Renderer::render("admin/productos", $dataview);
        }
    }
?>
