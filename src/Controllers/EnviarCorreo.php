<?php
/*if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $cliente = htmlspecialchars($_POST['cliente']);
  $correo = htmlspecialchars($_POST['correo']);
  $mensage = htmlspecialchars($_POST['mensaje']);

  $para = "agrofertilhn@gmail.com";
  $asunto = "Correo de $cliente";
  $cuerpo = "Nombre: $cliente\nCorreo: $correo\n\nMensaje:\n$mensaje";
  $headers = "From: $correo";

  if (mail($para, $para, $cuerpo, $headers)) {
    echo "Correo enviado con exito!";
  } else {
    echo "Error al enviar correo.";
  }
}*/

// Conectar a la base de datos
/*$servername = "localhost";
$username = "root";
$password = "unicah";
$dbname = "agrofertil";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtener el ID del pedido (por ejemplo, de la URL)
$pedidoId = $_GET['PedidoId'];

// Consulta SQL para obtener la información del pedido
$sql = "SELECT * FROM pedidos WHERE id = $PedidoId";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Obtener los datos del pedido
    $pedido = $result->fetch_assoc();
} else {
    die("No se encontró el pedido");
}

$conn->close();


$to = "agrofertilhn@gmail.com";  // Correo del cliente o destinatario
$asunto = "Detalles de su Pedido #" . $pedido['id'];
$body = "Hola " . $pedido['UsuarioNombre'] . ",\n\n";
$body .= "Gracias por su pedido. Aquí están los detalles de su pedido:\n";
$body .= "Pedido ID: " . $pedido['id'] . "\n";
$body .= "Producto: " . $pedido['ProductoNombre'] . "\n";
$body .= "Cantidad: " . $pedido['ProdCantidad'] . "\n";
$body .= "Precio Total: $" . number_format($pedido['total_precio'], 2) . "\n\n";
$body .= "Gracias por comprar con nosotros,\n";
$body .= "Agrofertil";

$headers = "From: agrofertilhn@gmail.com";

if (mail($to, $asunto, $body, $headers)) {
    echo "Correo enviado con éxito.";
} else {
    echo "Error al enviar el correo.";
}*/
/*use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "unicah";
$dbname = "agrofertil";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtener datos de la base de datos
$IdPedido = 1; // ID del pedido que quieres enviar
$sql = "SELECT * FROM pedidos WHERE id = $IdPedido";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $pedido = $result->fetch_assoc();

    $correo = 'agrofertilhn@gmail.com'; // Dirección de correo del destinatario
    $asunto = 'Detalles de su pedido';
    $body = 'Detalles del pedido: <br>';
    $body .= 'ID del pedido: ' . $pedido['id'] . '<br>';
    $body .= 'Producto: ' . $pedido['ProductoNombre'] . '<br>';
    $body .= 'Cantidad: ' . $pedido['ProdCantidad'] . '<br>';
    $body .= 'Precio: ' . $pedido['CarritoTotal'] . '<br>';

    // Enviar el correo electrónico
    $mail = new PHPMailer(true);
    try {
        // Configuración del servidor SMTP
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'agrofertilhn@gmail.com';
        $mail->Password = 'Agrofertil2024';
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        // Remitente y destinatario
        $mail->setFrom('agrofertilhn@gmail.com', 'Agrofertil');
        $mail->addAddress($correo);

        // Contenido del correo
        $mail->isHTML(true);
        $mail->asunto = $asunto;
        $mail->Body = $body;

        $mail->send();
        echo 'El correo ha sido enviado';
    } catch (Exception $e) {
        echo "El correo no pudo ser enviado. Mailer Error: {$mail->ErrorInfo}";
    }
} else {
    echo "No se encontraron pedidos.";
}

$conn->close();*/

// enviar_correo.php

/*use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

function enviarCorreo($destinatario, $nombreDestinatario, $asunto, $cuerpoHtml, $cuerpoTextoPlano) {
    $mail = new PHPMailer(true);
    try {
        // Configuración del servidor SMTP
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com'; // Cambia esto al host de tu proveedor
        $mail->SMTPAuth = true;
        $mail->Username = 'agrofertilhn@gmail.com'; // Cambia esto a tu dirección de correo
        $mail->Password = 'Agrofertil2024'; // Cambia esto a tu contraseña
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Habilitar encriptación TLS
        $mail->Port = 587; // Cambia esto si tu proveedor usa otro puerto

        // Remitente y destinatario
        $mail->setFrom('agrofertilhn@gmail.com', 'Agrofertil');
        $mail->addAddress($destinatario, $nombreDestinatario);

        // Contenido del correo
        $mail->isHTML(true);
        $mail->Subject = $asunto;
        $mail->Body    = $cuerpoHtml;
        $mail->AltBody = $cuerpoTextoPlano;

        $mail->send();
        return 'El correo ha sido enviado';
    } catch (Exception $e) {
        return "El correo no pudo ser enviado. Mailer Error: {$mail->ErrorInfo}";
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $destinatario = $_POST['correo'];
    $nombreDestinatario = $_POST['nombre'];
    $asunto = $_POST['asunto'];
    $mensajeHtml = $_POST['mensaje'];
    $mensajeTextoPlano = strip_tags($mensajeHtml); // Opcional: Convertir HTML a texto plano

    echo enviarCorreo($destinatario, $nombreDestinatario, $asunto, $mensajeHtml, $mensajeTextoPlano);
}*/

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
\Views\Renderer::render("paypal/carrito", $viewData);

require 'vendor/autoload.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $destinatario = $_POST['correo'];
    $nombreDestinatario = $_POST['nombre'];
    $asunto = $_POST['asunto'];
    $mensajeHtml = $_POST['mensaje'];
    $mensajeTextoPlano = strip_tags($mensajeHtml); // Opcional: Convertir HTML a texto plano

    // Crear una nueva instancia de PHPMailer
    $mail = new PHPMailer(true);
    try {
        // Configuración del servidor SMTP
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com'; // Cambia esto al host de tu proveedor
        $mail->SMTPAuth = true;
        $mail->Username = 'agrofertilhn@gmail.com'; // Cambia esto a tu dirección de correo
        $mail->Password = 'Agrofertil2024'; // Cambia esto a tu contraseña
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Habilitar encriptación TLS
        $mail->Port = 587; // Cambia esto si tu proveedor usa otro puerto

        // Remitente y destinatario
        $mail->setFrom('agrofertilhn@gmail.com', 'Agrofertil');
        $mail->addAddress($destinatario, $nombreDestinatario);

        // Contenido del correo
        $mail->isHTML(true);
        $mail->Subject = $asunto;
        $mail->Body    = $mensajeHtml;
        $mail->AltBody = $mensajeTextoPlano;

        // Enviar el correo
        $mail->send();
        echo 'El correo ha sido enviado';
    } catch (Exception $e) {
        echo "El correo no pudo ser enviado. Mailer Error: {$mail->ErrorInfo}";
    }
}

?>