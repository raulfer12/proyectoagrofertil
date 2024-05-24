<!--<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enviar Correo</title>
</head>
<body>
    <button id="sendEmailButton">Enviar Correo</button>

    <script>
        document.getElementById("sendEmailButton").addEventListener("click", function() {
            // Datos para enviar el correo
            const email = "destinatario@example.com";
            const nombre = "Nombre del Destinatario";
            const asunto = "Asunto del Correo";
            const mensaje = "Contenido del mensaje en HTML";

            // Crear un objeto FormData para enviar los datos
            const formData = new FormData();
            formData.append("email", email);
            formData.append("nombre", nombre);
            formData.append("asunto", asunto);
            formData.append("mensaje", mensaje);

            // Enviar la solicitud AJAX
            fetch("enviar_correo.php", {
                method: "POST",
                body: formData
            })
            .then(response => response.text())
            .then(result => {
                alert(result); // Mostrar el resultado del envío del correo
            })
            .catch(error => {
                console.error("Error:", error);
            });
        });
    </script>
</body>
</html>-->






<!--<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enviar Correo</title>
</head>
<body>
    <h2>Formulario de Envío de Correo</h2>
    <form action="EnviarCorreo.php" method="post">
        <label for="email">Correo Electrónico:</label><br>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="nombre">Nombre:</label><br>
        <input type="text" id="nombre" name="nombre" required><br><br>
        
        <label for="asunto">Asunto:</label><br>
        <input type="text" id="asunto" name="asunto" required><br><br>
        
        <label for="mensaje">Mensaje:</label><br>
        <textarea id="mensaje" name="mensaje" rows="4" cols="50" required></textarea><br><br>
        
        <button type="submit">Enviar Correo</button>
    </form>
</body>
</html>-->