<?php
class ChatBot {
    private $authorization;
    private $endpoint;
    public function __construct() {
        $this->authorization = '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';
        $this->endpoint = 'https://api.openai.com/v1/chat/completions';
    }
    public function sendMessage(string $message): string  {
        $data = [
            'messages' => [
                [
                    'role' => 'system',
                    'content' => 'Get answer for your queries.'
                ],
                [
                    'role' => 'user',
                    'content' => $message
                ],
            ],
            'model' => 'gpt-3.5-turbo'
        ];
        $headers = [
            'Content-Type: application/json',
            'Authorization: Bearer ' . $this->authorization,
        ];

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->endpoint);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($ch);
        print("Constructor Data: ");
        print($ch);
        if (curl_errno($ch)) {
            $error = curl_error($ch);
            curl_close($ch);
            throw new Exception('Error sending the message: ' . $error);
        }
        curl_close($ch);
        $result = json_decode($response, true);
        $responseContent = $result["choices"][0]["message"]["content"];
        return $responseContent;
    }
}