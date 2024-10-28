<section class="contact-page">
    <div class="container">
        <div class="row">
            <!-- Image Section -->
            <div class="col-lg-6 col-md-6">
                <div class="contact-image">
                    <img loading="lazy" src="<?php echo site_url('assets/frontend/default-new/image/feedback.jpg'); ?>" alt="Feedback Image" class="img-fluid">
                </div>
            </div>
            <!-- Feedback Form Section -->
            <div class="col-lg-6 col-md-6">
                <h3>Learner Feedback Form</h3>

                <!-- Form Start -->
                <form action="<?php echo site_url('feedback/submit'); ?>" method="post" class="form-section">

                    <!-- Extracting user details from session -->
                    <?php
                    // Get user ID from session
                    $user_id = $this->session->userdata('user_id');
                    // Fetch user details
                    $user_details = $this->user_model->get_all_user($user_id)->row_array();
                    // Fetch enrolled courses
                    $enrolments = $this->user_model->my_courses()->result_array();

                    // Set user name and role
                    $full_name = isset($user_details['first_name']) ? htmlspecialchars($user_details['first_name'] . ' ' . $user_details['last_name']) : '';
                    $email = isset($user_details['email']) ? htmlspecialchars($user_details['email']) : '';
                    ?>

                    <!-- Name Input (Uneditable) -->
                    <div class="mb-3">
                        <label for="name" class="form-label">Name:</label>
                        <input type="text" class="form-control" id="name" name="name" value="<?php echo $full_name; ?>" disabled>
                    </div>

                    <input type="hidden" class="form-control" id="email" name="email" value="<?php echo $email; ?>">

                    <!-- User ID Input (Hidden) -->
                    <input type="hidden" name="user_id" value="<?php echo htmlspecialchars($user_id); ?>">

                    <!-- Course Dropdown -->
                    <div class="mb-3">
                        <select class="form-control" name="course_name" id="course_name" required>
                            <option value="" disabled selected>Select <?php echo get_phrase('course_title'); ?></option> <!-- Default prompt -->
                            <?php if (!empty($enrolments)): ?>
                                <?php foreach ($enrolments as $enrolment):
                                    // Fetch course details for each enrolment
                                    $course_details = $this->crud_model->get_course_by_id($enrolment['course_id'])->row_array(); ?>
                                    <option value="<?php echo htmlspecialchars($course_details['id']); ?>">
                                        <?php echo htmlspecialchars($course_details['title']); // Use 'title' from course_details ?>
                                    </option>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <option value="">No courses available</option>
                            <?php endif; ?>
                        </select>
                    </div>

                    <!-- What did you enjoy most about the session? -->
                    <div class="mb-3">
                        <label for="enjoy_session" class="form-label">What did you enjoy most about the session?</label>
                        <input type="text" class="form-control" id="enjoy_session" name="enjoy_session" value="<?php echo isset($enjoySession) ? htmlspecialchars($enjoySession) : ''; ?>">
                    </div>

                    <!-- Participation Encouraged -->
                    <div class="mb-3">
                        <label for="participation" class="form-label">Participation was encouraged throughout the session?</label>
                        <select class="form-control" name="participation" id="participation">
                            <option value="Very Much" <?php if (isset($participation) && $participation == "Very Much") echo "selected"; ?>>Very Much</option>
                            <option value="Normal" <?php if (isset($participation) && $participation == "Normal") echo "selected"; ?>>Normal</option>
                            <option value="Average" <?php if (isset($participation) && $participation == "Average") echo "selected"; ?>>Average</option>
                        </select>
                    </div>

                    <!-- Topics Relevant - Radio Buttons -->
                    <div class="mb-3">
                        <label>The topics covered were relevant?</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="topics_relevant" id="topics_relevant_yes" value="Yes" <?php if (isset($topicsRelevant) && $topicsRelevant == "Yes") echo "checked"; ?>>
                            <label class="form-check-label" for="topics_relevant_yes">Yes</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="topics_relevant" id="topics_relevant_no" value="No" <?php if (isset($topicsRelevant) && $topicsRelevant == "No") echo "checked"; ?>>
                            <label class="form-check-label" for="topics_relevant_no">No</label>
                        </div>
                    </div>

                    <!-- Time Sufficient - Radio Buttons -->
                    <div class="mb-3">
                        <label>The time allotted for the training was sufficient?</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="time_sufficient" id="time_sufficient_yes" value="Yes" <?php if (isset($timeSufficient) && $timeSufficient == "Yes") echo "checked"; ?>>
                            <label class="form-check-label" for="time_sufficient_yes">Yes</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="time_sufficient" id="time_sufficient_no" value="No" <?php if (isset($timeSufficient) && $timeSufficient == "No") echo "checked"; ?>>
                            <label class="form-check-label" for="time_sufficient_no">No</label>
                        </div>
                    </div>

                    <!-- Content Organized - Radio Buttons -->
                    <div class="mb-3">
                        <label>The content of the training module was thorough and well-organized?</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="content_organized" id="content_organized_yes" value="Yes" <?php if (isset($contentOrganized) && $contentOrganized == "Yes") echo "checked"; ?>>
                            <label class="form-check-label" for="content_organized_yes">Yes</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="content_organized" id="content_organized_no" value="No" <?php if (isset($contentOrganized) && $contentOrganized == "No") echo "checked"; ?>>
                            <label class="form-check-label" for="content_organized_no">No</label>
                        </div>
                    </div>

                    <!-- Additional Questions -->
                    <div class="mb-3">
                        <label for="key_takeaways" class="form-label">What were your key takeaways from the session?</label>
                        <textarea class="form-control" id="key_takeaways" name="key_takeaways" rows="3"><?php echo isset($keyTakeaways) ? htmlspecialchars($keyTakeaways) : ''; ?></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="suggestions" class="form-label">Do you have any suggestions for future sessions?</label>
                        <textarea class="form-control" id="suggestions" name="suggestions" rows="3"><?php echo isset($suggestions) ? htmlspecialchars($suggestions) : ''; ?></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="changes" class="form-label">What would you change to improve the session?</label>
                        <textarea class="form-control" id="changes" name="changes" rows="3"><?php echo isset($changes) ? htmlspecialchars($changes) : ''; ?></textarea>
                    </div>

                    <!-- Overall Rating -->
                    <div class="mb-3">
                        <div class="feedback">
                            <label for="overall_rating" class="form-label">
                                Overall, how would you rate the session?
                                <small class="text-warning" style="font-size: small;">(1 is lowest, 5 is highest)</small>
                            </label>
                            <div>
                                <!-- Stars Rating -->
                                <span class="star" data-value="1">★</span>
                                <span class="star" data-value="2">★</span>
                                <span class="star" data-value="3">★</span>
                                <span class="star" data-value="4">★</span>
                                <span class="star" data-value="5">★</span>
                                <input type="hidden" id="overall_rating" name="overall_rating" value="">
                            </div>
                        </div>
                    </div>
                    <style>
                        .star {
                            font-size: 30px; /* Size of the stars */
                            cursor: pointer; /* Pointer on hover */
                            color: gray; /* Default star color */
                        }
                        .star.selected {
                            color: gold; /* Color for selected stars */
                        }
                    </style>
                    <!-- Submit Button -->
                    <div class="form-btn">
                        <button type="submit" class="btn btn-primary">Submit Feedback</button>
                    </div>
                </form>
                <!-- Form End -->
            </div>
        </div>
    </div>
</section>

<script>
    // JavaScript to handle star selection
    document.querySelectorAll('.star').forEach(star => {
        star.addEventListener('click', function() {
            const ratingValue = this.getAttribute('data-value');
            const hiddenInput = document.getElementById('overall_rating'); // Corrected the ID here

            // Set the hidden input value
            hiddenInput.value = ratingValue;

            // Remove 'selected' class from all stars
            document.querySelectorAll('.star').forEach(s => s.classList.remove('selected'));

            // Add 'selected' class to the current star and all previous stars
            for (let i = 1; i <= ratingValue; i++) {
                document.querySelector(`.star[data-value="${i}"]`).classList.add('selected');
            }
        });
    });

    function confirmSubmission() {
        // Gather form values
        var name = document.getElementById("name").value;
        var email = document.getElementById("email").value;
        var course = document.getElementById("course_name").value;
        var enjoySession = document.getElementById("enjoy_session").value;
        var participation = document.getElementById("participation").value;
        var topicsRelevant = document.querySelector('input[name="topics_relevant"]:checked') ? document.querySelector('input[name="topics_relevant"]:checked').value : '';
        var timeSufficient = document.querySelector('input[name="time_sufficient"]:checked') ? document.querySelector('input[name="time_sufficient"]:checked').value : '';
        var contentOrganized = document.querySelector('input[name="content_organized"]:checked') ? document.querySelector('input[name="content_organized"]:checked').value : '';
        var keyTakeaways = document.getElementById("key_takeaways").value;
        var suggestions = document.getElementById("suggestions").value;
        var changes = document.getElementById("changes").value;
        var overallRating = document.getElementById("overall_rating").value || 'Not Rated'; // Added default value if not rated

        // Alert the values
        alert("Please review your feedback:\n\n" +
            "Name: " + name + "\n" +
            "Email: " + email + "\n" +
            "Course: " + course + "\n" +
            "What did you enjoy: " + enjoySession + "\n" +
            "Participation Encouraged: " + participation + "\n" +
            "Topics Relevant: " + topicsRelevant + "\n" +
            "Time Sufficient: " + timeSufficient + "\n" +
            "Content Organized: " + contentOrganized + "\n" +
            "Key Takeaways: " + keyTakeaways + "\n" +
            "Suggestions: " + suggestions + "\n" +
            "Changes: " + changes + "\n" +
            "Rating: " + overallRating + "\n"
        );

        // Return true to allow form submission
        return true; // Change to true to submit the form
    }
</script>
