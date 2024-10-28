<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Feedback_model extends CI_Model {

    // Constructor
    public function __construct() {
        parent::__construct();
        // Load the database library
        $this->load->database();
    }

    // Create or insert feedback
    public function insert_feedback($data) {
        // Validate data before inserting
        if (!is_array($data) || empty($data)) {
            return false; // Ensure $data is an array and not empty
        }

        // $data should be an associative array with the feedback details
        if ($this->db->insert('feedback', $data)) {
            return $this->db->insert_id();  // Return the inserted feedback ID
        } else {
            return false;
        }
    }

    // Retrieve feedback by ID
    public function get_feedback_by_id($feedback_id) {
        $this->db->where('id', $feedback_id);
        $query = $this->db->get('feedback');
        return $query->row_array(); // Return a single feedback row as an associative array
    }

    // Retrieve all feedback entries (optional: with pagination)
    public function get_all_feedback($limit = 10, $offset = 0) {
        $this->db->limit($limit, $offset);
        $query = $this->db->get('feedback');
        return $query->result_array();  // Return all feedback as an array of rows
    }

    // Update feedback by ID
    public function update_feedback($feedback_id, $data) {
        $this->db->where('id', $feedback_id);
        return $this->db->update('feedback', $data);  // $data should be an associative array with updated values
    }

    // Delete feedback by ID
    public function delete_feedback($feedback_id) {
        $this->db->where('id', $feedback_id);
        return $this->db->delete('feedback');  // Delete the feedback entry
    }

    // Check if feedback exists by ID
    public function feedback_exists($feedback_id) {
        $this->db->where('id', $feedback_id);
        $query = $this->db->get('feedback');
        return ($query->num_rows() > 0); // Return true or false
    }

    // Load feedback form with user data
    public function index() {
        // Load necessary models if required
        $this->load->model('user_model');

        // Fetch user data (assuming user is logged in and has a session)
        // Adjust the logic below depending on how you're managing user sessions
        if ($this->session->userdata('user_id')) {
            $user_id = $this->session->userdata('user_id');
            $userData = $this->user_model->get_user_by_id($user_id);
        } else {
            // If user is not logged in, or no data, provide a default empty array
            $userData = [
                'name' => '',
                'email' => ''
            ];
        }

        // Pass $userData to the view
        $data['userData'] = $userData;
        $data['page_title'] = 'Learner Feedback Form';

        // Load the feedback form view with the data
        $this->load->view('frontend/default-new/feedback_form', $data);
    }
}
