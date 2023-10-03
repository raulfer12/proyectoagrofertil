<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
class Accept extends PublicController{
    public function run():void
    {
        $msj = array();
        $token = $_GET["token"] ?: "";
        $session_token = $_SESSION["orderid"] ?: "";
        if ($token !== "" && $token == $session_token) 
        {
            //$response = \Utilities\Paypal\PayPalCapture::captureOrder($session_token);
            $msj = "Transacción realizada con éxito";
        }
        else
        {
            $msj = "No hay orden";
        }

        //Cantidad total
        $this->CantidadTotal =
        $response->result->purchase_units[0]->payments->captures[0]->seller_receivable_breakdown->gross_amount->value;
        //Obtener la orden
        $this->LinkOrden = $response->result->purchase_units[0]->payments->captures[0]->links[2]->href;

        //Conversión de Moneda
        $this->CantidadTotal = $this->currencyConverter($this->CantidadTotal);

        //DbOperations
        $this->dbOperations();
        \Utilities\Site::redirectToWithMsg("index.php?page=carrito", $msj);
    }

    private function dbOperations()
    {
        $UsuarioId = \Utilities\Security::getUserId();
        $carritoUsuario = \Dao\Client\Checkout::getProductsCarritoUsuario($UsuarioId);
        \Dao\Client\Checkout::insertarVenta($this->LinkOrden, $this->CantidadTotal,
         $_SESSION['login']['DireccionUsuario'],
        $_SESSION['login']['TelefonoUsuario'], $UsuarioId);

        foreach($carritoUsuario as $item)
        {
            \Dao\Client\Checkout::insertarDetalleVenta($item["ProductoId"], $item["ProductoPrecioVenta"],
            $item["ProductoPrecioVenta"]);
        }

        \Dao\Client\Checkout::deleteAllCarritoUsuario($UsuarioId);
    }

    private function currencyConverter($cantidad)
    {
        $req_url = 'https://api.exchangerate-api.com/v4/latest/USD';
        $response_json = file_get_contents($req_url);

        if(false !== $response_json)
        {
            try
            {
                $response_object = json_decode($response_json);
                $lpsconversion = $response_object->rates->HNL;
                $cantidad = round(($cantidad * $lpsconversion), 2);
            }
            catch(Error $e)
            {
                error_log(
                    strval($e)
                );
            }
        }
        return $cantidad;
    }
}
?>
