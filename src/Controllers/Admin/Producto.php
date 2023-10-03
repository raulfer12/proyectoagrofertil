<?php

namespace Controllers\Admin;

class Producto extends \Controllers\PrivateController
{
    public function __construct()
    {
        
        $userInRole = \Utilities\Security::isInRol(
            \Utilities\Security::getUserId(),
            "ADMINISTRADOR"
        );
        
        parent::__construct();
    }

    private $ProductoId = 0;
    private $ProductoNombre = "";
    private $ProductoDescripcion = "";
    private $ProductoPrecioVenta = 0;
    private $ProductoPrecioCompra = 0;
    private $ProductoEst = "";
    private $ProductoStock = 0;
    private $ProductoStock_ACT = "";
    private $ProductoStock_INA = "";
    private $MediaId = 0;
    private $MediaPath = "public/imgs/productos/";
    private $Media = array();

    private $mode = "";
    private $mode_dsc = "";
    private $mode_adsc = array(
        "INS" => "Nuevo Producto",
        "UPD" => "<b>Editar</b> <br> Código: %s <br> Nombre: %s",
        "DEL" => "<b>Eliminar</b> <br> Código: %s <br> Nombre: %s",
        "DSP" => "<b>Visualizar</b> <br> Código: %s <br> Nombre: %s"
    );

    private $readonly = "";
    private $showaction= true;
    private $notDisplayIns= false;
    private $notDisplayDel= true;

    private $hasErrors = false;
    private $aErrors = array();

    public function run() :void
    {
        $this->mode = isset($_GET["mode"])?$_GET["mode"]:"";
        $this->ProductoId = isset($_GET["ProductoId"])?$_GET["ProductoId"]:"";

        if (!$this->isPostBack())
        {
            if ($this->mode !== "INS")
            {
                $this->_load();
            }
            else
            {
                $this->mode_dsc = $this->mode_adsc[$this->mode];
            }
        }
        else
        {
            $this->_loadPostData();
            if (!$this->hasErrors)
            {
                switch ($this->mode)
                {
                    case "INS":

                        $inserto = false;

                        if (\Dao\Mnt\Productos::insert($this->ProductoNombre, $this->ProductoDescripcion,
                        $this->ProductoPrecioVenta, $this->ProductoPrecioCompra, $this->ProductoEst,
                        $this->ProductoStock))
                        {
    
                            foreach ($this->Media['name'] as $item => $name)
                            {
                                if ( !empty($this->Media['name'][$item]) )
                                {
                                    if (\Dao\Mnt\Media::insert($this->Media['name'][$item],
                                    $this->MediaPath.$this->Media['name'][$item]))
                                    {
                                        move_uploaded_file($this->Media['tmp_name'][$item],
                                        $this->MediaPath.$this->Media['name'][$item]);
                                        $inserto = true;
                                    }
                                }
                                else
                                {
                                    if (\Dao\Mnt\Media::insert("sld1.jpg", "public/img/sld1.jpg"))
                                    {
                                        
                                        \Utilities\Site::redirectToWithMsg(
                                            "index.php?page=admin_productos",
                                            "¡Producto Agregado Satisfactoriamente!"
                                        );
                                    }
                                }
                            }

                            if ($inserto)
                            {
                                \Utilities\Site::redirectToWithMsg(
                                    "index.php?page=admin_productos",
                                    "¡Producto Agregado Satisfactoriamente!"
                                );
                            }
                            
                        }
                    break;

                    case "UPD":

                        $actualizo = false;

                        if (\Dao\Mnt\Productos::update($this->ProductoNombre,
                        $this->ProductoDescripcion, $this->ProductoPrecioVenta,
                        $this->ProductoPrecioCompra, $this->ProductoEst, $this->ProductoStock, $this->ProductoId))
                        {

                            $_datosMedia = \Dao\Mnt\Media::getAll($this->ProductoId);

                            foreach ($this->Media['name'] as $item => $name)
                            {
                                if (!empty($_FILES['imagenes']['name'][$item]))
                                {
                                    foreach ($_datosMedia as $_mediaDB)
                                    {
                                        if ($_mediaDB['MediaPath'] == "public/img/sld1.jpg")
                                        {
                                            \Dao\Mnt\Media::delete($this->ProductoId, $_mediaDB['MediaId']);
                                        }
                                        else
                                        {
                                            \Dao\Mnt\Media::delete($this->ProductoId, $_mediaDB['MediaId']);
                                            @unlink("public/imgs/productos/".$_mediaDB['MediaDoc']);
                                        }
                                    }

                                    if ( !empty($this->Media['name'][$item]) )
                                    {
                                        if (\Dao\Mnt\Media::update($this->Media['name'][$item],
                                        $this->MediaPath.$this->Media['name'][$item], $this->ProductoId))
                                        {
                                            move_uploaded_file($this->Media['tmp_name'][$item],
                                            $this->MediaPath.$this->Media['name'][$item]);
                                            $actualizo = true;
                                        }

                                    }

                                }
                                else
                                {
                                    foreach ($_datosMedia as $_mediaDB)
                                    {
                                        if (!empty($_mediaDB['MediaDoc']))
                                        {
                                            \Utilities\Site::redirectToWithMsg(
                                                "index.php?page=admin_productos",
                                                "¡Producto Actualizado Satisfactoriamente!"
                                            );
                                        }
                                        else
                                        {
                                            if (\Dao\Mnt\Media::update("sld1.jpg",
                                            "public/img/sld1.jpg", $this->ProductoId))
                                            {

                                                \Utilities\Site::redirectToWithMsg(
                                                    "index.php?page=admin_productos",
                                                    "¡Producto Actualizado Satisfactoriamente!"
                                                );
                                            }
                                        }
                                    }
                                }
                            }

                            if ($actualizo)
                            {
                                \Utilities\Site::redirectToWithMsg(
                                    "index.php?page=admin_productos",
                                    "¡Producto Actualizado Satisfactoriamente!"
                                );
                            }
                        }
                    break;

                    case "DEL":

                        $elimino = false;
                        $_dataMedia = \Dao\Mnt\Media::getAll($this->ProductoId);
                                                
                        if (\DAO\Mnt\Productos::delete($this->ProductoId))
                        {
                            foreach ($_dataMedia as $_media)
                            {
                                if ($_media['MediaPath'] == "public/img/sld1.jpg")
                                {
                                    \Dao\Mnt\Media::delete($this->ProductoId, $_media['MediaId']);
                                    $elimino = true;
                                }
                                else
                                {
                                    \Dao\Mnt\Media::delete($this->ProductoId, $_media['MediaId']);
                                    unlink("public/imgs/productos/".$_media['MediaDoc']);
                                    $elimino = true;
                                }
                            }
                            
                            if ($elimino)
                            {
                                \Utilities\Site::redirectToWithMsg(
                                    "index.php?page=admin_productos",
                                    "¡Producto Eliminado Satisfactoriamente!"
                                );
                            }
                        }
                    break;
                }
            }
        }

        $dataview = get_object_vars($this);
        \Views\Renderer::render("admin/producto", $dataview);
    }

    private function _load()
    {
        $_data = \Dao\Mnt\Productos::getOne($this->ProductoId);

        if ($_data)
        {
            $this->ProductoId = $_data["ProductoId"];
            $this->ProductoNombre = $_data["ProductoNombre"];
            $this->ProductoDescripcion = $_data["ProductoDescripcion"];
            $this->ProductoPrecioVenta = $_data["ProductoPrecioVenta"];
            $this->ProductoPrecioCompra = $_data["ProductoPrecioCompra"];
            $this->ProductoEst = $_data["ProductoEst"];
            $this->ProductoStock = $_data["ProductoStock"];

            $_dataMedia = \Dao\Mnt\Media::getAll($this->ProductoId);
            if ($_dataMedia){
                $this->Media = $_dataMedia;
            }
            $this->_setViewData();
        }
    
    }

    private function _loadPostData()
    {
        $this->ProductoId = isset($_POST["ProductoId"]) ? $_POST["ProductoId"] : 0 ;
        $this->ProductoNombre = isset($_POST["ProductoNombre"]) ? $_POST["ProductoNombre"] : "" ;
        $this->ProductoDescripcion = isset($_POST["ProductoDescripcion"]) ? $_POST["ProductoDescripcion"] : "";
        $this->ProductoPrecioVenta = isset($_POST["ProductoPrecioVenta"]) ? $_POST["ProductoPrecioVenta"] : 0;
        $this->ProductoPrecioCompra = isset($_POST["ProductoPrecioCompra"]) ? $_POST["ProductoPrecioCompra"] : 0;
        $this->ProductoEst = isset($_POST["ProductoEst"]) ? $_POST["ProductoEst"] : "";
        $this->ProductoStock = isset($_POST["ProductoStock"]) ? $_POST["ProductoStock"] : 0;
        $this->MediaId = isset($_POST["MediaId"]) ? $_POST["MediaId"] : 0;
        
        if(!(is_null(['imagenes']) || is_null(['name'])))
        {
            if (($_FILES['imagenes']['name'] != null))
            {
                foreach ($_FILES['imagenes']['tmp_name'] as $key => $tmp_name)
                {
                    if ( !empty($_FILES['imagenes']['name'][$key]) )
                    {
                        $this->Media['name'][$key] = $_FILES['imagenes']['name'][$key];
                        $this->Media['tmp_name'][$key] = $_FILES['imagenes']['tmp_name'][$key];
                        $this->Media['size'][$key] = $_FILES['imagenes']['size'][$key];
                    }
                    else
                    {
                        $this->Media['name'][$key] = "";
                        $this->Media['tmp_name'][$key] = "";
                    }
                }
            }
        }
        
        if (\Utilities\Validators::IsEmpty($this->ProductoNombre))
        {
            $this->aErrors[] = "El nombre del producto no puede ir vacio";
        }

        if(\Utilities\Validators::IsEmpty($this->ProductoDescripcion))
        {
            $this->aErrors[] = "La descripción del producto no puede ir vacia";
        }

        if(!(\Utilities\Validators::ValidarDinero($this->ProductoPrecioVenta)) || $this->ProductoPrecioVenta<=0)
        {
            $this->aErrors[] = "El precio de venta no es válido.";
        }

        if(!(\Utilities\Validators::ValidarDinero($this->ProductoPrecioCompra)) || $this->ProductoPrecioCompra<=0)
        {
            $this->aErrors[] = "El precio de compra no es válido.";
        }

        if(!(\Utilities\Validators::ValidarNumeros($this->ProductoStock)) || $this->ProductoPrecioCompra<=0)
        {
            $this->aErrors[] = "El stock no es válido.";
        }

        $this->hasErrors = (count($this->aErrors) > 0);
        $this->_setViewData();
    }

    private function _setViewData()
    {
        $this->ProductoEst_ACT = ($this->ProductoEst === "ACT") ? "selected" : "";
        $this->ProductoEst_INA = ($this->ProductoEst === "INA") ? "selected" : "";

        $this->mode_dsc = sprintf(
            $this->mode_adsc[$this->mode],
            $this->ProductoId,
            $this->ProductoNombre
        );

        $this->notDisplayIns = ($this->mode=="INS") ? false : true;
        $this->notDisplayDel = ($this->mode=="DEL") ? false : true;
        $this->readonly = ($this->mode =="DEL" || $this->mode=="DSP") ? "readonly":"";
        $this->showaction = !($this->mode == "DSP");
    }
}
?>
