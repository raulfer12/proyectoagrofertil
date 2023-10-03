<?php
/**
 * PHP Version 7.2
 *
 * @category Public
 * @package  Controllers
 * @author   Raul F. Banegas
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */
namespace Controllers;

/**
 * Index Controller
 *
 * @category Public
 * @package  Controllers
 * @author   Raul F. Banegas
 * @license  MIT http://
 * @link     http://
 */
class Index extends PublicController
{
    /**
     * Index run method
     *
     * @return void
     */

    public function run() :void
    {
        $dataview["items"] = \Dao\Client\Productos::getProductsRecientes();

        $max_description_length = 50;
        
        foreach($dataview["items"] as $key => $value)
        {
            if(strlen($dataview["items"][$key]["ProductoNombre"]) > $max_description_length)
            {
                $string = $value["ProductoNombre"];
                $offset = ($max_description_length - 3) - strlen($string);
                $dataview["items"][$key]["ProductoNombre"] = substr($string, 0, strrpos($string, ' ', $offset)) . '...';
            }

            $precioFinal = ($value["ProductoPrecioVenta"]) + ($value["ProductoPrecioVenta"] * 0.15);
            $dataview["items"][$key]["ProductoPrecioVenta"] = number_format($precioFinal, 2);
        }

        $layout = "layout.view.tpl";

        if(\Utilities\Security::isLogged())
        {
            $layout = "privatelayout.view.tpl";
            \Utilities\Nav::setNavContext();
        }

        \Views\Renderer::render("index", $dataview, $layout);
    }
}
?>
