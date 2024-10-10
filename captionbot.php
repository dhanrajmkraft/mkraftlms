<?php
header('Content-Type: text/html; charset=utf-8');

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

// Function to call OpenAI API
function callOpenAI($message) {
    $apiKey = $_ENV['OPENAI_API_KEY']; // Replace with your OpenAI API Key
    $endpoint = 'https://api.openai.com/v1/chat/completions';

    $data = [
        'model' => 'gpt-3.5-turbo',
        'messages' => [['role' => 'user', 'content' => $message]],
    ];

    $options = [
        'http' => [
            'header'  => [
                "Content-type: application/json",
                "Authorization: Bearer $apiKey"
            ],
            'method'  => 'POST',
            'content' => json_encode($data),
        ],
    ];

    $context  = stream_context_create($options);
    $result = file_get_contents($endpoint, false, $context);

    return json_decode($result, true);
}

// Handle AJAX request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $requestPayload = file_get_contents('php://input');
    $data = json_decode($requestPayload);

    if (isset($data->message)) {
        $message = htmlspecialchars($data->message);
        
        // Call OpenAI API
        $apiResponse = callOpenAI($message);

        if (isset($apiResponse['choices'][0]['message']['content'])) {
            $responseMsg = $apiResponse['choices'][0]['message']['content'];
        } else {
            $responseMsg = "Error retrieving response.";
        }
    } else {
        $responseMsg = "No message received.";
    }

    // Return the JSON response
    echo json_encode(['responseMsg' => htmlspecialchars($responseMsg, ENT_QUOTES, 'UTF-8')]);
    exit; // End the script after responding to AJAX
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MK - MKraft Capability Solutions</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }
        .chat-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 400px;
            margin: auto;
            position: fixed;
            bottom: 70px; /* Increased to appear above the chat icon */
            right: 20px;
            display: none;
            z-index: 1000;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s ease, transform 0.5s ease;
        }

        .chat-container.show {
            display: block;
            opacity: 1;
            transform: translateY(0);
        }

        /* Other styles for chat messages */
        .messageHistory {
            height: 300px;
            overflow-y: auto;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: #fafafa;
        }
        .bot-message {
            background-color: #e6f7ff;
            border-radius: 5px;
            padding: 10px;
            margin: 5px 0;
            border-left: 4px solid #00aaff;
        }
        .user-message {
            background-color: #d4edda;
            border-radius: 5px;
            padding: 10px;
            margin: 5px 0;
            border-left: 4px solid #28a745;
        }

        .chat-toggle {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #00aaff;
            color: white;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .chat-toggle:hover {
            background-color: #0088cc;
        }
    </style>
    <script type="module">
        window.addEventListener('load', (event) => {
            const chatContainer = document.querySelector(".chat-container");
            const chatToggle = document.querySelector(".chat-toggle");
            const messageInput = document.querySelector(".message");
            const sendMessageButton = document.querySelector(".sendMessage");
            const messageHistory = document.querySelector(".messageHistory");

            // Auto open the chat container with animation
            setTimeout(() => {
                chatContainer.classList.add('show');
                messageInput.focus();
            }, 1000); // Delay before showing the chat

            // Toggle chat visibility
            chatToggle.addEventListener('click', () => {
                chatContainer.classList.toggle('show');
                if (chatContainer.classList.contains('show')) {
                    messageInput.focus();
                }
            });

            // Display welcome message
            const welcomeMessage = `<div class="welcome-message">Hello! I am <strong>MKraft Captain</strong>. How can I assist you today?</div>`;
            messageHistory.innerHTML += welcomeMessage;

            // Send message on button click or Enter key
            const sendMessage = () => {
                sendMessageButton.classList.add('is-loading');
                sendMessageButton.disabled = true;

                let userMessage = messageInput.value;
                if (!userMessage) return; // Don't send empty messages

                const userMessageHTML = `<div class="user-message">
                                            <strong>You:</strong> ${userMessage}
                                        </div>`;
                messageHistory.innerHTML += userMessageHTML;
                messageHistory.scrollTop = messageHistory.scrollHeight; // Auto scroll

                const payload = JSON.stringify({ "message": userMessage });
                messageInput.value = "";

                fetch('', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: payload,
                }).then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    const aiMessageHTML = `<div class="bot-message">
                                            <strong>MKraft Captain:</strong> <span>${data.responseMsg}</span>
                                        </div>`;
                    messageHistory.innerHTML += aiMessageHTML;
                    messageHistory.scrollTop = messageHistory.scrollHeight; // Auto scroll
                })
                .catch((error) => {
                    console.error('Error:', error);
                    const errorMessageHTML = `<div class="bot-message notification is-danger">
                                                <strong>Error:</strong> ${error.message}
                                            </div>`;
                    messageHistory.innerHTML += errorMessageHTML;
                    messageHistory.scrollTop = messageHistory.scrollHeight; // Auto scroll
                }).finally(() => {
                    sendMessageButton.classList.remove('is-loading');
                    sendMessageButton.disabled = false;
                });
            };

            sendMessageButton.addEventListener('click', sendMessage);
            messageInput.addEventListener('keypress', (event) => {
                if (event.key === 'Enter') {
                    sendMessage();
                }
            });
        });
    </script>
</head>
<body>
    <section class="section">
        <div class="container">
            <button class="chat-toggle">
                <i class="fas fa-comments"></i>
            </button>
            <div class="chat-container">
                <h1 class="title has-text-centered">Welcome to MKraft Capability Solutions!</h1>
                <div class="messageHistory"></div>
                <div class="columns">
                    <div class="column">
                        <input class="input message" type="text" placeholder="Type your message">
                    </div>
                    <div class="column is-narrow">
                        <button class="button is-info sendMessage">Send</button>
                    </div>
                </div>
                <div class="columns box is-hidden">
                    <div class="column result"></div>
                </div>
                <div class="columns box is-hidden">
                    <div class="column notification is-danger error has-text-centered"></div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
