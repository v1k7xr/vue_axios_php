<?php
include('../lib/DBClass.php');
include('../lib/MailSender.php');
$config = parse_ini_file('../config/config.ini');
$ms = new MailSender("../config/mail.ini"); //mail sender
$receivedDataJson = file_get_contents("php://input");


$receivedData = json_decode($receivedDataJson, true);

$dbPDO = new DBClass($config, $receivedData);

$answerData = $dbPDO->wrapperBid();

if ($answerData['bid_id'] > 0) {
    $messageToSend = "Новая заявка!<br>";
    $messageToSend .= "Пользователь " . $receivedData['name'] . " с следующими контактными данными: <br>";
    $messageToSend .= "email: " . $receivedData['email'] . ";<br>";
    $messageToSend .= "номер телефона: " . $receivedData['phoneNumber'] . ";<br>";
    $messageToSend .= "оставил заявку с следующим комментарием: <br>";
    $messageToSend .= $receivedData['commentary'] . "<br>";
    $ms->sendMessage($messageToSend, $answerData['bid_id']);
}

echo json_encode($answerData);