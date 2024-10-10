<?php

// Include Composer's autoloader
require_once '/Applications/XAMPP/xamppfiles/htdocs/mkraft/vendor/autoload.php';

// Load the environment variables from the .env file
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$language_dir = 'ltr';
$language_dirs = get_settings('language_dirs');
if ($language_dirs) {
    $current_language = $this->session->userdata('language');
    $language_dirs_arr = json_decode($language_dirs, true);
    if (array_key_exists($current_language, $language_dirs_arr)) {
        $language_dir = $language_dirs_arr[$current_language];
    }
}

// Function to call OpenAI API
function callOpenAI($message) {
    // Load the environment variables
    // $apiKey = $_ENV['OPENAI_API_KEY'];  // The key should be in the .env file as OPENAI_API_KEY
    $apiKey = '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';

    $endpoint = 'https://api.openai.com/v1/chat/completions';

    // Data payload for API request
    $data = [
        'model' => 'gpt-3.5-turbo',  // You can switch this to 'gpt-3.5-turbo' or 'gpt-4' if needed
        'messages' => [['role' => 'user', 'content' => $message]],
    ];

    // Create the request headers
    $options = [
        'http' => [
            'header'  => [
                "Content-Type: application/json",
                "Authorization: Bearer $apiKey"
            ],
            'method'  => 'POST',
            'content' => json_encode($data),
            'ignore_errors' => true // Enable fetching errors in the response
        ],
    ];

    // Fetch the response from OpenAI API
    $context  = stream_context_create($options);
    $result = file_get_contents($endpoint, false, $context);
    
    // Error handling for failed API call
    if ($result === FALSE) {
        return ['error' => 'Unable to connect to OpenAI API.'];
    }

    $response = json_decode($result, true);

    // Check for any errors in the API response
    if (isset($response['error'])) {
        return ['error' => $response['error']['message']]; // Return error message from OpenAI
    }

    return $response;
}

// Handle AJAX request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    header('Content-Type: application/json'); // Ensure the response is JSON
    $requestPayload = file_get_contents('php://input');
    $data = json_decode($requestPayload);

    // Initialize response message
    $responseMsg = "";

    if (isset($data->message)) {
        $message = htmlspecialchars($data->message);
        
        // Call OpenAI API
        $apiResponse = callOpenAI($message);

        if (isset($apiResponse['choices'][0]['message']['content'])) {
            $responseMsg = $apiResponse['choices'][0]['message']['content'];
        } elseif (isset($apiResponse['error'])) {
            $responseMsg = "Error: " . htmlspecialchars($apiResponse['error'], ENT_QUOTES, 'UTF-8');
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
<html lang="<?php echo getIsoCode('english'); ?>" dir="<?php echo $language_dir; ?>">
<head>
    <?php if ($page_name == 'course_page'):
        $title = $this->crud_model->get_course_by_id($course_id)->row_array(); ?>
        <title><?php echo $title['title'].' | '.get_settings('system_name'); ?></title>
    <?php else: ?>
        <title><?php echo ucwords($page_title).' | '.get_settings('system_name'); ?></title>
    <?php endif; ?>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5.0, minimum-scale=0.86">
    <meta name="author" content="<?php echo get_settings('author') ?>" />

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <?php
    $seo_pages = array('course_page');
    if (in_array($page_name, $seo_pages)):
        $course_details = $this->crud_model->get_course_by_id($course_id)->row_array(); ?>
        <meta name="keywords" content="<?php echo $course_details['meta_keywords']; ?>"/>
        <meta name="description" content="<?php echo $course_details['meta_description']; ?>" />
    <?php elseif($page_name == 'blog_details'): ?>
        <meta name="keywords" content="<?php echo $blog_details['keywords']; ?>"/>
        <meta name="description" content="<?php echo ellipsis(strip_tags(htmlspecialchars_decode_($blog_details['description'])), 140); ?>" />
    <?php elseif($page_name == 'blogs'): ?>
        <meta name="keywords" content="<?php echo get_settings('website_keywords'); ?>"/>
        <meta name="description" content="<?php echo get_frontend_settings('blog_page_subtitle'); ?>" />
    <?php else: ?>
        <meta name="keywords" content="<?php echo get_settings('website_keywords'); ?>"/>
        <meta name="description" content="<?php echo get_settings('website_description'); ?>" />
    <?php endif; ?>

    <!--Social sharing content-->
    <?php if($page_name == "course_page"): ?>
        <meta property="og:title" content="<?php echo $title['title']; ?>" />
        <meta property="og:image" content="<?php echo $this->crud_model->get_course_thumbnail_url($course_id); ?>">
    <?php elseif($page_name == 'blog_details'): ?>
        <meta property="og:title" content="<?php echo $blog_details['title']; ?>" />
        <?php $blog_banner = 'uploads/blog/banner/'.$blog_details['banner']; ?>
        <?php if(!file_exists($blog_banner) || !is_file($blog_banner)): ?>
            <?php $blog_banner = 'uploads/blog/banner/placeholder.png'; ?>
        <?php endif; ?>
        <meta property="og:image" content="<?php echo base_url($blog_banner); ?>">
    <?php elseif($page_name == 'blogs'): ?>
        <meta property="og:title" content="<?php echo get_frontend_settings('blog_page_title'); ?>" />
        <meta property="og:image" content="<?php echo site_url('uploads/blog/page-banner/'.get_frontend_settings('blog_page_banner')); ?>">
    <?php else: ?>
        <meta property="og:title" content="<?php echo $page_title; ?>" />
        <meta property="og:image" content="<?= base_url("uploads/system/".get_current_banner('banner_image')); ?>">
    <?php endif; ?>
    <meta property="og:url" content="<?php echo current_url(); ?>" />
    <meta property="og:type" content="Learning management system" />
    <!--Social sharing content-->

    <link rel="icon" href="<?php echo base_url('uploads/system/'.get_frontend_settings('favicon')); ?>" type="image/x-icon">
    <link rel="apple-touch-icon" sizes="180x180" href="<?php echo base_url('uploads/system/'.get_frontend_settings('favicon')); ?>">

    <?php include 'includes_top.php';?>

    <style type="text/css">
        <?php echo get_frontend_settings('custom_css'); ?>

       /* Chatbot Styles */
        #chatbotFrame {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 350px;
            height: 500px;
            border: none;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
            display: none; /* Initially hidden */
            z-index: 1000; /* Ensure it appears above other content */
            border-radius: 15px; /* Add rounded corners */
        }

        /* Open Chat Button */
        #openChat {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 1001; /* Ensure the button is above the iframe */
        }

        /* Chat Container */
        .chat-container {
            background: #ffffff;
            border-radius: 15px; /* Rounded edges */
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            padding: 20px;
            max-width: 400px;
            margin: auto;
            position: fixed;
            bottom: 90px; /* Increased to appear above the chat icon */
            right: 20px;
            display: none;
            z-index: 1000;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s ease, transform 0.5s ease;
            border: 1px solid #eaeaea;
        }

        /* Show the chat container with animation */
        .chat-container.show {
            display: block;
            opacity: 1;
            transform: translateY(0);
        }

        /* Message History */
        .messageHistory {
            height: 300px;
            overflow-y: auto;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background: #f7f9fc; /* Softer background for message area */
            font-size: 15px; /* Adjusted for better readability */
        }

        /* Bot Message */
        .bot-message {
            background-color: #e6f7ff; /* Light blue for bot messages */
            border-radius: 10px;
            padding: 10px;
            margin: 5px 0;
            border-left: 5px solid #00aaff;
            color: #333; /* Darker text for better readability */
            font-weight: 500;
        }

        /* User Message */
        .user-message {
            background-color: #fff3cd; /* Light yellow for user messages */
            border-radius: 10px;
            padding: 10px;
            margin: 5px 0;
            border-left: 5px solid #ffc107; /* Yellow border */
            color: #333;
            font-weight: 500;
        }

        /* Chat Toggle Button */
        .chat-toggle {
            position: fixed;
            bottom: 29px;
            right: 29px;
            background: linear-gradient(45deg, #00aaff, #ffc107);
            color: white;
            border: none;
            border-radius: 50%; /* Make it round */
            width: 50px; /* Increased size */
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease, box-shadow 0.3s ease, transform 0.3s ease; /* Added transform transition */
        }

        /* Hover state for chat toggle button */
        .chat-toggle:hover {
            background-color: #007bbf;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            transform: scale(1.05); /* Slightly scale up on hover */
        }

        /* Chatbox Text Input */
        .input-container {
            display: flex; /* Flexbox to align input and button */
            width: 100%; /* Full width of the container */
        }

        .message {
            flex: 1; /* Take remaining space */
            padding: 10px;
            border-radius: 10px; /* Rounded input box */
            border: 1px solid #ccc;
            font-size: 14px;
            outline: none;
            transition: border-color 0.3s ease, background-color 0.3s ease;
            background-color: #f5f5f5;
        }

        /* Chatbox Text Input Focus State */
        .message:focus {
            border-color: #00aaff;
            background-color: white;
        }

        /* Send Button */
        .sendMessage {
            background: linear-gradient(45deg, #00aaff, #ffc107); /* Gradient background with blue and yellow */
            border: none;
            color: white;
            padding: 11px; /* Slightly larger padding */
            border-radius: 50%; /* Round button */
            font-size: 20px; /* Slightly larger font size */
            cursor: pointer;
            width: 50px; /* Increased size */
            height: 50px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.29); /* Increased shadow for depth */
            transition: transform 0.3s ease, background 0.3s ease, box-shadow 0.3s ease; /* Added transform transition */
        }

        /* Hover and Active State for Send Button */
        .sendMessage:hover {
            background: linear-gradient(45deg, #007bbf, #ffc107); /* Different gradient on hover */
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3); /* Increased shadow */
            transform: translateY(-2px); /* Lift effect on hover */
        }

        .sendMessage:active {
            background: linear-gradient(45deg, #005f8f, #e0a800); /* Darker gradient on active */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.25); /* Slightly reduced shadow */
            transform: translateY(0); /* Return to original position */
        }

        h1.titlec { 
            font-size: 16px;
            font-weight: 600;
            padding: 10px 10px 30px 10px;
        }

        /* Additional Enhancements */
        .chat-container::-webkit-scrollbar {
            width: 8px; /* Scrollbar width */
        }

        .chat-container::-webkit-scrollbar-thumb {
            background: #00aaff; /* Scrollbar color */
            border-radius: 10px; /* Rounded scrollbar */
        }

        .chat-container::-webkit-scrollbar-thumb:hover {
            background: #007bbf; /* Darker scrollbar on hover */
        }

        /* Fix for input and button sizing */
        .input-container {
            width: calc(100% - 10px); /* Ensure it fits the container with padding */
        }

        .message {
            flex: 1; /* Ensures the message input takes up remaining space */
            margin-right: 10px; /* Space between input and button */
        }

        .chatcolumns {
            display: flex; /* Use flexbox to manage layout */
            width: 100%; /* Ensure it takes full width */
        }

        .chatcolumn {
            display: flex;
        }

        .is-80 {
            flex: 0 0 85%; /* Take 80% width */
        }

        .is-10 {
            flex: 0 0 10%; /* Take 20% width */
        }

        /* Ensure the button fits within its column */
        .sendMessage {
            width: 100%; /* Make the button take full width of its column */
        }

        .center {
            text-align: center;
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
<body class="<?php echo $this->session->userdata('theme_mode'); ?>">
    <?php
    //user wishlist items
    $my_wishlist_items = array();
    if ($user_id = $this->session->userdata('user_id')) {
        $wishlist = $this->user_model->get_all_user($user_id)->row('wishlist');
        if ($wishlist != '') {
            $my_wishlist_items = json_decode($wishlist, true);
        }
    }
    
    if ($this->session->userdata('app_url')):
        include "go_back_to_mobile_app.php";
    endif;
    
    include 'header.php';

    if (get_frontend_settings('cookie_status') == 'active'):
        include 'eu-cookie.php';
    endif;

    if ($page_name === null) {
        include $path;
    } else {
        include $page_name.'.php';
    }
    
    include 'footer.php';
    include 'includes_bottom.php';
    include 'modal.php';
    include 'common_scripts.php';
    include 'init.php';
    ?>

    <section class="section">
        <div class="container">
            <button class="chat-toggle">
                <i class="fas fa-comments"></i>
            </button>
            <div class="chat-container">
                <h1 class="titlec center">Welcome to MKraft Capability Solution!</h1>
                <div class="messageHistory"></div>
                <div class="chatcolumns">
                    <div class="chatcolumn is-80">
                        <input class="input message" type="text" placeholder="Type your message">
                    </div>
                    <div class="chatcolumn is-10">
                        <button class="button is-info sendMessage">
                            <i class="material-icons" style="font-size:29px;color:white">send</i>
                        </button>
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

    <?php echo get_frontend_settings('embed_code'); ?>
</body>
</html>
