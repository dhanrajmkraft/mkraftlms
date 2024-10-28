<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require 'vendor/autoload.php'; // PhpSpreadsheet library

use PhpOffice\PhpSpreadsheet\IOFactory;

class User_import extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('User_model');
        $this->load->model('Crud_model');  // Load Crud_model for enrollment
        $this->load->model('Email_model'); // Load email model
    }

    // Function to preview Excel data
    public function preview_excel() {
        if (!isset($_FILES['userfile']['name']) || empty($_FILES['userfile']['tmp_name'])) {
            echo json_encode(['error' => 'No file uploaded.']);
            return;
        }

        $file = $_FILES['userfile']['tmp_name'];
        try {
            $spreadsheet = IOFactory::load($file);
            $worksheet = $spreadsheet->getActiveSheet();
            $excelData = [];

            foreach ($worksheet->getRowIterator() as $row) {
                $cellIterator = $row->getCellIterator();
                $cellIterator->setIterateOnlyExistingCells(false);
                $rowData = [];
                foreach ($cellIterator as $cell) {
                    $rowData[] = $cell->getValue();
                }
                $excelData[] = $rowData;
            }

            if (empty($excelData)) {
                echo json_encode(['error' => 'No data found in the Excel file.']);
                return;
            }

            echo json_encode($excelData);
        } catch (Exception $e) {
            echo json_encode(['error' => 'Error processing the file: ' . $e->getMessage()]);
        }
    }

    // Function to perform bulk registration and course enrollment
    public function bulk_register() {
        $sheetData = json_decode($this->input->post('sheetData'), true);

        if (!is_array($sheetData) || empty($sheetData)) {
            echo json_encode(['error' => 'Invalid data received.']);
            return;
        }

        foreach ($sheetData as $key => $row) {
            if ($key == 0) continue; // Skip header row

            // Populate $_POST with user data to match the add_user method expectations
            $_POST['first_name'] = isset($row[0]) ? $row[0] : '';
            $_POST['last_name']  = isset($row[1]) ? $row[1] : '';
            $_POST['email']      = isset($row[2]) ? $row[2] : '';
            $_POST['password']   = isset($row[3]) ? $row[3] : '';  // Do not hash here, `add_user` will handle it
            $_POST['phone']      = isset($row[4]) ? $row[4] : '';
            $_POST['address']    = isset($row[6]) ? $row[6] : '';
            $_POST['biography']  = isset($row[8]) ? $row[8] : '';
            $_POST['facebook_link'] = isset($row[9]) ? $row[9] : '';
            $_POST['twitter_link']  = isset($row[10]) ? $row[10] : '';
            $_POST['linkedin_link'] = isset($row[11]) ? $row[11] : '';
            $_POST['role_id'] = 2;  // Set default role as user
            $_POST['verification_code'] = rand(100000, 999999);  // Generate verification code

            // Call the existing method to register the user (this will use the populated $_POST values)
            $this->User_model->add_user(false, false);

            // Get the last inserted user's ID
            $user_id = $this->db->insert_id();

            // If course ID is present in the Excel sheet, enroll the user using Crud_model
            if (isset($row[7]) && !empty($row[7])) {
                $_POST['course_id'] = [$row[7]];  // Set course ID from the Excel sheet
                $_POST['user_id'] = [$user_id];   // Set the user ID for enrollment

                // Call the `enrol_a_student_manually()` method from Crud_model to enroll the user
                $this->Crud_model->enrol_a_student_manually();
            }

            // Send verification email with the verification code
            $this->Email_model->send_email_verification_mail($_POST['email'], $_POST['verification_code']);
        }

        $this->session->set_flashdata('flash_message', 'Bulk registration successful. Verification emails sent.');
        redirect(site_url('admin/bulk_user_upload'), 'refresh');
    }

}
