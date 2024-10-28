<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Feedback extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('feedback_model'); // Load feedback model
        $this->load->model('user_model'); // Load user model
        $this->load->model('api_model'); // Load API model for courses
        $this->load->library('session'); // Load session library
        $this->load->helper(array('form', 'url')); // Load form and URL helpers
    }

    // Load the feedback form page
    public function index() {
        $page_data['page_name'] = 'feedback_form';
        $page_data['page_title'] = strtoupper(get_phrase('Feedback'));
        $this->load->view('frontend/' . get_frontend_settings('theme') . '/index', $page_data);
    }

    // Display feedback form with user details
    public function feedback() {
        // Fetch the user ID from the session
        $user_id = $this->session->userdata('user_id');

        // Check if the user is logged in; if not, show an error message
        if (empty($user_id)) {
            echo 'You are not logged in';
            return; // Exit the function if the user is not logged in
        }

        // Fetch user details using the user ID
        $logged_in_user_details = $this->user_model->get_all_user($user_id)->row_array();

        // Prepare data for the view
        $userData = [
            'name' => isset($logged_in_user_details['name']) ? htmlspecialchars($logged_in_user_details['name']) : 'N/A',
            'email' => isset($logged_in_user_details['email']) ? htmlspecialchars($logged_in_user_details['email']) : 'N/A',
            'courses' => $this->api_model->my_courses_get($logged_in_user_details['user_id'] ?? 0) // Fetch user's courses
        ];

        // Fetch user's courses
        if (isset($logged_in_user_details['user_id']) && $logged_in_user_details['user_id'] > 0) {
            $userData['courses'] = $this->api_model->my_courses_get($logged_in_user_details['user_id']);
        }

        // Pass data to the view
        $page_data['page_name'] = 'feedback';
        $page_data['page_title'] = strtoupper(get_phrase('Feedback'));
        $page_data['userData'] = $userData;

        // Load the feedback form view
        $this->load->view('frontend/' . get_frontend_settings('theme') . '/index', $page_data);
    }

    // Success page after feedback submission
    public function success() {
        // Fetch user ID from session
        $user_id = $this->session->userdata('user_id');
        
        // Fetch user details
        $user_details = $this->user_model->get_all_user($user_id)->row_array();
        
        // Prepare user data for the success page
        $full_name = isset($user_details['first_name']) && isset($user_details['last_name']) 
            ? htmlspecialchars($user_details['first_name'] . ' ' . $user_details['last_name']) 
            : '';
        $email = isset($user_details['email']) ? htmlspecialchars($user_details['email']) : '';

        // Prepare data for the success page
        $page_data['page_name'] = 'feedback_success';
        $page_data['page_title'] = 'Feedback Submitted Successfully';
        $page_data['userData'] = [
            'full_name' => $full_name,
            'email' => $email
        ];
        $page_data['feedback_data'] = $this->session->userdata('feedback_data'); // Fetch feedback data from session

        // Load the success view
        $this->load->view('frontend/' . get_frontend_settings('theme') . '/index', $page_data);
    }


    // Handle feedback form submission
    public function submit() {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            // Get user ID from session
            $user_id = $this->session->userdata('user_id');
            // Fetch user details
            $user_details = $this->user_model->get_all_user($user_id)->row_array();
            // Fetch enrolled courses
            $enrolments = $this->user_model->my_courses()->result_array();

            // Set user name and role
            $first_name = isset($user_details['first_name']) ? htmlspecialchars($user_details['first_name']) : '';
            $last_name = isset($user_details['last_name']) ? htmlspecialchars($user_details['last_name']) : '';
            $email = isset($user_details['email']) ? htmlspecialchars($user_details['email']) : '';

            // Collect and sanitize feedback data
            $feedback_data = array(
                'name' => $first_name . ' ' . $last_name, // Directly setting full name
                'email' => htmlspecialchars(trim($this->input->post('email') ?? '')),
                'course' => htmlspecialchars(trim($this->input->post('course_name') ?? '')),
                'enjoy_session' => htmlspecialchars(trim($this->input->post('enjoy_session') ?? '')),
                'participation' => htmlspecialchars(trim($this->input->post('participation') ?? '')),
                'topics_relevant' => htmlspecialchars(trim($this->input->post('topics_relevant') ?? '')),
                'time_sufficient' => htmlspecialchars(trim($this->input->post('time_sufficient') ?? '')),
                'content_organized' => htmlspecialchars(trim($this->input->post('content_organized') ?? '')),
                'key_takeaways' => htmlspecialchars(trim($this->input->post('key_takeaways') ?? '')),
                'suggestions' => htmlspecialchars(trim($this->input->post('suggestions') ?? '')),
                'changes' => htmlspecialchars(trim($this->input->post('changes') ?? '')),
                'overall_rating' => htmlspecialchars(trim($this->input->post('overall_rating') ?? ''))
            );

            // Validate required fields
            $validation_errors = [];
            if (empty($feedback_data['name'])) {
                $validation_errors[] = "Name cannot be empty.";
            }
            if (empty($feedback_data['email'])) {
                $validation_errors[] = "Email cannot be empty.";
            }

            // Display validation errors if any
            if (!empty($validation_errors)) {
                echo implode("\n", $validation_errors);
                return;
            }

            $this->session->set_userdata('feedback_data', $feedback_data);

            // Redirect to success page
            redirect('feedback/success');


            // Save feedback using the model
            // if ($this->feedback_model->insert_feedback($feedback_data)) {
            //     // Store feedback data in session for displaying on success page
            //     $this->session->set_userdata('feedback_data', $feedback_data);

            //     // Redirect to success page
            //     redirect('feedback/success'); // Use CodeIgniter's redirect function
            // } else {
            //     echo "Error: Could not submit your feedback.";
            // }
        }
    }
}
