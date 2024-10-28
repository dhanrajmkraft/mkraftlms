<section class="feedback-success-page">
    <div class="container">
        <div class="row">
            <!-- Image Section -->
            <div class="col-lg-6 col-md-6">
                <div class="success-image">
                    <img loading="lazy" src="<?php echo site_url('assets/frontend/default-new/image/success.jpg'); ?>" alt="Success Image" class="img-fluid">
                </div>
            </div>
            <!-- Feedback Summary Section -->
            <div class="col-lg-6 col-md-6">
                <h2><?php echo $page_title; ?></h2>
                <p class="thank-you-message">Thank you for your feedback, <strong><?php echo htmlspecialchars($userData['full_name']); ?></strong>! Your input is invaluable to us.</p>
                
                <h3>Your Feedback Summary</h3>
                <div class="feedback-card">
                    <div class="feedback-details">
                        <div class="feedback-item">
                            <strong>Name:</strong> <span><?php echo htmlspecialchars($userData['full_name']); ?></span>
                        </div>
                        <div class="feedback-item">
                            <strong>Email:</strong> <span><?php echo htmlspecialchars($userData['email']); ?></span>
                        </div>
                        <div class="feedback-item">
                            <strong>Course:</strong> <span><?php echo htmlspecialchars($feedback_data['course']); ?></span>
                        </div>
                        <div class="feedback-item">
                            <strong>What did you enjoy?</strong> <span><?php echo htmlspecialchars($feedback_data['enjoy_session']); ?></span>
                        </div>
                        <div class="feedback-item">
                            <strong>Participation Encouraged:</strong> <span><?php echo htmlspecialchars($feedback_data['participation']); ?></span>
                        </div>
                        <div class="feedback-item">
                            <strong>Topics Relevant:</strong> <span><?php echo htmlspecialchars($feedback_data['topics_relevant']); ?></span>
                        </div>
                        <div class="feedback-item">
                            <strong>Time Sufficient:</strong> <span><?php echo htmlspecialchars($feedback_data['time_sufficient']); ?></span>
                        </div>
                        <div class="feedback-item">
                            <strong>Content Organized:</strong> <span><?php echo htmlspecialchars($feedback_data['content_organized']); ?></span>
                        </div>
                        <div class="feedback-item">
                            <strong>Key Takeaways:</strong> <span><?php echo htmlspecialchars($feedback_data['key_takeaways']); ?></span>
                        </div>
                        <div class="feedback-item">
                            <strong>Suggestions:</strong> <span><?php echo htmlspecialchars($feedback_data['suggestions']); ?></span>
                        </div>
                        <div class="feedback-item">
                            <strong>Changes:</strong> <span><?php echo htmlspecialchars($feedback_data['changes']); ?></span>
                        </div>
                        <div class="feedback-item">
                            <strong>Overall Rating:</strong> <span><?php echo htmlspecialchars($feedback_data['overall_rating']); ?></span>
                        </div>
                    </div>
                </div>

                <p>If you have any further feedback or questions, feel free to <a href="mailto:your_email@example.com">reach out to us</a>!</p>
            </div>
        </div>
    </div>
</section>

<style>
    .feedback-success-page {
        margin: 40px auto;
        padding: 30px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #4CAF50; /* Green color for the title */
        text-align: center;
        margin-bottom: 20px;
    }

    .thank-you-message {
        font-size: 1.2em;
        color: #555;
        text-align: center;
        margin-bottom: 30px;
    }

    h3 {
        margin-top: 30px;
        color: #333;
        text-align: center;
    }

    .feedback-card {
        background: #f9f9f9;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .feedback-item {
        padding: 10px 0;
        border-bottom: 1px solid #eee; /* Light border between items */
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .feedback-item:last-child {
        border-bottom: none; /* Remove border from the last item */
    }

    .feedback-item strong {
        color: #333;
    }

    .feedback-item span {
        color: #555;
        font-weight: normal;
    }

    /* Responsive design */
    @media (max-width: 600px) {
        .feedback-success-page {
            padding: 15px;
        }
        
        .feedback-card {
            padding: 15px;
        }
    }
</style>
