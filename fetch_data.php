<?php
require("ChatBot.php");

$params = json_decode(
    file_get_contents("php://input"),
    true
);

$ChatBot = new ChatBot();

$response = $ChatBot->sendMessage($params["message"]);
$responseMsg = json_encode(array("responseMsg" => $response));
echo $responseMsg;
exit;