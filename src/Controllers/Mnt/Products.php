<?php
/**
 * PHP Version 7.2
 * Mnt
 *
 * @category Controller
 * @package  Controllers\Mnt
 * @author   Raul F. Banegas
 * @license  Comercial http://
 * @version  CVS:1.0.0
 * @link     http://url.com
 */
 namespace Controllers\Mnt;

// ---------------------------------------------------------------
// Sección de imports
// ---------------------------------------------------------------
use Controllers\PublicController;
use Dao\Mnt\Productos as DaoProductos;
use Views\Renderer;

/**
 * Products
 *
 * @category Public
 * @package  Controllers\Mnt;
 * @author   Raul F. Banegas
 * @license  MIT http://
 * @link     http://
 */
class Productos extends PublicController
{
    /**
     * Runs the controller
     *
     * @return void
     */
    public function run():void
    {
        // code
        $viewData = array();
        $viewData["Productos"] = DaoProductos::getAll();
        error_log(json_encode($viewData));

        Renderer::render('mnt/Productos', $viewData);
    }
}
?>
