<?php namespace App;

/**
 * @author Lucas Di Cunzolo
 */

class Api
{
    const API_TELEGRAM_TOKEN = "456440817:AAFMl9hVYUXeGR8qiDmk4ua2_rphI16l2_w";
    const API_BOTAN_TRACKER_TOKEN = "";

    public function __construct()
    {
        try {
            $bot = new \TelegramBot\Api\Client(self::API_TELEGRAM_TOKEN);
            $bot->command("turnos", function($message) use($bot){
                $data = explode(" ", $message->getText());
                $ch = curl_init(URL . "turnos/{$data[1]}");
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                $info = curl_exec($ch);
                curl_close($ch);

                $bot->sendMessage($message->getChat()->getId(), $info);
            });
            $bot->command("no", function($message) use($bot){
                $bot->sendMessage($message->getChat()->getId(), "no");
            });
        } catch (\TelegramBot\Api\Exception $e) {
            $e->getMessage();
        }
    }
}
