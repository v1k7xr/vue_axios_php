<?php

class DBClass {

    private $dbConnection;
    private $userData;

    public function __construct($param, $userData) {
        $psqlConnectionString = "pgsql:host=" . $param['dbhost'] . ";port=5432;dbname=" . $param['dbname'];
        $this->dbConnection = new PDO($psqlConnectionString, $param['dbuser'], $param['dbpassword']);
        $this->userData = $userData;
    }

    public function checkEmailRepeat() {
        $sqlQuery = "SELECT creation_time from bid WHERE email = :email ORDER BY bid_id DESC LIMIT 1";
        $stmt = $this->dbConnection->prepare($sqlQuery);
        $stmt->bindValue(':email', $this->userData['email']);
        $stmt->execute();
        $answer = $stmt->fetch(PDO::FETCH_ASSOC);
        return strtok($answer['creation_time'], '.');
    }

    public function saveBid() {
        $sqlQuery = "INSERT INTO bid (fullname, email, phone, comment) VALUES (:fullname, :email, :phone, :comment) RETURNING creation_time, bid_id";
        $stmt = $this->dbConnection->prepare($sqlQuery);
        $stmt ->bindValue(':email', $this->userData['email']);
        $stmt ->bindValue(':fullname', $this->userData['name']);
        $stmt ->bindValue(':phone', $this->userData['phoneNumber']);
        $stmt ->bindValue(':comment', $this->userData['commentary']);
        $stmt->execute();
        $answer = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return ['time' => strtok($answer[0]['creation_time'], '.'),
                'bid_id' => $answer[0]['bid_id'],
                ];
    }

    public function diffDateTime($time) {
        if (is_bool($time)) {
            return 100;
        }
        $currentDateTime = strtotime(gmdate('Y-m-d H:i:s', time()));
        $lasDBDateTime = strtotime($time);
        return round(abs($currentDateTime - $lasDBDateTime) / 60,2);
    }

    public function addHalfHour($datetimeString) {
        $datetime = DateTime::createFromFormat('Y-m-d H:i:s', $datetimeString);
        date_modify($datetime, "+90 min");
        $date_new = date_format($datetime, "Y-m-d H:i:s");
        return $date_new;
    }

    public function wrapperBid() {
        $answerData = [];
        $time = $this->checkEmailRepeat();
        if (!$time || $this->diffDateTime($time) > 60) {
            $bdR = $this->saveBid();
            $time = $bdR['time'];
            $answerData['bid_id'] = $bdR['bid_id'];
            $answerData['status'] = 'ok';
            $answerData['mct'] = $this->addHalfHour($time);
        } else {
            $answerData['bid_id'] = NULL;
            $answerData['status'] = 'er'; //email repeat
            $answerData['mct'] = $this->addHalfHour($time);
        }

        return $answerData;
    }
}