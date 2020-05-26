<?php
require '../vendor/autoload.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

class MailSender {
    private $mailServiceData;

    public function __construct($configPath) {
        $this->mailServiceData = parse_ini_file($configPath);
    }

    public function sendMessage($message, $pidId) {
        $mail = new PHPMailer(true);
        try {
            //Server settings
            $mail->SMTPDebug = 0;                                             // Disable verbose debug output
            $mail->isSMTP();                                                 // Send using SMTP
            $mail->Host       = $this->mailServiceData['host'];             // Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                      // Enable SMTP authentication
            $mail->Username   = $this->mailServiceData['username'];       // SMTP username
            $mail->Password   = $this->mailServiceData['password'];      // SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
            $mail->Port       = $this->mailServiceData['port'];        // TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above
        
            //Recipients
            $mail->setFrom($this->mailServiceData['username'], 'BidRequester');
            $mail->addAddress($this->mailServiceData['managerEmail']);     // Add a recipient
        
            // Content
            $mail->isHTML(true);                                    // Set email format to HTML
            $mail->Subject = "Заявка №$pidId";
            $mail->Body    = $message;
            $mail->AltBody = str_replace("<br>", "\n", $message); // for non-HTML mail clients
        
            $mail->send();
        } catch (Exception $e) {
            echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        }
    }
}