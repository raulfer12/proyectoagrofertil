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
use Views\Renderer;

/**
 * Product
 *
 * @category Public
 * @package  Controllers\Mnt;
 * @author   Raul F. Banegas
 * @license  MIT http://
 * @link     http://
 */
class Product extends PublicController
{
    /**
     * Runs the controller
     *
     * @return void
     */
    public function run():void
    {
        // code
        Renderer::render('mnt/product', array());
    }
}
