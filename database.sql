-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 10, 2024 at 09:04 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mkraftlmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unique_identifier` varchar(255) NOT NULL,
  `version` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `about` longtext DEFAULT NULL,
  `purchase_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `name`, `unique_identifier`, `version`, `status`, `created_at`, `updated_at`, `about`, `purchase_code`) VALUES
(1, 'Course Content AI', 'course_ai', '1.1', 1, 1884882600, NULL, 'You can easily create your course content using this addon. It will offer you something creative, which will save you time.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bbb_meetings`
--

CREATE TABLE `bbb_meetings` (
  `id` int(20) NOT NULL,
  `course_id` int(11) NOT NULL,
  `meeting_id` varchar(255) DEFAULT NULL,
  `moderator_pw` varchar(255) DEFAULT NULL,
  `viewer_pw` varchar(255) DEFAULT NULL,
  `instructions` longtext DEFAULT NULL,
  `created_at` varchar(100) DEFAULT NULL,
  `updated_at` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blog_id` int(11) NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `keywords` text NOT NULL,
  `description` longtext NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `is_popular` int(11) NOT NULL,
  `likes` longtext NOT NULL,
  `added_date` varchar(100) NOT NULL,
  `updated_date` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE `blog_category` (
  `blog_category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `added_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `blog_comment_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `likes` longtext NOT NULL,
  `added_date` varchar(100) NOT NULL,
  `updated_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `font_awesome_class` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `sub_category_thumbnail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `code`, `name`, `parent`, `slug`, `date_added`, `last_modified`, `font_awesome_class`, `thumbnail`, `sub_category_thumbnail`) VALUES
(1, '7a32b9d35d', 'Technology', 0, 'technology', 1724385600, 1724385600, 'fas fa-tv', 'e714c9d45249037519c2755f24355333.jpg', NULL),
(2, '37ea2a58f3', 'Quantum Computing', 1, 'quantum-computing', 1724385600, NULL, 'fas fa-tv', NULL, NULL),
(3, '7022b6f0cd', 'Management', 0, 'management', 1724437800, NULL, 'fab fa-adn', '54bf01a57d860dac18a4dd90af8feb5c.jpg', NULL),
(4, '1af9488d2a', 'Beta', 3, 'beta', 1724437800, NULL, 'fas fa-adjust', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('g9sevlucv8oke57v96a8cfroe6d6bolj', '::1', 1727750987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732373730313636393b636172745f6974656d737c613a303a7b7d6c616e67756167657c733a373a22656e676c697368223b636f756e7443616c6c7c693a313b5f5f63695f766172737c613a313a7b733a393a22636f756e7443616c6c223b733a333a226f6c64223b7d),
('n2p5d19eh3lc3jdju38sn906kb40bafv', '::1', 1728586891, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732383439383333363b636172745f6974656d737c613a303a7b7d6c616e67756167657c733a373a22656e676c697368223b636f756e7443616c6c7c693a313b5f5f63695f766172737c613a313a7b733a393a22636f756e7443616c6c223b733a333a226f6c64223b7d),
('g9murp0o23q4b7lr17ilqg0o7hs63tj0', '::1', 1728499206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732383439393230353b636f756e7443616c6c7c693a313b5f5f63695f766172737c613a313a7b733a393a22636f756e7443616c6c223b733a333a226f6c64223b7d636172745f6974656d737c613a303a7b7d6c616e67756167657c733a373a22656e676c697368223b),
('1ggjdog05vdq0tin5j11u0mjaubep1fp', '::1', 1728499296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732383439393234373b636172745f6974656d737c613a303a7b7d6c616e67756167657c733a373a22656e676c697368223b636f756e7443616c6c7c693a313b5f5f63695f766172737c613a313a7b733a393a22636f756e7443616c6c223b733a333a226f6c64223b7d),
('mv31fnpde4fskl6a620vul3m9954bvco', '::1', 1728586963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732383536393139303b636172745f6974656d737c613a303a7b7d6c616e67756167657c733a373a22656e676c697368223b636f756e7443616c6c7c693a313b5f5f63695f766172737c613a323a7b733a393a22636f756e7443616c6c223b733a333a226f6c64223b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d637573746f6d5f73657373696f6e5f6c696d69747c693a313732393435303936333b757365725f69647c733a313a2232223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31353a224468616e72616a2044616468696368223b69735f696e7374727563746f727c733a313a2231223b666c6173685f6d6573736167657c733a32333a2257656c636f6d65204468616e72616a2044616468696368223b61646d696e5f6c6f67696e7c733a313a2231223b);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) UNSIGNED NOT NULL,
  `body` longtext DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `commentable_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(50) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(21) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `has_read` int(11) DEFAULT NULL,
  `replied` int(11) DEFAULT NULL,
  `created_at` varchar(100) DEFAULT NULL,
  `updated_at` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount_percentage` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `expiry_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `outcomes` longtext DEFAULT NULL,
  `faqs` text NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `section` longtext DEFAULT NULL,
  `requirements` longtext DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount_flag` int(11) DEFAULT 0,
  `discounted_price` double DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `course_type` varchar(255) DEFAULT NULL,
  `is_top_course` int(11) DEFAULT 0,
  `is_admin` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `course_overview_provider` varchar(255) DEFAULT NULL,
  `meta_keywords` longtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `is_free_course` int(11) DEFAULT NULL,
  `multi_instructor` int(11) NOT NULL DEFAULT 0,
  `enable_drip_content` int(11) NOT NULL,
  `creator` int(11) DEFAULT NULL,
  `expiry_period` int(11) DEFAULT NULL,
  `upcoming_image_thumbnail` varchar(255) DEFAULT NULL,
  `publish_date` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `title`, `short_description`, `description`, `outcomes`, `faqs`, `language`, `category_id`, `sub_category_id`, `section`, `requirements`, `price`, `discount_flag`, `discounted_price`, `level`, `user_id`, `thumbnail`, `video_url`, `date_added`, `last_modified`, `course_type`, `is_top_course`, `is_admin`, `status`, `course_overview_provider`, `meta_keywords`, `meta_description`, `is_free_course`, `multi_instructor`, `enable_drip_content`, `creator`, `expiry_period`, `upcoming_image_thumbnail`, `publish_date`) VALUES
(1, 'Quantum Computing', 'The Quantum Computing course is an in-depth exploration into the principles, theories, and applications of quantum computing—a revolutionary field that harnesses the laws of quantum mechanics to solve complex problems far beyond the capabilities of classical computers.', '<p>This course is designed for learners who are interested in understanding the core concepts of quantum mechanics, quantum algorithms, and their practical implementations.<br></p><h4><span style=\"font-weight: bolder;\">Key Learning Objectives:</span></h4><p style=\"margin-bottom: 0px;\"></p><h4></h4><p></p><ul><li><p><span style=\"font-weight: bolder;\">Understand Quantum Mechanics</span>: Grasp the fundamental principles of quantum mechanics that underpin quantum computing, including superposition, entanglement, and quantum measurement.</p></li><li><p><span style=\"font-weight: bolder;\">Explore Quantum Algorithms</span>: Learn about key quantum algorithms such as Shor’s algorithm for factoring, Grover’s search algorithm, and quantum Fourier transform, and understand their implications for problem-solving.</p></li><li><p><span style=\"font-weight: bolder;\">Quantum Hardware and Platforms</span>: Gain knowledge of quantum computing hardware, including qubits, quantum gates, and quantum circuits, as well as practical experience with quantum programming on platforms like IBM Quantum Experience, Google Cirq, and Microsoft Q#.</p></li><li><p><span style=\"font-weight: bolder;\">Real-World Applications</span>: Discover the potential applications of quantum computing in cryptography, optimization, drug discovery, materials science, and artificial intelligence, among other fields.</p></li><li><p><span style=\"font-weight: bolder;\">Future of Quantum Computing</span>: Explore the current challenges and future directions of quantum computing, including scalability, error correction, and the quest for quantum supremacy.</p></li></ul>', '[\"Upon successful completion of the Quantum Computing course, participants will achieve the following outcomes:  \",\"1. Comprehensive Understanding of Quantum Mechanics: Fundamental Concepts: Grasp core principles of quantum mechanics, including superposition, entanglement, and quantum measurement. Quantum Phenomena: Understand how quantum phenomena influence computational processes and algorithm design. \",\"2. Proficiency in Quantum Algorithms: Algorithm Implementation: Ability to implement key quantum algorithms such as Shor\\u2019s algorithm for integer factorization and Grover\\u2019s algorithm for searching unsorted databases. Algorithm Analysis: Analyze the efficiency and potential applications of quantum algorithms in solving complex problems.\",\"3. Practical Quantum Programming Skills: Programming Platforms: Proficiency in using quantum programming platforms such as IBM Qiskit, Google Cirq, and Microsoft Q#. Quantum Circuit Design: Ability to design, simulate, and analyze quantum circuits using real-world quantum computing tools.\",\"4. Application of Quantum Computing: Real-World Applications: Identify and evaluate potential applications of quantum computing in various fields, including cryptography, optimization, drug discovery, and artificial intelligence. Problem-Solving: Apply quantum computing techniques to solve practical problems and enhance current technologies.\",\"5. Awareness of Current Challenges and Future Trends: Challenges: Understand the current limitations and challenges of quantum computing, including issues related to scalability, error correction, and quantum decoherence. Future Directions: Stay informed about future trends and advancements in quantum computing technology and its potential impact on various industries.\",\"6. Certification and Career Advancement: Certification: Receive a certificate that validates your proficiency in quantum computing, which can enhance your resume and career prospects. Career Opportunities: Gain the skills and knowledge necessary to pursue careers or research opportunities in quantum computing, data science, cryptography, and related fields.\",\"7. Enhanced Problem-Solving Abilities: Innovative Thinking: Develop innovative problem-solving skills by leveraging quantum computing principles to tackle complex and computationally intensive challenges. \",\"By achieving these outcomes, participants will be well-equipped to contribute to the field of quantum computing, engage in advanced research, and leverage quantum technologies in various professional and academic settings.\"]', '{\"What is the Eligibility and Enrollment Criteria for the Quantum Computing Course?\":\"The Quantum Computing course is designed to be accessible to a diverse audience with varying backgrounds. Below are the key groups who can benefit from enrolling in this course:\\r\\n\\r\\n1. Students:\\r\\nUndergraduate and Graduate Students: Particularly those studying in fields such as computer science, physics, mathematics, or engineering who want to expand their knowledge into quantum computing.\\r\\nPhD Candidates: Researchers looking to explore quantum computing for their research projects.\\r\\n2. Professionals:\\r\\nSoftware Developers and Engineers: Individuals working in technology who want to learn quantum programming and how quantum computing might impact their field.\\r\\nData Scientists and Analysts: Professionals interested in how quantum computing could revolutionize data analysis, optimization, and machine learning.\\r\\nCryptographers: Experts in cybersecurity who want to understand how quantum computing will affect encryption and data security.\\r\\n3. Academics and Researchers:\\r\\nUniversity Faculty: Educators who wish to incorporate quantum computing into their curriculum or research.\\r\\nResearch Scientists: Those working in related fields who need a comprehensive understanding of quantum computing to apply in their research.\\r\\n4. Tech Enthusiasts:\\r\\nHobbyists and Lifelong Learners: Individuals passionate about emerging technologies and eager to delve into the world of quantum computing.\\r\\nSTEM Advocates: People interested in staying at the forefront of technological advancements.\\r\\n5. Industry Professionals:\\r\\nBusiness Analysts and Strategy Planners: Professionals who need to understand the implications of quantum computing for future technologies and business strategies.\\r\\nProduct Managers and Innovators: Those involved in developing or managing tech products that could leverage quantum computing advancements.\"}', 'english', 1, 2, '[1]', '[\"Prerequisites: Basic Knowledge: Familiarity with basic concepts of linear algebra, probability, and classical algorithms is recommended. Programming Skills: Basic proficiency in Python or another programming language is beneficial, particularly for the quantum programming modules.\"]', 5000, 1, 4500, 'beginner', '2', NULL, 'https://vimeo.com/336812686', 1724385600, 1727116562, 'general', 1, 1, 'active', 'vimeo', 'Quantum Computing,Quantum Mechanics,Qubits,Quantum Algorithms,Shor’s Algorithm,Grover’s Algorithm,Quantum Entanglement,Quantum Superposition,Quantum Circuits,Quantum Programming,IBM Qiskit,Google Cirq,Microsoft Q#,Quantum Cryptography,Quantum Optimization,Quantum Fourier Transform,Quantum Hardware,Quantum Error Correction,Quantum Supremacy,Quantum Computing Applications,Quantum Algorithms Implementation,Quantum Data Analysis,Quantum Simulation,Quantum Software,Quantum Research,Quantum Technologies,Quantum Future Trends,Advanced Quantum Computing,Quantum Computing Certification', 'Explore the Quantum Computing course to unlock the future of technology. Dive into quantum mechanics, algorithms, and programming with hands-on experience using IBM Qiskit, Google Cirq, and Microsoft Q#. Understand real-world applications, current challenges, and future trends in quantum computing. Ideal for students, professionals, and tech enthusiasts seeking to advance their knowledge and career in this revolutionary field. Enroll today to gain expertise and certification in quantum computing.', NULL, 0, 1, 2, NULL, NULL, ''),
(2, 'Management', 'Test Description for management', '<p>Test Description for management<br>Test Description for management</p><ul><li>Test Description for management</li><li>Test Description for management<br></li></ul>', '[\"Outcome 1\",\"Outcome 2\"]', '{\"Test FA Q1\":\"Test Ans1\"}', 'english', 1, 2, '[]', '[\"requirement 1\",\"requirement 2\"]', 500, NULL, 400, 'advanced', '2', NULL, '', 1724437800, 1724474782, 'general', 1, 1, 'active', '', 'mgmt,management,course,test', 'This is meta description test 1 course', NULL, 0, 0, 2, NULL, NULL, ''),
(3, 'Beta', 'Bera Beta Test Description:\r\n', '<p>Beta Description:</p><ul><li>Description 1</li><li>Description 2</li><li>Description3</li></ul>', '[\"Beta Out 1\",\"Beta Out 2\",\"Beta Out 3\"]', '{\"Beta Test FA Q1\":\"Beta Test Ans 1\"}', 'english', 3, 4, '[]', '[\"Beta R1\",\"Beta R2\",\"Beta R3\"]', 1000, 1, 800, 'intermediate', '2', NULL, 'https://www.youtube.com/watch?v=JhHMJCUmq28', 1724437800, NULL, 'general', 1, 1, 'active', 'youtube', 'meta,beta,course,management,mgmt', 'Meta Beta Description', NULL, 0, 0, 2, NULL, NULL, ''),
(4, 'Dev', 'Dev', '<p>Dev<br></p>', '[\"Dev Beta Out 1\",\"Dev Beta Out 2\"]', '{\"Dev FAQ1\":\"Dev FAQ ANS1\"}', 'english', 3, 4, '[2]', '[\"Dev Beta R1\"]', 5000, 1, 2000, 'advanced', '2', NULL, 'https://www.youtube.com/watch?v=ZxKM3DCV2kE', 1725215400, 1725264534, 'general', 1, 1, 'active', 'youtube', '', 'Development and Manangement ', NULL, 1, 1, 2, NULL, NULL, ''),
(5, 'Mkraft test 1', 'This is a test course initial stage', '<p>ABCC</p>', '[\"Excellent\"]', '{\"What is this\":\"This is it\"}', 'english', 3, 4, '[3]', '[\"Nothing much\"]', 2999, NULL, 1499, 'beginner', '4,3', NULL, 'https://www.youtube.com/watch?v=pVktObBxeN0', 1728498600, 1728504450, 'general', 0, 0, 'active', 'youtube', '', '', NULL, 1, 1, 4, 12, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `paypal_supported` int(11) DEFAULT NULL,
  `stripe_supported` int(11) DEFAULT NULL,
  `ccavenue_supported` int(11) DEFAULT 0,
  `iyzico_supported` int(11) DEFAULT 0,
  `paystack_supported` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `code`, `symbol`, `paypal_supported`, `stripe_supported`, `ccavenue_supported`, `iyzico_supported`, `paystack_supported`) VALUES
(1, 'US Dollar', 'USD', '$', 1, 1, 0, 0, 0),
(2, 'Albanian Lek', 'ALL', 'Lek', 0, 1, 0, 0, 0),
(3, 'Algerian Dinar', 'DZD', 'دج', 1, 1, 0, 0, 0),
(4, 'Angolan Kwanza', 'AOA', 'Kz', 1, 1, 0, 0, 0),
(5, 'Argentine Peso', 'ARS', '$', 1, 1, 0, 0, 0),
(6, 'Armenian Dram', 'AMD', '֏', 1, 1, 0, 0, 0),
(7, 'Aruban Florin', 'AWG', 'ƒ', 1, 1, 0, 0, 0),
(8, 'Australian Dollar', 'AUD', '$', 1, 1, 0, 0, 0),
(9, 'Azerbaijani Manat', 'AZN', 'm', 1, 1, 0, 0, 0),
(10, 'Bahamian Dollar', 'BSD', 'B$', 1, 1, 0, 0, 0),
(11, 'Bahraini Dinar', 'BHD', '.د.ب', 1, 1, 0, 0, 0),
(12, 'Bangladeshi Taka', 'BDT', '৳', 1, 1, 0, 0, 0),
(13, 'Barbadian Dollar', 'BBD', 'Bds$', 1, 1, 0, 0, 0),
(14, 'Belarusian Ruble', 'BYR', 'Br', 0, 0, 0, 0, 0),
(15, 'Belgian Franc', 'BEF', 'fr', 1, 1, 0, 0, 0),
(16, 'Belize Dollar', 'BZD', '$', 1, 1, 0, 0, 0),
(17, 'Bermudan Dollar', 'BMD', '$', 1, 1, 0, 0, 0),
(18, 'Bhutanese Ngultrum', 'BTN', 'Nu.', 1, 1, 0, 0, 0),
(19, 'Bitcoin', 'BTC', '฿', 1, 1, 0, 0, 0),
(20, 'Bolivian Boliviano', 'BOB', 'Bs.', 1, 1, 0, 0, 0),
(21, 'Bosnia', 'BAM', 'KM', 1, 1, 0, 0, 0),
(22, 'Botswanan Pula', 'BWP', 'P', 1, 1, 0, 0, 0),
(23, 'Brazilian Real', 'BRL', 'R$', 1, 1, 0, 0, 0),
(24, 'British Pound Sterling', 'GBP', '£', 1, 1, 0, 0, 0),
(25, 'Brunei Dollar', 'BND', 'B$', 1, 1, 0, 0, 0),
(26, 'Bulgarian Lev', 'BGN', 'Лв.', 1, 1, 0, 0, 0),
(27, 'Burundian Franc', 'BIF', 'FBu', 1, 1, 0, 0, 0),
(28, 'Cambodian Riel', 'KHR', 'KHR', 1, 1, 0, 0, 0),
(29, 'Canadian Dollar', 'CAD', '$', 1, 1, 0, 0, 0),
(30, 'Cape Verdean Escudo', 'CVE', '$', 1, 1, 0, 0, 0),
(31, 'Cayman Islands Dollar', 'KYD', '$', 1, 1, 0, 0, 0),
(32, 'CFA Franc BCEAO', 'XOF', 'CFA', 1, 1, 0, 0, 0),
(33, 'CFA Franc BEAC', 'XAF', 'FCFA', 1, 1, 0, 0, 0),
(34, 'CFP Franc', 'XPF', '₣', 1, 1, 0, 0, 0),
(35, 'Chilean Peso', 'CLP', '$', 1, 1, 0, 0, 0),
(36, 'Chinese Yuan', 'CNY', '¥', 1, 1, 0, 0, 0),
(37, 'Colombian Peso', 'COP', '$', 1, 1, 0, 0, 0),
(38, 'Comorian Franc', 'KMF', 'CF', 1, 1, 0, 0, 0),
(39, 'Congolese Franc', 'CDF', 'FC', 1, 1, 0, 0, 0),
(40, 'Costa Rican ColÃ³n', 'CRC', '₡', 1, 1, 0, 0, 0),
(41, 'Croatian Kuna', 'HRK', 'kn', 1, 1, 0, 0, 0),
(42, 'Cuban Convertible Peso', 'CUC', '$, CUC', 1, 1, 0, 0, 0),
(43, 'Czech Republic Koruna', 'CZK', 'Kč', 1, 1, 0, 0, 0),
(44, 'Danish Krone', 'DKK', 'Kr.', 1, 1, 0, 0, 0),
(45, 'Djiboutian Franc', 'DJF', 'Fdj', 1, 1, 0, 0, 0),
(46, 'Dominican Peso', 'DOP', '$', 1, 1, 0, 0, 0),
(47, 'East Caribbean Dollar', 'XCD', '$', 1, 1, 0, 0, 0),
(48, 'Egyptian Pound', 'EGP', 'ج.م', 1, 1, 0, 0, 0),
(49, 'Eritrean Nakfa', 'ERN', 'Nfk', 1, 1, 0, 0, 0),
(50, 'Estonian Kroon', 'EEK', 'kr', 1, 1, 0, 0, 0),
(51, 'Ethiopian Birr', 'ETB', 'Nkf', 1, 1, 0, 0, 0),
(52, 'Euro', 'EUR', '€', 1, 1, 0, 0, 0),
(53, 'Falkland Islands Pound', 'FKP', '£', 1, 1, 0, 0, 0),
(54, 'Fijian Dollar', 'FJD', 'FJ$', 1, 1, 0, 0, 0),
(55, 'Gambian Dalasi', 'GMD', 'D', 1, 1, 0, 0, 0),
(56, 'Georgian Lari', 'GEL', 'ლ', 1, 1, 0, 0, 0),
(57, 'German Mark', 'DEM', 'DM', 1, 1, 0, 0, 0),
(58, 'Ghanaian Cedi', 'GHS', 'GH₵', 1, 1, 0, 0, 0),
(59, 'Gibraltar Pound', 'GIP', '£', 1, 1, 0, 0, 0),
(60, 'Greek Drachma', 'GRD', '₯, Δρχ, Δρ', 1, 1, 0, 0, 0),
(61, 'Guatemalan Quetzal', 'GTQ', 'Q', 1, 1, 0, 0, 0),
(62, 'Guinean Franc', 'GNF', 'FG', 1, 1, 0, 0, 0),
(63, 'Guyanaese Dollar', 'GYD', '$', 1, 1, 0, 0, 0),
(64, 'Haitian Gourde', 'HTG', 'G', 1, 1, 0, 0, 0),
(65, 'Honduran Lempira', 'HNL', 'L', 1, 1, 0, 0, 0),
(66, 'Hong Kong Dollar', 'HKD', '$', 1, 1, 0, 0, 0),
(67, 'Hungarian Forint', 'HUF', 'Ft', 1, 1, 0, 0, 0),
(68, 'Icelandic KrÃ³na', 'ISK', 'kr', 1, 1, 0, 0, 0),
(69, 'Indian Rupee', 'INR', '₹', 1, 1, 1, 0, 0),
(70, 'Indonesian Rupiah', 'IDR', 'Rp', 1, 1, 0, 0, 0),
(71, 'Iranian Rial', 'IRR', '﷼', 1, 1, 0, 0, 0),
(72, 'Iraqi Dinar', 'IQD', 'د.ع', 1, 1, 0, 0, 0),
(73, 'Israeli New Sheqel', 'ILS', '₪', 1, 1, 0, 0, 0),
(74, 'Italian Lira', 'ITL', 'L,£', 1, 1, 0, 0, 0),
(75, 'Jamaican Dollar', 'JMD', 'J$', 1, 1, 0, 0, 0),
(76, 'Japanese Yen', 'JPY', '¥', 1, 1, 0, 0, 0),
(77, 'Jordanian Dinar', 'JOD', 'ا.د', 1, 1, 0, 0, 0),
(78, 'Kazakhstani Tenge', 'KZT', 'лв', 1, 1, 0, 0, 0),
(79, 'Kenyan Shilling', 'KES', 'KSh', 1, 1, 0, 0, 0),
(80, 'Kuwaiti Dinar', 'KWD', 'ك.د', 1, 1, 0, 0, 0),
(81, 'Kyrgystani Som', 'KGS', 'лв', 1, 1, 0, 0, 0),
(82, 'Laotian Kip', 'LAK', '₭', 1, 1, 0, 0, 0),
(83, 'Latvian Lats', 'LVL', 'Ls', 0, 0, 0, 0, 0),
(84, 'Lebanese Pound', 'LBP', '£', 1, 1, 0, 0, 0),
(85, 'Lesotho Loti', 'LSL', 'L', 1, 1, 0, 0, 0),
(86, 'Liberian Dollar', 'LRD', '$', 1, 1, 0, 0, 0),
(87, 'Libyan Dinar', 'LYD', 'د.ل', 1, 1, 0, 0, 0),
(88, 'Lithuanian Litas', 'LTL', 'Lt', 0, 0, 0, 0, 0),
(89, 'Macanese Pataca', 'MOP', '$', 1, 1, 0, 0, 0),
(90, 'Macedonian Denar', 'MKD', 'ден', 1, 1, 0, 0, 0),
(91, 'Malagasy Ariary', 'MGA', 'Ar', 1, 1, 0, 0, 0),
(92, 'Malawian Kwacha', 'MWK', 'MK', 1, 1, 0, 0, 0),
(93, 'Malaysian Ringgit', 'MYR', 'RM', 1, 1, 0, 0, 0),
(94, 'Maldivian Rufiyaa', 'MVR', 'Rf', 1, 1, 0, 0, 0),
(95, 'Mauritanian Ouguiya', 'MRO', 'MRU', 1, 1, 0, 0, 0),
(96, 'Mauritian Rupee', 'MUR', '₨', 1, 1, 0, 0, 0),
(97, 'Mexican Peso', 'MXN', '$', 1, 1, 0, 0, 0),
(98, 'Moldovan Leu', 'MDL', 'L', 1, 1, 0, 0, 0),
(99, 'Mongolian Tugrik', 'MNT', '₮', 1, 1, 0, 0, 0),
(100, 'Moroccan Dirham', 'MAD', 'MAD', 1, 1, 0, 0, 0),
(101, 'Mozambican Metical', 'MZM', 'MT', 1, 1, 0, 0, 0),
(102, 'Myanmar Kyat', 'MMK', 'K', 1, 1, 0, 0, 0),
(103, 'Namibian Dollar', 'NAD', '$', 1, 1, 0, 0, 0),
(104, 'Nepalese Rupee', 'NPR', '₨', 1, 1, 0, 0, 0),
(105, 'Netherlands Antillean Guilder', 'ANG', 'ƒ', 1, 1, 0, 0, 0),
(106, 'New Taiwan Dollar', 'TWD', '$', 1, 1, 0, 0, 0),
(107, 'New Zealand Dollar', 'NZD', '$', 1, 1, 0, 0, 0),
(108, 'Nicaraguan CÃ³rdoba', 'NIO', 'C$', 1, 1, 0, 0, 0),
(109, 'Nigerian Naira', 'NGN', '₦', 1, 1, 0, 0, 1),
(110, 'North Korean Won', 'KPW', '₩', 0, 0, 0, 0, 0),
(111, 'Norwegian Krone', 'NOK', 'kr', 1, 1, 0, 0, 0),
(112, 'Omani Rial', 'OMR', '.ع.ر', 0, 0, 0, 0, 0),
(113, 'Pakistani Rupee', 'PKR', '₨', 1, 1, 0, 0, 0),
(114, 'Panamanian Balboa', 'PAB', 'B/.', 1, 1, 0, 0, 0),
(115, 'Papua New Guinean Kina', 'PGK', 'K', 1, 1, 0, 0, 0),
(116, 'Paraguayan Guarani', 'PYG', '₲', 1, 1, 0, 0, 0),
(117, 'Peruvian Nuevo Sol', 'PEN', 'S/.', 1, 1, 0, 0, 0),
(118, 'Philippine Peso', 'PHP', '₱', 1, 1, 0, 0, 0),
(119, 'Polish Zloty', 'PLN', 'zł', 1, 1, 0, 0, 0),
(120, 'Qatari Rial', 'QAR', 'ق.ر', 1, 1, 0, 0, 0),
(121, 'Romanian Leu', 'RON', 'lei', 1, 1, 0, 0, 0),
(122, 'Russian Ruble', 'RUB', '₽', 1, 1, 0, 0, 0),
(123, 'Rwandan Franc', 'RWF', 'FRw', 1, 1, 0, 0, 0),
(124, 'Salvadoran ColÃ³n', 'SVC', '₡', 0, 0, 0, 0, 0),
(125, 'Samoan Tala', 'WST', 'SAT', 1, 1, 0, 0, 0),
(126, 'Saudi Riyal', 'SAR', '﷼', 1, 1, 0, 0, 0),
(127, 'Serbian Dinar', 'RSD', 'din', 1, 1, 0, 0, 0),
(128, 'Seychellois Rupee', 'SCR', 'SRe', 1, 1, 0, 0, 0),
(129, 'Sierra Leonean Leone', 'SLL', 'Le', 1, 1, 0, 0, 0),
(130, 'Singapore Dollar', 'SGD', '$', 1, 1, 0, 0, 0),
(131, 'Slovak Koruna', 'SKK', 'Sk', 1, 1, 0, 0, 0),
(132, 'Solomon Islands Dollar', 'SBD', 'Si$', 1, 1, 0, 0, 0),
(133, 'Somali Shilling', 'SOS', 'Sh.so.', 1, 1, 0, 0, 0),
(134, 'South African Rand', 'ZAR', 'R', 1, 1, 0, 0, 0),
(135, 'South Korean Won', 'KRW', '₩', 1, 1, 0, 0, 0),
(136, 'Special Drawing Rights', 'XDR', 'SDR', 1, 1, 0, 0, 0),
(137, 'Sri Lankan Rupee', 'LKR', 'Rs', 1, 1, 0, 0, 0),
(138, 'St. Helena Pound', 'SHP', '£', 1, 1, 0, 0, 0),
(139, 'Sudanese Pound', 'SDG', '.س.ج', 1, 1, 0, 0, 0),
(140, 'Surinamese Dollar', 'SRD', '$', 1, 1, 0, 0, 0),
(141, 'Swazi Lilangeni', 'SZL', 'E', 1, 1, 0, 0, 0),
(142, 'Swedish Krona', 'SEK', 'kr', 1, 1, 0, 0, 0),
(143, 'Swiss Franc', 'CHF', 'CHf', 1, 1, 0, 0, 0),
(144, 'Syrian Pound', 'SYP', 'LS', 0, 0, 0, 0, 0),
(145, 'São Tomé and Príncipe Dobra', 'STD', 'Db', 1, 1, 0, 0, 0),
(146, 'Tajikistani Somoni', 'TJS', 'SM', 1, 1, 0, 0, 0),
(147, 'Tanzanian Shilling', 'TZS', 'TSh', 1, 1, 0, 0, 0),
(148, 'Thai Baht', 'THB', '฿', 1, 1, 0, 0, 0),
(149, 'Tongan pa\'anga', 'TOP', '$', 1, 1, 0, 0, 0),
(150, 'Trinidad & Tobago Dollar', 'TTD', '$', 1, 1, 0, 0, 0),
(151, 'Tunisian Dinar', 'TND', 'ت.د', 1, 1, 0, 0, 0),
(152, 'Turkish Lira', 'TRY', '₺', 1, 1, 0, 1, 0),
(153, 'Turkmenistani Manat', 'TMT', 'T', 1, 1, 0, 0, 0),
(154, 'Ugandan Shilling', 'UGX', 'USh', 1, 1, 0, 0, 0),
(155, 'Ukrainian Hryvnia', 'UAH', '₴', 1, 1, 0, 0, 0),
(156, 'United Arab Emirates Dirham', 'AED', 'إ.د', 1, 1, 0, 0, 0),
(157, 'Uruguayan Peso', 'UYU', '$', 1, 1, 0, 0, 0),
(158, 'Afghan Afghani', 'AFA', '؋', 1, 1, 0, 0, 0),
(159, 'Uzbekistan Som', 'UZS', 'лв', 1, 1, 0, 0, 0),
(160, 'Vanuatu Vatu', 'VUV', 'VT', 1, 1, 0, 0, 0),
(161, 'Venezuelan BolÃvar', 'VEF', 'Bs', 0, 0, 0, 0, 0),
(162, 'Vietnamese Dong', 'VND', '₫', 1, 1, 0, 0, 0),
(163, 'Yemeni Rial', 'YER', '﷼', 1, 1, 0, 0, 0),
(164, 'Zambian Kwacha', 'ZMK', 'ZK', 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `custom_page`
--

CREATE TABLE `custom_page` (
  `custom_page_id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_content` longtext NOT NULL,
  `page_url` varchar(255) NOT NULL,
  `button_title` varchar(255) NOT NULL,
  `button_position` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrol`
--

CREATE TABLE `enrol` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `gifted_by` int(11) NOT NULL DEFAULT 0,
  `expiry_date` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_settings`
--

CREATE TABLE `frontend_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `frontend_settings`
--

INSERT INTO `frontend_settings` (`id`, `key`, `value`) VALUES
(1, 'banner_title', 'Welcome to MILE! Your companion to Multiply, Influence, Lead, Engage.'),
(2, 'banner_sub_title', 'Elevate your learning experience by choosing a platform that prioritizes quality and innovation.'),
(4, 'about_us', '<p></p><h2><span xss=\"removed\">About us</span></h2>'),
(10, 'terms_and_condition', '<h2>Terms and Condition</h2>'),
(11, 'privacy_policy', '<p></p><p></p><h2><span xss=\"removed\">Privacy Policy</span></h2>'),
(13, 'theme', 'default-new'),
(14, 'cookie_note', 'This website uses cookies to personalize content and analyse traffic in order to offer you a better experience.'),
(15, 'cookie_status', 'active'),
(16, 'cookie_policy', '<h1>Cookie policy</h1><ol><li>Cookies are small text files that can be used by websites to make a user\'s experience more efficient.</li><li>The law states that we can store cookies on your device if they are strictly necessary for the operation of this site. For all other types of cookies we need your permission.</li><li>This site uses different types of cookies. Some cookies are placed by third party services that appear on our pages.</li></ol>'),
(17, 'banner_image', '{\"home_1\":\"home-1.png\"}'),
(18, 'light_logo', '5a5ceee24492220aa1462229da195172.png'),
(19, 'dark_logo', 'a17d8a6b77def3ef5bbcb5b6afc22026.png'),
(20, 'small_logo', 'logo-light-sm.png'),
(21, 'favicon', 'favicon.png'),
(22, 'recaptcha_status', '0'),
(23, 'recaptcha_secretkey', 'Valid-secret-key'),
(24, 'recaptcha_sitekey', 'Valid-site-key'),
(25, 'refund_policy', '<h2><span xss=\"removed\">Refund Policy</span></h2>'),
(26, 'facebook', 'https://facebook.com/'),
(27, 'twitter', 'https://twitter.com'),
(28, 'linkedin', 'https://www.linkedin.com/company/multiplierskraft'),
(31, 'blog_page_title', 'Where possibilities begin'),
(32, 'blog_page_subtitle', 'We’re a leading marketplace platform for learning and teaching online. Explore some of our most popular content and learn something new.'),
(33, 'blog_page_banner', 'blog-page.png'),
(34, 'instructors_blog_permission', '0'),
(35, 'blog_visibility_on_the_home_page', '1'),
(37, 'website_faqs', '[{\"question\":\"What is MKraft Capability Learning Management System?\",\"answer\":\"MKraft is not only a learning platform; it\'s a transformative journey that empowers individuals and organizations alike. Our Capability Learning Management System offers a dynamic suite of e-learning courses crafted by industry experts, designed to ignite curiosity and foster real-world skills that drive success.\"},{\"question\":\"Who creates the courses?\",\"answer\":\"Our courses are curated by a diverse team of thought leaders and subject matter experts who bring decades of experience to the table. Each course is a blend of practical insights and cutting-edge knowledge, ensuring you learn from the best in the industry.\"},{\"question\":\"Can I customize the courses for my organization?\",\"answer\":\"Absolutely! At MKraft, we understand that every organization is unique. Our bespoke approach allows you to customize courses to align perfectly with your specific industry needs and organizational goals, making your learning experience truly relevant and impactful.\"},{\"question\":\"What types of courses do you offer?\",\"answer\":\"We offer a comprehensive array of courses spanning various disciplines\\u2014from leadership and compliance to technology and creative skills. Each course is meticulously designed to provide actionable insights and hands-on experience, ensuring that learning translates into real-world application.\"},{\"question\":\"Is there a minimum number of participants required for customized courses?\",\"answer\":\"To ensure a personalized experience, we typically require a minimum number of participants for our custom courses. However, we\\u2019re committed to accommodating your organization\\u2019s needs, so feel free to reach out to discuss your specific situation!\"},{\"question\":\"How do I enroll in a course?\",\"answer\":\"Enrolling in a course with MKraft is seamless and user-friendly. Simply visit our website, browse through our diverse course offerings, and click to enroll. If you need assistance, our dedicated support team is just a message away, ready to guide you through the process.\"},{\"question\":\"What is the duration of the courses?\",\"answer\":\"Course durations vary, thoughtfully designed to fit into your busy schedule. From quick, impactful modules to in-depth programs that dive deep into complex topics, our offerings cater to every learning pace and need, ensuring you find the perfect fit.\"},{\"question\":\"Are the courses self-paced?\",\"answer\":\"Yes, many of our courses are self-paced, empowering you to learn at your own rhythm. Whether you prefer to power through a module in one sitting or take your time to absorb the material, MKraft provides the flexibility you need to achieve your learning goals.\"},{\"question\":\"Do you provide certificates upon course completion?\",\"answer\":\"Certainly! Upon completing each course, you\\u2019ll receive a prestigious certificate that showcases your commitment to professional development. This certification not only enhances your resume but also serves as a testament to the skills and knowledge you\\u2019ve acquired.\"},{\"question\":\"What technology do I need to access the courses?\",\"answer\":\"You can access our courses from any device\\u2014be it a computer, tablet, or smartphone\\u2014as long as you have an internet connection. Our platform is optimized for a seamless learning experience, ensuring that you can learn anytime, anywhere, without technological barriers.\"}]'),
(38, 'motivational_speech', '[{\"title\":\"MKraft E-Learning Solution\",\"description\":\"Unlock Your Potential: Discover Learning Excellence with MKraft\\r\\n\\r\\nStep into a world where education meets innovation. At MKraft, we believe that the key to success lies in exceptional learning experiences. Our e-learning courses, meticulously designed by industry experts, are not just informative\\u2014they\'re transformative.\\r\\n\\r\\nWe understand that every organization has its unique challenges and goals. That\\u2019s why our courses are custom-tailored to align with your specific industry needs, ensuring that the knowledge gained is directly applicable and impactful.\\r\\n\\r\\nWhether you aim to upskill your workforce, enhance compliance, or ignite creativity, MKraft is here to guide you. Join us on a journey of growth and empowerment\\u2014let\'s unlock your team\'s full potential together. Connect with us today to explore how we can craft the ideal e-learning solutions for your organization and watch your team thrive!\",\"image\":\"AdMZUlnyQ61SgF9bR0iE.png\"}]'),
(39, 'home_page', 'home_2'),
(40, 'contact_info', '{\"email\":\"info@multiplierskraft.com,\\r\\nsupport@multiplierskraft.com\",\"phone\":\"0091-961-105-8522\",\"address\":\"193 CSV,  Electronic City Phase 2, Bangalore - 560100\",\"office_hours\":\"10:00 AM - 6:00 PM\"}'),
(41, 'custom_css', ''),
(42, 'embed_code', ''),
(43, 'top_course_section', '1'),
(44, 'latest_course_section', '1'),
(45, 'top_category_section', '1'),
(46, 'upcoming_course_section', '1'),
(47, 'faq_section', '1'),
(48, 'top_instructor_section', '1'),
(49, 'motivational_speech_section', '1'),
(50, 'promotional_section', '1');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL,
  `phrase` longtext DEFAULT NULL,
  `english` longtext DEFAULT NULL,
  `spanish` text DEFAULT NULL,
  `arabic` text DEFAULT NULL,
  `french` text DEFAULT NULL,
  `georgian` text DEFAULT NULL,
  `german` text DEFAULT NULL,
  `hindi` text DEFAULT NULL,
  `indonesia` text DEFAULT NULL,
  `italian` text DEFAULT NULL,
  `chinese` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `spanish`, `arabic`, `french`, `georgian`, `german`, `hindi`, `indonesia`, `italian`, `chinese`) VALUES
(1, 'English', 'English', 'Español', 'إنجليزي', 'Anglais', NULL, NULL, NULL, NULL, NULL, '英语'),
(2, '404_not_found', '404 not found', '404 no encontrado', '404 غير موجود', '404 non trouvé', '404 not found', NULL, '404 not found', NULL, NULL, '404 未找到'),
(3, 'courses', 'Courses', 'Cursos', 'الدورات', 'Cours', 'Courses', 'Courses', 'Courses', 'Courses', NULL, '培训班'),
(4, 'all_courses', 'All courses', 'Todos los cursos', 'كل الدورات', 'Tous les cours', 'All courses', 'All courses', 'All courses', NULL, NULL, '所有课程'),
(5, 'all_courses', 'All courses', 'Todos los cursos', 'كل الدورات', 'Tous les cours', 'All courses', 'All courses', 'All courses', NULL, NULL, '所有课程'),
(6, 'all_courses', 'All courses', 'Todos los cursos', 'كل الدورات', 'Tous les cours', 'All courses', 'All courses', 'All courses', NULL, NULL, '所有课程'),
(7, 'search', 'Search', 'Buscar', 'يبحث', 'Rechercher', 'Search', 'Search', 'Search', NULL, NULL, '搜索'),
(8, 'search', 'Search', 'Buscar', 'يبحث', 'Rechercher', 'Search', 'Search', 'Search', NULL, NULL, '搜索'),
(9, 'search', 'Search', 'Buscar', 'يبحث', 'Rechercher', 'Search', 'Search', 'Search', NULL, NULL, '搜索'),
(10, 'search', 'Search', 'Buscar', 'يبحث', 'Rechercher', 'Search', 'Search', 'Search', NULL, NULL, '搜索'),
(11, 'search', 'Search', 'Buscar', 'يبحث', 'Rechercher', 'Search', 'Search', 'Search', NULL, NULL, '搜索'),
(12, 'search', 'Search', 'Buscar', 'يبحث', 'Rechercher', 'Search', 'Search', 'Search', NULL, NULL, '搜索'),
(13, 'you_have_no_items_in_your_cart!', 'You have no items in your cart!', '¡No tienes artículos en tu carrito!', 'لا يوجد لديك أي سلع في سلة التسوق الخاصة بك!', 'Vous n\'avez aucun article dans votre panier !', 'You have no items in your cart!', 'You have no items in your cart!', 'You have no items in your cart!', NULL, NULL, '您的购物车中没有商品！'),
(14, 'you_have_no_items_in_your_cart!', 'You have no items in your cart!', '¡No tienes artículos en tu carrito!', 'لا يوجد لديك أي سلع في سلة التسوق الخاصة بك!', 'Vous n\'avez aucun article dans votre panier !', 'You have no items in your cart!', 'You have no items in your cart!', 'You have no items in your cart!', NULL, NULL, '您的购物车中没有商品！'),
(15, 'you_have_no_items_in_your_cart!', 'You have no items in your cart!', '¡No tienes artículos en tu carrito!', 'لا يوجد لديك أي سلع في سلة التسوق الخاصة بك!', 'Vous n\'avez aucun article dans votre panier !', 'You have no items in your cart!', 'You have no items in your cart!', 'You have no items in your cart!', NULL, NULL, '您的购物车中没有商品！'),
(16, 'you_have_no_items_in_your_cart!', 'You have no items in your cart!', '¡No tienes artículos en tu carrito!', 'لا يوجد لديك أي سلع في سلة التسوق الخاصة بك!', 'Vous n\'avez aucun article dans votre panier !', 'You have no items in your cart!', 'You have no items in your cart!', 'You have no items in your cart!', NULL, NULL, '您的购物车中没有商品！'),
(17, 'you_have_no_items_in_your_cart!', 'You have no items in your cart!', '¡No tienes artículos en tu carrito!', 'لا يوجد لديك أي سلع في سلة التسوق الخاصة بك!', 'Vous n\'avez aucun article dans votre panier !', 'You have no items in your cart!', 'You have no items in your cart!', 'You have no items in your cart!', NULL, NULL, '您的购物车中没有商品！'),
(18, 'you_have_no_items_in_your_cart!', 'You have no items in your cart!', '¡No tienes artículos en tu carrito!', 'لا يوجد لديك أي سلع في سلة التسوق الخاصة بك!', 'Vous n\'avez aucun article dans votre panier !', 'You have no items in your cart!', 'You have no items in your cart!', 'You have no items in your cart!', NULL, NULL, '您的购物车中没有商品！'),
(19, 'checkout', 'Checkout', 'Pagar', 'الدفع', 'Paiement', 'Checkout', 'Checkout', 'Checkout', NULL, NULL, '查看'),
(20, 'checkout', 'Checkout', 'Pagar', 'الدفع', 'Paiement', 'Checkout', 'Checkout', 'Checkout', NULL, NULL, '查看'),
(21, 'checkout', 'Checkout', 'Pagar', 'الدفع', 'Paiement', 'Checkout', 'Checkout', 'Checkout', NULL, NULL, '查看'),
(22, 'login', 'Login', 'Iniciar sesión', 'تسجيل الدخول', 'Connexion', 'Login', NULL, 'Login', NULL, NULL, '登录'),
(23, 'login', 'Login', 'Iniciar sesión', 'تسجيل الدخول', 'Connexion', 'Login', NULL, 'Login', NULL, NULL, '登录'),
(24, 'login', 'Login', 'Iniciar sesión', 'تسجيل الدخول', 'Connexion', 'Login', NULL, 'Login', NULL, NULL, '登录'),
(25, 'join_now', 'Join now', 'Únete ahora', 'نضم الان', 'Rejoignez maintenant', 'Join now', 'Join now', 'Join now', NULL, NULL, '立即加入'),
(26, 'join_now', 'Join now', 'Únete ahora', 'نضم الان', 'Rejoignez maintenant', 'Join now', 'Join now', 'Join now', NULL, NULL, '立即加入'),
(27, 'join_now', 'Join now', 'Únete ahora', 'نضم الان', 'Rejoignez maintenant', 'Join now', 'Join now', 'Join now', NULL, NULL, '立即加入'),
(28, 'join_now', 'Join now', 'Únete ahora', 'نضم الان', 'Rejoignez maintenant', 'Join now', 'Join now', 'Join now', NULL, NULL, '立即加入'),
(29, 'join_now', 'Join now', 'Únete ahora', 'نضم الان', 'Rejoignez maintenant', 'Join now', 'Join now', 'Join now', NULL, NULL, '立即加入'),
(30, 'join_now', 'Join now', 'Únete ahora', 'نضم الان', 'Rejoignez maintenant', 'Join now', 'Join now', 'Join now', NULL, NULL, '立即加入'),
(31, 'sign_up', 'Sign up', 'Registrarse', 'اشتراك', 'S\'inscrire', 'Sign up', 'Sign up', 'Sign up', NULL, NULL, '报名'),
(32, 'cart', 'Cart', 'Carrito', 'Cart', 'Panier', 'Cart', 'Cart', 'Cart', NULL, NULL, 'Cart'),
(33, 'cart', 'Cart', 'Carrito', 'Cart', 'Panier', 'Cart', 'Cart', 'Cart', NULL, NULL, 'Cart'),
(34, 'cart', 'Cart', 'Carrito', 'Cart', 'Panier', 'Cart', 'Cart', 'Cart', NULL, NULL, 'Cart'),
(35, 'categories', 'Categories', 'Categorías', 'فئات', 'Catégories', 'Categories', 'Categories', 'Categories', NULL, NULL, '类别'),
(36, 'categories', 'Categories', 'Categorías', 'فئات', 'Catégories', 'Categories', 'Categories', 'Categories', NULL, NULL, '类别'),
(37, 'categories', 'Categories', 'Categorías', 'فئات', 'Catégories', 'Categories', 'Categories', 'Categories', NULL, NULL, '类别'),
(38, 'categories', 'Categories', 'Categorías', 'فئات', 'Catégories', 'Categories', 'Categories', 'Categories', NULL, NULL, '类别'),
(39, 'cookie_policy', 'Cookie policy', 'Política de cookies', 'سياسة ملفات الارتباط', 'Politique relative aux cookies', 'Cookie policy', 'Cookie policy', 'Cookie policy', NULL, NULL, 'Cookie 政策'),
(40, 'cookie_policy', 'Cookie policy', 'Política de cookies', 'سياسة ملفات الارتباط', 'Politique relative aux cookies', 'Cookie policy', 'Cookie policy', 'Cookie policy', NULL, NULL, 'Cookie 政策'),
(41, 'cookie_policy', 'Cookie policy', 'Política de cookies', 'سياسة ملفات الارتباط', 'Politique relative aux cookies', 'Cookie policy', 'Cookie policy', 'Cookie policy', NULL, NULL, 'Cookie 政策'),
(42, 'cookie_policy', 'Cookie policy', 'Política de cookies', 'سياسة ملفات الارتباط', 'Politique relative aux cookies', 'Cookie policy', 'Cookie policy', 'Cookie policy', NULL, NULL, 'Cookie 政策'),
(43, 'accept', 'Accept', 'Aceptar', 'يقبل', 'Accepter', 'Accept', 'Accept', 'Accept', NULL, NULL, '接受'),
(44, 'accept', 'Accept', 'Aceptar', 'يقبل', 'Accepter', 'Accept', 'Accept', 'Accept', NULL, NULL, '接受'),
(45, 'accept', 'Accept', 'Aceptar', 'يقبل', 'Accepter', 'Accept', 'Accept', 'Accept', NULL, NULL, '接受'),
(46, 'accept', 'Accept', 'Aceptar', 'يقبل', 'Accepter', 'Accept', 'Accept', 'Accept', NULL, NULL, '接受'),
(47, 'accept', 'Accept', 'Aceptar', 'يقبل', 'Accepter', 'Accept', 'Accept', 'Accept', NULL, NULL, '接受'),
(48, 'accept', 'Accept', 'Aceptar', 'يقبل', 'Accepter', 'Accept', 'Accept', 'Accept', NULL, NULL, '接受'),
(49, 'home', 'Home', 'Inicio', 'بيت', 'Accueil', 'Home', 'Home', 'Home', NULL, NULL, '家'),
(50, 'the_page_you_requested_could_not_be_found', 'The page you requested could not be found', 'La página solicitada no pudo ser encontrada', 'الصفحة المطلوبة لا يمكن العثور عليه', 'La page demandée est introuvable', 'The page you requested could not be found', NULL, 'The page you requested could not be found', NULL, NULL, '您请求的页面无法找到'),
(51, 'the_page_you_requested_could_not_be_found', 'The page you requested could not be found', 'La página solicitada no pudo ser encontrada', 'الصفحة المطلوبة لا يمكن العثور عليه', 'La page demandée est introuvable', 'The page you requested could not be found', NULL, 'The page you requested could not be found', NULL, NULL, '您请求的页面无法找到'),
(52, 'the_page_you_requested_could_not_be_found', 'The page you requested could not be found', 'La página solicitada no pudo ser encontrada', 'الصفحة المطلوبة لا يمكن العثور عليه', 'La page demandée est introuvable', 'The page you requested could not be found', NULL, 'The page you requested could not be found', NULL, NULL, '您请求的页面无法找到'),
(53, 'check_the_spelling_of_the_url', 'Check the spelling of the url', 'Verifica la ortografía de la URL', 'تحقق من هجاء عنوان url', 'Vérifiez l\'orthographe de l\'URL', 'Check the spelling of the url', NULL, 'Check the spelling of the url', NULL, NULL, '检查 url 的拼写'),
(54, 'check_the_spelling_of_the_url', 'Check the spelling of the url', 'Verifica la ortografía de la URL', 'تحقق من هجاء عنوان url', 'Vérifiez l\'orthographe de l\'URL', 'Check the spelling of the url', NULL, 'Check the spelling of the url', NULL, NULL, '检查 url 的拼写'),
(55, 'check_the_spelling_of_the_url', 'Check the spelling of the url', 'Verifica la ortografía de la URL', 'تحقق من هجاء عنوان url', 'Vérifiez l\'orthographe de l\'URL', 'Check the spelling of the url', NULL, 'Check the spelling of the url', NULL, NULL, '检查 url 的拼写'),
(56, 'check_the_spelling_of_the_url', 'Check the spelling of the url', 'Verifica la ortografía de la URL', 'تحقق من هجاء عنوان url', 'Vérifiez l\'orthographe de l\'URL', 'Check the spelling of the url', NULL, 'Check the spelling of the url', NULL, NULL, '检查 url 的拼写'),
(57, 'if_you_are_still_puzzled,_click_on_the_home_link_below', 'If you are still puzzled, click on the home link below', 'Si aún estás confundido, haz clic en el enlace de inicio abajo', 'إذا كنت لا تزال في حيرة، انقر على الرابط الرئيسي أدناه', 'Si vous êtes toujours perplexe, cliquez sur le lien Accueil ci-dessous', 'If you are still puzzled, click on the home link below', NULL, 'If you are still puzzled, click on the home link below', NULL, NULL, NULL),
(58, 'if_you_are_still_puzzled,_click_on_the_home_link_below', 'If you are still puzzled, click on the home link below', 'Si aún estás confundido, haz clic en el enlace de inicio abajo', 'إذا كنت لا تزال في حيرة، انقر على الرابط الرئيسي أدناه', 'Si vous êtes toujours perplexe, cliquez sur le lien Accueil ci-dessous', 'If you are still puzzled, click on the home link below', NULL, 'If you are still puzzled, click on the home link below', NULL, NULL, NULL),
(59, 'if_you_are_still_puzzled,_click_on_the_home_link_below', 'If you are still puzzled, click on the home link below', 'Si aún estás confundido, haz clic en el enlace de inicio abajo', 'إذا كنت لا تزال في حيرة، انقر على الرابط الرئيسي أدناه', 'Si vous êtes toujours perplexe, cliquez sur le lien Accueil ci-dessous', 'If you are still puzzled, click on the home link below', NULL, 'If you are still puzzled, click on the home link below', NULL, NULL, NULL),
(60, 'if_you_are_still_puzzled,_click_on_the_home_link_below', 'If you are still puzzled, click on the home link below', 'Si aún estás confundido, haz clic en el enlace de inicio abajo', 'إذا كنت لا تزال في حيرة، انقر على الرابط الرئيسي أدناه', 'Si vous êtes toujours perplexe, cliquez sur le lien Accueil ci-dessous', 'If you are still puzzled, click on the home link below', NULL, 'If you are still puzzled, click on the home link below', NULL, NULL, NULL),
(61, 'if_you_are_still_puzzled,_click_on_the_home_link_below', 'If you are still puzzled, click on the home link below', 'Si aún estás confundido, haz clic en el enlace de inicio abajo', 'إذا كنت لا تزال في حيرة، انقر على الرابط الرئيسي أدناه', 'Si vous êtes toujours perplexe, cliquez sur le lien Accueil ci-dessous', 'If you are still puzzled, click on the home link below', NULL, 'If you are still puzzled, click on the home link below', NULL, NULL, NULL),
(62, 'if_you_are_still_puzzled,_click_on_the_home_link_below', 'If you are still puzzled, click on the home link below', 'Si aún estás confundido, haz clic en el enlace de inicio abajo', 'إذا كنت لا تزال في حيرة، انقر على الرابط الرئيسي أدناه', 'Si vous êtes toujours perplexe, cliquez sur le lien Accueil ci-dessous', 'If you are still puzzled, click on the home link below', NULL, 'If you are still puzzled, click on the home link below', NULL, NULL, NULL),
(63, 'back_to_home', 'Back to home', 'Volver al inicio', 'العودة إلى المنزل', 'Retour à l\'accueil', 'Back to home', NULL, 'Back to home', NULL, NULL, '回到家'),
(64, 'back_to_home', 'Back to home', 'Volver al inicio', 'العودة إلى المنزل', 'Retour à l\'accueil', 'Back to home', NULL, 'Back to home', NULL, NULL, '回到家'),
(65, 'back_to_home', 'Back to home', 'Volver al inicio', 'العودة إلى المنزل', 'Retour à l\'accueil', 'Back to home', NULL, 'Back to home', NULL, NULL, '回到家'),
(66, 'back_to_home', 'Back to home', 'Volver al inicio', 'العودة إلى المنزل', 'Retour à l\'accueil', 'Back to home', NULL, 'Back to home', NULL, NULL, '回到家'),
(67, 'back_to_home', 'Back to home', 'Volver al inicio', 'العودة إلى المنزل', 'Retour à l\'accueil', 'Back to home', NULL, 'Back to home', NULL, NULL, '回到家'),
(68, 'back_to_home', 'Back to home', 'Volver al inicio', 'العودة إلى المنزل', 'Retour à l\'accueil', 'Back to home', NULL, 'Back to home', NULL, NULL, '回到家'),
(69, 'top_categories', 'Top categories', 'Categorías principales', 'أهم الفئات', 'Catégories principales', 'Top categories', 'Top categories', 'Top categories', NULL, NULL, '热门类别'),
(70, 'useful_links', 'Useful links', 'Enlaces útiles', 'روابط مفيدة', 'Liens utiles', 'Useful links', 'Useful links', 'Useful links', NULL, NULL, '有用的链接'),
(71, 'useful_links', 'Useful links', 'Enlaces útiles', 'روابط مفيدة', 'Liens utiles', 'Useful links', 'Useful links', 'Useful links', NULL, NULL, '有用的链接'),
(72, 'useful_links', 'Useful links', 'Enlaces útiles', 'روابط مفيدة', 'Liens utiles', 'Useful links', 'Useful links', 'Useful links', NULL, NULL, '有用的链接'),
(73, 'useful_links', 'Useful links', 'Enlaces útiles', 'روابط مفيدة', 'Liens utiles', 'Useful links', 'Useful links', 'Useful links', NULL, NULL, '有用的链接'),
(74, 'useful_links', 'Useful links', 'Enlaces útiles', 'روابط مفيدة', 'Liens utiles', 'Useful links', 'Useful links', 'Useful links', NULL, NULL, '有用的链接'),
(75, 'useful_links', 'Useful links', 'Enlaces útiles', 'روابط مفيدة', 'Liens utiles', 'Useful links', 'Useful links', 'Useful links', NULL, NULL, '有用的链接'),
(76, 'become_an_instructor', 'Become an instructor', 'Conviértete en instructor', 'Become an instructor', 'Devenir instructeur', 'Become an instructor', 'Become an instructor', 'Become an instructor', NULL, NULL, 'Become an instructor'),
(77, 'become_an_instructor', 'Become an instructor', 'Conviértete en instructor', 'Become an instructor', 'Devenir instructeur', 'Become an instructor', 'Become an instructor', 'Become an instructor', NULL, NULL, 'Become an instructor'),
(78, 'become_an_instructor', 'Become an instructor', 'Conviértete en instructor', 'Become an instructor', 'Devenir instructeur', 'Become an instructor', 'Become an instructor', 'Become an instructor', NULL, NULL, 'Become an instructor'),
(79, 'become_an_instructor', 'Become an instructor', 'Conviértete en instructor', 'Become an instructor', 'Devenir instructeur', 'Become an instructor', 'Become an instructor', 'Become an instructor', NULL, NULL, 'Become an instructor'),
(80, 'blog', 'Blog', 'Blog', 'مدونة', 'Blog', 'Blog', 'Blog', 'Blog', 'Blog', NULL, '博客'),
(81, 'blog', 'Blog', 'Blog', 'مدونة', 'Blog', 'Blog', 'Blog', 'Blog', 'Blog', NULL, '博客'),
(82, 'blog', 'Blog', 'Blog', 'مدونة', 'Blog', 'Blog', 'Blog', 'Blog', 'Blog', NULL, '博客'),
(83, 'blog', 'Blog', 'Blog', 'مدونة', 'Blog', 'Blog', 'Blog', 'Blog', 'Blog', NULL, '博客'),
(84, 'blog', 'Blog', 'Blog', 'مدونة', 'Blog', 'Blog', 'Blog', 'Blog', 'Blog', NULL, '博客'),
(85, 'help', 'Help', 'Ayuda', 'يساعد', 'Aide', 'Help', 'Help', 'Help', NULL, NULL, '帮助'),
(86, 'help', 'Help', 'Ayuda', 'يساعد', 'Aide', 'Help', 'Help', 'Help', NULL, NULL, '帮助'),
(87, 'help', 'Help', 'Ayuda', 'يساعد', 'Aide', 'Help', 'Help', 'Help', NULL, NULL, '帮助'),
(88, 'help', 'Help', 'Ayuda', 'يساعد', 'Aide', 'Help', 'Help', 'Help', NULL, NULL, '帮助'),
(89, 'help', 'Help', 'Ayuda', 'يساعد', 'Aide', 'Help', 'Help', 'Help', NULL, NULL, '帮助'),
(90, 'help', 'Help', 'Ayuda', 'يساعد', 'Aide', 'Help', 'Help', 'Help', NULL, NULL, '帮助'),
(91, 'contact_us', 'Contact us', 'Contáctenos', 'اتصل بنا', 'Contactez-nous', 'Contact us', 'Contact us', 'Contact us', NULL, NULL, '联系我们'),
(92, 'contact_us', 'Contact us', 'Contáctenos', 'اتصل بنا', 'Contactez-nous', 'Contact us', 'Contact us', 'Contact us', NULL, NULL, '联系我们'),
(93, 'contact_us', 'Contact us', 'Contáctenos', 'اتصل بنا', 'Contactez-nous', 'Contact us', 'Contact us', 'Contact us', NULL, NULL, '联系我们'),
(94, 'contact_us', 'Contact us', 'Contáctenos', 'اتصل بنا', 'Contactez-nous', 'Contact us', 'Contact us', 'Contact us', NULL, NULL, '联系我们'),
(95, 'contact_us', 'Contact us', 'Contáctenos', 'اتصل بنا', 'Contactez-nous', 'Contact us', 'Contact us', 'Contact us', NULL, NULL, '联系我们'),
(96, 'contact_us', 'Contact us', 'Contáctenos', 'اتصل بنا', 'Contactez-nous', 'Contact us', 'Contact us', 'Contact us', NULL, NULL, '联系我们'),
(97, 'about_us', 'About us', 'Sobre nosotros', 'معلومات عنا', 'À propos de nous', 'About us', 'About us', 'About us', NULL, NULL, '关于我们'),
(98, 'about_us', 'About us', 'Sobre nosotros', 'معلومات عنا', 'À propos de nous', 'About us', 'About us', 'About us', NULL, NULL, '关于我们'),
(99, 'about_us', 'About us', 'Sobre nosotros', 'معلومات عنا', 'À propos de nous', 'About us', 'About us', 'About us', NULL, NULL, '关于我们'),
(100, 'about_us', 'About us', 'Sobre nosotros', 'معلومات عنا', 'À propos de nous', 'About us', 'About us', 'About us', NULL, NULL, '关于我们'),
(101, 'privacy_policy', 'Privacy policy', 'Política de privacidad', 'سياسة الخصوصية', 'Politique de confidentialité', 'Privacy policy', 'Privacy policy', 'Privacy policy', NULL, NULL, '隐私政策'),
(102, 'privacy_policy', 'Privacy policy', 'Política de privacidad', 'سياسة الخصوصية', 'Politique de confidentialité', 'Privacy policy', 'Privacy policy', 'Privacy policy', NULL, NULL, '隐私政策'),
(103, 'privacy_policy', 'Privacy policy', 'Política de privacidad', 'سياسة الخصوصية', 'Politique de confidentialité', 'Privacy policy', 'Privacy policy', 'Privacy policy', NULL, NULL, '隐私政策'),
(104, 'privacy_policy', 'Privacy policy', 'Política de privacidad', 'سياسة الخصوصية', 'Politique de confidentialité', 'Privacy policy', 'Privacy policy', 'Privacy policy', NULL, NULL, '隐私政策'),
(105, 'privacy_policy', 'Privacy policy', 'Política de privacidad', 'سياسة الخصوصية', 'Politique de confidentialité', 'Privacy policy', 'Privacy policy', 'Privacy policy', NULL, NULL, '隐私政策'),
(106, 'privacy_policy', 'Privacy policy', 'Política de privacidad', 'سياسة الخصوصية', 'Politique de confidentialité', 'Privacy policy', 'Privacy policy', 'Privacy policy', NULL, NULL, '隐私政策'),
(107, 'terms_and_condition', 'Terms and condition', 'Términos y condiciones', 'أحكام وشروط', 'Conditions générales', 'Terms and condition', 'Terms and condition', 'Terms and condition', NULL, NULL, '附带条约'),
(108, 'terms_and_condition', 'Terms and condition', 'Términos y condiciones', 'أحكام وشروط', 'Conditions générales', 'Terms and condition', 'Terms and condition', 'Terms and condition', NULL, NULL, '附带条约'),
(109, 'terms_and_condition', 'Terms and condition', 'Términos y condiciones', 'أحكام وشروط', 'Conditions générales', 'Terms and condition', 'Terms and condition', 'Terms and condition', NULL, NULL, '附带条约'),
(110, 'terms_and_condition', 'Terms and condition', 'Términos y condiciones', 'أحكام وشروط', 'Conditions générales', 'Terms and condition', 'Terms and condition', 'Terms and condition', NULL, NULL, '附带条约'),
(111, 'terms_and_condition', 'Terms and condition', 'Términos y condiciones', 'أحكام وشروط', 'Conditions générales', 'Terms and condition', 'Terms and condition', 'Terms and condition', NULL, NULL, '附带条约'),
(112, 'terms_and_condition', 'Terms and condition', 'Términos y condiciones', 'أحكام وشروط', 'Conditions générales', 'Terms and condition', 'Terms and condition', 'Terms and condition', NULL, NULL, '附带条约'),
(113, 'faq', 'Faq', 'Preguntas frecuentes', 'التعليمات', 'FAQ', 'Faq', 'Faq', 'Faq', NULL, NULL, '常问问题'),
(114, 'faq', 'Faq', 'Preguntas frecuentes', 'التعليمات', 'FAQ', 'Faq', 'Faq', 'Faq', NULL, NULL, '常问问题'),
(115, 'faq', 'Faq', 'Preguntas frecuentes', 'التعليمات', 'FAQ', 'Faq', 'Faq', 'Faq', NULL, NULL, '常问问题'),
(116, 'faq', 'Faq', 'Preguntas frecuentes', 'التعليمات', 'FAQ', 'Faq', 'Faq', 'Faq', NULL, NULL, '常问问题'),
(117, 'faq', 'Faq', 'Preguntas frecuentes', 'التعليمات', 'FAQ', 'Faq', 'Faq', 'Faq', NULL, NULL, '常问问题'),
(118, 'refund_policy', 'Refund policy', 'Política de reembolso', 'سياسة الاسترجاع', 'Politique de remboursement', 'Refund policy', 'Refund policy', 'Refund policy', NULL, NULL, '退款政策'),
(119, 'refund_policy', 'Refund policy', 'Política de reembolso', 'سياسة الاسترجاع', 'Politique de remboursement', 'Refund policy', 'Refund policy', 'Refund policy', NULL, NULL, '退款政策'),
(120, 'refund_policy', 'Refund policy', 'Política de reembolso', 'سياسة الاسترجاع', 'Politique de remboursement', 'Refund policy', 'Refund policy', 'Refund policy', NULL, NULL, '退款政策'),
(121, 'refund_policy', 'Refund policy', 'Política de reembolso', 'سياسة الاسترجاع', 'Politique de remboursement', 'Refund policy', 'Refund policy', 'Refund policy', NULL, NULL, '退款政策'),
(122, 'refund_policy', 'Refund policy', 'Política de reembolso', 'سياسة الاسترجاع', 'Politique de remboursement', 'Refund policy', 'Refund policy', 'Refund policy', NULL, NULL, '退款政策'),
(123, 'subscribe_to_our_newsletter', 'Subscribe to our newsletter', 'Suscríbete a nuestro boletín', 'اشترك في نشرتنا الإخبارية', 'Abonnez-vous à notre newsletter', 'Subscribe to our newsletter', 'Subscribe to our newsletter', 'Subscribe to our newsletter', NULL, NULL, '订阅我们的新闻'),
(124, 'subscribe_to_our_newsletter', 'Subscribe to our newsletter', 'Suscríbete a nuestro boletín', 'اشترك في نشرتنا الإخبارية', 'Abonnez-vous à notre newsletter', 'Subscribe to our newsletter', 'Subscribe to our newsletter', 'Subscribe to our newsletter', NULL, NULL, '订阅我们的新闻'),
(125, 'subscribe_to_our_newsletter', 'Subscribe to our newsletter', 'Suscríbete a nuestro boletín', 'اشترك في نشرتنا الإخبارية', 'Abonnez-vous à notre newsletter', 'Subscribe to our newsletter', 'Subscribe to our newsletter', 'Subscribe to our newsletter', NULL, NULL, '订阅我们的新闻'),
(126, 'subscribe_to_our_newsletter', 'Subscribe to our newsletter', 'Suscríbete a nuestro boletín', 'اشترك في نشرتنا الإخبارية', 'Abonnez-vous à notre newsletter', 'Subscribe to our newsletter', 'Subscribe to our newsletter', 'Subscribe to our newsletter', NULL, NULL, '订阅我们的新闻'),
(127, 'subscribe_to_our_newsletter', 'Subscribe to our newsletter', 'Suscríbete a nuestro boletín', 'اشترك في نشرتنا الإخبارية', 'Abonnez-vous à notre newsletter', 'Subscribe to our newsletter', 'Subscribe to our newsletter', 'Subscribe to our newsletter', NULL, NULL, '订阅我们的新闻'),
(128, 'subscribe_to_our_newsletter', 'Subscribe to our newsletter', 'Suscríbete a nuestro boletín', 'اشترك في نشرتنا الإخبارية', 'Abonnez-vous à notre newsletter', 'Subscribe to our newsletter', 'Subscribe to our newsletter', 'Subscribe to our newsletter', NULL, NULL, '订阅我们的新闻'),
(129, 'enter_your_email_address', 'Enter your email address', 'Introduce tu dirección de correo electrónico', 'أدخل عنوان بريدك الالكتروني', 'Entrez votre adresse e-mail', 'Enter your email address', 'Enter your email address', 'Enter your email address', NULL, NULL, '输入你的电子邮箱地址'),
(130, 'enter_your_email_address', 'Enter your email address', 'Introduce tu dirección de correo electrónico', 'أدخل عنوان بريدك الالكتروني', 'Entrez votre adresse e-mail', 'Enter your email address', 'Enter your email address', 'Enter your email address', NULL, NULL, '输入你的电子邮箱地址'),
(131, 'enter_your_email_address', 'Enter your email address', 'Introduce tu dirección de correo electrónico', 'أدخل عنوان بريدك الالكتروني', 'Entrez votre adresse e-mail', 'Enter your email address', 'Enter your email address', 'Enter your email address', NULL, NULL, '输入你的电子邮箱地址'),
(132, 'enter_your_email_address', 'Enter your email address', 'Introduce tu dirección de correo electrónico', 'أدخل عنوان بريدك الالكتروني', 'Entrez votre adresse e-mail', 'Enter your email address', 'Enter your email address', 'Enter your email address', NULL, NULL, '输入你的电子邮箱地址'),
(133, 'enter_your_email_address', 'Enter your email address', 'Introduce tu dirección de correo electrónico', 'أدخل عنوان بريدك الالكتروني', 'Entrez votre adresse e-mail', 'Enter your email address', 'Enter your email address', 'Enter your email address', NULL, NULL, '输入你的电子邮箱地址'),
(134, 'enter_your_email_address', 'Enter your email address', 'Introduce tu dirección de correo electrónico', 'أدخل عنوان بريدك الالكتروني', 'Entrez votre adresse e-mail', 'Enter your email address', 'Enter your email address', 'Enter your email address', NULL, NULL, '输入你的电子邮箱地址'),
(135, 'creativeitem', 'Creativeitem', 'Creativeitem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, 'creativeitem', 'Creativeitem', 'Creativeitem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 'creativeitem', 'Creativeitem', 'Creativeitem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 'creativeitem', 'Creativeitem', 'Creativeitem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 'creativeitem', 'Creativeitem', 'Creativeitem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 'are_you_sure', 'Are you sure', '¿Estás seguro?', 'هل أنت متأكد', 'Êtes-vous sûr', 'Are you sure', 'Are you sure', 'Are you sure', 'Are you sure', NULL, '你确定吗'),
(141, 'are_you_sure', 'Are you sure', '¿Estás seguro?', 'هل أنت متأكد', 'Êtes-vous sûr', 'Are you sure', 'Are you sure', 'Are you sure', 'Are you sure', NULL, '你确定吗'),
(142, 'yes', 'Yes', 'Sí', 'نعم', 'Oui', 'Yes', 'Yes', 'Yes', NULL, NULL, '是的'),
(143, 'yes', 'Yes', 'Sí', 'نعم', 'Oui', 'Yes', 'Yes', 'Yes', NULL, NULL, '是的'),
(144, 'yes', 'Yes', 'Sí', 'نعم', 'Oui', 'Yes', 'Yes', 'Yes', NULL, NULL, '是的'),
(145, 'no', 'No', 'No', 'لا', 'Non', 'No', 'No', 'No', NULL, NULL, '不'),
(146, 'no', 'No', 'No', 'لا', 'Non', 'No', 'No', 'No', NULL, NULL, '不'),
(147, 'no', 'No', 'No', 'لا', 'Non', 'No', 'No', 'No', NULL, NULL, '不'),
(148, 'no', 'No', 'No', 'لا', 'Non', 'No', 'No', 'No', NULL, NULL, '不'),
(149, 'log_in', 'Log in', 'Iniciar sesión', 'تسجيل الدخول', 'Connexion', 'Log in', NULL, 'Log in', NULL, NULL, '登录'),
(150, 'explore,_learn,_and_grow_with_us._enjoy_a_seamless_and_enriching_educational_journey._lets_begin!', 'Explore, learn, and grow with us. enjoy a seamless and enriching educational journey. lets begin!', 'Explora, aprende y crece con nosotros. Disfruta de un viaje educativo fluido y enriquecedor. ¡Comencemos!', 'Explore, learn, and grow with us. enjoy a seamless and enriching educational journey. lets begin!', 'Explorez, apprenez et grandissez avec nous. Profitez d\'un parcours éducatif sans faille et enrichissant. Commençons!', 'Explore, learn, and grow with us. enjoy a seamless and enriching educational journey. lets begin!', NULL, 'Explore, learn, and grow with us. enjoy a seamless and enriching educational journey. lets begin!', NULL, NULL, NULL),
(151, 'your_email', 'Your email', 'Tu correo electrónico', 'بريدك الالكتروني', 'Votre e-mail', 'Your email', NULL, 'Your email', NULL, NULL, 'Your email'),
(152, 'enter_your_email', 'Enter your email', 'Introduce tu correo electrónico', 'أدخل بريدك الإلكتروني', 'Entrez votre e-mail', 'Enter your email', NULL, 'Enter your email', NULL, NULL, 'Enter your email'),
(153, 'password', 'Password', 'Contraseña', 'كلمة المرور', 'Mot de passe', 'Password', NULL, 'Password', NULL, NULL, '密码'),
(154, 'enter_your_valid_password', 'Enter your valid password', 'Introduce tu contraseña válida', 'أدخل كلمة المرور الصالحة الخاصة بك', 'Entrez votre mot de passe valide', 'Enter your valid password', NULL, 'Enter your valid password', NULL, NULL, 'Enter your valid password'),
(155, 'forgot_password?', 'Forgot password?', '¿Olvidaste tu contraseña?', 'Forgot password?', 'Mot de passe oublié?', 'Forgot password?', NULL, 'Forgot password?', NULL, NULL, NULL),
(156, 'don`t_have_an_account?', 'Don`t have an account?', '¿No tienes una cuenta?', 'Don`t have an account?', 'Vous n\'avez pas de compte?', 'Don`t have an account?', NULL, 'Don`t have an account?', NULL, NULL, NULL),
(157, 'or', 'Or', 'O', 'أو', 'Ou', 'Or', NULL, 'Or', NULL, NULL, '或者'),
(158, 'welcome', 'Welcome', 'Bienvenido', 'مرحباً', 'Bienvenue', 'Welcome', 'Welcome', 'Welcome', 'Welcome', NULL, '欢迎'),
(159, 'dashboard', 'Dashboard', 'Tablero', 'لوحة القيادة', 'Tableau de bord', 'Dashboard', 'Dashboard', 'Dashboard', 'Dashboard', NULL, '仪表板'),
(160, 'quick_actions', 'Quick actions', 'Acciones rápidas', 'إجراءات سريعة', 'Actions rapides', 'Quick actions', 'Quick actions', 'Quick actions', 'Quick actions', NULL, '快速行动'),
(161, 'create_course', 'Create course', 'Crear curso', 'أنشئ دورة', 'Créer un cours', 'Create course', 'Create course', 'Create course', 'Create course', NULL, '创建课程'),
(162, 'add_course', 'Add course', 'Agregar curso', 'أضف دورة', 'Ajouter un cours', 'Add course', 'Add course', 'Add course', 'Add course', NULL, '添加课程'),
(163, 'add_new_lesson', 'Add new lesson', 'Agregar nueva lección', 'أضف درسًا جديدًا', 'Ajouter une nouvelle leçon', 'Add new lesson', 'Add new lesson', 'Add new lesson', 'Add new lesson', NULL, '添加新课程'),
(164, 'add_lesson', 'Add lesson', 'Agregar lección', 'أضف درسًا', 'Ajouter une leçon', 'Add lesson', 'Add lesson', 'Add lesson', 'Add lesson', NULL, '添加课程'),
(165, 'add_student', 'Add student', 'Agregar estudiante', 'أضف طالبًا', 'Ajouter un étudiant', 'Add student', 'Add student', 'Add student', 'Add student', NULL, '添加学生'),
(166, 'enrol_a_student', 'Enrol a student', 'Inscribir a un estudiante', 'انتسب طالب', 'Inscrire un étudiant', 'Enrol a student', 'Enrol a student', 'Enrol a student', 'Enrol a student', NULL, '招收一名学生'),
(167, 'enrol_student', 'Enrol student', 'Inscribir estudiante', 'تسجيل الطالب', 'Inscrire un étudiant', 'Enrol student', 'Enrol student', 'Enrol student', 'Enrol student', NULL, '招收学生'),
(168, 'help_center', 'Help center', 'Centro de ayuda', 'مركز المساعدة', 'Centre d\'aide', 'Help center', 'Help center', 'Help center', 'Help center', NULL, '帮助中心'),
(169, 'read_documentation', 'Read documentation', 'Leer documentación', 'اقرأ الوثائق', 'Lire la documentation', 'Read documentation', 'Read documentation', 'Read documentation', 'Read documentation', NULL, '阅读文档'),
(170, 'watch_video_tutorial', 'Watch video tutorial', 'Ver tutorial en video', 'شاهد فيديو تعليمي', 'Regarder le tutoriel vidéo', 'Watch video tutorial', 'Watch video tutorial', 'Watch video tutorial', 'Watch video tutorial', NULL, '观看视频教程'),
(171, 'get_customer_support', 'Get customer support', 'Obtener soporte al cliente', 'احصل على دعم العملاء', 'Obtenir de l\'assistance', 'Get customer support', 'Get customer support', 'Get customer support', 'Get customer support', NULL, '获得客户支持'),
(172, 'order_customization', 'Order customization', 'Ordenar personalización', 'طلب التخصيص', 'Personnalisation de la commande', 'Order customization', 'Order customization', 'Order customization', 'Order customization', NULL, '订单定制'),
(173, 'request_a_new_feature', 'Request a new feature', 'Solicitar una nueva función', 'اطلب ميزة جديدة', 'Demander une nouvelle fonctionnalité', 'Request a new feature', 'Request a new feature', 'Request a new feature', 'Request a new feature', NULL, '请求新功能'),
(174, 'browse_addons', 'Browse addons', 'Explorar complementos', 'تصفح الوظائف الإضافية', 'Parcourir les modules complémentaires', 'Browse addons', 'Browse addons', 'Browse addons', 'Browse addons', NULL, '浏览插件'),
(175, 'get_services', 'Get services', 'Obtener servicios', 'Get services', 'Obtenir des services', 'Get services', 'Get services', 'Get services', 'Get services', NULL, NULL),
(176, 'remove_all', 'Remove all', 'Eliminar todo', 'حذف الكل', 'Tout supprimer', 'Remove all', 'Remove all', 'Remove all', 'Remove all', NULL, '移除所有'),
(177, 'notification', 'Notification', 'Notificación', 'إشعار', 'Notification', 'Notification', 'Notification', 'Notification', 'Notification', NULL, '通知'),
(178, 'no_notification', 'No notification', 'Sin notificaciones', 'لا يوجد إشعارات', 'Aucune notification', 'No notification', 'No notification', 'No notification', 'No notification', NULL, '无通知'),
(179, 'stay_tuned!', 'Stay tuned!', '¡Mantente al tanto!', 'Stay tuned!', 'Restez à l\'écoute !', 'Stay tuned!', 'Stay tuned!', 'Stay tuned!', 'Stay tuned!', NULL, NULL),
(180, 'notifications_about_your_activity_will_show_up_here.', 'Notifications about your activity will show up here.', 'Las notificaciones sobre tu actividad aparecerán aquí.', 'Notifications about your activity will show up here.', 'Les notifications sur votre activité apparaîtront ici.', 'Notifications about your activity will show up here.', 'Notifications about your activity will show up here.', 'Notifications about your activity will show up here.', 'Notifications about your activity will show up here.', NULL, NULL),
(181, 'notification_settings', 'Notification settings', 'Configuración de notificaciones', 'إعدادات الإشعار', 'Paramètres de notification', 'Notification settings', 'Notification settings', 'Notification settings', 'Notification settings', NULL, '通知设置'),
(182, 'mark_all_as_read', 'Mark all as read', 'Marcar todo como leído', 'اشر عليها بانها قرات', 'Tout marquer comme lu', 'Mark all as read', 'Mark all as read', 'Mark all as read', 'Mark all as read', NULL, '标记为已读'),
(183, 'admin', 'Admin', 'Administrador', 'مسؤل', 'Administrateur', 'Admin', 'Admin', 'Admin', 'Admin', NULL, '行政'),
(184, 'my_account', 'My account', 'Mi cuenta', 'حسابي', 'Mon compte', 'My account', 'My account', 'My account', 'My account', NULL, '我的账户'),
(185, 'settings', 'Settings', 'Configuración', 'إعدادات', 'Paramètres', 'Settings', 'Settings', 'Settings', 'Settings', NULL, '设置'),
(186, 'logout', 'Logout', 'Cerrar sesión', 'تسجيل خروج', 'Déconnexion', 'Logout', 'Logout', 'Logout', 'Logout', NULL, '登出'),
(187, 'visit_website', 'Visit website', 'Visitar sitio web', 'زيارة الموقع', 'Visiter le site Web', 'Visit website', 'Visit website', 'Visit website', 'Visit website', NULL, '访问网站'),
(188, 'navigation', 'Navigation', 'Navegación', 'ملاحة', 'Navigation', 'Navigation', 'Navigation', 'Navigation', 'Navigation', NULL, '导航'),
(189, 'manage_courses', 'Manage courses', 'Gestionar cursos', 'إدارة الدورات', 'Gérer les cours', 'Manage courses', 'Manage courses', 'Manage courses', 'Manage courses', NULL, '管理课程'),
(190, 'add_new_course', 'Add new course', 'Agregar nuevo curso', 'إضافة دورة جديدة', 'Ajouter un nouveau cours', 'Add new course', 'Add new course', 'Add new course', 'Add new course', NULL, '添加新课程'),
(191, 'course_category', 'Course category', 'Categoría del curso', 'فئة الدورة', 'Catégorie de cours', 'Course category', 'Course category', 'Course category', 'Course category', NULL, '课程类别'),
(192, 'coupons', 'Coupons', 'Cupones', 'كوبونات', 'Coupons', 'Coupons', 'Coupons', 'Coupons', 'Coupons', NULL, '优惠券'),
(193, 'enrollments', 'Enrollments', 'Inscripciones', 'التسجيلات', 'Inscriptions', 'Enrollments', 'Enrollments', 'Enrollments', 'Enrollments', NULL, '入学人数'),
(194, 'course_enrollment', 'Course enrollment', 'Inscripción al curso', 'التسجيل في الدورة', 'Inscription au cours', 'Course enrollment', 'Course enrollment', 'Course enrollment', 'Course enrollment', NULL, '课程报名'),
(195, 'enrol_history', 'Enrol history', 'Historial de inscripciones', 'سجل التسجيل', 'Historique des inscriptions', 'Enrol history', 'Enrol history', 'Enrol history', 'Enrol history', NULL, '报名历史'),
(196, 'report', 'Report', 'Informe', 'تقرير', 'Rapport', 'Report', 'Report', 'Report', 'Report', NULL, '报告'),
(197, 'admin_revenue', 'Admin revenue', 'Ingresos del administrador', 'الإيرادات الإدارية', 'Revenus administratifs', 'Admin revenue', 'Admin revenue', 'Admin revenue', 'Admin revenue', NULL, '管理收入'),
(198, 'instructor_revenue', 'Instructor revenue', 'Ingresos del instructor', 'إيرادات المدرب', 'Revenus des instructeurs', 'Instructor revenue', 'Instructor revenue', 'Instructor revenue', 'Instructor revenue', NULL, '教练收入'),
(199, 'purchase_history', 'Purchase history', 'Historial de compras', 'تاريخ شراء', 'Historique des achats', 'Purchase history', 'Purchase history', 'Purchase history', 'Purchase history', NULL, '购买记录'),
(200, 'users', 'Users', 'Usuarios', 'المستخدمون', 'Utilisateurs', 'Users', 'Users', 'Users', 'Users', NULL, '用户'),
(201, 'admins', 'Admins', 'Administradores', 'المشرفون', 'Administrateurs', 'Admins', 'Admins', 'Admins', 'Admins', NULL, '管理员'),
(202, 'manage_admins', 'Manage admins', 'Gestionar administradores', 'إدارة المسؤولين', 'Gérer les administrateurs', 'Manage admins', 'Manage admins', 'Manage admins', 'Manage admins', NULL, '管理管理员'),
(203, 'add_new_admin', 'Add new admin', 'Agregar nuevo administrador', 'إضافة مسؤول جديد', 'Ajouter un nouvel administrateur', 'Add new admin', 'Add new admin', 'Add new admin', 'Add new admin', NULL, '添加新管理员'),
(204, 'instructors', 'Instructors', 'Instructores', 'المدربين', 'Instructeurs', 'Instructors', 'Instructors', 'Instructors', 'Instructors', NULL, '导师'),
(205, 'manage_instructors', 'Manage instructors', 'Gestionar instructores', 'إدارة المدربين', 'Gérer les instructeurs', 'Manage instructors', 'Manage instructors', 'Manage instructors', 'Manage instructors', NULL, '管理导师'),
(206, 'add_new_instructor', 'Add new instructor', 'Agregar nuevo instructor', 'أضف مدرسًا جديدًا', 'Ajouter un nouvel instructeur', 'Add new instructor', 'Add new instructor', 'Add new instructor', 'Add new instructor', NULL, '添加新导师'),
(207, 'instructor_payout', 'Instructor payout', 'Pago del instructor', 'دفع تعويضات المدرب', 'Paiement de l\'instructeur', 'Instructor payout', 'Instructor payout', 'Instructor payout', 'Instructor payout', NULL, '教练报酬'),
(208, 'instructor_settings', 'Instructor settings', 'Configuración del instructor', 'إعدادات المدرب', 'Paramètres de l\'instructeur', 'Instructor settings', 'Instructor settings', 'Instructor settings', 'Instructor settings', NULL, '导师设置'),
(209, 'applications', 'Applications', 'Aplicaciones', 'التطبيقات', 'Applications', 'Applications', 'Applications', 'Applications', 'Applications', NULL, '应用领域'),
(210, 'students', 'Students', 'Estudiantes', 'طلاب', 'Étudiants', 'Students', 'Students', 'Students', 'Students', NULL, '学生'),
(211, 'manage_students', 'Manage students', 'Gestionar estudiantes', 'إدارة الطلاب', 'Gérer les étudiants', 'Manage students', 'Manage students', 'Manage students', 'Manage students', NULL, '管理学生'),
(212, 'add_new_student', 'Add new student', 'Agregar nuevo estudiante', 'أضف طالبًا جديدًا', 'Ajouter un nouvel étudiant', 'Add new student', 'Add new student', 'Add new student', 'Add new student', NULL, '添加新学生'),
(213, 'message', 'Message', 'Mensaje', 'رسالة', 'Message', 'Message', 'Message', 'Message', 'Message', NULL, '信息'),
(214, 'newsletter', 'Newsletter', 'Boletín', 'النشرة الإخبارية', 'Bulletin', 'Newsletter', 'Newsletter', 'Newsletter', 'Newsletter', NULL, '通讯'),
(215, 'all_newsletter', 'All newsletter', 'Todo el boletín', 'كل النشرة الإخبارية', 'Tous les bulletins', 'All newsletter', 'All newsletter', 'All newsletter', 'All newsletter', NULL, '所有时事通讯'),
(216, 'subscribed_user', 'Subscribed user', 'Usuario suscrito', 'مستخدم مشترك', 'Utilisateur abonné', 'Subscribed user', 'Subscribed user', 'Subscribed user', 'Subscribed user', NULL, '订阅用户'),
(217, 'contact', 'Contact', 'Contacto', 'اتصال', 'Contact', 'Contact', 'Contact', 'Contact', 'Contact', NULL, NULL),
(218, 'all_blogs', 'All blogs', 'Todos los blogs', 'كل المدونات', 'Tous les blogs', 'All blogs', 'All blogs', 'All blogs', 'All blogs', NULL, '所有博客'),
(219, 'pending_blog', 'Pending blog', 'Blog pendiente', 'مدونة معلقة', 'Blog en attente', 'Pending blog', 'Pending blog', 'Pending blog', 'Pending blog', NULL, '待定博客'),
(220, 'blog_category', 'Blog category', 'Categoría del blog', 'فئة المدونة', 'Catégorie Blog', 'Blog category', 'Blog category', 'Blog category', 'Blog category', NULL, '博客类别'),
(221, 'blog_settings', 'Blog settings', 'Configuración del blog', 'إعدادات بلوق', 'Paramètres du blog', 'Blog settings', 'Blog settings', 'Blog settings', 'Blog settings', NULL, '博客设置'),
(222, 'addons', 'Addons', 'Complementos', 'الإضافات', 'Compléments', 'Addons', 'Addons', 'Addons', 'Addons', NULL, '插件'),
(223, 'themes', 'Themes', 'Temas', 'ثيمات', 'Thèmes', 'Themes', 'Themes', 'Themes', 'Themes', NULL, '主题'),
(224, 'system_settings', 'System settings', 'Configuración del sistema', 'اعدادات النظام', 'Paramètres du système', 'System settings', 'System settings', 'System settings', 'System settings', NULL, '系统设置'),
(225, 'website_settings', 'Website settings', 'Configuración del sitio web', 'إعدادات موقع الويب', 'Paramètres du site Web', 'Website settings', 'Website settings', 'Website settings', 'Website settings', NULL, '网站设置'),
(226, 'academy_cloud', 'Academy cloud', 'Academy cloud', 'سحابة الأكاديمية', 'Académie Cloud', 'Academy cloud', 'Academy cloud', 'Academy cloud', 'Academy cloud', NULL, '学院云'),
(227, 'drip_content_settings', 'Drip content settings', 'Configuración de contenido por goteo', 'إعدادات محتوى التنقيط', 'Paramètres du contenu goutte à goutte', 'Drip content settings', 'Drip content settings', 'Drip content settings', 'Drip content settings', NULL, '滴灌内容设置'),
(228, 'wasabi_storage_settings', 'Wasabi storage settings', 'Configuración de almacenamiento Wasabi', 'Wasabi storage settings', 'Paramètres de stockage Wasabi', 'Wasabi storage settings', 'Wasabi storage settings', 'Wasabi storage settings', 'Wasabi storage settings', NULL, NULL),
(229, 'bbb_live_class_settings', 'Bbb live class settings', 'Configuración de clase en vivo BBB', 'إعدادات الفصل المباشر لـ Bbb', 'Paramètres des cours en direct BBB', 'Bbb live class settings', 'Bbb live class settings', 'Bbb live class settings', 'Bbb live class settings', NULL, NULL),
(230, 'payment_settings', 'Payment settings', 'Configuración de pago', 'إعدادات الدفع', 'Paramètres de paiement', 'Payment settings', 'Payment settings', 'Payment settings', 'Payment settings', NULL, '付款设置'),
(231, 'language_settings', 'Language settings', 'Configuración de idioma', 'اعدادات اللغة', 'Paramètres de langue', 'Language settings', 'Language settings', 'Language settings', 'Language settings', NULL, '语言设定'),
(232, 'social_login', 'Social login', 'Inicio de sesión social', 'تسجيل الدخول الاجتماعي', 'Connexion sociale', 'Social login', 'Social login', 'Social login', 'Social login', NULL, '社交登录'),
(233, 'custom_page_builder', 'Custom page builder', 'Constructor de páginas personalizado', 'منشئ الصفحة المخصص', 'Créateur de pages personnalisées', 'Custom page builder', 'Custom page builder', 'Custom page builder', 'Custom page builder', NULL, '自定义页面构建器'),
(234, 'data_center', 'Data center', 'Centro de datos', 'مركز البيانات', 'Centre de données', 'Data center', 'Data center', 'Data center', 'Data center', NULL, '数据中心'),
(235, 'about', 'About', 'Acerca de', 'عن', 'À propos', 'About', 'About', 'About', 'About', NULL, '关于'),
(236, 'manage_profile', 'Manage profile', 'Gestionar perfil', 'إدارة الملف الشخصى', 'Gérer le profil', 'Manage profile', 'Manage profile', 'Manage profile', 'Manage profile', NULL, '管理个人资料'),
(237, 'admin_revenue_this_year', 'Admin revenue this year', 'Ingresos del administrador este año', 'الايرادات الادارية هذا العام', 'Revenus administratifs cette année', NULL, 'Admin revenue this year', NULL, NULL, NULL, '今年管理收入'),
(238, 'number_courses', 'Number courses', 'Número de cursos', 'عدد الدورات', 'Nombre de cours', NULL, 'Number courses', NULL, NULL, NULL, '课程数量'),
(239, 'number_of_lessons', 'Number of lessons', 'Número de lecciones', 'عدد الدروس', 'Nombre de leçons', NULL, 'Number of lessons', NULL, NULL, NULL, '课时数'),
(240, 'number_of_enrolment', 'Number of enrolment', 'Número de inscripciones', 'عدد المسجلين', 'Nombre d\'inscriptions', NULL, 'Number of enrolment', NULL, NULL, NULL, '招生人数'),
(241, 'number_of_student', 'Number of student', 'Número de estudiantes', 'عدد الطلاب', 'Nombre d\'étudiants', NULL, 'Number of student', NULL, NULL, NULL, '学生人数'),
(242, 'course_overview', 'Course overview', 'Descripción del curso', 'نظرة عامة على الدورة', 'Aperçu du cours', NULL, 'Course overview', NULL, NULL, NULL, '课程大纲'),
(243, 'active_courses', 'Active courses', 'Cursos activos', 'دورات نشطة', 'Cours actifs', NULL, 'Active courses', NULL, NULL, NULL, '活跃课程'),
(244, 'pending_courses', 'Pending courses', 'Cursos pendientes', 'الدورات المعلقة', 'Cours en attente', NULL, 'Pending courses', NULL, NULL, NULL, '待定课程'),
(245, 'requested_withdrawal', 'Requested withdrawal', 'Retiro solicitado', 'طلب سحب', 'Retrait demandé', NULL, 'Requested withdrawal', NULL, NULL, NULL, '请求提款'),
(246, 'january', 'January', 'Enero', 'يناير', 'Janvier', 'January', 'January', 'January', 'January', NULL, '一月'),
(247, 'february', 'February', 'Febrero', 'شهر فبراير', 'Février', 'February', 'February', 'February', 'February', NULL, '二月'),
(248, 'march', 'March', 'Marzo', 'يمشي', 'Mars', 'March', 'March', 'March', 'March', NULL, '行进'),
(249, 'april', 'April', 'Abril', 'أبريل', 'Avril', 'April', 'April', 'April', 'April', NULL, '四月'),
(250, 'may', 'May', 'Mayo', 'يمكن', 'Mai', 'May', 'May', 'May', 'May', NULL, '可能'),
(251, 'june', 'June', 'Junio', 'يونيو', 'Juin', 'June', 'June', 'June', 'June', NULL, '六月'),
(252, 'july', 'July', 'Julio', 'يوليو', 'Juillet', 'July', 'July', 'July', 'July', NULL, '七月'),
(253, 'august', 'August', 'Agosto', 'أغسطس', 'Août', 'August', 'August', 'August', 'August', NULL, '八月'),
(254, 'september', 'September', 'Septiembre', 'سبتمبر', 'Septembre', 'September', 'September', 'September', 'September', NULL, '九月'),
(255, 'october', 'October', 'Octubre', 'اكتوبر', 'Octobre', 'October', 'October', 'October', 'October', NULL, '十月'),
(256, 'november', 'November', 'Noviembre', 'شهر نوفمبر', 'Novembre', 'November', 'November', 'November', 'November', NULL, '十一月'),
(257, 'december', 'December', 'Diciembre', 'ديسمبر', 'Décembre', 'December', 'December', 'December', 'December', NULL, '十二月'),
(258, 'this_year', 'This year', 'Este año', 'هذا العام', 'Cette année', 'This year', 'This year', 'This year', 'This year', NULL, '今年'),
(259, 'active_course', 'Active course', 'Curso activo', 'دورة نشطة', 'Cours actif', 'Active course', 'Active course', 'Active course', 'Active course', NULL, '活跃课程'),
(260, 'pending_course', 'Pending course', 'Curso pendiente', 'دورة معلقة', 'Cours en attente', 'Pending course', 'Pending course', 'Pending course', 'Pending course', NULL, '待定课程'),
(261, 'heads_up', 'Heads up', 'Aviso', 'انتباه', 'Attention', 'Heads up', 'Heads up', 'Heads up', 'Heads up', NULL, '小心'),
(262, 'congratulations', 'Congratulations', '¡Felicidades!', 'تهانينا', 'Félicitations', 'Congratulations', 'Congratulations', 'Congratulations', 'Congratulations', NULL, '恭喜你'),
(263, 'oh_snap', 'Oh snap', 'Oh, vaya', 'أوه المفاجئة', 'Oh zut', 'Oh snap', 'Oh snap', 'Oh snap', 'Oh snap', NULL, '哦，快点'),
(264, 'please_fill_all_the_required_fields', 'Please fill all the required fields', 'Por favor, completa todos los campos requeridos', 'يرجى ملء جميع الحقول المطلوبة', 'Veuillez remplir tous les champs obligatoires', 'Please fill all the required fields', 'Please fill all the required fields', 'Please fill all the required fields', 'Please fill all the required fields', NULL, '请填写所有必填字段'),
(265, 'close', 'Close', 'Cerrar', 'يغلق', 'Fermer', 'Close', 'Close', 'Close', 'Close', NULL, '关闭'),
(266, 'cancel', 'Cancel', 'Cancelar', 'يلغي', 'Annuler', 'Cancel', 'Cancel', 'Cancel', 'Cancel', NULL, '取消'),
(267, 'continue', 'Continue', 'Continuar', 'يكمل', 'Continuer', 'Continue', 'Continue', 'Continue', 'Continue', NULL, '继续'),
(268, 'ok', 'Ok', 'Ok', 'نعم', 'D\'accord', 'Ok', 'Ok', 'Ok', 'Ok', NULL, '好的'),
(269, 'success', 'Success', 'Éxito', 'نجاح', 'Succès', 'Success', 'Success', 'Success', 'Success', NULL, '成功'),
(270, 'your_server_does_not_allow_uploading_files_that_large.', 'Your server does not allow uploading files that large.', 'Tu servidor no permite subir archivos tan grandes.', 'Your server does not allow uploading files that large.', 'Votre serveur ne permet pas de télécharger des fichiers aussi volumineux.', 'Your server does not allow uploading files that large.', 'Your server does not allow uploading files that large.', 'Your server does not allow uploading files that large.', 'Your server does not allow uploading files that large.', NULL, NULL),
(271, 'your_servers_file_upload_limit_is_40mb', 'Your servers file upload limit is 40mb', 'El límite de carga de archivos de tu servidor es 40 MB', 'Your servers file upload limit is 40mb', 'La limite de téléchargement de fichiers de votre serveur est de 40 Mo', 'Your servers file upload limit is 40mb', 'Your servers file upload limit is 40mb', 'Your servers file upload limit is 40mb', 'Your servers file upload limit is 40mb', NULL, NULL),
(272, 'successfully', 'Successfully', 'Exitosamente', 'بنجاح', 'Avec succès', 'Successfully', 'Successfully', 'Successfully', 'Successfully', NULL, '成功地'),
(273, 'div_added_to_bottom_', 'Div added to bottom ', 'Div agregado al final', 'تمت إضافة Div إلى الأسفل', 'Div ajouté en bas', 'Div added to bottom ', 'Div added to bottom ', 'Div added to bottom ', 'Div added to bottom ', NULL, 'Div 添加到底部'),
(274, 'div_has_been_deleted_', 'Div has been deleted ', 'Div ha sido eliminado', 'تم حذف Div', 'Div a été supprimé', 'Div has been deleted ', 'Div has been deleted ', 'Div has been deleted ', 'Div has been deleted ', NULL, 'Div已被删除'),
(275, 'not_found', 'Not found', 'No encontrado', 'غير معثور عليه', 'Non trouvé', NULL, NULL, NULL, NULL, NULL, '未找到'),
(276, 'about_this_application', 'About this application', 'Sobre esta aplicación', 'حول هذا التطبيق', 'À propos de cette application', NULL, NULL, NULL, NULL, NULL, '关于此应用程序'),
(277, 'software_version', 'Software version', 'Versión del software', 'إصدار البرنامج', 'Version du logiciel', NULL, NULL, NULL, NULL, NULL, '软件版本'),
(278, 'check_update', 'Check update', 'Verificar actualización', 'اختر التحديث', 'Vérifier les mises à jour', NULL, NULL, NULL, NULL, NULL, '检查更新'),
(279, 'php_version', 'Php version', 'Versión de PHP', 'نسخة php', 'Version PHP', NULL, NULL, NULL, NULL, NULL, 'php版本');
INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `spanish`, `arabic`, `french`, `georgian`, `german`, `hindi`, `indonesia`, `italian`, `chinese`) VALUES
(280, 'curl_enable', 'Curl enable', 'Curl habilitado', 'حليقة تمكين', 'Activer cURL', NULL, NULL, NULL, NULL, NULL, '卷曲启用'),
(281, 'enabled', 'Enabled', 'Habilitado', 'ممكن', 'Activé', NULL, NULL, NULL, NULL, NULL, '启用'),
(282, 'purchase_code', 'Purchase code', 'Código de compra', 'كود شراء', 'Code d\'achat', NULL, NULL, NULL, NULL, NULL, '购买代码'),
(283, 'product_license', 'Product license', 'Licencia del producto', 'ترخيص المنتج', 'Licence du produit', NULL, NULL, NULL, NULL, NULL, '产品许可证'),
(284, 'invalid', 'Invalid', 'Inválido', 'غير صالح', 'Invalide', NULL, NULL, NULL, NULL, NULL, '无效的'),
(285, 'enter_valid_purchase_code', 'Enter valid purchase code', 'Introduce un código de compra válido', 'أدخل رمز شراء صالحًا', 'Entrez un code d\'achat valide', NULL, NULL, NULL, NULL, NULL, '输入有效的购买代码'),
(286, 'customer_support_status', 'Customer support status', 'Estado del soporte al cliente', 'حالة دعم العملاء', 'Statut de l\'assistance client', NULL, NULL, NULL, NULL, NULL, '客户支持状态'),
(287, 'support_expiry_date', 'Support expiry date', 'Fecha de vencimiento del soporte', 'تاريخ انتهاء الدعم', 'Date d\'expiration de l\'assistance', NULL, NULL, NULL, NULL, NULL, '支持有效期'),
(288, 'customer_name', 'Customer name', 'Nombre del cliente', 'اسم الزبون', 'Nom du client', NULL, NULL, NULL, NULL, NULL, '顾客姓名'),
(289, 'customer_support', 'Customer support', 'Soporte al cliente', 'دعم العملاء', 'Support client', NULL, NULL, NULL, NULL, NULL, '客户支持'),
(290, 'our_premium_services', 'Our premium services', 'Nuestros servicios premium', NULL, 'Nos services premium', NULL, NULL, NULL, NULL, NULL, NULL),
(291, 'website_name', 'Website name', 'Nombre del sitio web', 'اسم الموقع', 'Nom du site Web', NULL, NULL, NULL, NULL, NULL, '网站名称'),
(292, 'website_title', 'Website title', 'Título del sitio web', 'عنوان الموقع', 'Titre du site Web', NULL, NULL, NULL, NULL, NULL, '网站标题'),
(293, 'website_keywords', 'Website keywords', 'Palabras clave del sitio web', 'كلمات الموقع', 'Mots-clés du site Web', NULL, NULL, NULL, NULL, NULL, '网站关键词'),
(294, 'website_description', 'Website description', 'Descripción del sitio web', 'وصف الموقع', 'Description du site Web', NULL, NULL, NULL, NULL, NULL, '网站说明'),
(295, 'author', 'Author', 'Autor', 'مؤلف', 'Auteur', NULL, NULL, NULL, NULL, NULL, '作者'),
(296, 'slogan', 'Slogan', 'Eslogan', 'شعار', 'Slogan', NULL, NULL, NULL, NULL, NULL, '口号'),
(297, 'system_email', 'System email', 'Correo electrónico del sistema', 'البريد الإلكتروني للنظام', 'E-mail système', NULL, NULL, NULL, NULL, NULL, '系统邮箱'),
(298, 'address', 'Address', 'Dirección', 'عنوان', 'Adresse', NULL, NULL, NULL, NULL, NULL, '地址'),
(299, 'phone', 'Phone', 'Teléfono', 'هاتف', 'Téléphone', NULL, NULL, NULL, NULL, NULL, '电话'),
(300, 'youtube_api_key', 'Youtube api key', 'Clave API de Youtube', 'مفتاح Youtube api', 'Clé API YouTube', NULL, NULL, NULL, NULL, NULL, 'YouTube API 密钥'),
(301, 'get_youtube_api_key', 'Get youtube api key', 'Obtener clave API de Youtube', 'احصل على مفتاح youtube api', 'Obtenez la clé API YouTube', NULL, NULL, NULL, NULL, NULL, '获取 YouTube api 密钥'),
(302, 'if_you_want_to_use_google_drive_video,_you_need_to_enable_the_google_drive_service_in_this_api', 'If you want to use google drive video, you need to enable the google drive service in this api', 'Si desea utilizar videos de Google Drive, debe habilitar el servicio de Google Drive en esta API', NULL, 'Si vous souhaitez utiliser la vidéo Google Drive, vous devez activer le service Google Drive dans cette API.', NULL, NULL, NULL, NULL, NULL, NULL),
(303, 'vimeo_api_key', 'Vimeo api key', 'Clave API de Vimeo', 'مفتاح Vimeo api', 'Clé API Vimeo', NULL, NULL, NULL, NULL, NULL, 'Vimeo API 密钥'),
(304, 'get_vimeo_api_key', 'Get vimeo api key', 'Obtener clave API de Vimeo', 'الحصول على مفتاح vimeo api', 'Obtenez la clé API Vimeo', NULL, NULL, NULL, NULL, NULL, '获取 vimeo api 密钥'),
(305, 'system_language', 'System language', 'Idioma del sistema', 'لغة النظام', 'Langue du système', NULL, NULL, NULL, NULL, NULL, '系统语言'),
(306, 'student_email_verification', 'Student email verification', 'Verificación de correo electrónico del estudiante', 'التحقق من البريد الإلكتروني للطالب', 'Vérification de l\'adresse e-mail de l\'étudiant', NULL, NULL, NULL, NULL, NULL, '学生邮箱验证'),
(307, 'enable', 'Enable', 'Habilitar', 'يُمكَِن', 'Activer', NULL, NULL, NULL, NULL, NULL, '使能够'),
(308, 'disable', 'Disable', 'Deshabilitar', 'إبطال', 'Désactiver', NULL, NULL, NULL, NULL, NULL, '禁用'),
(309, 'course_accessibility', 'Course accessibility', 'Accesibilidad del curso', 'إمكانية الوصول إلى الدورة التدريبية', 'Accessibilité des cours', NULL, NULL, NULL, NULL, NULL, '课程无障碍'),
(310, 'publicly', 'Publicly', 'Públicamente', 'علانية', 'Publiquement', NULL, NULL, NULL, NULL, NULL, '公开'),
(311, 'only_logged_in_users', 'Only logged in users', 'Solo usuarios registrados', 'فقط المستخدمين المسجلين', 'Seulement les utilisateurs connectés', NULL, NULL, NULL, NULL, NULL, '仅登录用户'),
(312, 'number_of_authorized_devices', 'Number of authorized devices', 'Número de dispositivos autorizados', 'عدد الأجهزة المصرح بها', 'Nombre d\'appareils autorisés', NULL, NULL, NULL, NULL, NULL, '授权设备数量'),
(313, 'how_many_devices_do_you_want_to_allow_for_logging_in_using_a_single_account', 'How many devices do you want to allow for logging in using a single account', '¿Cuántos dispositivos desea permitir para iniciar sesión con una sola cuenta?', 'كم عدد الأجهزة التي تريد السماح لها بتسجيل الدخول باستخدام حساب واحد', 'Combien d\'appareils souhaitez-vous autoriser pour se connecter avec un seul compte ?', NULL, NULL, NULL, NULL, NULL, '您希望允许多少台设备使用单个帐户登录'),
(314, 'course_selling_tax', 'Course selling tax', 'Impuesto sobre la venta de cursos', 'ضريبة بيع الدورة', 'Taxe de vente de cours', NULL, NULL, NULL, NULL, NULL, '课程销售税'),
(315, 'enter_0_if_you_want_to_disable_the_tax_option', 'Enter 0 if you want to disable the tax option', 'Ingrese 0 si desea deshabilitar la opción de impuestos', 'أدخل 0 إذا كنت تريد تعطيل خيار الضريبة', 'Entrez 0 si vous souhaitez désactiver l\'option de taxe', NULL, NULL, NULL, NULL, NULL, '如果您想禁用税收选项，请输入 0'),
(316, 'google_analytics_id', 'Google analytics id', 'ID de Google Analytics', 'معرف Google Analytics', 'Identifiant Google Analytics', NULL, NULL, NULL, NULL, NULL, '谷歌分析 ID'),
(317, 'keep_it_blank_if_you_want_to_disable_it', 'Keep it blank if you want to disable it', 'Déjelo en blanco si desea deshabilitarlo', 'اتركه فارغًا إذا كنت تريد تعطيله', 'Laissez-le vide si vous souhaitez le désactiver', NULL, NULL, NULL, NULL, NULL, '如果您想禁用它，请将其保留为空'),
(318, 'meta_pixel_id', 'Meta pixel id', 'ID de Meta Pixel', 'معرف بكسل ميتا', 'ID Meta Pixel', NULL, NULL, NULL, NULL, NULL, '元像素 ID'),
(319, 'footer_text', 'Footer text', 'Texto de pie de página', 'نص التذييل', 'Texte de pied de page', NULL, NULL, NULL, NULL, NULL, '页脚文本'),
(320, 'footer_link', 'Footer link', 'Enlace de pie de página', 'رابط التذييل', 'Lien de pied de page', NULL, NULL, NULL, NULL, NULL, '页脚链接'),
(321, 'timezone', 'Timezone', 'Zona horaria', NULL, 'Fuseau horaire', NULL, NULL, NULL, NULL, NULL, NULL),
(322, 'can_students_disable_their_own_accounts?', 'Can students disable their own accounts?', '¿Pueden los estudiantes deshabilitar sus propias cuentas?', NULL, 'Les étudiants peuvent-ils désactiver leurs propres comptes ?', NULL, NULL, NULL, NULL, NULL, NULL),
(323, 'save', 'Save', 'Guardar', 'يحفظ', 'Enregistrer', NULL, 'Save', NULL, NULL, NULL, '节省'),
(324, 'update_product', 'Update product', 'Actualizar producto', 'تحديث المنتج', 'Mettre à jour le produit', NULL, NULL, NULL, NULL, NULL, '更新产品'),
(325, 'file', 'File', 'Archivo', 'ملف', 'Fichier', NULL, NULL, NULL, NULL, NULL, '文件'),
(326, 'update', 'Update', 'Actualizar', 'تحديث', 'Mettre à jour', NULL, NULL, NULL, NULL, NULL, '更新'),
(327, 'product_updated_successfully', 'Product updated successfully', 'Producto actualizado con éxito', 'تم تحديث المنتج بنجاح', 'Produit mis à jour avec succès', NULL, NULL, NULL, NULL, NULL, '产品更新成功'),
(328, 'administration', 'Administration', 'Administración', 'إدارة', 'Administration', 'Administration', 'Administration', 'Administration', NULL, NULL, '行政'),
(329, 'log_out', 'Log out', 'Cerrar sesión', 'تسجيل خروج', 'Déconnexion', 'Log out', 'Log out', 'Log out', NULL, NULL, '登出'),
(330, 'start_learning_from_best_platform', 'Start learning from best platform', 'Comienza a aprender desde la mejor plataforma', 'ابدأ التعلم من أفضل منصة', 'Commencez à apprendre sur la meilleure plateforme', NULL, NULL, NULL, NULL, NULL, 'Start learning from best platform'),
(331, 'study_any_topic,_anytime._explore_thousands_of_courses_for_the_lowest_price_ever!', 'Study any topic, anytime. explore thousands of courses for the lowest price ever!', 'Estudia cualquier tema, en cualquier momento. ¡Explora miles de cursos al precio más bajo de la historia!', 'Study any topic, anytime. explore thousands of courses for the lowest price ever!', 'Étudiez n\'importe quel sujet, à tout moment. Explorez des milliers de cours au prix le plus bas jamais vu !', NULL, NULL, NULL, NULL, NULL, NULL),
(332, 'what_do_you_want_to_learn', 'What do you want to learn', '¿Qué quieres aprender?', 'ماذا تريد أن تتعلم', 'Que voulez-vous apprendre', 'What do you want to learn', 'What do you want to learn', NULL, NULL, NULL, '你想学些什么'),
(333, 'expert_instruction', 'Expert instruction', 'Instrucción experta', 'تعليمات الخبراء', 'Instructions d\'experts', 'Expert instruction', 'Expert instruction', NULL, NULL, NULL, '专家指导'),
(334, 'find_the_right_course_for_you', 'Find the right course for you', 'Encuentra el curso adecuado para ti', 'ابحث عن الدورة المناسبة لك', 'Trouvez le cours qui vous convient', 'Find the right course for you', 'Find the right course for you', NULL, NULL, NULL, '找到适合您的课程'),
(335, 'online_courses', 'Online courses', 'Cursos en línea', 'دروس مباشرة على الإنترنت', 'Cours en ligne', 'Online courses', 'Online courses', NULL, NULL, NULL, '在线课程'),
(336, 'explore_a_variety_of_fresh_topics', 'Explore a variety of fresh topics', 'Explora una variedad de temas nuevos', 'اكتشف مجموعة متنوعة من الموضوعات الجديدة', 'Explorez une variété de nouveaux sujets', 'Explore a variety of fresh topics', 'Explore a variety of fresh topics', NULL, NULL, NULL, '探索各种新鲜话题'),
(337, 'lifetime_access', 'Lifetime access', 'Acceso de por vida', 'وصول مدى الحياة', 'Accès à vie', NULL, NULL, NULL, NULL, NULL, '终身访问'),
(338, 'learn_on_your_schedule', 'Learn on your schedule', 'Aprende a tu ritmo', 'تعلم على الجدول الزمني الخاص بك', 'Apprenez selon votre emploi du temps', 'Learn on your schedule', 'Learn on your schedule', NULL, NULL, NULL, '按照您的日程安排学习'),
(339, 'top_courses', 'Top courses', 'Cursos principales', 'أفضل الدورات', 'Meilleurs cours', 'Top courses', 'Top courses', NULL, NULL, NULL, '热门课程'),
(340, 'these_are_the_most_popular_courses_among_listen_courses_learners_worldwide', 'These are the most popular courses among listen courses learners worldwide', 'Estos son los cursos más populares entre los estudiantes de Listen Courses en todo el mundo', 'هذه هي الدورات الأكثر شيوعًا بين متعلمي دورات الاستماع في جميع أنحاء العالم', 'Ce sont les cours les plus populaires parmi les apprenants du monde entier', 'These are the most popular courses among listen courses learners worldwide', 'These are the most popular courses among listen courses learners worldwide', NULL, NULL, NULL, 'These are the most popular courses among listen courses learners worldwide'),
(341, 'top', 'Top', 'Top', 'قمة', 'Haut', 'Top', 'Top', NULL, NULL, NULL, '顶部'),
(342, 'latest_courses', 'Latest courses', 'Cursos más recientes', 'أحدث الدورات', 'Derniers cours', 'Latest courses', 'Latest courses', NULL, NULL, NULL, '最新课程'),
(343, 'these_are_the_most_latest_courses_among_listen_courses_learners_worldwide', 'These are the most latest courses among listen courses learners worldwide', 'Estos son los cursos más recientes entre los estudiantes de Listen Courses en todo el mundo', 'هذه هي أحدث الدورات بين متعلمي دورات الاستماع في جميع أنحاء العالم', 'Ce sont les cours les plus récents parmi les apprenants du monde entier', 'These are the most latest courses among listen courses learners worldwide', 'These are the most latest courses among listen courses learners worldwide', NULL, NULL, NULL, '这些是全球听力课程学习者的最新课程'),
(344, 'learn', 'Learn', 'Aprender', NULL, 'Apprendre', NULL, NULL, NULL, NULL, NULL, NULL),
(345, 'new_skills_when_and_where_you_like.', 'New skills when and where you like.', 'Nuevas habilidades cuando y donde quieras.', NULL, 'De nouvelles compétences quand et où vous le souhaitez.', NULL, NULL, NULL, NULL, NULL, NULL),
(346, 'discover_a_world_of_learning_opportunities_through_our_upcoming_courses,_where_industry_experts.', 'Discover a world of learning opportunities through our upcoming courses, where industry experts.', 'Descubre un mundo de oportunidades de aprendizaje a través de nuestros próximos cursos, donde expertos de la industria.', NULL, 'Découvrez un monde d\'opportunités d\'apprentissage à travers nos prochains cours, où des experts de l\'industrie.', NULL, NULL, NULL, NULL, NULL, NULL),
(347, 'join_course_for_free', 'Join course for free', 'Únete al curso gratis', NULL, 'Rejoignez un cours gratuitement', NULL, NULL, NULL, NULL, NULL, NULL),
(348, 'became_a_instructor', 'Became a instructor', 'Conviértete en instructor', NULL, 'Devenez un instructeur', NULL, NULL, NULL, NULL, NULL, NULL),
(349, 'join_now_to_start_learning', 'Join now to start learning', 'Únete ahora para comenzar a aprender', 'انضم الآن لبدء التعلم', 'Inscrivez-vous maintenant pour commencer à apprendre', NULL, NULL, NULL, NULL, NULL, '立即加入开始学习'),
(350, 'learn_from_our_quality_instructors!', 'Learn from our quality instructors!', '¡Aprende de nuestros instructores de calidad!', 'Learn from our quality instructors!', 'Apprenez de nos instructeurs qualifiés !', 'Learn from our quality instructors!', 'Learn from our quality instructors!', NULL, NULL, NULL, 'Learn from our quality instructors!'),
(351, 'get_started', 'Get started', 'Comenzar', 'البدء', 'Commencez', 'Get started', 'Get started', NULL, NULL, NULL, '开始使用'),
(352, 'become_a_new_instructor', 'Become a new instructor', 'Conviértete en un nuevo instructor', 'كن مدربا جديدا', 'Devenez un nouvel instructeur', 'Become a new instructor', 'Become a new instructor', NULL, NULL, NULL, '成为新导师'),
(353, 'teach_thousands_of_students_and_earn_money!', 'Teach thousands of students and earn money!', '¡Enseña a miles de estudiantes y gana dinero!', 'Teach thousands of students and earn money!', 'Enseignez à des milliers d\'étudiants et gagnez de l\'argent !', 'Teach thousands of students and earn money!', 'Teach thousands of students and earn money!', NULL, NULL, NULL, 'Teach thousands of students and earn money!'),
(354, 'course_adding_form', 'Course adding form', 'Formulario de adición de curso', 'نموذج إضافة الدورة', 'Formulaire d\'ajout de cours', NULL, NULL, NULL, NULL, NULL, 'Course adding form'),
(355, 'back_to_course_list', 'Back to course list', 'Volver a la lista de cursos', 'العودة إلى قائمة الدورات', 'Retour à la liste des cours', NULL, NULL, NULL, NULL, NULL, '返回课程列表'),
(356, 'basic', 'Basic', 'Básico', 'أساسي', 'Basique', NULL, NULL, NULL, NULL, NULL, '基本的'),
(357, 'info', 'Info', 'Información', 'معلومات', 'Info', NULL, NULL, NULL, NULL, NULL, '信息'),
(358, 'pricing', 'Pricing', 'Precios', 'التسعير', 'Tarification', NULL, NULL, NULL, NULL, NULL, '价钱'),
(359, 'media', 'Media', 'Medios', 'وسائط', 'Médias', NULL, NULL, NULL, NULL, NULL, '媒体'),
(360, 'seo', 'Seo', 'SEO', 'سيو', 'SEO', NULL, NULL, NULL, NULL, NULL, '搜索引擎优化'),
(361, 'finish', 'Finish', 'Terminar', 'ينهي', 'Terminer', NULL, NULL, NULL, NULL, NULL, '结束'),
(362, 'course_title', 'Course title', 'Título del curso', 'عنوان الدورة', 'Titre du cours', NULL, NULL, NULL, NULL, NULL, '课程名称'),
(363, 'enter_course_title', 'Enter course title', 'Ingresa el título del curso', 'أدخل عنوان الدورة', 'Entrez le titre du cours', NULL, NULL, NULL, NULL, NULL, 'Enter course title'),
(364, 'short_description', 'Short description', 'Descripción corta', 'وصف قصير', 'Brève description', NULL, NULL, NULL, NULL, NULL, 'Short description'),
(365, 'description', 'Description', 'Descripción', 'وصف', 'Description', NULL, NULL, NULL, NULL, NULL, '描述'),
(366, 'category', 'Category', 'Categoría', 'فئة', 'Catégorie', NULL, NULL, NULL, NULL, NULL, '类别'),
(367, 'select_a_category', 'Select a category', 'Selecciona una categoría', 'اختر تصنيف', 'Sélectionnez une catégorie', NULL, NULL, NULL, NULL, NULL, 'Select a category'),
(368, 'select_sub_category', 'Select sub category', 'Selecciona una subcategoría', 'حدد فئة فرعية', 'Sélectionnez une sous-catégorie', NULL, NULL, NULL, NULL, NULL, 'Select sub category'),
(369, 'level', 'Level', 'Nivel', 'مستوى', 'Niveau', NULL, NULL, NULL, NULL, NULL, '等级'),
(370, 'beginner', 'Beginner', 'Principiante', 'مبتدئ', 'Débutant', 'Beginner', 'Beginner', NULL, NULL, NULL, '初学者'),
(371, 'advanced', 'Advanced', 'Avanzado', 'متقدم', 'Avancé', 'Advanced', 'Advanced', NULL, NULL, NULL, '先进的'),
(372, 'intermediate', 'Intermediate', 'Intermedio', 'متوسط', 'Intermédiaire', 'Intermediate', 'Intermediate', NULL, NULL, NULL, '中间的'),
(373, 'language_made_in', 'Language made in', 'Idioma del curso', 'اللغة صنعت في', 'Langue utilisée', NULL, NULL, NULL, NULL, NULL, 'Language made in'),
(374, 'enable_drip_content', 'Enable drip content', 'Habilitar contenido progresivo', 'تمكين المحتوى بالتنقيط', 'Activer le contenu goutte à goutte', NULL, NULL, NULL, NULL, NULL, 'Enable drip content'),
(375, 'create_as_a', 'Create as a', 'Crear como', 'خلق كملف', 'Créer en tant que', NULL, NULL, NULL, NULL, NULL, 'Create as a'),
(376, 'private_course', 'Private course', 'Curso privado', 'دورة خاصة', 'Cours privé', NULL, NULL, NULL, NULL, NULL, '私人课程'),
(377, 'upcoming_course', 'Upcoming course', 'Curso próximo', 'الدورة القادمة', 'Cours à venir', NULL, NULL, NULL, NULL, NULL, '即将推出的课程'),
(378, 'upcoming_image_thumbnail', 'Upcoming image thumbnail', 'Miniatura de imagen próxima', 'Upcoming image thumbnail', 'Miniature de cours à venir', NULL, NULL, NULL, NULL, NULL, NULL),
(379, 'the_image_size_should_be', 'The image size should be', 'El tamaño de la imagen debe ser', 'يجب أن يكون حجم الصورة', 'La taille de l\'image doit être', NULL, NULL, NULL, NULL, NULL, '图像大小应该是'),
(380, 'publish_date', 'Publish date', 'Fecha de publicación', 'Publish date', 'Date de publication', NULL, NULL, NULL, NULL, NULL, NULL),
(381, 'enter_publish_date', 'Enter publish date', 'Ingrese la fecha de publicación', 'Enter publish date', 'Entrez la date de publication', NULL, NULL, NULL, NULL, NULL, NULL),
(382, 'check_if_this_course_is_top_course', 'Check if this course is top course', 'Marque si este curso es un curso superior', 'تحقق مما إذا كانت هذه الدورة التدريبية هي الأفضل', 'Vérifiez si ce cours est un cours de premier plan', NULL, NULL, NULL, NULL, NULL, '检查该课程是否为顶级课程'),
(383, 'course_faq', 'Course faq', 'Preguntas frecuentes del curso', 'أسئلة شائعة عن الدورة التدريبية', 'FAQ du cours', NULL, NULL, NULL, NULL, NULL, '课程常见问题解答'),
(384, 'faq_question', 'Faq question', 'Pregunta frecuente', 'سؤال أسئلة وأجوبة', 'Question FAQ', NULL, NULL, NULL, NULL, NULL, '常见问题解答'),
(385, 'answer', 'Answer', 'Respuesta', 'إجابة', 'Réponse', NULL, NULL, NULL, NULL, NULL, '回答'),
(386, 'requirements', 'Requirements', 'Requisitos', 'متطلبات', 'Exigences', NULL, NULL, NULL, NULL, NULL, '要求'),
(387, 'provide_requirements', 'Provide requirements', 'Proporcionar requisitos', 'تقديم المتطلبات', 'Fournir des exigences', NULL, NULL, NULL, NULL, NULL, '提供需求'),
(388, 'outcomes', 'Outcomes', 'Resultados', 'النتائج', 'Résultats', 'Outcomes', 'Outcomes', NULL, NULL, NULL, 'Outcomes'),
(389, 'provide_outcomes', 'Provide outcomes', 'Proporcionar resultados', 'قدم النتائج', 'Fournir des résultats', NULL, NULL, NULL, NULL, NULL, '提供成果'),
(390, 'check_if_this_is_a_free_course', 'Check if this is a free course', 'Verificar si este es un curso gratuito', 'تحقق مما إذا كانت هذه دورة مجانية', 'Vérifiez s\'il s\'agit d\'un cours gratuit', NULL, NULL, NULL, NULL, NULL, '检查这是否是免费课程'),
(392, 'enter_course_course_price', 'Enter course course price', 'Ingrese el precio del curso', 'أدخل سعر الدورة', 'Entrez le prix du cours', NULL, NULL, NULL, NULL, NULL, '输入课程 课程价格'),
(393, 'check_if_this_course_has_discount', 'Check if this course has discount', 'Verificar si este curso tiene descuento', 'تحقق مما إذا كانت هذه الدورة بها خصم', 'Vérifiez si ce cours a une remise', NULL, NULL, NULL, NULL, NULL, '查看该课程是否有折扣'),
(394, 'discounted_price', 'Discounted price', 'Precio con descuento', 'سعر مخفض', 'Prix réduit', NULL, NULL, NULL, NULL, NULL, '打折后价格'),
(395, 'this_course_has', 'This course has', 'Este curso tiene', 'هذه الدورة لها', 'Ce cours a', NULL, NULL, NULL, NULL, NULL, '本课程有'),
(396, 'discount', 'Discount', 'Descuento', 'تخفيض', 'Remise', NULL, NULL, NULL, NULL, NULL, '折扣'),
(397, 'expiry_period', 'Expiry period', 'Periodo de expiración', 'فترة انتهاء الصلاحية', 'Délai d\'expiration', NULL, NULL, NULL, NULL, NULL, '有效期'),
(398, 'lifetime', 'Lifetime', 'De por vida', 'حياة', 'À vie', NULL, NULL, NULL, NULL, NULL, '寿命'),
(399, 'limited_time', 'Limited time', 'Tiempo limitado', 'وقت محدود', 'Temps limité', NULL, NULL, NULL, NULL, NULL, '有限的时间'),
(400, 'number_of_month', 'Number of month', 'Número de meses', 'عدد الشهر', 'Nombre de mois', NULL, NULL, NULL, NULL, NULL, '月份数'),
(401, 'after_purchase,_students_can_access_the_course_until_your_selected_time.', 'After purchase, students can access the course until your selected time.', 'Después de la compra, los estudiantes podrán acceder al curso hasta el tiempo seleccionado.', 'After purchase, students can access the course until your selected time.', 'Après l\'achat, les étudiants peuvent accéder au cours jusqu\'à l\'heure sélectionnée.', NULL, NULL, NULL, NULL, NULL, NULL),
(402, 'course_overview_provider', 'Course overview provider', 'Proveedor de vista general del curso', 'مزود نظرة عامة على الدورة التدريبية', 'Fournisseur d\'aperçu du cours', NULL, NULL, NULL, NULL, NULL, '课程概述提供者'),
(403, 'youtube', 'Youtube', 'YouTube', 'موقع YouTube', 'YouTube', NULL, NULL, NULL, NULL, NULL, 'YouTube'),
(404, 'vimeo', 'Vimeo', 'Vimeo', 'فيميو', 'Vimeo', NULL, NULL, NULL, NULL, NULL, '维梅奥'),
(405, 'html5', 'Html5', 'HTML5', 'Html5', 'HTML5', NULL, NULL, NULL, NULL, NULL, 'HTML5'),
(406, 'course_overview_url', 'Course overview url', 'URL de vista general del curso', 'نظرة عامة على الرابط URL', 'URL d\'aperçu du cours', NULL, NULL, NULL, NULL, NULL, '课程概述网址'),
(407, 'course_thumbnail', 'Course thumbnail', 'Miniatura del curso', 'صورة مصغرة للدورة', 'Vignette du cours', NULL, NULL, NULL, NULL, NULL, '课程缩略图'),
(408, 'meta_keywords', 'Meta keywords', 'Palabras clave meta', 'كلمات دلالية', 'Méta mots-clés', NULL, NULL, NULL, NULL, NULL, '元关键字'),
(409, 'write_a_keyword_and_then_press_enter_button', 'Write a keyword and then press enter button', 'Escriba una palabra clave y luego presione el botón Enter', 'اكتب كلمة رئيسية ثم اضغط على زر الإدخال', 'Écrivez un mot-clé puis appuyez sur le bouton Entrée', NULL, NULL, NULL, NULL, NULL, '输入关键字，然后按 Enter 按钮'),
(410, 'meta_description', 'Meta description', 'Descripción meta', 'ميتا الوصف', 'Méta description', NULL, NULL, NULL, NULL, NULL, '元描述'),
(411, 'thank_you', 'Thank you', 'Gracias', 'شكرًا لك', 'Merci', NULL, NULL, NULL, NULL, NULL, '谢谢'),
(412, 'you_are_just_one_click_away', 'You are just one click away', 'Estás a solo un clic de distancia', 'أنت على بعد نقرة واحدة فقط', 'Vous n\'êtes qu\'à un clic', NULL, NULL, NULL, NULL, NULL, '您只需一键点击即可'),
(414, 'upcoming_courses', 'Upcoming courses', 'Cursos próximos', 'الدورات القادمة', 'Cours à venir', NULL, NULL, NULL, NULL, NULL, '即将推出的课程'),
(415, 'free_courses', 'Free courses', 'Cursos gratuitos', 'دورات مجانية', 'Cours gratuits', NULL, NULL, NULL, NULL, NULL, '免费课程'),
(416, 'paid_courses', 'Paid courses', 'Cursos de pago', 'الدورات المدفوعة', 'Cours payants', NULL, NULL, NULL, NULL, NULL, '付费课程'),
(417, 'course_list', 'Course list', 'Lista de cursos', 'قائمة الدورات', 'Liste des cours', NULL, NULL, NULL, NULL, NULL, '课程列表'),
(418, 'all', 'All', 'Todos', 'الجميع', 'Tous', NULL, NULL, NULL, NULL, NULL, '全部'),
(419, 'status', 'Status', 'Estado', 'حالة', 'Statut', NULL, NULL, NULL, NULL, NULL, '地位'),
(420, 'active', 'Active', 'Activo', 'نشيط', 'Actif', NULL, NULL, NULL, NULL, NULL, '积极的'),
(421, 'pending', 'Pending', 'Pendiente', 'قيد الانتظار', 'En attente', NULL, NULL, NULL, NULL, NULL, '待办的'),
(422, 'private', 'Private', 'Privado', 'خاص', 'Privé', NULL, NULL, NULL, NULL, NULL, '私人的'),
(423, 'upcoming', 'Upcoming', 'Próximo', 'القادمة', 'À venir', NULL, NULL, NULL, NULL, NULL, '即将推出'),
(424, 'instructor', 'Instructor', 'Instructor', 'مدرب', 'Instructeur', NULL, NULL, NULL, NULL, NULL, '讲师'),
(425, 'price', 'Price', 'Precio', 'سعر', 'Prix', NULL, NULL, NULL, NULL, NULL, '价格'),
(426, 'free', 'Free', 'Gratis', 'حر', 'Gratuit', NULL, NULL, NULL, NULL, NULL, '自由的'),
(427, 'paid', 'Paid', 'Pagado', 'مدفوع', 'Payé', NULL, NULL, NULL, NULL, NULL, '有薪酬的'),
(428, 'filter', 'Filter', 'Filtrar', 'منقي', 'Filtrer', NULL, NULL, NULL, NULL, NULL, '筛选'),
(429, 'title', 'Title', 'Título', 'عنوان', 'Titre', NULL, NULL, NULL, NULL, NULL, '标题'),
(430, 'lesson_and_section', 'Lesson and section', 'Lección y sección', 'الدرس والقسم', 'Leçon et section', NULL, NULL, NULL, NULL, NULL, '课程和部分'),
(431, 'enrolled_student', 'Enrolled student', 'Estudiante inscrito', 'طالب مسجل', 'Étudiant inscrit', NULL, NULL, NULL, NULL, NULL, '在读学生'),
(432, 'actions', 'Actions', 'Acciones', 'أجراءات', 'Actions', NULL, NULL, NULL, NULL, NULL, '行动'),
(433, 'system_settings_updated', 'System settings updated', 'Configuraciones del sistema actualizadas', 'تم تحديث إعدادات النظام', 'Paramètres système mis à jour', NULL, NULL, NULL, NULL, NULL, '系统设置已更新'),
(434, 'basic_info', 'Basic info', 'Información básica', 'معلومات أساسية', 'Informations de base', NULL, NULL, NULL, NULL, NULL, 'Basic info'),
(435, 'first_name', 'First name', 'Nombre', 'الاسم الأول', 'Prénom', NULL, NULL, NULL, NULL, NULL, '名'),
(436, 'last_name', 'Last name', 'Apellido', 'اسم العائلة', 'Nom', NULL, NULL, NULL, NULL, NULL, '姓'),
(438, 'facebook_link', 'Facebook link', 'Enlace de Facebook', 'رابط الفيسبوك', 'Lien Facebook', NULL, NULL, NULL, NULL, NULL, 'Facebook link'),
(439, 'twitter_link', 'Twitter link', 'Enlace de Twitter', 'رابط تويتر', 'Lien Twitter', NULL, NULL, NULL, NULL, NULL, 'Twitter link'),
(440, 'linkedin_link', 'Linkedin link', 'Enlace de LinkedIn', 'رابط ينكدين', 'Lien LinkedIn', NULL, NULL, NULL, NULL, NULL, 'Linkedin link'),
(441, 'a_short_title_about_yourself', 'A short title about yourself', 'Un título corto sobre ti', 'عنوان قصير عن نفسك', 'Un court titre sur vous-même', NULL, NULL, NULL, NULL, NULL, 'A short title about yourself'),
(442, 'skills', 'Skills', 'Habilidades', 'مهارات', 'Compétences', NULL, NULL, NULL, NULL, NULL, 'Skills'),
(443, 'write_your_skill_and_click_the_enter_button', 'Write your skill and click the enter button', 'Escribe tu habilidad y haz clic en el botón Enter', 'اكتب مهارتك وانقر على زر الدخول', 'Écrivez votre compétence et cliquez sur Entrée', NULL, NULL, NULL, NULL, NULL, '写下您的技能并单击输入按钮'),
(444, 'biography', 'Biography', 'Biografía', 'سيرة شخصية', 'Biographie', NULL, NULL, NULL, NULL, NULL, '传'),
(445, 'photo', 'Photo', 'Foto', 'صورة', 'Photo', NULL, NULL, NULL, NULL, NULL, 'Photo'),
(446, 'the_image_size_should_be_any_square_image', 'The image size should be any square image', 'El tamaño de la imagen debe ser una imagen cuadrada', 'يجب أن يكون حجم الصورة أي صورة مربعة', 'La taille de l\'image doit être une image carrée', NULL, NULL, NULL, NULL, NULL, 'The image size should be any square image'),
(447, 'choose_file', 'Choose file', 'Elegir archivo', 'اختر ملف', 'Choisir un fichier', NULL, NULL, NULL, NULL, NULL, '选择文件'),
(448, 'update_profile', 'Update profile', 'Actualizar perfil', 'تحديث الملف', 'Mettre à jour le profil', NULL, NULL, NULL, NULL, NULL, 'Update profile'),
(449, 'current_password', 'Current password', 'Contraseña actual', 'كلمة السر الحالية', 'Mot de passe actuel', NULL, NULL, NULL, NULL, NULL, 'Current password'),
(452, 'update_password', 'Update password', 'Actualizar contraseña', NULL, 'Mettre à jour le mot de passe', NULL, NULL, NULL, NULL, NULL, 'Update password'),
(453, 'user_update_successfully', 'User update successfully', 'Usuario actualizado exitosamente', 'تحديث المستخدم بنجاح', 'Mise à jour de l\'utilisateur réussie', NULL, NULL, NULL, NULL, NULL, '用户更新成功'),
(454, 'private_messaging', 'Private messaging', 'Mensajería privada', 'الرسائل الخاصة', 'Messagerie privée', NULL, NULL, NULL, NULL, NULL, '私人消息'),
(455, 'private_message', 'Private message', 'Mensaje privado', 'رسالة خاصة', 'Message privé', NULL, NULL, NULL, NULL, NULL, '私人信息'),
(456, 'new_message', 'New message', 'Nuevo mensaje', 'رسالة جديدة', 'Nouveau message', NULL, NULL, NULL, NULL, NULL, '新消息'),
(457, 'choose_an_option_from_the_left_side', 'Choose an option from the left side', 'Elija una opción desde el lado izquierdo', NULL, 'Choisissez une option sur la gauche', NULL, NULL, NULL, NULL, NULL, NULL),
(458, 'blogs', 'Blogs', 'Blogs', 'المدونات', 'Blogs', NULL, NULL, NULL, NULL, NULL, '博客'),
(459, 'add_new_blog', 'Add new blog', 'Agregar nuevo blog', 'أضف مدونة جديدة', 'Ajouter un nouveau blog', NULL, NULL, NULL, NULL, NULL, '添加新博客'),
(460, 'creator', 'Creator', 'Creador', 'المنشئ', 'Créateur', NULL, NULL, NULL, NULL, NULL, '创作者'),
(461, 'all_category', 'All category', 'Todas las categorías', 'كل الفئات', 'Toutes les catégories', NULL, NULL, NULL, NULL, NULL, '所有类别'),
(463, 'show_less', 'Show less', 'Mostrar menos', 'عرض أقل', 'Montrer moins', NULL, NULL, NULL, NULL, NULL, '显示较少'),
(464, 'language', 'Language', 'Idioma', 'لغة', 'Langue', NULL, 'Language', NULL, NULL, NULL, '语言'),
(465, 'ratings', 'Ratings', 'Calificaciones', 'التقييمات', 'Évaluations', NULL, NULL, NULL, NULL, NULL, '评级'),
(466, 'list_view', 'List view', 'Vista de lista', 'عرض القائمة', 'Vue en liste', NULL, NULL, NULL, NULL, NULL, '列表显示'),
(467, 'grid_view', 'Grid view', 'Vista de cuadrícula', 'عرض شبكي', 'Vue en grille', NULL, NULL, NULL, NULL, NULL, '网格视图'),
(468, 'reset', 'Reset', 'Restablecer', 'إعادة ضبط', 'Réinitialiser', NULL, NULL, NULL, NULL, NULL, '重置'),
(469, 'showing', 'Showing', 'Mostrando', 'عرض', 'Montrant', NULL, NULL, NULL, NULL, NULL, '显示中'),
(470, 'of', 'Of', 'De', 'ل', 'de', NULL, NULL, NULL, NULL, NULL, '的'),
(471, 'results', 'Results', 'Resultados', 'نتائج', 'Résultats', NULL, NULL, NULL, NULL, NULL, '结果'),
(472, 'newly_published', 'Newly published', 'Recientemente publicado', 'تم نشره حديثًا', 'Nouvellement publié', NULL, NULL, NULL, NULL, NULL, '新发布'),
(473, 'highest_rating', 'Highest rating', 'Calificación más alta', 'أعلى تقييم', 'Note la plus élevée', NULL, NULL, NULL, NULL, NULL, '最高评价'),
(474, 'lowest_price', 'Lowest price', 'Precio más bajo', 'أقل سعر', 'Prix le plus bas', NULL, NULL, NULL, NULL, NULL, '最低价格'),
(475, 'highest_price', 'Highest price', 'Precio más alto', 'اغلى سعر', 'Prix le plus élevé', NULL, NULL, NULL, NULL, NULL, '最高价格'),
(476, 'discounted', 'Discounted', 'Descontado', 'مخفضة', 'Remisé', NULL, NULL, NULL, NULL, NULL, '折扣'),
(477, 'course_not_found', 'Course not found', 'Curso no encontrado', NULL, 'Cours introuvable', NULL, NULL, NULL, NULL, NULL, NULL),
(478, 'sorry,_try_using_more_similar_words_in_your_search.', 'Sorry, try using more similar words in your search.', 'Lo siento, intenta usar palabras más similares en tu búsqueda.', NULL, 'Désolé, essayez d\'utiliser des mots plus similaires dans votre recherche.', NULL, NULL, NULL, NULL, NULL, NULL),
(479, 'enter_your_first_name', 'Enter your first name', 'Introduce tu primer nombre', 'أدخل اسمك الأول', 'Entrez votre prénom', NULL, NULL, NULL, NULL, NULL, '输入您的名字'),
(480, 'enter_your_last_name', 'Enter your last name', 'Introduce tu apellido', 'أدخل اسمك الأخير', 'Entrez votre nom de famille', NULL, NULL, NULL, NULL, NULL, '输入您的姓氏'),
(481, 'apply_to_become_an_instructor', 'Apply to become an instructor', 'Solicitar ser instructor', NULL, 'Postuler pour devenir instructeur', NULL, NULL, NULL, NULL, NULL, NULL),
(482, 'enter_your_phone_number', 'Enter your phone number', 'Introduce tu número de teléfono', 'أدخل رقم هاتفك', 'Entrez votre numéro de téléphone', NULL, NULL, NULL, NULL, NULL, 'Enter your phone number'),
(483, 'document', 'Document', 'Documento', 'وثيقة', 'Document', NULL, NULL, NULL, NULL, NULL, 'Document'),
(484, 'provide_some_documents_about_your_qualifications', 'Provide some documents about your qualifications', 'Proporcionar algunos documentos sobre tus calificaciones', 'قدم بعض المستندات حول مؤهلاتك', 'Fournissez des documents sur vos qualifications', NULL, NULL, NULL, NULL, NULL, 'Provide some documents about your qualifications'),
(485, 'already_you_have_an_account?', 'Already you have an account?', '¿Ya tienes una cuenta?', NULL, 'Vous avez déjà un compte ?', NULL, NULL, NULL, NULL, NULL, NULL),
(486, 'search_results', 'Search results', 'Resultados de búsqueda', NULL, 'Résultats de recherche', NULL, NULL, NULL, NULL, NULL, NULL),
(487, 'add_admin', 'Add admin', 'Agregar administrador', 'أضف المسؤول', 'Ajouter un administrateur', NULL, NULL, NULL, NULL, NULL, 'Add admin'),
(488, 'name', 'Name', 'Nombre', 'اسم', 'Nom', NULL, NULL, NULL, NULL, NULL, 'Name'),
(489, 'root_admin', 'Root admin', 'Administrador principal', 'مشرف الجذر', 'Administrateur racine', NULL, NULL, NULL, NULL, NULL, 'Root admin'),
(490, 'admin_add', 'Admin add', 'Agregar administrador', NULL, 'Ajouter un administrateur', NULL, NULL, NULL, NULL, NULL, NULL),
(491, 'back_to_admins', 'Back to admins', 'Volver a administradores', NULL, 'Retour aux administrateurs', NULL, NULL, NULL, NULL, NULL, NULL),
(492, 'admin_add_form', 'Admin add form', 'Formulario de agregar administrador', NULL, 'Formulaire d\'ajout d\'administrateur', NULL, NULL, NULL, NULL, NULL, NULL),
(493, 'login_credentials', 'Login credentials', 'Credenciales de inicio de sesión', 'بيانات اعتماد تسجيل الدخول', 'Identifiants de connexion', NULL, NULL, NULL, NULL, NULL, 'Login credentials'),
(494, 'social_information', 'Social information', 'Información social', 'المعلومات الاجتماعية', 'Informations sociales', NULL, NULL, NULL, NULL, NULL, 'Social information'),
(495, 'user_image', 'User image', 'Imagen de usuario', 'صورة المستخدم', 'Image utilisateur', NULL, NULL, NULL, NULL, NULL, '用户形象'),
(496, 'choose_user_image', 'Choose user image', 'Elegir imagen de usuario', 'اختر صورة المستخدم', 'Choisissez une image utilisateur', NULL, NULL, NULL, NULL, NULL, '选择用户图片'),
(497, 'facebook', 'Facebook', 'Facebook', 'فيسبوك', 'Facebook', NULL, NULL, NULL, NULL, NULL, 'Facebook'),
(498, 'twitter', 'Twitter', 'Twitter', 'تويتر', 'Twitter', NULL, NULL, NULL, NULL, NULL, '推特'),
(499, 'linkedin', 'Linkedin', 'LinkedIn', 'ينكدين', 'LinkedIn', NULL, NULL, NULL, NULL, NULL, '领英'),
(500, 'add_new_category', 'Add new category', 'Agregar nueva categoría', 'إضافة فئة جديدة', 'Ajouter une nouvelle catégorie', NULL, NULL, NULL, NULL, NULL, '添加新类别'),
(501, 'add_category', 'Add category', 'Agregar categoría', NULL, 'Ajouter une catégorie', NULL, NULL, NULL, NULL, NULL, NULL),
(502, 'category_add_form', 'Category add form', 'Formulario para agregar categoría', NULL, 'Formulaire d\'ajout de catégorie', NULL, NULL, NULL, NULL, NULL, NULL),
(503, 'category_code', 'Category code', 'Código de categoría', NULL, 'Code de la catégorie', NULL, NULL, NULL, NULL, NULL, NULL),
(504, 'category_title', 'Category title', 'Título de categoría', 'عنوان الفئة', 'Titre de la catégorie', NULL, NULL, NULL, NULL, NULL, '类别标题'),
(505, 'parent', 'Parent', 'Padre', 'الأبوين', 'Parent', NULL, NULL, NULL, NULL, NULL, '家长'),
(506, 'none', 'None', 'Ninguno', 'لا أحد', 'Aucun', NULL, NULL, NULL, NULL, NULL, '没有任何'),
(507, 'select_none_to_create_a_parent_category', 'Select none to create a parent category', 'Seleccione ninguno para crear una categoría principal', 'حدد لا شيء لإنشاء فئة رئيسية', 'Ne sélectionnez aucun pour créer une catégorie parent', NULL, NULL, NULL, NULL, NULL, '选择无创建父类别'),
(508, 'icon_picker', 'Icon picker', 'Selector de iconos', 'منتقي الرموز', 'Sélecteur d\'icônes', NULL, NULL, NULL, NULL, NULL, '图标选择器'),
(509, 'sub_category_thumbnail', 'Sub category thumbnail', 'Miniatura de subcategoría', NULL, 'Vignette de sous-catégorie', NULL, NULL, NULL, NULL, NULL, NULL),
(510, 'category_thumbnail', 'Category thumbnail', 'Miniatura de categoría', 'صورة مصغرة للفئة', 'Vignette de catégorie', NULL, NULL, NULL, NULL, NULL, '类别缩略图'),
(511, 'choose_thumbnail', 'Choose thumbnail', 'Elegir miniatura', 'اختر الصورة المصغرة', 'Choisissez la vignette', NULL, NULL, NULL, NULL, NULL, '选择缩略图'),
(512, 'data_added_successfully', 'Data added successfully', 'Datos añadidos exitosamente', 'تمت إضافة البيانات بنجاح', 'Données ajoutées avec succès', NULL, NULL, NULL, NULL, NULL, '数据添加成功'),
(513, 'sub_categories', 'Sub categories', 'Subcategorías', 'الفئات الفرعية', 'Sous-catégories', NULL, NULL, NULL, NULL, NULL, 'Sub categories'),
(516, 'edit_category', 'Edit category', 'Editar categoría', 'تحرير الفئة', 'Modifier la catégorie', NULL, NULL, NULL, NULL, NULL, 'Edit category'),
(517, 'update_category', 'Update category', 'Actualizar categoría', 'فئة التحديث', 'Mettre à jour la catégorie', NULL, NULL, NULL, NULL, NULL, 'Update category'),
(518, 'update_category_form', 'Update category form', 'Formulario de actualización de categoría', 'تحديث نموذج الفئة', 'Mettre à jour le formulaire de catégorie', NULL, NULL, NULL, NULL, NULL, '更新类别表格'),
(519, 'course_has_been_added_successfully', 'Course has been added successfully', 'Curso añadido exitosamente', 'تم إضافة الدورة بنجاح', 'Le cours a été ajouté avec succès', NULL, NULL, NULL, NULL, NULL, 'Course has been added successfully'),
(521, 'course_manager', 'Course manager', 'Administrador de cursos', 'مدير الدورة', 'Gestionnaire de cours', NULL, NULL, NULL, NULL, NULL, '课程经理'),
(522, 'view_on_frontend', 'View on frontend', 'Ver en el frontend', 'عرض على الواجهة الأمامية', 'Voir sur le frontend', NULL, NULL, NULL, NULL, NULL, '在前端查看'),
(523, 'curriculum', 'Curriculum', 'Plan de estudios', 'مقرر', 'Curriculum', NULL, NULL, NULL, NULL, NULL, '课程'),
(524, 'academic_progress', 'Academic progress', 'Progreso académico', 'التقدم العلمي', 'Progrès académiques', NULL, NULL, NULL, NULL, NULL, '学业进步'),
(525, 'bbb_live_class', 'Bbb live class', 'Clase en vivo de BBB', 'دروس بي بي بي المباشرة', 'Cours en direct BBB', NULL, NULL, NULL, NULL, NULL, NULL),
(526, 'add_new_section', 'Add new section', 'Agregar nueva sección', 'أضف قسم جديد', 'Ajouter une nouvelle section', NULL, NULL, NULL, NULL, NULL, '添加新部分'),
(527, 'add_section', 'Add section', 'Agregar sección', 'إضافة قسم', 'Ajouter une section', NULL, NULL, NULL, NULL, NULL, '添加部分'),
(528, 'meeting_id', 'Meeting id', 'ID de la reunión', 'Meeting id', 'ID de réunion', NULL, NULL, NULL, NULL, NULL, NULL),
(529, 'moderator_password', 'Moderator password', 'Contraseña del moderador', 'كلمة مرور المشرف', 'Mot de passe modérateur', NULL, NULL, NULL, NULL, NULL, NULL),
(530, 'viewer_password', 'Viewer password', 'Contraseña del espectador', 'Viewer password', 'Mot de passe spectateur', NULL, NULL, NULL, NULL, NULL, NULL),
(531, 'instructions_for_students', 'Instructions for students', 'Instrucciones para los estudiantes', 'Instructions for students', 'Instructions pour les étudiants', NULL, NULL, NULL, NULL, NULL, NULL),
(532, 'attention!', 'Attention!', '¡Atención!', 'Attention!', 'Attention!', NULL, NULL, NULL, NULL, NULL, NULL),
(533, 'give_some_instructions_to_keep_your_students_informed_about_the_meeting', 'Give some instructions to keep your students informed about the meeting', 'Dé algunas instrucciones para mantener a sus estudiantes informados sobre la reunión', 'أعط بعض التعليمات لإبقاء طلابك على اطلاع بشأن الاجتماع', 'Donnez des instructions pour informer vos étudiants sur la réunion', NULL, NULL, NULL, NULL, NULL, NULL),
(534, 'save_meeting_info', 'Save meeting info', 'Guardar información de la reunión', 'Save meeting info', 'Enregistrer les informations de la réunion', NULL, NULL, NULL, NULL, NULL, NULL),
(535, 'start_meeting', 'Start meeting', 'Iniciar reunión', 'Start meeting', 'Commencer la réunion', NULL, NULL, NULL, NULL, NULL, NULL),
(536, 'meeting_id_and_password_can_not_be_empty', 'Meeting id and password can not be empty', 'El ID de la reunión y la contraseña no pueden estar vacíos', 'Meeting id and password can not be empty', 'L\'ID de réunion et le mot de passe ne peuvent pas être vides', NULL, NULL, NULL, NULL, NULL, NULL),
(537, 'moderator_and_viewer_password_can_not_be_same', 'Moderator and viewer password can not be same', 'La contraseña del moderador y del espectador no pueden ser iguales', 'Moderator and viewer password can not be same', 'Le mot de passe du modérateur et du spectateur ne peuvent pas être identiques', NULL, NULL, NULL, NULL, NULL, NULL),
(538, 'course_type', 'Course type', 'Tipo de curso', 'دورة كتابية', 'Type de cours', NULL, NULL, NULL, NULL, NULL, 'Course type'),
(539, 'general', 'General', 'General', 'عام', 'Général', NULL, NULL, NULL, NULL, NULL, 'General'),
(540, 'the_course_type_can_not_be_editable', 'The course type can not be editable', 'El tipo de curso no puede ser editable', 'لا يمكن تعديل نوع الدورة', 'Le type de cours ne peut pas être modifié', NULL, NULL, NULL, NULL, NULL, 'The course type can not be editable'),
(541, 'instructor_of_this_course', 'Instructor of this course', 'Instructor de este curso', 'مدرس لهذه الدورة', 'Instructeur de ce cours', NULL, NULL, NULL, NULL, NULL, 'Instructor of this course'),
(542, 'updated_as_a', 'Updated as a', 'Actualizado como un', 'تم التحديث كملف', 'Mis à jour en tant que', NULL, NULL, NULL, NULL, NULL, '更新为'),
(543, 'hours', 'Hours', 'Horas', 'ساعات', 'Heures', 'Hours', 'Hours', NULL, NULL, NULL, '小时'),
(545, 'compare', 'Compare', 'Comparar', 'يقارن', 'Comparer', 'Compare', 'Compare', NULL, NULL, NULL, '比较'),
(546, 'last_updated', 'Last updated', 'Última actualización', 'آخر تحديث', 'Dernière mise à jour', 'Last updated', 'Last updated', NULL, NULL, NULL, '最近更新时间'),
(548, 'remove_from_cart', 'Remove from cart', 'Eliminar del carrito', 'إزالة من عربة التسوق', 'Retirer du panier', 'Remove from cart', 'Remove from cart', NULL, NULL, NULL, 'Remove from cart'),
(549, 'add_to_cart', 'Add to cart', 'Agregar al carrito', 'أضف إلى السلة', 'Ajouter au panier', 'Add to cart', 'Add to cart', NULL, NULL, NULL, '添加到购物车'),
(550, 'course', 'Course', 'Curso', 'دورة', 'Cours', NULL, NULL, NULL, NULL, NULL, '课程'),
(551, 'created_by', 'Created by', 'Creado por', 'انشأ من قبل', 'Créé par', NULL, NULL, NULL, NULL, NULL, '由...制作'),
(552, 'enrolled', 'Enrolled', 'Inscrito', 'المقيدين', 'Inscrit', NULL, NULL, NULL, NULL, NULL, '已注册'),
(553, 'overview', 'Overview', 'Descripción general', 'ملخص', 'Aperçu', NULL, NULL, NULL, NULL, NULL, '概述'),
(554, 'course_description', 'Course description', 'Descripción del curso', 'وصف الدورة التدريبية', 'Description du cours', NULL, NULL, NULL, NULL, NULL, '课程描述'),
(555, 'what_will_i_learn?', 'What will i learn?', '¿Qué aprenderé?', NULL, 'Qu\'est-ce que je vais apprendre?', NULL, NULL, NULL, NULL, NULL, NULL),
(556, 'frequently_asked_question', 'Frequently asked question', 'Pregunta frecuente', NULL, 'Questions fréquemment posées', NULL, NULL, NULL, NULL, NULL, NULL),
(557, 'view_profile', 'View profile', 'Ver perfil', NULL, 'Voir le profil', NULL, NULL, NULL, NULL, NULL, NULL),
(558, 'quantum_computing', 'Quantum computing', 'Computación cuántica', NULL, 'Informatique quantique', NULL, NULL, NULL, NULL, NULL, NULL),
(559, 'compare_this_course', 'Compare this course', 'Comparar este curso', 'قارن هذه الدورة', 'Comparer ce cours', NULL, NULL, NULL, NULL, NULL, '比较本课程'),
(560, 'lectures', 'Lectures', 'Lecturas', 'محاضرات', 'Conférences', NULL, NULL, NULL, NULL, NULL, '讲座'),
(561, 'skill_level', 'Skill level', 'Nivel de habilidad', 'مستوى المهارة', 'Niveau de compétence', NULL, NULL, NULL, NULL, NULL, '技能等级'),
(562, 'buy_now', 'Buy now', 'Comprar ahora', 'اشتري الآن', 'Acheter maintenant', NULL, NULL, NULL, NULL, NULL, '立即购买'),
(563, 'share_on_facebook', 'Share on facebook', 'Compartir en Facebook', NULL, 'Partager sur Facebook', NULL, NULL, NULL, NULL, NULL, NULL),
(564, 'share_on_twitter', 'Share on twitter', 'Compartir en Twitter', NULL, 'Partager sur Twitter', NULL, NULL, NULL, NULL, NULL, NULL),
(565, 'share_on_whatsapp', 'Share on whatsapp', 'Compartir en WhatsApp', NULL, 'Partager sur WhatsApp', NULL, NULL, NULL, NULL, NULL, NULL),
(566, 'share_on_linkedin', 'Share on linkedin', 'Compartir en LinkedIn', NULL, 'Partager sur LinkedIn', NULL, NULL, NULL, NULL, NULL, NULL),
(568, 'mark_as_pending', 'Mark as pending', 'Marcar como pendiente', 'وضع علامة على أنه معلق', 'Marquer comme en attente', NULL, NULL, NULL, NULL, NULL, '标记为待处理'),
(569, 'section_and_lesson', 'Section and lesson', 'Sección y lección', 'قسم ودرس', 'Section et leçon', NULL, NULL, NULL, NULL, NULL, '部分和课程'),
(570, 'edit_this_course', 'Edit this course', 'Editar este curso', 'قم بتحرير هذه الدورة', 'Modifier ce cours', NULL, NULL, NULL, NULL, NULL, '编辑本课程'),
(571, 'duplicate_this_course', 'Duplicate this course', 'Duplicar este curso', 'Duplicate this course', 'Dupliquer ce cours', NULL, NULL, NULL, NULL, NULL, NULL),
(572, 'view_course_on_frontend', 'View course on frontend', 'Ver curso en el frontend', 'عرض الدورة على الواجهة الأمامية', 'Voir le cours sur le frontend', NULL, NULL, NULL, NULL, NULL, '在前端查看课程'),
(573, 'go_to_course_playing_page', 'Go to course playing page', 'Ir a la página de reproducción del curso', 'انتقل إلى صفحة اللعب بالطبع', 'Aller à la page de lecture du cours', NULL, NULL, NULL, NULL, NULL, '进入课程播放页面'),
(574, 'section', 'Section', 'Sección', 'قسم', 'Section', NULL, NULL, NULL, NULL, NULL, '部分'),
(575, 'lesson', 'Lesson', 'Lección', 'درس', 'Leçon', NULL, NULL, NULL, NULL, NULL, '课'),
(576, 'student', 'Student', 'Estudiante', 'طالب', 'Étudiant', NULL, NULL, NULL, NULL, NULL, '学生'),
(577, 'date', 'Date', 'Fecha', 'تاريخ', 'Date', NULL, NULL, NULL, NULL, NULL, 'Date'),
(578, 'progress', 'Progress', 'Progreso', 'تقدم', 'Progrès', NULL, NULL, NULL, NULL, NULL, '进步'),
(579, 'course_updated_successfully', 'Course updated successfully', 'Curso actualizado exitosamente', 'تم تحديث الدورة بنجاح', 'Cours mis à jour avec succès', NULL, NULL, NULL, NULL, NULL, '课程更新成功'),
(580, 'connect_with_us_to_experience_seamless_communication._we_value_open_dialogue_and_are_eager_to_engage_with_you._whether_you_have_questions,_ideas,_or_feedback,_we_are_here_to_listen_and_respond.', 'Connect with us to experience seamless communication. we value open dialogue and are eager to engage with you. whether you have questions, ideas, or feedback, we are here to listen and respond.', 'Conéctese con nosotros para experimentar una comunicación fluida. Valoramos el diálogo abierto y estamos ansiosos por interactuar con usted. Ya sea que tenga preguntas, ideas o comentarios, estamos aquí para escuchar y responder.', NULL, 'Connectez-vous avec nous pour vivre une communication fluide. Nous apprécions le dialogue ouvert et sommes impatients d\'interagir avec vous. Que vous ayez des questions, des idées ou des retours, nous sommes ici pour écouter et répondre.', NULL, NULL, NULL, NULL, NULL, NULL),
(581, 'get_in_touch', 'Get in touch', 'Ponte en contacto', NULL, 'Prenez contact', NULL, NULL, NULL, NULL, NULL, NULL),
(582, 'our_address', 'Our address', 'Nuestra dirección', NULL, 'Notre adresse', NULL, NULL, NULL, NULL, NULL, NULL),
(583, 'office_hours', 'Office hours', 'Horas de oficina', NULL, 'Heures de bureau', NULL, NULL, NULL, NULL, NULL, NULL),
(584, 'email_address', 'Email address', 'Dirección de correo electrónico', 'عنوان البريد الإلكتروني', 'Adresse e-mail', NULL, NULL, NULL, NULL, NULL, 'Email address'),
(585, 'write_your_message', 'Write your message', 'Escribe tu mensaje', 'اكتب رسالتك', 'Rédigez votre message', NULL, NULL, NULL, NULL, NULL, 'Write your message'),
(586, 'i_agree_that_my_submitted_data_is_being_collected_and_stored.', 'I agree that my submitted data is being collected and stored.', 'Acepto que mis datos enviados están siendo recopilados y almacenados.', NULL, 'Je suis d\'accord pour que mes données soumises soient collectées et stockées.', NULL, NULL, NULL, NULL, NULL, NULL),
(587, 'shopping_cart', 'Shopping cart', 'Carrito de compras', 'عربة التسوق', 'Panier', NULL, NULL, NULL, NULL, NULL, 'Shopping cart'),
(588, 'your_cart_items', 'Your cart items', 'Los artículos de tu carrito', 'عناصر عربة التسوق الخاصة بك', 'Articles dans votre panier', NULL, NULL, NULL, NULL, NULL, 'Your cart items'),
(589, 'items', 'Items', 'Artículos', 'أغراض', 'Articles', NULL, NULL, NULL, NULL, NULL, 'Items'),
(591, 'subtotal', 'Subtotal', 'Subtotal', 'المجموع الفرعي', 'Sous-total', NULL, NULL, NULL, NULL, NULL, 'Subtotal'),
(592, 'tax', 'Tax', 'Impuesto', NULL, 'Taxe', NULL, NULL, NULL, NULL, NULL, 'Tax'),
(593, 'apply_coupon', 'Apply coupon', 'Aplicar cupón', 'تطبيق القسيمة', 'Appliquer le coupon', NULL, NULL, NULL, NULL, NULL, 'Apply coupon'),
(594, 'apply', 'Apply', 'Aplicar', 'يتقدم', 'Appliquer', NULL, NULL, NULL, NULL, NULL, 'Apply'),
(595, 'send_as_a_gift', 'Send as a gift', 'Enviar como regalo', 'أرسل كهدية', 'Envoyer en cadeau', NULL, NULL, NULL, NULL, NULL, 'Send as a gift'),
(596, 'continue_to_payment', 'Continue to payment', 'Continuar con el pago', 'تواصل الدفع', 'Continuer vers le paiement', NULL, NULL, NULL, NULL, NULL, 'Continue to payment'),
(597, 'searching', 'Searching', 'Buscando', 'يبحث', 'Recherche', NULL, NULL, NULL, NULL, NULL, 'Searching'),
(598, 'frontend_settings', 'Frontend settings', 'Configuraciones del frontend', 'إعدادات الواجهة الأمامية', 'Paramètres de l\'interface', NULL, NULL, NULL, NULL, NULL, '前端设置'),
(599, 'home_layout', 'Home layout', 'Diseño de inicio', NULL, 'Disposition de la page d\'accueil', NULL, NULL, NULL, NULL, NULL, NULL),
(600, 'home_page_settings', 'Home page settings', 'Configuraciones de la página de inicio', NULL, 'Paramètres de la page d\'accueil', NULL, NULL, NULL, NULL, NULL, NULL),
(601, 'website_faqs', 'Website faqs', 'Preguntas frecuentes del sitio web', 'الأسئلة الشائعة عن الموقع', 'FAQ du site Web', NULL, NULL, NULL, NULL, NULL, '网站常见问题解答');
INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `spanish`, `arabic`, `french`, `georgian`, `german`, `hindi`, `indonesia`, `italian`, `chinese`) VALUES
(602, 'contact_information', 'Contact information', 'Información de contacto', NULL, 'Informations de contact', NULL, NULL, NULL, NULL, NULL, NULL),
(603, 'recaptcha', 'Recaptcha', 'Recaptcha', 'ريكابتشا', 'Recaptcha', NULL, NULL, NULL, NULL, NULL, '验证码'),
(604, 'logo_&_images', 'Logo & images', 'Logo e imágenes', NULL, 'Logo et images', NULL, NULL, NULL, NULL, NULL, NULL),
(605, 'custom_codes', 'Custom codes', 'Códigos personalizados', NULL, 'Codes personnalisés', NULL, NULL, NULL, NULL, NULL, NULL),
(606, 'frontend_website_settings', 'Frontend website settings', 'Configuración del sitio web frontal', 'إعدادات موقع الواجهة الأمامية', 'Paramètres de l\'interface du site Web', NULL, NULL, NULL, NULL, NULL, '前端网站设置'),
(607, 'banner_title', 'Banner title', 'Título del banner', 'عنوان البانر', 'Titre de la bannière', NULL, NULL, NULL, NULL, NULL, '横幅标题'),
(608, 'banner_sub_title', 'Banner sub title', 'Subtítulo del banner', 'العنوان الفرعي للراية', 'Sous-titre de la bannière', NULL, NULL, NULL, NULL, NULL, '横幅副标题'),
(609, 'cookie_status', 'Cookie status', 'Estado de las cookies', 'حالة ملف تعريف الارتباط', 'Statut des cookies', NULL, NULL, NULL, NULL, NULL, 'Cookie 状态'),
(610, 'inactive', 'Inactive', 'Inactivo', 'غير نشط', 'Inactif', NULL, NULL, NULL, NULL, NULL, '不活跃'),
(611, 'cookie_note', 'Cookie note', 'Nota de cookies', 'ملاحظة ملف تعريف الارتباط', 'Note sur les cookies', NULL, NULL, NULL, NULL, NULL, '饼干笔记'),
(612, 'update_settings', 'Update settings', 'Actualizar configuraciones', 'إعدادات التحديث', 'Mettre à jour les paramètres', NULL, NULL, NULL, NULL, NULL, '更新设置'),
(613, 'activated', 'Activated', 'Activado', 'مفعل', 'Activé', NULL, NULL, NULL, NULL, NULL, '活性'),
(614, 'motivational_speech', 'Motivational speech', 'Discurso motivacional', 'كلمة تحفيزية', 'Discours de motivation', NULL, NULL, NULL, NULL, NULL, '励志演讲'),
(615, 'image', 'Image', 'Imagen', 'صورة', 'Image', NULL, NULL, NULL, NULL, NULL, '图像'),
(616, 'upload_image', 'Upload image', 'Subir imagen', 'تحميل الصور', 'Télécharger une image', NULL, NULL, NULL, NULL, NULL, '上传图片'),
(617, 'save_changes', 'Save changes', 'Guardar cambios', 'احفظ التغييرات', 'Enregistrer les modifications', 'Save changes', NULL, 'Save changes', 'Save changes', NULL, '保存更改'),
(618, 'home_page_section', 'Home page section', 'Sección de la página de inicio', NULL, 'Section de la page d\'accueil', NULL, NULL, NULL, NULL, NULL, NULL),
(619, 'upcoming_course_section', 'Upcoming course section', 'Sección de cursos próximos', NULL, 'Section des cours à venir', NULL, NULL, NULL, NULL, NULL, NULL),
(620, 'top_course_section', 'Top course section', 'Sección de los mejores cursos', NULL, 'Section des meilleurs cours', NULL, NULL, NULL, NULL, NULL, NULL),
(621, 'latest_course_section', 'Latest course section', 'Sección de los cursos más recientes', NULL, 'Section des derniers cours', NULL, NULL, NULL, NULL, NULL, NULL),
(622, 'top_category_section', 'Top category section', 'Sección de las mejores categorías', NULL, 'Section des principales catégories', NULL, NULL, NULL, NULL, NULL, NULL),
(623, 'top_instructor_section', 'Top instructor section', 'Sección de los mejores instructores', NULL, 'Section des meilleurs instructeurs', NULL, NULL, NULL, NULL, NULL, NULL),
(624, 'faq_section', 'Faq section', 'Sección de preguntas frecuentes', NULL, 'Section FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(625, 'motivational_speech_section', 'Motivational speech section', 'Sección de discursos motivacionales', NULL, 'Section du discours de motivation', NULL, NULL, NULL, NULL, NULL, NULL),
(626, 'blog_visibility_on_the_home_page', 'Blog visibility on the home page', 'Visibilidad del blog en la página de inicio', 'رؤية المدونة على الصفحة الرئيسية', 'Visibilité du blog sur la page d\'accueil', NULL, NULL, NULL, NULL, NULL, 'Blog visibility on the home page'),
(627, 'promotional_section', 'Promotional section', 'Sección promocional', NULL, 'Section promotionnelle', NULL, NULL, NULL, NULL, NULL, NULL),
(628, 'question', 'Question', 'Pregunta', 'سؤال', 'Question', NULL, NULL, NULL, NULL, NULL, '问题'),
(629, 'contact_email', 'Contact email', 'Correo electrónico de contacto', NULL, 'E-mail de contact', NULL, NULL, NULL, NULL, NULL, NULL),
(630, 'phone_number', 'Phone number', 'Número de teléfono', NULL, 'Numéro de téléphone', NULL, NULL, NULL, NULL, NULL, NULL),
(631, 'recaptcha_settings', 'Recaptcha settings', 'Configuración de Recaptcha', 'إعدادات Recaptcha', 'Paramètres Recaptcha', NULL, NULL, NULL, NULL, NULL, '验证码设置'),
(632, 'recaptcha_status', 'Recaptcha status', 'Estado de Recaptcha', 'حالة Recaptcha', 'Statut Recaptcha', NULL, NULL, NULL, NULL, NULL, '验证码状态'),
(633, 'recaptcha_sitekey', 'Recaptcha sitekey', 'Clave del sitio Recaptcha', 'Recaptcha sitekey', 'Clé du site Recaptcha', NULL, NULL, NULL, NULL, NULL, '验证码站点密钥'),
(634, 'recaptcha_secretkey', 'Recaptcha secretkey', 'Clave secreta de Recaptcha', 'Recaptcha secretkey', 'Clé secrète Recaptcha', NULL, NULL, NULL, NULL, NULL, '验证码密钥'),
(635, 'update_recaptcha_settings', 'Update recaptcha settings', 'Actualizar configuraciones de Recaptcha', 'تحديث إعدادات recaptcha', 'Mettre à jour les paramètres Recaptcha', NULL, NULL, NULL, NULL, NULL, '更新验证码设置'),
(636, 'update_banner_image', 'Update banner image', 'Actualizar imagen del banner', 'تحديث صورة البانر', 'Mettre à jour l\'image de la bannière', NULL, NULL, NULL, NULL, NULL, '更新横幅图像'),
(637, 'upload_banner_image', 'Upload banner image', 'Subir imagen del banner', 'تحميل صورة البانر', 'Télécharger l\'image de la bannière', NULL, NULL, NULL, NULL, NULL, '上传横幅图片'),
(638, 'update_light_logo', 'Update light logo', 'Actualizar logo claro', 'تحديث الشعار الفاتح', 'Mettre à jour le logo clair', NULL, NULL, NULL, NULL, NULL, '更新灯光标志'),
(639, 'upload_light_logo', 'Upload light logo', 'Subir logo claro', 'تحميل شعار خفيف', 'Télécharger le logo clair', NULL, NULL, NULL, NULL, NULL, '上传灯光标志'),
(640, 'update_dark_logo', 'Update dark logo', 'Actualizar logo oscuro', 'تحديث الشعار الداكن', 'Mettre à jour le logo sombre', NULL, NULL, NULL, NULL, NULL, '更新深色徽标'),
(641, 'upload_dark_logo', 'Upload dark logo', 'Subir logo oscuro', 'تحميل الشعار الداكن', 'Télécharger le logo sombre', NULL, NULL, NULL, NULL, NULL, '上传深色徽标'),
(642, 'update_small_logo', 'Update small logo', 'Actualizar logo pequeño', 'تحديث الشعار الصغير', 'Mettre à jour le petit logo', NULL, NULL, NULL, NULL, NULL, '更新小标志'),
(643, 'upload_small_logo', 'Upload small logo', 'Subir logo pequeño', 'تحميل شعار صغير', 'Télécharger le petit logo', NULL, NULL, NULL, NULL, NULL, 'Upload small logo'),
(644, 'update_favicon', 'Update favicon', 'Actualizar favicon', 'تحديث favicon', 'Mettre à jour le favicon', NULL, NULL, NULL, NULL, NULL, 'Update favicon'),
(645, 'upload_favicon', 'Upload favicon', 'Subir favicon', 'تحميل الأيقونة المفضلة', 'Télécharger le favicon', NULL, NULL, NULL, NULL, NULL, 'Upload favicon'),
(646, 'you_can_modify_your_theme_style_and_add_external_embed_code_from_here', 'You can modify your theme style and add external embed code from here', 'Puedes modificar el estilo de tu tema y agregar código incrustado externo desde aquí', NULL, 'Vous pouvez modifier le style de votre thème et ajouter un code intégré externe ici.', NULL, NULL, NULL, NULL, NULL, NULL),
(647, 'enter_your_custom_css', 'Enter your custom css', 'Ingresa tu CSS personalizado', NULL, 'Entrez votre CSS personnalisé', NULL, NULL, NULL, NULL, NULL, NULL),
(648, 'only_css_code', 'Only css code', 'Solo código CSS', NULL, 'Uniquement du code CSS', NULL, NULL, NULL, NULL, NULL, NULL),
(649, 'these_codes_are_applicable_for_all_pages_of_the_frontend_site', 'These codes are applicable for all pages of the frontend site', 'Estos códigos son aplicables a todas las páginas del sitio frontal', NULL, 'Ces codes sont applicables à toutes les pages du site frontend', NULL, NULL, NULL, NULL, NULL, NULL),
(650, 'enter_your_embed_or_widget_code', 'Enter your embed or widget code', 'Ingresa tu código de incrustación o widget', NULL, 'Entrez votre code intégré ou widget', NULL, NULL, NULL, NULL, NULL, NULL),
(651, 'enter_your_embed_or_widget_code_here', 'Enter your embed or widget code here', 'Ingresa tu código de incrustación o widget aquí', NULL, 'Entrez votre code intégré ou widget ici', NULL, NULL, NULL, NULL, NULL, NULL),
(652, 'frontend_settings_updated', 'Frontend settings updated', 'Configuraciones del frontend actualizadas', 'تم تحديث إعدادات الواجهة الأمامية', 'Paramètres frontend mis à jour', NULL, NULL, NULL, NULL, NULL, 'Frontend settings updated'),
(653, 'manage_your_drip_content_settings', 'Manage your drip content settings', 'Gestiona la configuración de tu contenido de goteo', NULL, 'Gérez vos paramètres de contenu goutte à goutte', NULL, NULL, NULL, NULL, NULL, NULL),
(654, 'lesson_completion_role', 'Lesson completion role', 'Rol de finalización de lección', NULL, 'Rôle d\'achèvement de la leçon', NULL, NULL, NULL, NULL, NULL, NULL),
(655, 'video_percentage_wise', 'Video percentage wise', 'Porcentaje de video', NULL, 'En fonction du pourcentage de vidéo', NULL, NULL, NULL, NULL, NULL, NULL),
(656, 'video_duration_wise', 'Video duration wise', 'Duración del video', NULL, 'En fonction de la durée de la vidéo', NULL, NULL, NULL, NULL, NULL, NULL),
(657, 'minimum_duration_to_watch', 'Minimum duration to watch', 'Duración mínima para ver', NULL, 'Durée minimale à regarder', NULL, NULL, NULL, NULL, NULL, NULL),
(658, 'minimum_percentage_to_watch', 'Minimum percentage to watch', 'Porcentaje mínimo para ver', NULL, 'Pourcentage minimum à regarder', NULL, NULL, NULL, NULL, NULL, NULL),
(659, 'message_for_locked_lesson', 'Message for locked lesson', 'Mensaje para lección bloqueada', NULL, 'Message pour leçon verrouillée', NULL, NULL, NULL, NULL, NULL, NULL),
(660, 'attention', 'Attention', 'Atención', NULL, 'Attention', NULL, NULL, NULL, NULL, NULL, NULL),
(661, 'the_auto_checkmark_is_only_applicable_for_video_lessons', 'The auto checkmark is only applicable for video lessons', 'La marca de verificación automática solo es aplicable a las lecciones en video', NULL, 'La coche automatique n\'est applicable qu\'aux leçons vidéo', NULL, NULL, NULL, NULL, NULL, NULL),
(662, 'learn_more', 'Learn more', 'Aprender más', NULL, 'En savoir plus', NULL, NULL, NULL, NULL, NULL, '了解更多'),
(663, 'access_key', 'Access key', 'Clave de acceso', 'Access key', 'Clé d\'accès', NULL, NULL, NULL, NULL, NULL, NULL),
(664, 'secret_key', 'Secret key', 'Clave secreta', 'المفتاح السري', 'Clé secrète', 'Secret key', NULL, 'Secret key', 'Secret key', NULL, '密钥'),
(665, 'bucket_name', 'Bucket name', 'Nombre del bucket', 'Bucket name', 'Nom du compartiment', NULL, NULL, NULL, NULL, NULL, NULL),
(666, 'region_name', 'Region name', 'Nombre de la región', 'Region name', 'Nom de la région', NULL, NULL, NULL, NULL, NULL, NULL),
(667, 'bigbluebutton_live_class_settings', 'Bigbluebutton live class settings', 'Configuración de clases en vivo de Bigbluebutton', NULL, 'Paramètres des cours en direct BigBlueButton', NULL, NULL, NULL, NULL, NULL, NULL),
(668, 'bigbluebutton_endpoint', 'Bigbluebutton endpoint', 'Punto final de Bigbluebutton', NULL, 'Point de terminaison BigBlueButton', NULL, NULL, NULL, NULL, NULL, NULL),
(669, 'bigbluebutton_shared_secret_or_salt', 'Bigbluebutton shared secret or salt', 'Secreto compartido o sal de Bigbluebutton', NULL, 'Secret partagé ou sel BigBlueButton', NULL, NULL, NULL, NULL, NULL, NULL),
(670, 'setup_payment_informations', 'Setup payment informations', 'Configurar información de pago', NULL, 'Configurer les informations de paiement', NULL, NULL, NULL, NULL, NULL, NULL),
(671, 'system_currency_settings', 'System currency settings', 'Configuraciones de moneda del sistema', NULL, 'Paramètres de la devise du système', NULL, NULL, NULL, NULL, NULL, NULL),
(672, 'system_currency', 'System currency', 'Moneda del sistema', NULL, 'Devise du système', NULL, NULL, NULL, NULL, NULL, NULL),
(673, 'select_system_currency', 'Select system currency', 'Seleccionar moneda del sistema', NULL, 'Sélectionner la devise du système', NULL, NULL, NULL, NULL, NULL, NULL),
(674, 'currency_position', 'Currency position', 'Posición de la moneda', NULL, 'Position de la devise', NULL, NULL, NULL, NULL, NULL, NULL),
(675, 'left', 'Left', 'Izquierda', NULL, 'Gauche', NULL, NULL, NULL, NULL, NULL, NULL),
(676, 'right', 'Right', 'Derecha', NULL, 'Droite', NULL, NULL, NULL, NULL, NULL, NULL),
(677, 'left_with_a_space', 'Left with a space', 'Izquierda con espacio', NULL, 'Gauche avec un espace', NULL, NULL, NULL, NULL, NULL, NULL),
(678, 'right_with_a_space', 'Right with a space', 'Derecha con espacio', NULL, 'Droite avec un espace', NULL, NULL, NULL, NULL, NULL, NULL),
(679, 'update_system_currency', 'Update system currency', 'Actualizar moneda del sistema', NULL, 'Mettre à jour la devise du système', NULL, NULL, NULL, NULL, NULL, NULL),
(680, 'want_to_keep_test_mode_enabled', 'Want to keep test mode enabled', '¿Deseas mantener el modo de prueba habilitado?', NULL, 'Voulez-vous garder le mode test activé ?', NULL, NULL, NULL, NULL, NULL, NULL),
(681, 'select_currency', 'Select currency', 'Seleccionar moneda', NULL, 'Sélectionner la devise', NULL, NULL, NULL, NULL, NULL, NULL),
(682, 'sandbox_client_id', 'Sandbox client id', 'ID de cliente de Sandbox', 'معرف عميل Sandbox', 'ID client Sandbox', NULL, NULL, NULL, NULL, NULL, '沙盒客户端 ID'),
(683, 'sandbox_secret_key', 'Sandbox secret key', 'Clave secreta de Sandbox', 'المفتاح السري لوضع الحماية', 'Clé secrète Sandbox', NULL, NULL, NULL, NULL, NULL, '沙盒秘钥'),
(684, 'production_client_id', 'Production client id', 'ID de cliente de producción', 'معرف عميل الإنتاج', 'ID client Production', NULL, NULL, NULL, NULL, NULL, '生产客户 ID'),
(685, 'production_secret_key', 'Production secret key', 'Clave secreta de producción', 'مفتاح سر الإنتاج', 'Clé secrète Production', NULL, NULL, NULL, NULL, NULL, '生产密钥'),
(686, 'public_key', 'Public key', 'Clave pública', 'المفتاح العمومي', 'Clé publique', NULL, NULL, NULL, NULL, NULL, '公钥'),
(687, 'public_live_key', 'Public live key', 'Clave pública en vivo', 'مفتاح مباشر عام', 'Clé publique live', NULL, NULL, NULL, NULL, NULL, '公共直播密钥'),
(688, 'secret_live_key', 'Secret live key', 'Clave secreta en vivo', 'المفتاح السري المباشر', 'Clé secrète live', NULL, NULL, NULL, NULL, NULL, '秘密实时密钥'),
(689, 'key_id', 'Key id', 'ID de clave', 'معرف المفتاح', 'ID de clé', NULL, NULL, NULL, NULL, NULL, '钥匙编号'),
(690, 'theme_color', 'Theme color', 'Color del tema', 'لون الموضوع', 'Couleur du thème', NULL, NULL, NULL, NULL, NULL, '主题色'),
(691, 'api_key', 'Api key', 'Clave API', NULL, 'Clé API', NULL, NULL, NULL, NULL, NULL, NULL),
(692, 'other_parameter', 'Other parameter', 'Otro parámetro', NULL, 'Autre paramètre', NULL, NULL, NULL, NULL, NULL, NULL),
(693, 'pos_id', 'Pos id', 'ID de POS', NULL, 'ID POS', NULL, NULL, NULL, NULL, NULL, NULL),
(694, 'second_key', 'Second key', 'Segunda clave', NULL, 'Deuxième clé', NULL, NULL, NULL, NULL, NULL, NULL),
(695, 'client_id', 'Client id', 'ID de cliente', NULL, 'ID client', NULL, NULL, NULL, NULL, NULL, NULL),
(696, 'client_secret', 'Client secret', 'Secreto del cliente', NULL, 'Clé secrète client', NULL, NULL, NULL, NULL, NULL, NULL),
(697, 'store_id', 'Store id', 'ID de tienda', NULL, 'ID du magasin', NULL, NULL, NULL, NULL, NULL, NULL),
(698, 'store_password', 'Store password', 'Contraseña de la tienda', NULL, 'Mot de passe du magasin', NULL, NULL, NULL, NULL, NULL, NULL),
(699, 'skrill_merchant_email', 'Skrill merchant email', 'Correo electrónico del comerciante de Skrill', NULL, 'E-mail du marchand Skrill', NULL, NULL, NULL, NULL, NULL, NULL),
(700, 'secret_passphrase', 'Secret passphrase', 'Frase secreta', NULL, 'Phrase secrète', NULL, NULL, NULL, NULL, NULL, NULL),
(701, 'shared_key', 'Shared key', 'Clave compartida', NULL, 'Clé partagée', NULL, NULL, NULL, NULL, NULL, NULL),
(702, 'app_key', 'App key', 'Clave de la aplicación', NULL, 'Clé de l\'application', NULL, NULL, NULL, NULL, NULL, NULL),
(703, 'app_secret', 'App secret', 'Secreto de la aplicación', NULL, 'Secret de l\'application', NULL, NULL, NULL, NULL, NULL, NULL),
(704, 'username', 'Username', 'Nombre de usuario', NULL, 'Nom d\'utilisateur', NULL, NULL, NULL, NULL, NULL, NULL),
(705, 'merchant_id', 'Merchant id', 'ID de comerciante', NULL, 'ID du marchand', NULL, NULL, NULL, NULL, NULL, NULL),
(706, 'merchant_password', 'Merchant password', 'Contraseña del comerciante', NULL, 'Mot de passe du marchand', NULL, NULL, NULL, NULL, NULL, NULL),
(707, 'signature_key', 'Signature key', 'Clave de firma', NULL, 'Clé de signature', NULL, NULL, NULL, NULL, NULL, NULL),
(708, 'api_secret', 'Api secret', 'Secreto API', NULL, 'Clé secrète API', NULL, NULL, NULL, NULL, NULL, NULL),
(709, 'ensure_that_the_system_currency_and_all_active_payment_gateway_currencies_are_same', 'Ensure that the system currency and all active payment gateway currencies are same', 'Asegúrate de que la moneda del sistema y todas las monedas de las pasarelas de pago activas sean las mismas', NULL, 'Assurez-vous que la devise du système et toutes les devises des passerelles de paiement actives sont identiques', NULL, NULL, NULL, NULL, NULL, NULL),
(710, 'multi_language_settings', 'Multi language settings', 'Configuraciones multilingües', 'Multi language settings', 'Paramètres multilingues', NULL, 'Multi language settings', NULL, NULL, NULL, 'Multi language settings'),
(711, 'manage_language', 'Manage language', 'Gestionar idioma', 'Manage language', 'Gérer la langue', NULL, 'Manage language', NULL, NULL, NULL, 'Manage language'),
(712, 'language_list', 'Language list', 'Lista de idiomas', 'Language list', 'Liste des langues', NULL, 'Language list', NULL, NULL, NULL, 'Language list'),
(713, 'add_language', 'Add language', 'Agregar idioma', 'Add language', 'Ajouter une langue', NULL, 'Add language', NULL, NULL, NULL, 'Add language'),
(714, 'import_language', 'Import language', 'Importar idioma', 'Import language', 'Importer une langue', NULL, 'Import language', NULL, NULL, NULL, 'Import language'),
(715, 'direction', 'Direction', 'Dirección', 'Direction', 'Direction', NULL, 'Direction', NULL, NULL, NULL, NULL),
(716, 'option', 'Option', 'Opción', 'خيار', 'Option', NULL, 'Option', NULL, NULL, NULL, '选项'),
(717, 'ltr', 'Ltr', 'Izquierda a derecha', 'Ltr', 'LTR', NULL, 'Ltr', NULL, NULL, NULL, NULL),
(718, 'rtl', 'Rtl', 'Derecha a izquierda', 'Rtl', 'RTL', NULL, 'Rtl', NULL, NULL, NULL, NULL),
(719, 'edit_phrase', 'Edit phrase', 'Editar frase', 'Edit phrase', 'Modifier la phrase', NULL, 'Edit phrase', NULL, NULL, NULL, '编辑短语'),
(720, 'export', 'Export', 'Exportar', 'Export', 'Exporter', NULL, 'Export', NULL, NULL, NULL, '出口'),
(721, 'delete_language', 'Delete language', 'Eliminar idioma', 'Delete language', 'Supprimer la langue', NULL, 'Delete language', NULL, NULL, NULL, '删除语言'),
(722, 'add_new_phrase', 'Add new phrase', 'Agregar nueva frase', 'Add new phrase', 'Ajouter une nouvelle phrase', NULL, 'Add new phrase', NULL, NULL, NULL, '添加新短语'),
(723, 'add_new_language', 'Add new language', 'Agregar nuevo idioma', 'Add new language', 'Ajouter une nouvelle langue', NULL, 'Add new language', NULL, NULL, NULL, '添加新语言'),
(724, 'no_special_character_or_space_is_allowed', 'No special character or space is allowed', 'No se permiten caracteres especiales ni espacios', 'No special character or space is allowed', 'Aucun caractère spécial ou espace n\'est autorisé', NULL, 'No special character or space is allowed', NULL, NULL, NULL, '不允许使用特殊字符或空格'),
(725, 'valid_examples', 'Valid examples', 'Ejemplos válidos', 'Valid examples', 'Exemples valides', NULL, 'Valid examples', NULL, NULL, NULL, '有效示例'),
(726, 'choose_your_json_file', 'Choose your json file', 'Elige tu archivo JSON', 'Choose your json file', 'Choisissez votre fichier JSON', NULL, 'Choose your json file', NULL, NULL, NULL, '选择您的 json 文件'),
(727, 'import', 'Import', 'Importar', 'Import', 'Importer', NULL, 'Import', NULL, NULL, NULL, '进口'),
(728, 'phrase_updated', 'Phrase updated', 'Frase actualizada', 'Phrase updated', 'Phrase mise à jour', NULL, 'Phrase updated', NULL, NULL, NULL, '短语已更新'),
(729, 'we_would_love_to_hear_from_you!', 'We would love to hear from you!', '¡Nos encantaría saber de ti!', NULL, 'Nous aimerions avoir de vos nouvelles !', NULL, NULL, NULL, NULL, NULL, NULL),
(730, 'your_message', 'Your message', 'Tu mensaje', NULL, 'Votre message', NULL, NULL, NULL, NULL, NULL, NULL),
(731, 'i_am_sure,_it_will_look_great!', 'I am sure, it will look great!', '¡Estoy seguro de que se verá genial!', NULL, 'Je suis sûr que cela aura fière allure !', NULL, NULL, NULL, NULL, NULL, NULL),
(732, 'send', 'Send', 'Enviar', 'يرسل', 'Envoyer', NULL, NULL, NULL, NULL, NULL, 'Send'),
(733, 'whatsapp', 'WhatsApp', 'WhatsApp', NULL, 'WhatsApp', NULL, NULL, NULL, NULL, NULL, NULL),
(734, 'location', 'Location', 'Ubicación', NULL, 'Localisation', NULL, NULL, NULL, NULL, NULL, NULL),
(735, 'follow_us_on', 'Follow us on', 'Síguenos en', NULL, 'Suivez-nous sur', NULL, NULL, NULL, NULL, NULL, NULL),
(736, 'for_customers', 'For customers', 'Para clientes', NULL, 'Pour les clients', NULL, NULL, NULL, NULL, NULL, NULL),
(737, 'for_instructors', 'For instructors', 'Para instructores', NULL, 'Pour les instructeurs', NULL, NULL, NULL, NULL, NULL, NULL),
(738, 'get_help', 'Get help', 'Obtener ayuda', NULL, 'Obtenir de l\'aide', NULL, NULL, NULL, NULL, NULL, NULL),
(739, 'explore', 'Explore', 'Explorar', NULL, 'Explorer', NULL, NULL, NULL, NULL, NULL, NULL),
(740, 'company', 'Company', 'Compañía', NULL, 'Entreprise', NULL, NULL, NULL, NULL, NULL, NULL),
(741, 'policy', 'Policy', 'Política', NULL, 'Politique', NULL, NULL, NULL, NULL, NULL, NULL),
(742, 'instructor\'s_courses', 'Instructor\'s courses', 'Cursos del instructor', NULL, 'Cours de l\'instructeur', NULL, NULL, NULL, NULL, NULL, NULL),
(743, 'my_courses', 'My courses', 'Mis cursos', 'دوراتي', 'Mes cours', NULL, NULL, NULL, NULL, NULL, '我的课程'),
(744, 'no_courses_found', 'No courses found', 'No se encontraron cursos', NULL, 'Aucun cours trouvé', NULL, NULL, NULL, NULL, NULL, NULL),
(745, 'rating', 'Rating', 'Calificación', NULL, 'Évaluation', NULL, NULL, NULL, NULL, NULL, NULL),
(746, 'select_category', 'Select category', 'Seleccionar categoría', NULL, 'Sélectionner une catégorie', NULL, NULL, NULL, NULL, NULL, NULL),
(747, 'search_results_for', 'Search results for', 'Resultados de búsqueda para', NULL, 'Résultats de recherche pour', NULL, NULL, NULL, NULL, NULL, NULL),
(748, 'students_also_bought', 'Students also bought', 'Los estudiantes también compraron', NULL, 'Les étudiants ont également acheté', NULL, NULL, NULL, NULL, NULL, NULL),
(749, 'enroll_now', 'Enroll now', 'Inscribirse ahora', 'تسجيل الآن', 'Inscrivez-vous maintenant', NULL, NULL, NULL, NULL, NULL, '现在报名'),
(750, 'more_courses', 'More courses', 'Más cursos', NULL, 'Plus de cours', NULL, NULL, NULL, NULL, NULL, NULL),
(751, 'start_course', 'Start course', 'Iniciar curso', NULL, 'Commencer le cours', NULL, NULL, NULL, NULL, NULL, NULL),
(752, 'enter_password', 'Enter password', 'Introduce la contraseña', NULL, 'Entrez le mot de passe', NULL, NULL, NULL, NULL, NULL, NULL),
(753, 'enter_email', 'Enter email', 'Introduce el correo electrónico', NULL, 'Entrez l\'e-mail', NULL, NULL, NULL, NULL, NULL, NULL),
(754, 'valid_email', 'Valid email', 'Correo electrónico válido', NULL, 'E-mail valide', NULL, NULL, NULL, NULL, NULL, NULL),
(755, 'register', 'Register', 'Registrarse', NULL, 'S\'inscrire', NULL, NULL, NULL, NULL, NULL, NULL),
(756, 'subscribe', 'Subscribe', 'Suscribirse', NULL, 'S\'abonner', NULL, NULL, NULL, NULL, NULL, NULL),
(757, 'your_email_address', 'Your email address', 'Tu dirección de correo electrónico', NULL, 'Votre adresse e-mail', NULL, NULL, NULL, NULL, NULL, NULL),
(758, 'enter_your_password', 'Enter your password', 'Introduce tu contraseña', NULL, 'Entrez votre mot de passe', NULL, NULL, NULL, NULL, NULL, NULL),
(759, 'check_your_email', 'Check your email', 'Revisa tu correo electrónico', NULL, 'Vérifiez votre e-mail', NULL, NULL, NULL, NULL, NULL, NULL),
(760, 'email_has_been_sent', 'Email has been sent', 'El correo ha sido enviado', NULL, 'L\'e-mail a été envoyé', NULL, NULL, NULL, NULL, NULL, NULL),
(761, 'go_to_login_page', 'Go to login page', 'Ir a la página de inicio de sesión', NULL, 'Aller à la page de connexion', NULL, NULL, NULL, NULL, NULL, NULL),
(762, 'continue_with_facebook', 'Continue with Facebook', 'Continuar con Facebook', NULL, 'Continuer avec Facebook', NULL, NULL, NULL, NULL, NULL, NULL),
(763, 'continue_with_google', 'Continue with Google', 'Continuar con Google', NULL, 'Continuer avec Google', NULL, NULL, NULL, NULL, NULL, NULL),
(764, 'continue_with_twitter', 'Continue with Twitter', 'Continuar con Twitter', NULL, 'Continuer avec Twitter', NULL, NULL, NULL, NULL, NULL, NULL),
(765, 'full_name', 'Full name', 'Nombre completo', NULL, 'Nom complet', NULL, NULL, NULL, NULL, NULL, NULL),
(766, 'your_name', 'Your name', 'Tu nombre', NULL, 'Votre nom', NULL, NULL, NULL, NULL, NULL, NULL),
(767, 'write_your_review', 'Write your review', 'Escribe tu reseña', NULL, 'Rédigez votre avis', NULL, NULL, NULL, NULL, NULL, NULL),
(768, 'rate_this_course', 'Rate this course', 'Califica este curso', NULL, 'Évaluez ce cours', NULL, NULL, NULL, NULL, NULL, NULL),
(769, 'submit_review', 'Submit review', 'Enviar reseña', NULL, 'Soumettre l\'avis', NULL, NULL, NULL, NULL, NULL, NULL),
(770, 'view_details', 'View details', 'Ver detalles', 'عرض التفاصيل', 'Voir les détails', NULL, NULL, NULL, NULL, NULL, 'View details'),
(771, 'add_to_wishlist', 'Add to wishlist', 'Agregar a la lista de deseos', 'أضف إلى قائمة الامنيات', 'Ajouter à la liste de souhaits', NULL, NULL, NULL, NULL, NULL, '添加到愿望清单'),
(772, 'added_to_wishlist', 'Added to wishlist', 'Agregado a la lista de deseos', 'أضيف لقائمة الأماني', 'Ajouté à la liste de souhaits', NULL, NULL, NULL, NULL, NULL, '已添加至愿望清单'),
(773, 'remove_from_wishlist', 'Remove from wishlist', 'Eliminar de la lista de deseos', NULL, 'Retirer de la liste de souhaits', NULL, NULL, NULL, NULL, NULL, NULL),
(774, 'back_to_course', 'Back to course', 'Volver al curso', NULL, 'Retour au cours', NULL, NULL, NULL, NULL, NULL, NULL),
(775, 'lecture_name', 'Lecture name', 'Nombre de la lección', NULL, 'Nom de la leçon', NULL, NULL, NULL, NULL, NULL, NULL),
(776, 'duration', 'Duration', 'Duración', 'مدة', 'Durée', NULL, NULL, NULL, NULL, NULL, 'Duration'),
(777, 'no_courses_in_your_wishlist!', 'No courses in your wishlist!', '¡No hay cursos en tu lista de deseos!', NULL, 'Aucun cours dans votre liste de souhaits !', NULL, NULL, NULL, NULL, NULL, NULL),
(778, 'no_lessons_in_your_course!', 'No lessons in your course!', '¡No hay lecciones en tu curso!', NULL, 'Aucune leçon dans votre cours !', NULL, NULL, NULL, NULL, NULL, NULL),
(779, 'message_us', 'Message us', 'Envíanos un mensaje', NULL, 'Envoyez-nous un message', NULL, NULL, NULL, NULL, NULL, NULL),
(780, 'edit_profile', 'Edit profile', 'Editar perfil', NULL, 'Modifier le profil', NULL, NULL, NULL, NULL, NULL, NULL),
(781, 'view_courses', 'View courses', 'Ver cursos', 'عرض الدورات', 'Voir les cours', NULL, NULL, NULL, NULL, NULL, 'View courses'),
(782, 'open_the_app', 'Open the app', 'Abrir la aplicación', NULL, 'Ouvrir l\'application', NULL, NULL, NULL, NULL, NULL, NULL),
(783, 'instructor_dashboard', 'Instructor dashboard', 'Panel de instructor', NULL, 'Tableau de bord instructeur', NULL, NULL, NULL, NULL, NULL, NULL),
(784, 'learners', 'Learners', 'Aprendices', NULL, 'Apprenants', NULL, NULL, NULL, NULL, NULL, NULL),
(785, 'sign_out', 'Sign out', 'Cerrar sesión', NULL, 'Se déconnecter', NULL, NULL, NULL, NULL, NULL, NULL),
(786, 'already_have_an_account', 'Already have an account?', '¿Ya tienes una cuenta?', NULL, 'Vous avez déjà un compte', NULL, NULL, NULL, NULL, NULL, NULL),
(787, 'dont_have_an_account', 'Don\'t have an account?', '¿No tienes una cuenta?', NULL, 'Vous n\'avez pas de compte', NULL, NULL, NULL, NULL, NULL, NULL),
(788, 'enter_first_name', 'Enter first name', 'Introduce el primer nombre', NULL, 'Entrez le prénom', NULL, NULL, NULL, NULL, NULL, NULL),
(789, 'enter_last_name', 'Enter last name', 'Introduce el apellido', NULL, 'Entrez le nom', NULL, NULL, NULL, NULL, NULL, NULL),
(790, 'enter_your_username', 'Enter your username', 'Introduce tu nombre de usuario', NULL, 'Entrez votre nom d\'utilisateur', NULL, NULL, NULL, NULL, NULL, NULL),
(791, 'we_will_never_share_your_email_with_anyone_else', 'We will never share your email with anyone else', 'Nunca compartiremos tu correo electrónico con nadie más', NULL, 'Nous ne partagerons jamais votre e-mail avec personne d\'autre', NULL, NULL, NULL, NULL, NULL, NULL),
(792, 'reset_password', 'Reset password', 'Restablecer contraseña', NULL, 'Réinitialiser le mot de passe', NULL, NULL, NULL, NULL, NULL, NULL),
(793, 'verify', 'Verify', 'Verificar', NULL, 'Vérifier', NULL, NULL, NULL, NULL, NULL, NULL),
(794, 'change_password', 'Change password', 'Cambiar contraseña', NULL, 'Changer le mot de passe', NULL, NULL, NULL, NULL, NULL, NULL),
(795, 'my_wishlist', 'My wishlist', 'Mi lista de deseos', 'قائمة امنياتي', 'Ma liste de souhaits', NULL, NULL, NULL, NULL, NULL, '我的收藏'),
(796, 'wishlist_empty', 'Wishlist empty', 'Lista de deseos vacía', NULL, 'Liste de souhaits vide', NULL, NULL, NULL, NULL, NULL, NULL),
(797, 'updating_your_profile', 'Updating your profile', 'Actualizando tu perfil', NULL, 'Mise à jour de votre profil', NULL, NULL, NULL, NULL, NULL, NULL),
(798, 'order', 'Order', 'Orden', NULL, 'Commande', NULL, NULL, NULL, NULL, NULL, NULL),
(799, 'instructors_bio', 'Instructor\'s bio', 'Biografía del instructor', NULL, 'Biographie des instructeurs', NULL, NULL, NULL, NULL, NULL, NULL),
(800, 'education', 'Education', 'Educación', NULL, 'Éducation', NULL, NULL, NULL, NULL, NULL, NULL),
(801, 'experience', 'Experience', 'Experiencia', NULL, 'Expérience', NULL, NULL, NULL, NULL, NULL, NULL),
(802, 'by', 'By', 'Por', 'بواسطة', 'Par', NULL, NULL, NULL, NULL, NULL, '经过'),
(803, 'please_fill_all_the_fields', 'Please fill all the fields', 'Por favor, completa todos los campos', NULL, 'Veuillez remplir tous les champs', NULL, NULL, NULL, NULL, NULL, NULL),
(804, 'payment', 'Payment', 'Pago', NULL, 'Paiement', NULL, NULL, NULL, NULL, NULL, NULL),
(805, 'contact_support', 'Contact support', 'Contactar soporte', NULL, 'Contacter le support', NULL, NULL, NULL, NULL, NULL, NULL),
(806, 'error', 'Error', 'Error', NULL, 'Erreur', NULL, NULL, NULL, NULL, NULL, NULL),
(807, 'close_all', 'Close all', 'Cerrar todo', NULL, 'Tout fermer', NULL, NULL, NULL, NULL, NULL, NULL),
(808, 'start_a_course', 'Start a course', 'Iniciar un curso', NULL, 'Commencer un cours', NULL, NULL, NULL, NULL, NULL, NULL),
(809, 'certificates', 'Certificates', 'Certificados', NULL, 'Certificats', NULL, NULL, NULL, NULL, NULL, NULL),
(810, 'view_certificate', 'View certificate', 'Ver certificado', NULL, 'Voir le certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(811, 'course_certificate', 'Course certificate', 'Certificado del curso', NULL, 'Certificat du cours', NULL, NULL, NULL, NULL, NULL, NULL),
(812, 'quizzes', 'Quizzes', 'Cuestionarios', 'الإختبارات', 'Quiz', NULL, NULL, NULL, NULL, NULL, '测验'),
(813, 'quiz', 'Quiz', 'Cuestionario', 'اختبار', 'Questionnaire', NULL, NULL, NULL, NULL, NULL, 'Quiz'),
(814, 'attachments', 'Attachments', 'Archivos adjuntos', NULL, 'Pièces jointes', NULL, NULL, NULL, NULL, NULL, NULL),
(815, 'no_data_available', 'No data available', 'No hay datos disponibles', NULL, 'Pas de données disponibles', NULL, NULL, NULL, NULL, NULL, NULL),
(816, 'quiz_title', 'Quiz title', 'Título del cuestionario', NULL, 'Titre du quiz', NULL, NULL, NULL, NULL, NULL, NULL),
(817, 'start_quiz', 'Start quiz', 'Iniciar cuestionario', NULL, 'Commencer le quiz', NULL, NULL, NULL, NULL, NULL, NULL),
(818, 'take_this_course', 'Take this course', 'Tomar este curso', NULL, 'Suivre ce cours', NULL, NULL, NULL, NULL, NULL, NULL),
(819, 'course_content', 'Course content', 'Contenido del curso', 'محتوى الدورة', 'Contenu du cours', NULL, NULL, NULL, NULL, NULL, '课程内容'),
(820, 'lecture', 'Lecture', 'Conferencia', NULL, 'Leçon', NULL, NULL, NULL, NULL, NULL, NULL),
(821, 'student_feedback', 'Student feedback', 'Comentarios de los estudiantes', 'ملاحظات الطلاب', 'Retour des étudiants', NULL, NULL, NULL, NULL, NULL, '学生反馈'),
(822, 'number_of_students_enrolled', 'Number of students enrolled', 'Número de estudiantes inscritos', NULL, 'Nombre d\'étudiants inscrits', NULL, NULL, NULL, NULL, NULL, NULL),
(823, 'student_enrollment', 'Student enrollment', 'Inscripción de estudiantes', NULL, 'Inscription des étudiants', NULL, NULL, NULL, NULL, NULL, NULL),
(824, 'report_this_course', 'Report this course', 'Reportar este curso', NULL, 'Signaler ce cours', NULL, NULL, NULL, NULL, NULL, NULL),
(825, 'share_this_course', 'Share this course', 'Compartir este curso', NULL, 'Partager ce cours', NULL, NULL, NULL, NULL, NULL, NULL),
(826, 'copy_link', 'Copy link', 'Copiar enlace', NULL, 'Copier le lien', NULL, NULL, NULL, NULL, NULL, NULL),
(827, 'course_reviews', 'Course reviews', 'Reseñas del curso', NULL, 'Avis sur le cours', NULL, NULL, NULL, NULL, NULL, NULL),
(828, 'course_requirements', 'Course requirements', 'Requisitos del curso', 'متطلبات الدورة', 'Exigences du cours', NULL, NULL, NULL, NULL, NULL, 'Course requirements'),
(829, 'lessons_learned', 'Lessons learned', 'Lecciones aprendidas', NULL, 'Leçons apprises', NULL, NULL, NULL, NULL, NULL, NULL),
(830, 'number_of_reviews', 'Number of reviews', 'Número de reseñas', NULL, 'Nombre d\'avis', NULL, NULL, NULL, NULL, NULL, '评论数量'),
(831, 'number_of_instructors', 'Number of instructors', 'Número de instructores', NULL, 'Nombre d\'instructeurs', NULL, NULL, NULL, NULL, NULL, NULL),
(832, 'number_of_courses_in_progress', 'Number of courses in progress', 'Número de cursos en progreso', NULL, 'Nombre de cours en cours', NULL, NULL, NULL, NULL, NULL, NULL),
(833, 'number_of_courses_completed', 'Number of courses completed', 'Número de cursos completados', NULL, 'Nombre de cours terminés', NULL, NULL, NULL, NULL, NULL, NULL),
(834, 'hours_of_instruction', 'Hours of instruction', 'Horas de instrucción', NULL, 'Heures d\'instruction', NULL, NULL, NULL, NULL, NULL, NULL),
(835, 'number_of_lectures', 'Number of lectures', 'Número de conferencias', NULL, 'Nombre de leçons', NULL, NULL, NULL, NULL, NULL, NULL),
(836, 'hours_of_content', 'Hours of content', 'Horas de contenido', NULL, 'Heures de contenu', NULL, NULL, NULL, NULL, NULL, NULL),
(837, 'percentage_completion', 'Percentage completion', 'Porcentaje de finalización', NULL, 'Pourcentage de complétion', NULL, NULL, NULL, NULL, NULL, NULL),
(838, 'total_number_of_students', 'Total number of students', 'Número total de estudiantes', NULL, 'Nombre total d\'étudiants', NULL, NULL, NULL, NULL, NULL, NULL),
(839, 'course_instructor', 'Course instructor', 'Instructor del curso', NULL, 'Instructeur du cours', NULL, NULL, NULL, NULL, NULL, NULL),
(840, 'course_outcomes', 'Course outcomes', 'Resultados del curso', 'نتائج الدورة', 'Résultats du cours', NULL, NULL, NULL, NULL, NULL, 'Course outcomes'),
(841, 'your_learning_objectives', 'Your learning objectives', 'Tus objetivos de aprendizaje', NULL, 'Vos objectifs d\'apprentissage', NULL, NULL, NULL, NULL, NULL, NULL),
(842, 'start_learning', 'Start learning', 'Comenzar a aprender', NULL, 'Commencer à apprendre', NULL, NULL, NULL, NULL, NULL, NULL),
(843, 'back_to_my_courses', 'Back to my courses', 'Volver a mis cursos', NULL, 'Retour à mes cours', NULL, NULL, NULL, NULL, NULL, NULL),
(844, 'duration_of_the_course', 'Duration of the course', 'Duración del curso', NULL, 'Durée du cours', NULL, NULL, NULL, NULL, NULL, NULL),
(845, 'number_of_lessons_in_course', 'Number of lessons in course', 'Número de lecciones en el curso', NULL, 'Nombre de leçons dans le cours', NULL, NULL, NULL, NULL, NULL, NULL),
(846, 'my_profile', 'My profile', 'Mi perfil', NULL, 'Mon profil', NULL, NULL, NULL, NULL, NULL, NULL),
(847, 'edit_your_profile', 'Edit your profile', 'Edita tu perfil', NULL, 'Modifier votre profil', NULL, NULL, NULL, NULL, NULL, NULL),
(848, 'account_settings', 'Account settings', 'Configuración de la cuenta', NULL, 'Paramètres du compte', NULL, NULL, NULL, NULL, NULL, NULL),
(849, 'delete_account', 'Delete account', 'Eliminar cuenta', NULL, 'Supprimer le compte', NULL, NULL, NULL, NULL, NULL, NULL),
(850, 'course_search', 'Course search', 'Búsqueda de curso', NULL, 'Recherche de cours', NULL, NULL, NULL, NULL, NULL, NULL),
(851, 'showing_results_for', 'Showing results for', 'Mostrando resultados para', NULL, 'Affichage des résultats pour', NULL, NULL, NULL, NULL, NULL, NULL),
(852, 'courses_found', 'Courses found', 'Cursos encontrados', NULL, 'Cours trouvés', NULL, NULL, NULL, NULL, NULL, NULL),
(853, 'add_to_cart_button', 'Add to cart button', 'Botón agregar al carrito', NULL, 'Bouton Ajouter au panier', NULL, NULL, NULL, NULL, NULL, NULL),
(854, 'cart_button', 'Cart button', 'Botón del carrito', NULL, 'Bouton Panier', NULL, NULL, NULL, NULL, NULL, NULL),
(855, 'buy_button', 'Buy button', 'Botón de compra', NULL, 'Bouton Acheter', NULL, NULL, NULL, NULL, NULL, NULL),
(856, 'add_to_wishlist_button', 'Add to wishlist button', 'Botón agregar a la lista de deseos', NULL, 'Bouton Ajouter à la liste de souhaits', NULL, NULL, NULL, NULL, NULL, NULL),
(857, 'wishlist_button', 'Wishlist button', 'Botón de la lista de deseos', NULL, 'Bouton Liste de souhaits', NULL, NULL, NULL, NULL, NULL, NULL),
(858, 'share_button', 'Share button', 'Botón compartir', NULL, 'Bouton Partager', NULL, NULL, NULL, NULL, NULL, NULL),
(859, 'apply_coupon_button', 'Apply coupon button', 'Botón aplicar cupón', NULL, 'Bouton Appliquer le coupon', NULL, NULL, NULL, NULL, NULL, NULL),
(860, 'apply_button', 'Apply button', 'Botón aplicar', NULL, 'Bouton Appliquer', NULL, NULL, NULL, NULL, NULL, NULL),
(861, 'remove_button', 'Remove button', 'Botón eliminar', NULL, 'Bouton Retirer', NULL, NULL, NULL, NULL, NULL, NULL),
(862, 'message_button', 'Message button', 'Botón mensaje', NULL, 'Bouton Message', NULL, NULL, NULL, NULL, NULL, NULL),
(863, 'view_button', 'View button', 'Botón ver', NULL, 'Bouton Voir', NULL, NULL, NULL, NULL, NULL, NULL),
(864, 'save_button', 'Save button', 'Botón guardar', NULL, 'Bouton Enregistrer', NULL, NULL, NULL, NULL, NULL, NULL),
(865, 'continue_button', 'Continue button', 'Botón continuar', NULL, 'Bouton Continuer', NULL, NULL, NULL, NULL, NULL, NULL),
(866, 'cancel_button', 'Cancel button', 'Botón cancelar', NULL, 'Bouton Annuler', NULL, NULL, NULL, NULL, NULL, NULL),
(867, 'confirm_button', 'Confirm button', 'Botón confirmar', NULL, 'Bouton Confirmer', NULL, NULL, NULL, NULL, NULL, NULL),
(868, 'submit_button', 'Submit button', 'Botón enviar', NULL, 'Bouton Soumettre', NULL, NULL, NULL, NULL, NULL, NULL),
(869, 'contact_button', 'Contact button', 'Botón contactar', NULL, 'Bouton Contact', NULL, NULL, NULL, NULL, NULL, NULL),
(870, 'start_button', 'Start button', 'Botón iniciar', NULL, 'Bouton Commencer', NULL, NULL, NULL, NULL, NULL, NULL),
(871, 'complete_button', 'Complete button', 'Botón completar', NULL, 'Bouton Terminer', NULL, NULL, NULL, NULL, NULL, NULL),
(872, 'next_button', 'Next button', 'Botón siguiente', NULL, 'Bouton Suivant', NULL, NULL, NULL, NULL, NULL, NULL),
(873, 'back_button', 'Back button', 'Botón volver', NULL, 'Bouton Précédent', NULL, NULL, NULL, NULL, NULL, NULL),
(874, 'previous_button', 'Previous button', 'Botón anterior', NULL, 'Bouton Précédent', NULL, NULL, NULL, NULL, NULL, NULL),
(875, 'start_now', 'Start now', 'Comienza ahora', 'ابدأ الآن', 'Commencer maintenant', NULL, NULL, NULL, NULL, NULL, '现在开始'),
(876, 'take_quiz', 'Take quiz', 'Tomar cuestionario', NULL, 'Passer le quiz', NULL, NULL, NULL, NULL, NULL, NULL),
(877, 'submit_quiz', 'Submit quiz', 'Enviar cuestionario', NULL, 'Soumettre le quiz', NULL, NULL, NULL, NULL, NULL, NULL),
(878, 'your_score', 'Your score', 'Tu puntuación', NULL, 'Votre score', NULL, NULL, NULL, NULL, NULL, NULL),
(879, 'quiz_completed', 'Quiz completed', 'Cuestionario completado', NULL, 'Quiz terminé', NULL, NULL, NULL, NULL, NULL, NULL),
(880, 'view_results', 'View results', 'Ver resultados', NULL, 'Voir les résultats', NULL, NULL, NULL, NULL, NULL, NULL),
(881, 'you_have_completed_the_course', 'You have completed the course', 'Has completado el curso', NULL, 'Vous avez terminé le cours', NULL, NULL, NULL, NULL, NULL, NULL),
(882, 'view_certificate_button', 'View certificate button', 'Botón ver certificado', NULL, 'Bouton Voir le certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(883, 'certificate_of_completion', 'Certificate of completion', 'Certificado de finalización', NULL, 'Certificat de réussite', NULL, NULL, NULL, NULL, NULL, NULL),
(884, 'claim_your_certificate', 'Claim your certificate', 'Reclama tu certificado', NULL, 'Réclamer votre certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(885, 'print_certificate', 'Print certificate', 'Imprimir certificado', NULL, 'Imprimer le certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(886, 'download_certificate', 'Download certificate', 'Descargar certificado', NULL, 'Télécharger le certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(887, 'review_certificate', 'Review certificate', 'Revisar certificado', NULL, 'Examiner le certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(888, 'issued_by', 'Issued by', 'Emitido por', NULL, 'Délivré par', NULL, NULL, NULL, NULL, NULL, NULL),
(889, 'date_of_issue', 'Date of issue', 'Fecha de emisión', NULL, 'Date d\'émission', NULL, NULL, NULL, NULL, NULL, '签发日期'),
(890, 'student_name', 'Student name', 'Nombre del estudiante', NULL, 'Nom de l\'étudiant', NULL, NULL, NULL, NULL, NULL, NULL),
(891, 'course_name', 'Course name', 'Nombre del curso', NULL, 'Nom du cours', NULL, NULL, NULL, NULL, NULL, NULL),
(892, 'certificate_id', 'Certificate ID', 'ID del certificado', NULL, 'ID du certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(893, 'certificate_details', 'Certificate details', 'Detalles del certificado', NULL, 'Détails du certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(894, 'this_certificate_is_awarded_to', 'This certificate is awarded to', 'Este certificado es otorgado a', NULL, 'Ce certificat est décerné à', NULL, NULL, NULL, NULL, NULL, NULL),
(895, 'in_recognition_of', 'In recognition of', 'En reconocimiento de', NULL, 'En reconnaissance de', NULL, NULL, NULL, NULL, NULL, NULL),
(896, 'successful_completion_of', 'Successful completion of', 'La finalización exitosa de', NULL, 'Réussite du', NULL, NULL, NULL, NULL, NULL, NULL),
(897, 'certification_of_completion', 'Certification of completion', 'Certificación de finalización', NULL, 'Certification de réussite', NULL, NULL, NULL, NULL, NULL, NULL),
(898, 'verify_your_certificate', 'Verify your certificate', 'Verifica tu certificado', NULL, 'Vérifiez votre certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(899, 'certificate_verification', 'Certificate verification', 'Verificación del certificado', NULL, 'Vérification du certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(900, 'certificate_verification_instructions', 'Certificate verification instructions', 'Instrucciones de verificación del certificado', NULL, 'Instructions de vérification du certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(901, 'certificate_verification_code', 'Certificate verification code', 'Código de verificación del certificado', NULL, 'Code de vérification du certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(902, 'view_more', 'View more', 'Ver más', 'عرض المزيد', 'Voir plus', NULL, NULL, NULL, NULL, NULL, '查看更多'),
(903, 'certificate_of_achievement', 'Certificate of achievement', 'Certificado de logro', NULL, 'Certificat d\'accomplissement', NULL, NULL, NULL, NULL, NULL, NULL),
(904, 'certificate_of_excellence', 'Certificate of excellence', 'Certificado de excelencia', NULL, 'Certificat d\'excellence', NULL, NULL, NULL, NULL, NULL, NULL),
(905, 'certificate_of_participation', 'Certificate of participation', 'Certificado de participación', NULL, 'Certificat de participation', NULL, NULL, NULL, NULL, NULL, NULL),
(906, 'certificate_template', 'Certificate template', 'Plantilla de certificado', NULL, 'Modèle de certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(907, 'certificate_design', 'Certificate design', 'Diseño de certificado', NULL, 'Design du certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(908, 'customize_certificate', 'Customize certificate', 'Personalizar certificado', NULL, 'Personnaliser le certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(909, 'download_your_certificate', 'Download your certificate', 'Descarga tu certificado', NULL, 'Télécharger votre certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(910, 'share_your_certificate', 'Share your certificate', 'Comparte tu certificado', NULL, 'Partager votre certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(911, 'print_your_certificate', 'Print your certificate', 'Imprime tu certificado', NULL, 'Imprimer votre certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(912, 'view_all_courses', 'View all courses', 'Ver todos los cursos', NULL, 'Voir tous les cours', NULL, NULL, NULL, NULL, NULL, NULL),
(913, 'view_certificate_details', 'View certificate details', 'Ver detalles del certificado', NULL, 'Voir les détails du certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(914, 'certificate_awarded_to', 'Certificate awarded to', 'Certificado otorgado a', NULL, 'Certificat décerné à', NULL, NULL, NULL, NULL, NULL, NULL),
(915, 'congratulations_on_your_achievement', 'Congratulations on your achievement', 'Felicidades por tu logro', NULL, 'Félicitations pour votre réussite', NULL, NULL, NULL, NULL, NULL, NULL),
(916, 'well_done', 'Well done', 'Bien hecho', NULL, 'Bien joué', NULL, NULL, NULL, NULL, NULL, NULL),
(917, 'you_have_successfully_completed_the_course', 'You have successfully completed the course', 'Has completado con éxito el curso', NULL, 'Vous avez terminé avec succès le cours', NULL, NULL, NULL, NULL, NULL, NULL),
(918, 'back_to_courses', 'Back to courses', 'Volver a los cursos', NULL, 'Retour aux cours', NULL, NULL, NULL, NULL, NULL, NULL),
(919, 'your_certificate_of_completion', 'Your certificate of completion', 'Tu certificado de finalización', NULL, 'Votre certificat de réussite', NULL, NULL, NULL, NULL, NULL, NULL),
(920, 'download_or_print_your_certificate', 'Download or print your certificate', 'Descarga o imprime tu certificado', NULL, 'Téléchargez ou imprimez votre certificat', NULL, NULL, NULL, NULL, NULL, NULL),
(921, 'thank_you_for_your_participation', 'Thank you for your participation', 'Gracias por tu participación', NULL, 'Merci pour votre participation', NULL, NULL, NULL, NULL, NULL, NULL),
(922, 'claim_your_award', 'Claim your award', 'Reclama tu premio', NULL, 'Réclamez votre récompense', NULL, NULL, NULL, NULL, NULL, NULL),
(923, 'view_your_award', 'View your award', 'Ver tu premio', NULL, 'Voir votre récompense', NULL, NULL, NULL, NULL, NULL, NULL),
(924, 'congratulations_on_your_success', 'Congratulations on your success', 'Felicidades por tu éxito', NULL, 'Félicitations pour votre succès', NULL, NULL, NULL, NULL, NULL, NULL),
(925, 'claim_your_certificate_of_completion', 'Claim your certificate of completion', 'Reclama tu certificado de finalización', NULL, 'Réclamez votre certificat de réussite', NULL, NULL, NULL, NULL, NULL, NULL),
(926, 'congratulations_on_finishing_the_course', 'Congratulations on finishing the course', 'Felicidades por terminar el curso', NULL, 'Félicitations pour avoir terminé le cours', NULL, NULL, NULL, NULL, NULL, NULL),
(927, 'your_completion_certificate', 'Your completion certificate', 'Tu certificado de finalización', NULL, 'Votre certificat de réussite', NULL, NULL, NULL, NULL, NULL, NULL),
(928, 'your_achievement_certificate', 'Your achievement certificate', 'Tu certificado de logro', NULL, 'Votre certificat d\'accomplissement', NULL, NULL, NULL, NULL, NULL, NULL),
(929, 'download_your_completion_certificate', 'Download your completion certificate', 'Descarga tu certificado de finalización', NULL, 'Téléchargez votre certificat de réussite', NULL, NULL, NULL, NULL, NULL, NULL),
(930, 'download_your_achievement_certificate', 'Download your achievement certificate', 'Descarga tu certificado de logro', NULL, 'Téléchargez votre certificat d\'accomplissement', NULL, NULL, NULL, NULL, NULL, NULL),
(931, 'share_your_completion_certificate', 'Share your completion certificate', 'Comparte tu certificado de finalización', NULL, 'Partagez votre certificat de réussite', NULL, NULL, NULL, NULL, NULL, NULL),
(932, 'share_your_achievement_certificate', 'Share your achievement certificate', 'Comparte tu certificado de logro', NULL, 'Partagez votre certificat d\'accomplissement', NULL, NULL, NULL, NULL, NULL, NULL),
(933, 'print_your_completion_certificate', 'Print your completion certificate', 'Imprime tu certificado de finalización', NULL, 'Imprimez votre certificat de réussite', NULL, NULL, NULL, NULL, NULL, NULL),
(934, 'print_your_achievement_certificate', 'Print your achievement certificate', 'Imprime tu certificado de logro', NULL, 'Imprimez votre certificat d\'accomplissement', NULL, NULL, NULL, NULL, NULL, NULL),
(935, 'congratulations_on_successfully_completing_the_course', 'Congratulations on successfully completing the course', 'Felicidades por completar con éxito el curso', NULL, 'Félicitations pour avoir terminé avec succès le cours', NULL, NULL, NULL, NULL, NULL, NULL),
(936, 'your_course_completion_certificate', 'Your course completion certificate', 'Tu certificado de finalización del curso', NULL, 'Votre certificat de réussite du cours', NULL, NULL, NULL, NULL, NULL, NULL),
(937, 'your_course_achievement_certificate', 'Your course achievement certificate', 'Tu certificado de logro del curso', NULL, 'Votre certificat d\'accomplissement du cours', NULL, NULL, NULL, NULL, NULL, NULL),
(938, 'download_your_course_completion_certificate', 'Download your course completion certificate', 'Descarga tu certificado de finalización del curso', NULL, 'Téléchargez votre certificat de réussite du cours', NULL, NULL, NULL, NULL, NULL, NULL),
(939, 'download_your_course_achievement_certificate', 'Download your course achievement certificate', 'Descarga tu certificado de logro del curso', NULL, 'Téléchargez votre certificat d\'accomplissement du cours', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `spanish`, `arabic`, `french`, `georgian`, `german`, `hindi`, `indonesia`, `italian`, `chinese`) VALUES
(940, 'share_your_course_completion_certificate', 'Share your course completion certificate', 'Comparte tu certificado de finalización del curso', NULL, 'Partagez votre certificat de réussite du cours', NULL, NULL, NULL, NULL, NULL, NULL),
(941, 'share_your_course_achievement_certificate', 'Share your course achievement certificate', 'Comparte tu certificado de logro del curso', NULL, 'Partagez votre certificat d\'accomplissement du cours', NULL, NULL, NULL, NULL, NULL, NULL),
(942, 'print_your_course_completion_certificate', 'Print your course completion certificate', 'Imprime tu certificado de finalización del curso', NULL, 'Imprimez votre certificat de réussite du cours', NULL, NULL, NULL, NULL, NULL, NULL),
(943, 'print_your_course_achievement_certificate', 'Print your course achievement certificate', 'Imprime tu certificado de logro del curso', NULL, 'Imprimez votre certificat d\'accomplissement du cours', NULL, NULL, NULL, NULL, NULL, NULL),
(944, 'language_file_import_successfully', 'Language file import successfully', 'Importación de archivo de idioma exitosa', NULL, 'Fichier de langue importé avec succès', NULL, 'Language file import successfully', NULL, NULL, NULL, NULL),
(945, 'website_notification', 'Website notification', 'Notificación del sitio web', 'إشعار الموقع', 'Notification du site Web', NULL, NULL, NULL, NULL, NULL, 'Website notification'),
(946, 'smtp_settings', 'SMTP settings', 'Configuraciones SMTP', 'إعدادات SMTP', 'Paramètres SMTP', NULL, NULL, NULL, NULL, NULL, '邮件设置'),
(947, 'email_template', 'Email template', 'Plantilla de correo electrónico', 'قالب البريد الإلكتروني', 'Modèle d\'e-mail', NULL, NULL, NULL, NULL, NULL, 'Email template'),
(948, 'protocol', 'Protocol', 'Protocolo', 'بروتوكول', 'Protocole', NULL, NULL, NULL, NULL, NULL, 'Protocol'),
(949, 'smtp_crypto', 'SMTP crypto', 'Criptografía SMTP', 'تشفير بروتوكول SMTP', 'Cryptage SMTP', NULL, NULL, NULL, NULL, NULL, 'Smtp crypto'),
(950, 'smtp_host', 'SMTP host', 'Host SMTP', 'مضيف SMTP', 'Hôte SMTP', NULL, NULL, NULL, NULL, NULL, 'Smtp host'),
(951, 'smtp_port', 'SMTP port', 'Puerto SMTP', 'منفذ SMTP', 'Port SMTP', NULL, NULL, NULL, NULL, NULL, 'Smtp port'),
(952, 'smtp_from_email', 'SMTP from email', 'Correo electrónico del remitente SMTP', 'بروتوكول smtp من البريد الإلكتروني', 'E-mail expéditeur SMTP', NULL, NULL, NULL, NULL, NULL, 'Smtp from email'),
(953, 'smtp_username', 'SMTP username', 'Nombre de usuario SMTP', 'اسم مستخدم SMTP', 'Nom d\'utilisateur SMTP', NULL, NULL, NULL, NULL, NULL, 'Smtp username'),
(954, 'smtp_password', 'SMTP password', 'Contraseña SMTP', 'كلمة مرور smtp', 'Mot de passe SMTP', NULL, NULL, NULL, NULL, NULL, 'Smtp password'),
(955, 'email_type', 'Email type', 'Tipo de correo electrónico', 'نوع البريد الإلكتروني', 'Type d\'e-mail', NULL, NULL, NULL, NULL, NULL, 'Email type'),
(956, 'email_subject', 'Email subject', 'Asunto del correo electrónico', 'موضوع البريد الإلكتروني', 'Objet de l\'e-mail', NULL, NULL, NULL, NULL, NULL, 'Email subject'),
(957, 'action', 'Action', 'Acción', 'فعل', 'Action', NULL, NULL, NULL, NULL, NULL, '行动'),
(958, 'to_admin', 'To admin', 'Para administrador', 'إلى المشرف', 'À l\'administrateur', NULL, NULL, NULL, NULL, NULL, '至管理员'),
(959, 'to_user', 'To user', 'Para usuario', 'إلى المستخدم', 'À l\'utilisateur', NULL, NULL, NULL, NULL, NULL, '致用户'),
(960, 'edit_email_template', 'Edit email template', 'Editar plantilla de correo electrónico', 'تحرير قالب البريد الإلكتروني', 'Modifier le modèle d\'e-mail', NULL, NULL, NULL, NULL, NULL, '编辑电子邮件模板'),
(961, 'to_instructor', 'To instructor', 'Para instructor', 'للمدرس', 'À l\'instructeur', NULL, NULL, NULL, NULL, NULL, '致导师'),
(962, 'to_student', 'To student', 'Para estudiante', 'للطالب', 'À l\'étudiant', NULL, NULL, NULL, NULL, NULL, '致学生'),
(963, 'to_affiliator', 'To affiliator', 'Para afiliador', 'إلى التابع', 'À l\'affilié', NULL, NULL, NULL, NULL, NULL, '致附属机构'),
(964, 'to_payer', 'To payer', 'Para pagador', 'للدافع', 'Au payeur', NULL, NULL, NULL, NULL, NULL, '致付款人'),
(965, 'to_receiver', 'To receiver', 'Para receptor', 'إلى المتلقي', 'Au récepteur', NULL, NULL, NULL, NULL, NULL, '至接收者'),
(966, 'configure_your_notification_settings', 'Configure your notification settings', 'Configura tus ajustes de notificación', 'تكوين إعدادات الإعلام الخاصة بك', 'Configurez vos paramètres de notification', NULL, NULL, NULL, NULL, NULL, '配置您的通知设置'),
(967, 'new_user_registration', 'New user registration', 'Registro de nuevo usuario', 'تسجيل مستخدم جديد', 'Inscription d\'un nouvel utilisateur', NULL, NULL, NULL, NULL, NULL, '新用户注册'),
(968, 'get_notified_when_a_new_user_signs_up', 'Get notified when a new user signs up', 'Recibe notificaciones cuando un nuevo usuario se registre', 'احصل على تنبيهات عندما يقوم مستخدم جديد بالتسجيل', 'Soyez informé lorsqu\'un nouvel utilisateur s\'inscrit', NULL, NULL, NULL, NULL, NULL, '新用户注册时收到通知'),
(969, 'configure_for_admin', 'Configure for admin', 'Configurar para administrador', 'تكوين للمسؤول', 'Configurer pour l\'administrateur', NULL, NULL, NULL, NULL, NULL, '配置为管理员'),
(970, 'system_notification', 'System notification', 'Notificación del sistema', 'إخطار النظام', 'Notification du système', NULL, NULL, NULL, NULL, NULL, '系统通知'),
(971, 'email_notification', 'Email notification', 'Notificación por correo electrónico', 'إشعار البريد الإلكتروني', 'Notification par e-mail', NULL, NULL, NULL, NULL, NULL, '电子邮件通知'),
(972, 'configure_for_user', 'Configure for user', 'Configurar para usuario', 'تكوين للمستخدم', 'Configurer pour l\'utilisateur', NULL, NULL, NULL, NULL, NULL, '为用户配置'),
(973, 'email_verification', 'Email verification', 'Verificación de correo electrónico', 'تأكيد بواسطة البريد الالكتروني', 'Vérification de l\'e-mail', NULL, NULL, NULL, NULL, NULL, '电子邮件验证'),
(974, 'not_editable', 'Not editable', 'No editable', 'غير قابل للتحرير', 'Non modifiable', NULL, NULL, NULL, NULL, NULL, '不可编辑'),
(975, 'it_is_permanently_enabled_for_student_email_verification.', 'It is permanently enabled for student email verification.', 'Está habilitado permanentemente para la verificación de correo electrónico de los estudiantes.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(976, 'forgot_password_mail', 'Forgot password mail', 'Correo de olvido de contraseña', 'نسيت كلمة المرور البريد', 'E-mail de mot de passe oublié', NULL, NULL, NULL, NULL, NULL, 'Forgot password mail'),
(977, 'account_security_alert', 'Account security alert', 'Alerta de seguridad de la cuenta', 'تنبيه أمان الحساب', 'Alerte de sécurité du compte', NULL, NULL, NULL, NULL, NULL, 'Account security alert'),
(978, 'send_verification_code_for_login_from_a_new_device', 'Send verification code for login from a new device', 'Enviar código de verificación para inicio de sesión desde un nuevo dispositivo', 'إرسال رمز التحقق لتسجيل الدخول من جهاز جديد', 'Envoyer le code de vérification pour la connexion depuis un nouvel appareil', NULL, NULL, NULL, NULL, NULL, 'Send verification code for login from a new device'),
(979, 'course_purchase_notification', 'Course purchase notification', 'Notificación de compra de curso', 'إشعار شراء الدورة', 'Notification d\'achat de cours', NULL, NULL, NULL, NULL, NULL, 'Course purchase notification'),
(980, 'stay_up-to-date_on_student_course_purchases.', 'Stay up-to-date on student course purchases.', 'Mantente al tanto de las compras de cursos de los estudiantes.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(981, 'configure_for_student', 'Configure for student', 'Configurar para estudiante', 'تكوين للطالب', 'Configurer pour l\'étudiant', NULL, NULL, NULL, NULL, NULL, 'Configure for student'),
(982, 'configure_for_instructor', 'Configure for instructor', 'Configurar para instructor', 'تكوين للمدرس', 'Configurer pour l\'instructeur', NULL, NULL, NULL, NULL, NULL, 'Configure for instructor'),
(983, 'course_completion_mail', 'Course completion mail', 'Correo de finalización del curso', 'بريد إتمام الدورة', 'Mail de fin de cours', NULL, NULL, NULL, NULL, NULL, 'Course completion mail'),
(984, 'stay_up_to_date_on_student_course_completion.', 'Stay up to date on student course completion.', 'Mantente al tanto de la finalización de cursos por parte de los estudiantes.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(985, 'course_gift_notification', 'Course gift notification', 'Notificación de regalo de curso', 'إشعار هدية الدورة', 'Notification de cadeau de cours', NULL, NULL, NULL, NULL, NULL, 'Course gift notification'),
(986, 'notify_users_after_course_gift', 'Notify users after course gift', 'Notificar a los usuarios después del regalo del curso', 'إخطار المستخدمين بعد هدية الدورة', 'Notifier les utilisateurs après le cadeau de cours', NULL, NULL, NULL, NULL, NULL, 'Notify users after course gift'),
(987, 'configure_for_payer', 'Configure for payer', 'Configurar para pagador', 'تكوين للدافع', 'Configurer pour le payeur', NULL, NULL, NULL, NULL, NULL, 'Configure for payer'),
(988, 'configure_for_receiver', 'Configure for receiver', 'Configurar para receptor', 'تكوين لجهاز الاستقبال', 'Configurer pour le récepteur', NULL, NULL, NULL, NULL, NULL, 'Configure for receiver'),
(989, 'reviews', 'Reviews', 'Reviews', 'المراجعات', 'Avis', 'Reviews', 'Reviews', NULL, NULL, NULL, '评论'),
(990, 'lessons', 'Lessons', 'Lessons', 'الدروس', 'Leçons', 'Lessons', 'Lessons', NULL, NULL, NULL, '教训'),
(991, 'submit', 'Submit', 'Submit', 'يُقدِّم', 'Soumettre', NULL, NULL, NULL, NULL, NULL, '提交'),
(992, 'configuraciones_del_frontend', NULL, 'Configuraciones del frontend', NULL, 'Paramètres du frontend', NULL, NULL, NULL, NULL, NULL, NULL),
(993, 'email', 'Email', NULL, 'بريد إلكتروني', 'E-mail', NULL, NULL, NULL, NULL, NULL, '电子邮件'),
(994, 'new_password', 'New password', NULL, 'كلمة المرور الجديدة', 'Nouveau mot de passe', NULL, NULL, NULL, NULL, NULL, 'New password'),
(995, 'confirm_new_password', 'Confirm new password', NULL, 'تأكيد كلمة المرور الجديدة', 'Confirmer le nouveau mot de passe', NULL, NULL, NULL, NULL, NULL, 'Confirm new password'),
(996, 'eduprovince_technologies_private_limited_(edubuk)', 'Eduprovince technologies private limited (edubuk)', 'Eduprovince technologies private limited (edubuk)', NULL, 'EduProvince Technologies Private Limited (EduBuk)', NULL, NULL, NULL, NULL, NULL, NULL),
(997, 'show_more', 'Show more', NULL, 'أظهر المزيد', 'Montrer plus', NULL, NULL, NULL, NULL, NULL, '展示更多'),
(998, 'related_courses', 'Related courses', NULL, 'الدورات ذات الصلة', 'Cours connexes', NULL, NULL, NULL, NULL, NULL, '相关课程'),
(999, 'delete', 'Delete', NULL, 'يمسح', 'Supprimer', NULL, NULL, NULL, NULL, NULL, '删除'),
(1000, 'edit_course', 'Edit course', NULL, 'تحرير الدورة', 'Modifier le cours', NULL, NULL, NULL, NULL, NULL, '编辑课程'),
(1001, 'course_price', 'Course price', NULL, 'سعر الدورة', 'Prix du cours', NULL, NULL, NULL, NULL, NULL, '课程价格'),
(1002, 'management', 'Management', NULL, NULL, 'Gestion', NULL, NULL, NULL, NULL, NULL, NULL),
(1003, 'edit', 'Edit', NULL, 'يحرر', 'Modifier', NULL, NULL, NULL, NULL, NULL, 'Edit'),
(1004, 'beta', 'Beta', NULL, NULL, 'Bêta', NULL, NULL, NULL, NULL, NULL, NULL),
(1005, 'item_successfully_added_to_cart', 'Item successfully added to cart', NULL, NULL, 'Article ajouté au panier avec succès', NULL, NULL, NULL, NULL, NULL, '商品已成功添加到购物车'),
(1006, 'total', 'Total', NULL, 'المجموع', 'Total', NULL, NULL, NULL, NULL, NULL, '全部的'),
(1007, 'item_successfully_removed_from_cart', 'Item successfully removed from cart', NULL, NULL, 'Article supprimé du panier avec succès', NULL, NULL, NULL, NULL, NULL, 'Item successfully removed from cart'),
(1008, 'provide_a_section_name', 'Provide a section name', NULL, NULL, 'Fournissez un nom de section', NULL, NULL, NULL, NULL, NULL, NULL),
(1009, 'date_of_study_plan', 'Date of study plan', NULL, NULL, 'Date du plan d\'étude', NULL, NULL, NULL, NULL, NULL, NULL),
(1010, 'optional', 'Optional', NULL, NULL, 'Optionnel', NULL, NULL, NULL, NULL, NULL, NULL),
(1011, 'restriction_of_study_plan', 'Restriction of study plan', NULL, NULL, 'Restriction du plan d\'étude', NULL, NULL, NULL, NULL, NULL, NULL),
(1012, 'no_restriction', 'No restriction', NULL, NULL, 'Aucune restriction', NULL, NULL, NULL, NULL, NULL, NULL),
(1013, 'until_the_start_date,_keep_this_section_locked', 'Until the start date, keep this section locked', NULL, NULL, 'Jusqu\'à la date de début, gardez cette section verrouillée', NULL, NULL, NULL, NULL, NULL, NULL),
(1014, 'keep_this_section_open_only_within_the_selected_date_range', 'Keep this section open only within the selected date range', NULL, NULL, 'Gardez cette section ouverte uniquement dans la plage de dates sélectionnée', NULL, NULL, NULL, NULL, NULL, NULL),
(1015, 'section_has_been_added_successfully', 'Section has been added successfully', NULL, NULL, 'La section a été ajoutée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1016, 'add_new_quiz', 'Add new quiz', NULL, 'أضف اختبارًا جديدًا', 'Ajouter un nouveau quiz', NULL, NULL, NULL, NULL, NULL, '添加新测验'),
(1017, 'add_quiz', 'Add quiz', NULL, 'إضافة اختبار', 'Ajouter un quiz', NULL, NULL, NULL, NULL, NULL, '添加测验'),
(1018, 'sort_sections', 'Sort sections', NULL, 'أقسام الفرز', 'Trier les sections', NULL, NULL, NULL, NULL, NULL, '对部分进行排序'),
(1019, 'sort_lessons', 'Sort lessons', NULL, 'فرز الدروس', 'Trier les leçons', NULL, NULL, NULL, NULL, NULL, '对课程进行排序'),
(1020, 'sort_lesson', 'Sort lesson', NULL, 'فرز الدرس', 'Trier la leçon', NULL, NULL, NULL, NULL, NULL, 'Sort lesson'),
(1021, 'update_section', 'Update section', NULL, 'قسم التحديث', 'Mettre à jour la section', NULL, NULL, NULL, NULL, NULL, 'Update section'),
(1022, 'edit_section', 'Edit section', NULL, 'تحرير القسم', 'Modifier la section', NULL, NULL, NULL, NULL, NULL, 'Edit section'),
(1023, 'delete_section', 'Delete section', NULL, 'حذف القسم', 'Supprimer la section', NULL, NULL, NULL, NULL, NULL, 'Delete section'),
(1024, 'select_lesson_type', 'Select lesson type', NULL, NULL, 'Sélectionner le type de leçon', NULL, NULL, NULL, NULL, NULL, NULL),
(1025, 'video', 'Video', NULL, 'فيديو', 'Vidéo', NULL, NULL, NULL, NULL, NULL, '视频'),
(1026, 'secured', 'Secured', NULL, NULL, 'Sécurisé', NULL, NULL, NULL, NULL, NULL, NULL),
(1027, 'video_file', 'Video file', NULL, NULL, 'Fichier vidéo', NULL, NULL, NULL, NULL, NULL, NULL),
(1028, 'audio_file', 'Audio file', NULL, NULL, 'Fichier audio', NULL, NULL, NULL, NULL, NULL, NULL),
(1029, 'video_url', 'Video url', NULL, 'رابط الفيديو', 'URL de la vidéo', NULL, NULL, NULL, NULL, NULL, 'Video url'),
(1030, 'wasabi_storage_video', 'Wasabi storage video', NULL, NULL, 'Vidéo de stockage Wasabi', NULL, NULL, NULL, NULL, NULL, NULL),
(1031, 'google_drive_video', 'Google drive video', NULL, NULL, 'Vidéo Google Drive', NULL, NULL, NULL, NULL, NULL, NULL),
(1032, 'document_file', 'Document file', NULL, NULL, 'Fichier document', NULL, NULL, NULL, NULL, NULL, NULL),
(1033, 'text', 'Text', NULL, NULL, 'Texte', NULL, NULL, NULL, NULL, NULL, NULL),
(1034, 'image_file', 'Image file', NULL, NULL, 'Fichier image', NULL, NULL, NULL, NULL, NULL, NULL),
(1035, 'iframe_embed', 'Iframe embed', NULL, NULL, 'Intégration Iframe', NULL, NULL, NULL, NULL, NULL, NULL),
(1036, 'next', 'Next', NULL, 'التالي', 'Suivant', NULL, NULL, NULL, NULL, NULL, '下一个'),
(1037, 'please_select_a_course', 'Please select a course', NULL, NULL, 'Veuillez sélectionner un cours', NULL, NULL, NULL, NULL, NULL, NULL),
(1038, 'lesson_type', 'Lesson type', NULL, 'نوع الدرس', 'Type de leçon', NULL, NULL, NULL, NULL, NULL, 'Lesson type'),
(1039, 'change', 'Change', NULL, NULL, 'Changer', NULL, NULL, NULL, NULL, NULL, NULL),
(1040, 'document_type', 'Document type', NULL, NULL, 'Type de document', NULL, NULL, NULL, NULL, NULL, NULL),
(1041, 'select_type_of_document', 'Select type of document', NULL, NULL, 'Sélectionner le type de document', NULL, NULL, NULL, NULL, NULL, NULL),
(1042, 'text_file', 'Text file', NULL, NULL, 'Fichier texte', NULL, NULL, NULL, NULL, NULL, NULL),
(1043, 'pdf_file', 'Pdf file', NULL, NULL, 'Fichier PDF', NULL, NULL, NULL, NULL, NULL, NULL),
(1044, 'attachment', 'Attachment', NULL, NULL, 'Pièce jointe', NULL, NULL, NULL, NULL, NULL, NULL),
(1045, 'summary', 'Summary', NULL, 'ملخص', 'Résumé', NULL, NULL, NULL, NULL, NULL, '概括'),
(1046, 'do_you_want_to_keep_it_free_as_a_preview_lesson', 'Do you want to keep it free as a preview lesson', NULL, 'هل تريد إبقائه مجانيًا كدرس معاينة', 'Voulez-vous le garder gratuit comme leçon d\'aperçu ?', NULL, NULL, NULL, NULL, NULL, 'Do you want to keep it free as a preview lesson'),
(1047, 'mark_as_free_lesson', 'Mark as free lesson', NULL, 'وضع علامة كدرس مجاني', 'Marquer comme leçon gratuite', NULL, NULL, NULL, NULL, NULL, '标记为免费课程'),
(1048, 'uploading', 'Uploading', NULL, 'تحميل', 'Téléchargement', NULL, NULL, NULL, NULL, NULL, '上传中'),
(1049, 'please_wait', 'Please wait', NULL, 'انتظر من فضلك', 'Veuillez patienter', NULL, NULL, NULL, NULL, NULL, '请稍等'),
(1050, 'lesson_has_been_added_successfully', 'Lesson has been added successfully', NULL, NULL, 'La leçon a été ajoutée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1051, 'add_new_resource_file', 'Add new resource file', NULL, 'Add new resource file', 'Ajouter un nouveau fichier ressource', NULL, NULL, NULL, NULL, NULL, NULL),
(1052, 'resource_files', 'Resource files', NULL, 'Resource files', 'Fichiers ressources', NULL, NULL, NULL, NULL, NULL, NULL),
(1053, 'update_lesson', 'Update lesson', NULL, 'تحديث الدرس', 'Mettre à jour la leçon', NULL, NULL, NULL, NULL, NULL, 'Update lesson'),
(1054, 'mark_as_complete', 'Mark as complete', NULL, 'وضع علامة كمكتمل', 'Marquer comme terminé', NULL, NULL, NULL, NULL, NULL, '标记为完成'),
(1055, 'pdf', 'Pdf', NULL, 'بي دي إف', 'PDF', NULL, NULL, NULL, NULL, NULL, 'pdf'),
(1056, 'live_class', 'Live class', NULL, 'فئة حية', 'Cours en direct', NULL, NULL, NULL, NULL, NULL, '直播课'),
(1057, 'live_class_is_not_scheduled_yet', 'Live class is not scheduled yet', NULL, NULL, 'Le cours en direct n\'est pas encore programmé', NULL, NULL, NULL, NULL, NULL, NULL),
(1058, 'previous', 'Previous', NULL, 'سابق', 'Précédent', NULL, NULL, NULL, NULL, NULL, '以前的'),
(1059, 'preview', 'Preview', NULL, 'معاينة', 'Aperçu', NULL, NULL, NULL, NULL, NULL, '预览'),
(1060, 'enter_your_title', 'Enter your title', NULL, NULL, 'Entrez votre titre', NULL, NULL, NULL, NULL, NULL, NULL),
(1061, 'resource_file', 'Resource file', NULL, NULL, 'Fichier ressource', NULL, NULL, NULL, NULL, NULL, NULL),
(1062, 'add', 'Add', NULL, NULL, 'Ajouter', NULL, NULL, NULL, NULL, NULL, NULL),
(1063, 'edit_resource', 'Edit resource', NULL, NULL, 'Modifier la ressource', NULL, NULL, NULL, NULL, NULL, NULL),
(1064, 'back', 'Back', NULL, NULL, 'Retour', NULL, NULL, NULL, NULL, NULL, 'Back'),
(1065, 'attached_files', 'Attached files', NULL, NULL, 'Fichiers joints', NULL, NULL, NULL, NULL, NULL, NULL),
(1066, 'import_your_data', 'Import your data', NULL, NULL, 'Importer vos données', NULL, NULL, NULL, NULL, NULL, NULL),
(1067, 'choose_your_demo_file', 'Choose your demo file', NULL, NULL, 'Choisissez votre fichier démo', NULL, NULL, NULL, NULL, NULL, NULL),
(1068, 'backup_your_website', 'Backup your website', NULL, NULL, 'Sauvegarder votre site Web', NULL, NULL, NULL, NULL, NULL, NULL),
(1069, 'backup_your_current_data', 'Backup your current data', NULL, NULL, 'Sauvegardez vos données actuelles', NULL, NULL, NULL, NULL, NULL, NULL),
(1070, 'keep_a_backup', 'Keep a backup', NULL, NULL, 'Conservez une sauvegarde', NULL, NULL, NULL, NULL, NULL, NULL),
(1071, 'no_backup', 'No backup', NULL, NULL, 'Pas de sauvegarde', NULL, NULL, NULL, NULL, NULL, NULL),
(1072, 'enter_your_text', 'Enter your text', NULL, NULL, 'Entrez votre texte', NULL, NULL, NULL, NULL, NULL, NULL),
(1073, 'quiz_duration', 'Quiz duration', NULL, NULL, 'Durée du quiz', NULL, NULL, NULL, NULL, NULL, NULL),
(1074, 'if_you_want_to_disable_the_timer,_set_the_duration_to', 'If you want to disable the timer, set the duration to', NULL, NULL, 'Si vous souhaitez désactiver le minuteur, définissez la durée sur', NULL, NULL, NULL, NULL, NULL, NULL),
(1075, 'total_marks', 'Total marks', NULL, 'مجموع علامات', 'Total des notes', NULL, NULL, NULL, NULL, NULL, '总分'),
(1076, 'pass_mark', 'Pass mark', NULL, NULL, 'Note de passage', NULL, NULL, NULL, NULL, NULL, NULL),
(1077, 'drip_content_rule_for_quiz', 'Drip content rule for quiz', NULL, NULL, 'Règle de contenu goutte à goutte pour le quiz', NULL, NULL, NULL, NULL, NULL, NULL),
(1078, 'this_will_only_work_if_drip_content_is_enabled', 'This will only work if drip content is enabled', NULL, NULL, 'Cela ne fonctionnera que si le contenu goutte à goutte est activé', NULL, NULL, NULL, NULL, NULL, NULL),
(1079, 'students_can_start_the_next_lesson_by_submitting_the_quiz', 'Students can start the next lesson by submitting the quiz', NULL, NULL, 'Les étudiants peuvent commencer la leçon suivante en soumettant le quiz', NULL, NULL, NULL, NULL, NULL, NULL),
(1080, 'students_must_achieve_pass_mark_to_start_the_next_lesson', 'Students must achieve pass mark to start the next lesson', NULL, NULL, 'Les étudiants doivent atteindre la note de passage pour commencer la leçon suivante', NULL, NULL, NULL, NULL, NULL, NULL),
(1081, 'number_of_quiz_retakes', 'Number of quiz retakes', NULL, NULL, 'Nombre de reprises du quiz', NULL, NULL, NULL, NULL, NULL, NULL),
(1082, 'enter_0_if_you_want_to_disable_multiple_attempts', 'Enter 0 if you want to disable multiple attempts', NULL, NULL, 'Entrez 0 si vous souhaitez désactiver les tentatives multiples', NULL, NULL, NULL, NULL, NULL, NULL),
(1083, 'instruction', 'Instruction', NULL, 'تعليمات', 'Instruction', NULL, NULL, NULL, NULL, NULL, '操作说明'),
(1084, 'quiz_has_been_added_successfully', 'Quiz has been added successfully', NULL, NULL, 'Le quiz a été ajouté avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1085, 'quiz_results', 'Quiz results', NULL, 'نتائج الاختبار', 'Résultats du quiz', NULL, NULL, NULL, NULL, NULL, 'Quiz results'),
(1086, 'manage_quiz_questions', 'Manage quiz questions', NULL, 'إدارة أسئلة الاختبار', 'Gérer les questions du quiz', NULL, NULL, NULL, NULL, NULL, 'Manage quiz questions'),
(1087, 'quiz_questions', 'Quiz questions', NULL, 'أسئلة الاختبار', 'Questions du quiz', NULL, NULL, NULL, NULL, NULL, 'Quiz questions'),
(1088, 'update_quiz_information', 'Update quiz information', NULL, 'تحديث معلومات الاختبار', 'Mettre à jour les informations du quiz', NULL, NULL, NULL, NULL, NULL, 'Update quiz information'),
(1089, 'change_course_author', 'Change course author', NULL, 'Change course author', 'Changer l\'auteur du cours', NULL, NULL, NULL, NULL, NULL, NULL),
(1090, 'course_enrolment', 'Course enrolment', NULL, NULL, 'Inscription au cours', NULL, NULL, NULL, NULL, NULL, NULL),
(1091, 'enrolment_form', 'Enrolment form', NULL, NULL, 'Formulaire d\'inscription', NULL, NULL, NULL, NULL, NULL, NULL),
(1092, 'course_to_enrol', 'Course to enrol', NULL, NULL, 'Cours à inscrire', NULL, NULL, NULL, NULL, NULL, NULL),
(1093, 'select_a_course', 'Select a course', NULL, NULL, 'Sélectionner un cours', NULL, NULL, NULL, NULL, NULL, '选择课程'),
(1094, 'enrol_histories', 'Enrol histories', NULL, NULL, 'Historiques des inscriptions', NULL, NULL, NULL, NULL, NULL, NULL),
(1095, 'no_data_found', 'No data found', NULL, 'لاتوجد بيانات', 'Aucune donnée trouvée', NULL, NULL, NULL, NULL, NULL, 'No data found'),
(1096, 'enrolled_course', 'Enrolled course', NULL, 'بالطبع المسجلين', 'Cours inscrit', NULL, NULL, NULL, NULL, NULL, '已报名课程'),
(1097, 'total_amount', 'Total amount', NULL, 'المبلغ الإجمالي', 'Montant total', NULL, NULL, NULL, NULL, NULL, '总金额'),
(1098, 'user', 'User', NULL, NULL, 'Utilisateur', NULL, NULL, NULL, NULL, NULL, NULL),
(1099, 'paid_amount', 'Paid amount', NULL, NULL, 'Montant payé', NULL, NULL, NULL, NULL, NULL, NULL),
(1100, 'payment_method', 'Payment method', NULL, 'طريقة الدفع او السداد', 'Méthode de paiement', NULL, NULL, NULL, NULL, NULL, 'Payment method'),
(1101, 'purchased_date', 'Purchased date', NULL, 'تاريخ الشراء', 'Date d\'achat', NULL, NULL, NULL, NULL, NULL, 'Purchased date'),
(1102, 'instructor_payouts', 'Instructor payouts', NULL, 'مدفوعات المعلم', 'Paiements des instructeurs', NULL, NULL, NULL, NULL, NULL, '教练报酬'),
(1103, 'list_of_payouts', 'List of payouts', NULL, 'قائمة المدفوعات', 'Liste des paiements', NULL, NULL, NULL, NULL, NULL, '付款清单'),
(1104, 'completed_payouts', 'Completed payouts', NULL, 'المدفوعات المكتملة', 'Paiements terminés', NULL, NULL, NULL, NULL, NULL, '已完成的付款'),
(1105, 'pending_payouts', 'Pending payouts', NULL, 'المدفوعات المعلقة', 'Paiements en attente', NULL, NULL, NULL, NULL, NULL, '待付款'),
(1106, 'payout_amount', 'Payout amount', NULL, 'مبلغ الدفع', 'Montant du paiement', NULL, NULL, NULL, NULL, NULL, '支付金额'),
(1107, 'payment_type', 'Payment type', NULL, 'نوع الدفع', 'Type de paiement', NULL, NULL, NULL, NULL, NULL, '付款方式'),
(1108, 'payout_date', 'Payout date', NULL, 'تاريخ الدفع', 'Date du paiement', NULL, NULL, NULL, NULL, NULL, '付款日期'),
(1109, 'instructor_application', 'Instructor application', NULL, 'طلب مدرب', 'Demande d\'instructeur', NULL, NULL, NULL, NULL, NULL, '导师申请'),
(1110, 'instructor_applications', 'Instructor applications', NULL, 'تطبيقات المعلم', 'Demandes d\'instructeur', NULL, NULL, NULL, NULL, NULL, 'Instructor applications'),
(1111, 'list_of_applications', 'List of applications', NULL, 'قائمة التطبيقات', 'Liste des candidatures', NULL, NULL, NULL, NULL, NULL, 'List of applications'),
(1112, 'pending_applications', 'Pending applications', NULL, 'الطلبات المعلقة', 'Candidatures en attente', NULL, NULL, NULL, NULL, NULL, 'Pending applications'),
(1113, 'approved_applications', 'Approved applications', NULL, 'الطلبات المعتمدة', 'Demandes approuvées', NULL, NULL, NULL, NULL, NULL, 'Approved applications'),
(1114, 'details', 'Details', NULL, 'تفاصيل', 'Détails', NULL, NULL, NULL, NULL, NULL, 'Details'),
(1115, 'enrolled_courses', 'Enrolled courses', NULL, 'الدورات المسجلة', 'Cours inscrits', NULL, NULL, NULL, NULL, NULL, 'Enrolled courses'),
(1116, 'student_add', 'Student add', NULL, NULL, 'Ajouter un étudiant', NULL, NULL, NULL, NULL, NULL, NULL),
(1117, 'student_add_form', 'Student add form', NULL, NULL, 'Formulaire d\'ajout d\'étudiant', NULL, NULL, NULL, NULL, NULL, NULL),
(1118, 'payment_info', 'Payment info', NULL, 'معلومات الدفع', 'Informations de paiement', NULL, NULL, NULL, NULL, NULL, 'Payment info'),
(1119, 'paypal', 'Paypal', NULL, 'باي بال', 'PayPal', NULL, NULL, NULL, NULL, NULL, '贝宝'),
(1120, 'required_for_instructor', 'Required for instructor', NULL, 'مطلوب للمدرس', 'Requis pour l\'instructeur', NULL, NULL, NULL, NULL, NULL, '需要导师'),
(1121, 'stripe', 'Stripe', NULL, 'شريط', 'Stripe', NULL, NULL, NULL, NULL, NULL, '条纹'),
(1122, 'razorpay', 'Razorpay', NULL, 'رازورباي', 'Razorpay', NULL, NULL, NULL, NULL, NULL, '剃须刀支付'),
(1123, 'xendit', 'Xendit', NULL, NULL, 'Xendit', NULL, NULL, NULL, NULL, NULL, NULL),
(1124, 'payu', 'Payu', NULL, NULL, 'PayU', NULL, NULL, NULL, NULL, NULL, NULL),
(1125, 'pagseguro', 'Pagseguro', NULL, NULL, 'PagSeguro', NULL, NULL, NULL, NULL, NULL, NULL),
(1126, 'ssl_commerz', 'Ssl commerz', NULL, NULL, 'SSL Commerz', NULL, NULL, NULL, NULL, NULL, NULL),
(1127, 'skrill', 'Skrill', NULL, NULL, 'Skrill', NULL, NULL, NULL, NULL, NULL, NULL),
(1128, 'doku', 'Doku', NULL, NULL, 'Doku', NULL, NULL, NULL, NULL, NULL, NULL),
(1129, 'bkash', 'Bkash', NULL, NULL, 'Bkash', NULL, NULL, NULL, NULL, NULL, NULL),
(1130, 'cashfree', 'Cashfree', NULL, NULL, 'Cashfree', NULL, NULL, NULL, NULL, NULL, NULL),
(1131, 'maxicash', 'Maxicash', NULL, NULL, 'MaxiCash', NULL, NULL, NULL, NULL, NULL, NULL),
(1132, 'aamarpay', 'Aamarpay', NULL, NULL, 'AamarPay', NULL, NULL, NULL, NULL, NULL, NULL),
(1133, 'flutterwave', 'Flutterwave', NULL, NULL, 'Flutterwave', NULL, NULL, NULL, NULL, NULL, NULL),
(1134, 'tazapay', 'Tazapay', NULL, NULL, 'Tazapay', NULL, NULL, NULL, NULL, NULL, NULL),
(1135, 'write_new_messages', 'Write new messages', NULL, NULL, 'Écrire de nouveaux messages', NULL, NULL, NULL, NULL, NULL, NULL),
(1136, 'recipient', 'Recipient', NULL, NULL, 'Destinataire', NULL, NULL, NULL, NULL, NULL, NULL),
(1137, 'select_a_user', 'Select a user', NULL, 'حدد مستخدمًا', 'Sélectionnez un utilisateur', NULL, NULL, NULL, NULL, NULL, 'Select a user'),
(1138, 'type_your_message', 'Type your message', NULL, NULL, 'Tapez votre message', NULL, NULL, NULL, NULL, NULL, NULL),
(1139, 'sent_message', 'Sent message', NULL, NULL, 'Message envoyé', NULL, NULL, NULL, NULL, NULL, NULL),
(1140, 'newsletters', 'Newsletters', NULL, NULL, 'Bulletins d\'information', NULL, NULL, NULL, NULL, NULL, 'Newsletters'),
(1141, 'newsletter_template', 'Newsletter template', NULL, NULL, 'Modèle de bulletin', NULL, NULL, NULL, NULL, NULL, 'Newsletter template'),
(1142, 'total_pending', 'Total pending', NULL, NULL, 'Total en attente', NULL, NULL, NULL, NULL, NULL, NULL),
(1143, 'waiting_to_be_sent', 'Waiting to be sent', NULL, NULL, 'En attente d\'envoi', NULL, NULL, NULL, NULL, NULL, NULL),
(1144, 'total_success', 'Total success', NULL, NULL, 'Total des réussites', NULL, NULL, NULL, NULL, NULL, NULL),
(1145, 'successfully_sent', 'Successfully sent', NULL, NULL, 'Envoyé avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1146, 'total_faild', 'Total faild', NULL, NULL, 'Total échoué', NULL, NULL, NULL, NULL, NULL, NULL),
(1147, 'waiting_for_the_next_cue', 'Waiting for the next cue', NULL, NULL, 'En attente du prochain signal', NULL, NULL, NULL, NULL, NULL, NULL),
(1148, 'unable_to_send', 'Unable to send', NULL, NULL, 'Impossible d\'envoyer', NULL, NULL, NULL, NULL, NULL, NULL),
(1149, '10_attempts_failed,_click_here_to_send_email_manually', '10 attempts failed, click here to send email manually', NULL, NULL, '10 tentatives échouées, cliquez ici pour envoyer l\'e-mail manuellement', NULL, NULL, NULL, NULL, NULL, NULL),
(1150, 'create_cronjob_file', 'Create cronjob file', NULL, NULL, 'Créer un fichier Cronjob', NULL, NULL, NULL, NULL, NULL, NULL),
(1151, 'subscriber', 'Subscriber', NULL, NULL, 'Abonné', NULL, NULL, NULL, NULL, NULL, 'Subscriber'),
(1152, 'user_status', 'User status', NULL, NULL, 'Statut de l\'utilisateur', NULL, NULL, NULL, NULL, NULL, 'User status'),
(1153, 'subject', 'Subject', NULL, NULL, 'Objet', NULL, NULL, NULL, NULL, NULL, 'Subject'),
(1154, 'contact_users', 'Contact users', NULL, NULL, 'Contacter les utilisateurs', NULL, NULL, NULL, NULL, NULL, NULL),
(1155, 'add_blog', 'Add blog', NULL, NULL, 'Ajouter un blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1156, 'add_a_new_blog', 'Add a new blog', NULL, NULL, 'Ajouter un nouveau blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1157, 'enter_blog_title', 'Enter blog title', NULL, 'أدخل عنوان المدونة', 'Entrez le titre du blog', NULL, NULL, NULL, NULL, NULL, '输入博客标题'),
(1158, 'keywords', 'Keywords', NULL, 'الكلمات الدالة', 'Mots-clés', NULL, NULL, NULL, NULL, NULL, '关键词'),
(1159, 'click_the_enter_button_after_writing_your_keyword', 'Click the enter button after writing your keyword', NULL, 'انقر فوق زر الإدخال بعد كتابة كلمتك الرئيسية', 'Cliquez sur le bouton Entrée après avoir écrit votre mot-clé', NULL, NULL, NULL, NULL, NULL, '输入关键字后点击输入按钮'),
(1160, 'blog_banner', 'Blog banner', NULL, 'شعار المدونة', 'Bannière du blog', NULL, NULL, NULL, NULL, NULL, '博客横幅'),
(1161, 'choose_a_banner', 'Choose a banner', NULL, 'اختر لافتة', 'Choisir une bannière', NULL, NULL, NULL, NULL, NULL, '选择横幅'),
(1162, 'blog_thumbnail', 'Blog thumbnail', NULL, 'صورة مصغرة للمدونة', 'Vignette du blog', NULL, NULL, NULL, NULL, NULL, '博客缩略图'),
(1163, 'choose_a_thumbnail', 'Choose a thumbnail', NULL, 'اختر صورة مصغرة', 'Choisissez une vignette', NULL, NULL, NULL, NULL, NULL, '选择缩略图'),
(1164, 'do_you_want_to_mark_it_as_popular', 'Do you want to mark it as popular', NULL, 'هل تريد تمييزه على أنه شائع', 'Voulez-vous le marquer comme populaire?', NULL, NULL, NULL, NULL, NULL, '您想将其标记为热门吗'),
(1165, 'mark_as_popular', 'Mark as popular', NULL, 'وضع علامة شائع', 'Marquer comme populaire', NULL, NULL, NULL, NULL, NULL, 'Mark as popular'),
(1166, 'instructors_pending_blog', 'Instructors pending blog', NULL, NULL, 'Blog en attente des instructeurs', NULL, NULL, NULL, NULL, NULL, NULL),
(1167, 'blog_categories', 'Blog categories', NULL, NULL, 'Catégories de blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1168, 'add_a_new_category', 'Add a new category', NULL, NULL, 'Ajouter une nouvelle catégorie', NULL, NULL, NULL, NULL, NULL, NULL),
(1169, 'addon_manager', 'Addon manager', NULL, 'مدير الملحق', 'Gestionnaire de modules complémentaires', NULL, NULL, NULL, NULL, NULL, '插件管理器'),
(1170, 'buy_new_addon', 'Buy new addon', NULL, NULL, 'Acheter un nouveau module', NULL, NULL, NULL, NULL, NULL, NULL),
(1171, 'install_addon', 'Install addon', NULL, NULL, 'Installer un module', NULL, NULL, NULL, NULL, NULL, NULL),
(1172, 'installed_addons', 'Installed addons', NULL, NULL, 'Modules installés', NULL, NULL, NULL, NULL, NULL, NULL),
(1173, 'available_addons', 'Available addons', NULL, 'الوظائف الإضافية المتاحة', 'Modules disponibles', NULL, NULL, NULL, NULL, NULL, '可用的插件'),
(1174, 'version', 'Version', NULL, NULL, 'Version', NULL, NULL, NULL, NULL, NULL, NULL),
(1175, 'theme_settings', 'Theme settings', NULL, 'إعدادات الموضوع', 'Paramètres du thème', NULL, NULL, NULL, NULL, NULL, '主题设置'),
(1176, 'buy_new_theme', 'Buy new theme', NULL, NULL, 'Acheter un nouveau thème', NULL, NULL, NULL, NULL, NULL, NULL),
(1177, 'upload_your_theme_file', 'Upload your theme file', NULL, NULL, 'Téléchargez votre fichier de thème', NULL, NULL, NULL, NULL, NULL, NULL),
(1178, 'installed_themes', 'Installed themes', NULL, NULL, 'Thèmes installés', NULL, NULL, NULL, NULL, NULL, NULL),
(1179, 'add_new_themes', 'Add new themes', NULL, NULL, 'Ajouter de nouveaux thèmes', NULL, NULL, NULL, NULL, NULL, NULL),
(1180, 'active_theme', 'Active theme', NULL, NULL, 'Thème actif', NULL, NULL, NULL, NULL, NULL, NULL),
(1181, 'theme_successfully_activated', 'Theme successfully activated', NULL, NULL, 'Thème activé avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1182, 'you_do_not_have_right_to_access_this_theme', 'You do not have right to access this theme', NULL, NULL, 'Vous n\'avez pas le droit d\'accéder à ce thème', NULL, NULL, NULL, NULL, NULL, NULL),
(1183, 'social_login_configuration', 'Social login configuration', NULL, 'تكوين تسجيل الدخول الاجتماعي', 'Configuration de la connexion sociale', NULL, NULL, NULL, NULL, NULL, 'Social login configuration'),
(1184, 'issue', 'Issue', NULL, NULL, 'Problème', NULL, NULL, NULL, NULL, NULL, NULL),
(1185, 'you_must_use_an_ssl_supported_server_to_use_the_facebook_login_feature', 'You must use an ssl supported server to use the facebook login feature', NULL, NULL, 'Vous devez utiliser un serveur compatible SSL pour utiliser la fonction de connexion Facebook', NULL, NULL, NULL, NULL, NULL, NULL),
(1186, 'facebook_login', 'Facebook login', NULL, 'تسجيل الدخول الى الفيسبوك', 'Connexion Facebook', NULL, NULL, NULL, NULL, NULL, 'Facebook login'),
(1187, 'facebook_app_creation_instruction', 'Facebook app creation instruction', NULL, 'تعليمات إنشاء تطبيق Facebook', 'Instruction de création d\'application Facebook', NULL, NULL, NULL, NULL, NULL, 'Facebook app creation instruction'),
(1188, 'facebook_app_id', 'Facebook app id', NULL, 'معرف تطبيق Facebook', 'ID de l\'application Facebook', NULL, NULL, NULL, NULL, NULL, 'Facebook app id'),
(1189, 'facebook_app_secret', 'Facebook app secret', NULL, 'سر تطبيق Facebook', 'Secret de l\'application Facebook', NULL, NULL, NULL, NULL, NULL, 'Facebook app secret'),
(1190, 'custom_pages', 'Custom pages', NULL, 'صفحات مخصصة', 'Pages personnalisées', NULL, NULL, NULL, NULL, NULL, 'Custom pages'),
(1191, 'add_a_new_page', 'Add a new page', NULL, 'أضف صفحة جديدة', 'Ajouter une nouvelle page', NULL, NULL, NULL, NULL, NULL, 'Add a new page'),
(1192, 'page_title', 'Page title', NULL, 'عنوان الصفحة', 'Titre de la page', NULL, NULL, NULL, NULL, NULL, 'Page title'),
(1193, 'button_title', 'Button title', NULL, 'عنوان الزر', 'Titre du bouton', NULL, NULL, NULL, NULL, NULL, 'Button title'),
(1194, 'button_position', 'Button position', NULL, 'موضع الزر', 'Position du bouton', NULL, NULL, NULL, NULL, NULL, 'Button position'),
(1195, 'dev', 'Dev', NULL, NULL, 'Dév', NULL, NULL, NULL, NULL, NULL, NULL),
(1196, 'course_compare', 'Course compare', NULL, NULL, 'Comparaison de cours', NULL, NULL, NULL, NULL, NULL, '课程比较'),
(1197, 'compare_with_1_courses', 'Compare with 1 courses', NULL, NULL, 'Comparer avec 1 cours', NULL, NULL, NULL, NULL, NULL, '与 1 门课程比较'),
(1198, 'has_discount', 'Has discount', NULL, NULL, 'A une réduction', NULL, NULL, NULL, NULL, NULL, '有折扣'),
(1199, 'made_in', 'Made in', NULL, NULL, 'Fabriqué en', NULL, NULL, NULL, NULL, NULL, '在制作'),
(1200, 'last_updated_at', 'Last updated at', NULL, NULL, 'Dernière mise à jour à', NULL, NULL, NULL, NULL, NULL, '最后更新于'),
(1201, 'total_lectures', 'Total lectures', NULL, NULL, 'Total des conférences', NULL, NULL, NULL, NULL, NULL, '总讲座数'),
(1202, 'total_quizzes', 'Total quizzes', NULL, NULL, 'Total des quiz', NULL, NULL, NULL, NULL, NULL, '测验总数'),
(1203, 'total_duration', 'Total duration', NULL, 'المدة الإجمالية', 'Durée totale', NULL, NULL, NULL, NULL, NULL, '总持续时间'),
(1204, 'total_enrolment', 'Total enrolment', NULL, NULL, 'Inscription totale', NULL, NULL, NULL, NULL, NULL, '总入学人数'),
(1205, 'avg_rating', 'Avg rating', NULL, NULL, 'Note moyenne', NULL, NULL, NULL, NULL, NULL, '平均评分'),
(1206, 'invalid_login_credentials', 'Invalid login credentials', NULL, 'اعتماد تسجيل الدخول غير صالح', 'Identifiants de connexion invalides', NULL, NULL, NULL, NULL, NULL, 'Invalid login credentials'),
(1207, 'new_home_page_layout_has_been_activated', 'New home page layout has been activated', NULL, 'تم تنشيط تخطيط الصفحة الرئيسية الجديدة', 'La nouvelle mise en page de la page d\'accueil a été activée', NULL, NULL, NULL, NULL, NULL, '新的主页布局已激活'),
(1208, 'unlock_your_potential:_learn_from_the_best_platform_available', 'Unlock your potential: learn from the best platform available', 'Unlock your potential: learn from the best platform available', 'أطلق العنان لإمكاناتك: تعلم من أفضل منصة', 'Libérez votre potentiel : apprenez de la meilleure plateforme disponible', 'Unlock your potential: learn from the best platform available', 'Unlock your potential: learn from the best platform available', NULL, NULL, NULL, '释放你的潜力：向最好的平台学习'),
(1209, 'elevate_your_learning_experience_by_choosing_a_platform_that_prioritizes_quality_and_innovation.', 'Elevate your learning experience by choosing a platform that prioritizes quality and innovation.', 'Elevate your learning experience by choosing a platform that prioritizes quality and innovation.', 'قم بترقية تجربة التعلم الخاصة بك من خلال اختيار منصة تعطي الأولوية للجودة والابتكار.', 'Élevez votre expérience d\'apprentissage en choisissant une plateforme qui privilégie la qualité et l\'innovation.', 'Elevate your learning experience by choosing a platform that prioritizes quality and innovation.', 'Elevate your learning experience by choosing a platform that prioritizes quality and innovation.', NULL, NULL, NULL, '选择注重质量和创新的平台来提升您的学习体验。'),
(1210, 'happy_students', 'Happy students', NULL, 'طلاب سعداء', 'Étudiants satisfaits', NULL, NULL, NULL, NULL, NULL, NULL),
(1211, 'experienced_instructors', 'Experienced instructors', NULL, 'مدربين ذوي خبرة', 'Instructeurs expérimentés', NULL, NULL, NULL, NULL, NULL, NULL),
(1212, 'smart_solution', 'Smart solution', 'Smart solution', 'حل ذكي', 'Solution intelligente', 'Smart solution', 'Smart solution', NULL, NULL, NULL, '智能解决方案'),
(1213, 'happy', 'Happy', NULL, 'سعيد', 'Heureux', NULL, NULL, NULL, NULL, NULL, '快乐的'),
(1214, 'experienced', 'Experienced', NULL, 'ذوي الخبرة', 'Expérimenté', NULL, NULL, NULL, NULL, NULL, '有经验的'),
(1215, 'motivational_speech_updated_successfully', 'Motivational speech updated successfully', NULL, 'تم تحديث الخطاب التحفيزي بنجاح', 'Discours de motivation mis à jour avec succès', NULL, NULL, NULL, NULL, NULL, '励志演讲更新成功'),
(1216, 'think_more_clearly', 'Think more clearly', 'Think more clearly', 'فكر بشكل أكثر وضوحًا', 'Pensez plus clairement', 'Think more clearly', 'Think more clearly', NULL, NULL, NULL, 'Think more clearly'),
(1217, 'gather_your_thoughts,_and_make_your_decisions_clearly', 'Gather your thoughts, and make your decisions clearly', 'Gather your thoughts, and make your decisions clearly', 'اجمع أفكارك واتخذ قراراتك بوضوح', 'Rassemblez vos pensées et prenez vos décisions clairement', 'Gather your thoughts, and make your decisions clearly', 'Gather your thoughts, and make your decisions clearly', NULL, NULL, NULL, 'Gather your thoughts, and make your decisions clearly'),
(1218, 'website_faqs_updated_successfully', 'Website faqs updated successfully', NULL, 'تم تحديث الأسئلة الشائعة للموقع بنجاح', 'Les FAQ du site Web ont été mises à jour avec succès', NULL, NULL, NULL, NULL, NULL, '网站常见问题解答已成功更新'),
(1219, 'frequently_asked_questions', 'Frequently asked questions', 'Frequently asked questions', 'أسئلة مكررة', 'Questions fréquemment posées', 'Frequently asked questions', 'Frequently asked questions', NULL, NULL, NULL, '经常问的问题'),
(1220, 'have_something_to_know?', 'Have something to know?', 'Have something to know?', 'Have something to know?', 'Quelque chose à savoir ?', 'Have something to know?', 'Have something to know?', NULL, NULL, NULL, 'Have something to know?'),
(1221, 'check_here_if_you_have_any_questions_about_us.', 'Check here if you have any questions about us.', 'Check here if you have any questions about us.', 'Check here if you have any questions about us.', 'Vérifiez ici si vous avez des questions à propos de nous.', 'Check here if you have any questions about us.', 'Check here if you have any questions about us.', NULL, NULL, NULL, 'Check here if you have any questions about us.'),
(1222, 'see_more', 'See more', 'See more', 'شاهد المزيد', 'Voir plus', 'See more', 'See more', NULL, NULL, NULL, 'See more'),
(1223, 'faqs', 'Faqs', NULL, 'الأسئلة الشائعة', 'FAQ', NULL, NULL, NULL, NULL, NULL, 'Faqs'),
(1224, 'looking_for_answers?', 'Looking for answers?', NULL, 'هل تبحث عن إجابات؟', 'Vous cherchez des réponses ?', NULL, NULL, NULL, NULL, NULL, NULL),
(1225, 'we_provides_you_world_class_performance', 'We provides you world class performance', 'We provides you world class performance', 'نحن نقدم لك أداءً عالميًا', 'Nous vous offrons une performance de classe mondiale', 'We provides you world class performance', 'We provides you world class performance', NULL, NULL, NULL, 'We provides you world class performance'),
(1226, 'why_learn_online?', 'Why learn online?', NULL, 'لماذا التعلم عبر الإنترنت؟', 'Pourquoi apprendre en ligne ?', NULL, NULL, NULL, NULL, NULL, NULL),
(1227, 'flexibility', 'Flexibility', NULL, 'المرونة', 'Flexibilité', NULL, NULL, NULL, NULL, NULL, NULL),
(1228, 'flexibility_in_scheduling_and_learning_at_your_own_pace.', 'Flexibility in scheduling and learning at your own pace.', NULL, 'المرونة في الجدولة والتعلم بالسرعة التي تناسبك.', 'Flexibilité dans la planification et l\'apprentissage à votre propre rythme.', NULL, NULL, NULL, NULL, NULL, NULL),
(1229, 'accessibility', 'Accessibility', NULL, NULL, 'Accessibilité', NULL, NULL, NULL, NULL, NULL, NULL),
(1230, 'convenient_access_from_anywhere_with_an_internet_connection.', 'Convenient access from anywhere with an internet connection.', NULL, 'إمكانية الوصول بسهولة من أي مكان يتوفر فيه اتصال بالإنترنت.', 'Accès pratique de n\'importe où avec une connexion Internet.', NULL, NULL, NULL, NULL, NULL, NULL),
(1231, 'globalization', 'Globalization', NULL, 'العولمة', 'Mondialisation', NULL, NULL, NULL, NULL, NULL, '全球化'),
(1232, 'opportunity_for_global_networking_and_collaboration_with_peers_worldwide.', 'Opportunity for global networking and collaboration with peers worldwide.', NULL, NULL, 'Opportunité de réseautage mondial et de collaboration avec des pairs du monde entier.', NULL, NULL, NULL, NULL, NULL, NULL),
(1233, 'cost-effectiveness', 'Cost-effectiveness', NULL, 'الفعالية من حيث التكلفة', 'Rentabilité', NULL, NULL, NULL, NULL, NULL, '成本效益'),
(1234, 'cost-effective_compared_to_traditional_in-person_education.', 'Cost-effective compared to traditional in-person education.', NULL, 'فعالة من حيث التكلفة مقارنة بالتعليم التقليدي المباشر.', 'Rentable par rapport à l\'éducation traditionnelle en personne.', NULL, NULL, NULL, NULL, NULL, NULL),
(1235, 'popular_categories', 'Popular categories', NULL, 'الفئات الشعبية', 'Catégories populaires', NULL, NULL, NULL, NULL, NULL, 'Popular categories'),
(1236, 'happy_student', 'Happy student', NULL, 'طالب سعيد', 'Étudiant satisfait', NULL, NULL, NULL, NULL, NULL, '快乐的学生'),
(1237, 'quality_trainers', 'Quality trainers', NULL, NULL, 'Formateurs de qualité', NULL, NULL, NULL, NULL, NULL, NULL),
(1238, 'premium_courses', 'Premium courses', NULL, 'دورات متميزة', 'Cours premium', NULL, NULL, NULL, NULL, NULL, 'Premium courses'),
(1239, 'cost-free_courses', 'Cost-free courses', NULL, NULL, 'Cours gratuits', NULL, NULL, NULL, NULL, NULL, NULL),
(1240, 'add_addon', 'Add addon', NULL, NULL, 'Ajouter un module complémentaire', NULL, NULL, NULL, NULL, NULL, NULL),
(1241, 'install_an_addon', 'Install an addon', NULL, NULL, 'Installer un module complémentaire', NULL, NULL, NULL, NULL, NULL, NULL),
(1242, 'back_to_addon_list', 'Back to addon list', NULL, NULL, 'Retour à la liste des modules complémentaires', NULL, NULL, NULL, NULL, NULL, NULL),
(1243, 'upload_addon_file', 'Upload addon file', NULL, NULL, 'Télécharger un fichier de module complémentaire', NULL, NULL, NULL, NULL, NULL, NULL),
(1244, 'zip_file', 'Zip file', NULL, NULL, 'Fichier ZIP', NULL, NULL, NULL, NULL, NULL, NULL),
(1245, 'addon_installed_successfully', 'Addon installed successfully', NULL, NULL, 'Module complémentaire installé avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1246, 'ai_writer', 'Ai writer', NULL, 'كاتب عاي', 'Écrivain IA', 'Ai writer', 'Ai writer', 'Ai writer', 'Ai writer', NULL, '艾作家'),
(1247, 'open_ai_settings', 'Open ai settings', NULL, 'افتح إعدادات ai', 'Paramètres Open AI', 'Open ai settings', 'Open ai settings', 'Open ai settings', 'Open ai settings', NULL, '打开ai设置'),
(1248, 'addon_update', 'Addon update', NULL, NULL, 'Mise à jour du module complémentaire', NULL, NULL, NULL, NULL, NULL, NULL),
(1249, 'deactive', 'Deactive', NULL, NULL, 'Désactivé', NULL, NULL, NULL, NULL, NULL, 'Deactive'),
(1250, 'about_this_addon', 'About this addon', NULL, NULL, 'À propos de ce module complémentaire', NULL, NULL, NULL, NULL, NULL, NULL),
(1251, 'add_update', 'Add update', NULL, NULL, 'Ajouter une mise à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1252, 'ge_to_addon_list', 'Ge to addon list', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1253, 'update_addon', 'Update addon', NULL, NULL, 'Mettre à jour le module complémentaire', NULL, NULL, NULL, NULL, NULL, NULL),
(1254, 'for_more_details_check_out_our', 'For more details check out our', NULL, NULL, 'Pour plus de détails, consultez notre', NULL, NULL, NULL, NULL, NULL, NULL),
(1255, 'website', 'Website', NULL, NULL, 'Site web', NULL, NULL, NULL, NULL, NULL, NULL),
(1256, 'openai_settings', 'Openai settings', NULL, 'Openai settings', 'Paramètres OpenAI', 'Openai settings', NULL, 'Openai settings', 'Openai settings', NULL, NULL),
(1257, 'manage_your_open_ai_settings', 'Manage your open ai settings', NULL, 'Manage your open ai settings', 'Gérez vos paramètres Open AI', 'Manage your open ai settings', NULL, 'Manage your open ai settings', 'Manage your open ai settings', NULL, NULL),
(1258, 'select_ai_model', 'Select ai model', NULL, 'Select ai model', 'Sélectionner le modèle AI', 'Select ai model', NULL, 'Select ai model', 'Select ai model', NULL, NULL),
(1259, 'required_premium_account', 'Required premium account', NULL, 'Required premium account', 'Compte premium requis', 'Required premium account', NULL, 'Required premium account', 'Required premium account', NULL, NULL),
(1260, 'max_tokens', 'Max tokens', NULL, 'Max tokens', 'Nombre maximal de jetons', 'Max tokens', NULL, 'Max tokens', 'Max tokens', NULL, NULL),
(1261, 'number_of_image_creation', 'Number of image creation', NULL, 'Number of image creation', 'Nombre de créations d\'image', 'Number of image creation', NULL, 'Number of image creation', 'Number of image creation', NULL, NULL),
(1262, 'ai_settings_updated_successfully', 'Ai settings updated successfully', NULL, NULL, 'Paramètres AI mis à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1263, 'gpt_assistant', 'Gpt assistant', NULL, 'Gpt assistant', 'Assistant GPT', NULL, NULL, NULL, NULL, NULL, NULL),
(1264, 'services', 'Services', NULL, 'Services', 'Services', NULL, NULL, NULL, NULL, NULL, NULL),
(1265, 'how_can_i_help_you?', 'How can i help you?', NULL, 'How can i help you?', 'Comment puis-je vous aider ?', NULL, NULL, NULL, NULL, NULL, NULL),
(1266, 'select_your_service', 'Select your service', NULL, 'اختر خدمتك', 'Sélectionnez votre service', NULL, NULL, NULL, NULL, NULL, 'Select your service'),
(1267, 'course_short_description', 'Course short description', NULL, 'وصف مختصر للدورة', 'Brève description du cours', NULL, NULL, NULL, NULL, NULL, 'Course short description'),
(1268, 'course_long_description', 'Course long description', NULL, 'الوصف التفصيلي للدورة', 'Description longue du cours', NULL, NULL, NULL, NULL, NULL, 'Course long description'),
(1269, 'course_seo_tags', 'Course seo tags', NULL, 'كورس سيو به', 'Balises SEO du cours', NULL, NULL, NULL, NULL, NULL, 'Course seo tags'),
(1270, 'course_lesson_text', 'Course lesson text', NULL, 'نص درس الدورة', 'Texte de la leçon du cours', NULL, NULL, NULL, NULL, NULL, 'Course lesson text'),
(1271, 'course_certificate_text', 'Course certificate text', NULL, 'نص شهادة الدورة', 'Texte du certificat de cours', NULL, NULL, NULL, NULL, NULL, 'Course certificate text'),
(1272, 'course_quiz_text', 'Course quiz text', NULL, 'نص اختبار الدورة', 'Texte du quiz du cours', NULL, NULL, NULL, NULL, NULL, 'Course quiz text'),
(1273, 'course_blog_title', 'Course blog title', NULL, 'عنوان مدونة الدورة', 'Titre du blog du cours', NULL, NULL, NULL, NULL, NULL, 'Course blog title'),
(1274, 'course_blog_post', 'Course blog post', NULL, 'مشاركة مدونة الدورة', 'Article de blog du cours', NULL, NULL, NULL, NULL, NULL, 'Course blog post'),
(1275, 'enter_your_keyword', 'Enter your keyword', NULL, 'أدخل كلمتك الرئيسية', 'Entrez votre mot-clé', NULL, NULL, NULL, NULL, NULL, 'Enter your keyword'),
(1276, 'generate', 'Generate', NULL, 'يولد', 'Générer', NULL, NULL, NULL, NULL, NULL, 'Generate');
INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `spanish`, `arabic`, `french`, `georgian`, `german`, `hindi`, `indonesia`, `italian`, `chinese`) VALUES
(1277, 'generating', 'Generating', NULL, 'التوليد', 'Génération en cours', NULL, NULL, NULL, NULL, NULL, 'Generating'),
(1278, 'your_images', 'Your images', NULL, 'Your images', 'Vos images', NULL, NULL, NULL, NULL, NULL, NULL),
(1279, 'generated_text', 'Generated text', NULL, 'نص تم إنشاؤه', 'Texte généré', NULL, NULL, NULL, NULL, NULL, 'Generated text'),
(1280, 'copy', 'Copy', NULL, 'ينسخ', 'Copier', NULL, NULL, NULL, NULL, NULL, 'Copy'),
(1281, 'copied', 'Copied', NULL, 'Copied', 'Copié', NULL, NULL, NULL, NULL, NULL, NULL),
(1282, 'payment_settings_updated_successfully', 'Payment settings updated successfully', NULL, NULL, 'Paramètres de paiement mis à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1283, 'mkraft_capability_solutions_llp', 'Mkraft capability solutions llp', NULL, 'Mkraft capability solutions llp', 'MKraft Capability Solutions LLP', 'Mkraft capability solutions llp', 'Mkraft capability solutions llp', 'Mkraft capability solutions llp', NULL, NULL, 'Mkraft capability solutions llp'),
(1284, 'language_added_successfully', 'Language added successfully', NULL, NULL, 'Langue ajoutée avec succès', NULL, NULL, NULL, NULL, NULL, '语言添加成功'),
(1584, 'course_content_not_found', NULL, NULL, 'لم يتم العثور على محتوى الدورة', 'Contenu du cours introuvable', NULL, NULL, NULL, NULL, NULL, 'Course content not found'),
(1362, 'your_servers_file_upload_limit_is_900mb', NULL, NULL, 'حد تحميل ملف الخوادم هو 900 ميجا بايت', 'La limite de téléchargement de fichiers de votre serveur est de 900 Mo', NULL, NULL, NULL, NULL, NULL, '您的服务器文件上传限制为 900mb'),
(1285, 'write_a_public_review', NULL, NULL, 'اكتب مراجعة عامة', 'Rédiger un avis public', NULL, NULL, NULL, NULL, NULL, '撰写公开评论'),
(1286, 'describe_your_experience_what_you_got_out_of_the_course_and_other_helpful_highlights', NULL, NULL, 'صِف تجربتك وما حصلت عليه من الدورة وأبرز النقاط المفيدة الأخرى', 'Décrivez votre expérience, ce que vous avez retiré du cours et d\'autres points forts utiles', NULL, NULL, NULL, NULL, NULL, '描述您从课程中获得的经验以及其他有用的亮点'),
(1287, 'what_did_the_instructor_do_well_and_what_could_use_some_improvement', NULL, NULL, 'ما الذي فعله المدرب جيدًا وما الذي يمكن أن يحتاج إلى بعض التحسين', 'Qu\'est-ce que l\'instructeur a bien fait et qu\'est-ce qui pourrait être amélioré', NULL, NULL, NULL, NULL, NULL, '教练哪些方面做得好，哪些方面需要改进'),
(1288, 'publish', NULL, NULL, 'ينشر', 'Publier', NULL, NULL, NULL, NULL, NULL, '发布'),
(1289, '404_page_not_found', NULL, NULL, 'صفحة 404 غير موجودة', '404 Page non trouvée', NULL, NULL, NULL, NULL, NULL, '404页面不存在'),
(1290, 'search_for_courses', NULL, NULL, 'ابحث عن الدورات', 'Rechercher des cours', NULL, NULL, NULL, NULL, NULL, '搜索课程'),
(1291, 'go_to_cart', NULL, NULL, 'اذهب إلى عربة التسوق', 'Aller au panier', NULL, NULL, NULL, NULL, NULL, '去购物车'),
(1292, 'your_cart_is_empty', NULL, NULL, 'عربة التسوق فارغة', 'Votre panier est vide', NULL, NULL, NULL, NULL, NULL, '您的购物车是空的'),
(1293, 'this_is_not_the_web_page_you_are_looking_for', NULL, NULL, 'هذه ليست صفحة الويب التي تبحث عنها', 'Ce n\'est pas la page Web que vous recherchez', NULL, NULL, NULL, NULL, NULL, '这不是您正在寻找的网页'),
(1294, 'step', NULL, NULL, 'خطوة', 'Étape', NULL, NULL, NULL, NULL, NULL, '步'),
(1295, 'how_would_you_rate_this_course_overall', NULL, NULL, 'كيف تقيم هذه الدورة بشكل عام', 'Comment évaluez-vous ce cours dans l\'ensemble ?', NULL, NULL, NULL, NULL, NULL, '您对本课程的总体评价如何'),
(1296, 'showing_on_this_page', NULL, NULL, 'يظهر في هذه الصفحة', 'Affichage sur cette page', NULL, NULL, NULL, NULL, NULL, '在此页面显示'),
(1297, 'students_enrolled', NULL, NULL, 'التحق الطلاب', 'Étudiants inscrits', NULL, NULL, NULL, NULL, NULL, '学生入学'),
(1298, 'what_will_i_learn', NULL, NULL, 'ماذا سأتعلم', 'Qu\'est-ce que je vais apprendre ?', NULL, NULL, NULL, NULL, NULL, '我会学到什么'),
(1299, 'curriculum_for_this_course', NULL, NULL, 'المنهج الدراسي لهذه الدورة', 'Programme pour ce cours', NULL, NULL, NULL, NULL, NULL, '本课程的课程设置'),
(1300, 'other_related_courses', NULL, NULL, 'دورات أخرى ذات صلة', 'Autres cours connexes', NULL, NULL, NULL, NULL, NULL, '其他相关课程'),
(1301, 'updated', NULL, NULL, 'محدث', 'Mis à jour', NULL, NULL, NULL, NULL, NULL, '更新'),
(1302, 'about_the_instructor', NULL, NULL, 'عن المدرب', 'À propos de l\'instructeur', NULL, NULL, NULL, NULL, NULL, '关于导师'),
(1303, 'average_rating', NULL, NULL, 'متوسط ​​تقييم', 'Note moyenne', NULL, NULL, NULL, NULL, NULL, '平均评分'),
(1304, 'added_to_cart', NULL, NULL, 'تمت الإضافة إلى عربة التسوق', 'Ajouté au panier', NULL, NULL, NULL, NULL, NULL, '已添加到购物车'),
(1305, 'includes', NULL, NULL, 'يشمل', 'Comprend', NULL, NULL, NULL, NULL, NULL, '包括'),
(1306, 'on_demand_videos', NULL, NULL, 'مقاطع فيديو حسب الطلب', 'Vidéos à la demande', NULL, NULL, NULL, NULL, NULL, '点播视频'),
(1307, 'full_lifetime_access', NULL, NULL, 'وصول كامل مدى الحياة', 'Accès à vie complet', NULL, NULL, NULL, NULL, NULL, '终身访问权限'),
(1308, 'access_on_mobile_and_tv', NULL, NULL, 'الوصول على الهاتف المحمول والتلفزيون', 'Accès sur mobile et TV', NULL, NULL, NULL, NULL, NULL, '通过手机和电视访问'),
(1309, 'preview_this_course', NULL, NULL, 'معاينة هذه الدورة', 'Aperçu de ce cours', NULL, NULL, NULL, NULL, NULL, '预览本课程'),
(1310, 'course_preview', NULL, NULL, 'معاينة الدورة', 'Aperçu du cours', NULL, NULL, NULL, NULL, NULL, '课程预览'),
(1311, 'enrolment', 'Enrolment', NULL, 'التسجيل', 'Inscription', NULL, NULL, NULL, NULL, NULL, '注册'),
(1312, 'enrolment_date', NULL, NULL, 'تاريخ التسجيل', 'Date d\'inscription', NULL, NULL, NULL, NULL, NULL, '入学日期'),
(1313, 'click_the_upload_h5p_file_button.', NULL, NULL, NULL, 'Cliquez sur le bouton de téléchargement du fichier H5P', NULL, NULL, NULL, NULL, NULL, NULL),
(1314, 'menu', NULL, NULL, 'قائمة طعام', 'Menu', NULL, NULL, NULL, NULL, NULL, '菜单'),
(1315, 'all_tutions', NULL, NULL, 'كل هذه الأمور', 'Tous les cours', NULL, NULL, NULL, NULL, NULL, '所有学费'),
(1316, 'ebooks', NULL, NULL, 'كتب إلكترونية', 'Livres électroniques', NULL, NULL, NULL, NULL, NULL, '电子书'),
(1317, 'course_bundles', NULL, NULL, 'حزم الدورات', 'Ensembles de cours', NULL, NULL, NULL, NULL, NULL, '课程包'),
(1318, 'administrator', NULL, NULL, 'مدير', 'Administrateur', NULL, NULL, NULL, NULL, NULL, '行政人员'),
(1319, 'get_enrolled', NULL, NULL, 'التحق', 'S\'inscrire', NULL, NULL, NULL, NULL, NULL, '报名'),
(1320, 'h5p_course', NULL, NULL, 'دورة H5p', 'Cours H5P', NULL, NULL, NULL, NULL, NULL, 'H5p课程'),
(1321, 'scorm_course', NULL, NULL, 'بالطبع Scorm', 'Cours SCORM', NULL, NULL, NULL, NULL, NULL, '斯科姆课程'),
(1322, 'featured_instructor', NULL, NULL, 'مدرب مميز', 'Instructeur vedette', NULL, NULL, NULL, NULL, NULL, '特色导师'),
(1323, 'all_rights_reserved', NULL, NULL, 'كل الحقوق محفوظة', 'Tous droits réservés', NULL, NULL, NULL, NULL, NULL, '版权所有'),
(1324, 'view_less', NULL, NULL, 'عرض أقل', 'Voir moins', NULL, NULL, NULL, NULL, NULL, '查看较少'),
(1325, 'course_bundle', NULL, NULL, 'حزمة الدورة', 'Ensemble de cours', NULL, NULL, NULL, NULL, NULL, '课程包'),
(1326, 'add_new_bundle', NULL, NULL, 'إضافة حزمة جديدة', 'Ajouter un nouveau bundle', NULL, NULL, NULL, NULL, NULL, '添加新捆绑包'),
(1327, 'manage_bundle', NULL, NULL, 'إدارة الحزمة', 'Gérer le bundle', NULL, NULL, NULL, NULL, NULL, '管理捆绑包'),
(1328, 'subscription_report', NULL, NULL, 'تقرير الاشتراك', 'Rapport d\'abonnement', NULL, NULL, NULL, NULL, NULL, '订阅报告'),
(1329, 'tutor_booking', NULL, NULL, 'حجز المعلم', 'Réservation de tuteur', NULL, NULL, NULL, NULL, NULL, '导师预约'),
(1330, 'subject_category', NULL, NULL, 'فئة الموضوع', 'Catégorie de sujet', NULL, NULL, NULL, NULL, NULL, '学科类别'),
(1331, 'add_booking', NULL, NULL, 'أضف الحجز', 'Ajouter une réservation', NULL, NULL, NULL, NULL, NULL, '添加预订'),
(1332, 'all_bookings', NULL, NULL, 'كل الحجوزات', 'Toutes les réservations', NULL, NULL, NULL, NULL, NULL, '所有预订'),
(1333, 'booked_schedules', NULL, NULL, 'جداول محجوزة', 'Horaires réservés', NULL, NULL, NULL, NULL, NULL, '已预订的时间表'),
(1334, 'live_class_settings', NULL, NULL, 'إعدادات الفصل المباشر', 'Paramètres de cours en direct', NULL, NULL, NULL, NULL, NULL, '直播课堂设置'),
(1335, 'ebook', NULL, NULL, 'الكتاب الاليكتروني', 'Livre électronique', NULL, NULL, NULL, NULL, NULL, '电子书'),
(1336, 'all_ebooks', NULL, NULL, 'جميع الكتب الإلكترونية', 'Tous les e-books', NULL, NULL, NULL, NULL, NULL, '所有电子书'),
(1337, 'add_ebook', NULL, NULL, 'أضف كتابًا إلكترونيًا', 'Ajouter un e-book', NULL, NULL, NULL, NULL, NULL, '添加电子书'),
(1338, 'payment_history', NULL, NULL, 'سجل الدفع', 'Historique des paiements', NULL, NULL, NULL, NULL, NULL, '支付历史'),
(1339, 'affiliate', NULL, NULL, 'شركة تابعة', 'Affiliation', NULL, NULL, NULL, NULL, NULL, '附属机构'),
(1340, 'affliliator_list', NULL, NULL, 'قائمة التابعين', 'Liste des affilieurs', NULL, NULL, NULL, NULL, NULL, '附属机构列表'),
(1341, 'affiliation_history', NULL, NULL, 'تاريخ الانتماء', 'Historique des affiliations', NULL, NULL, NULL, NULL, NULL, '隶属历史'),
(1342, 'payouts', NULL, NULL, 'المدفوعات', 'Paiements', NULL, NULL, NULL, NULL, NULL, '支出'),
(1343, 'create_affiliator', NULL, NULL, 'إنشاء شركة تابعة', 'Créer un affilié', NULL, NULL, NULL, NULL, NULL, '创建联营者'),
(1344, 'affiliation_settings', NULL, NULL, 'إعدادات الانتساب', 'Paramètres d\'affiliation', NULL, NULL, NULL, NULL, NULL, '隶属关系设置'),
(1345, 'offline_payment', NULL, NULL, 'الدفع دون اتصال بالإنترنت', 'Paiement hors ligne', NULL, NULL, NULL, NULL, NULL, '线下支付'),
(1346, 'pending_request', NULL, NULL, 'طلب معلق', 'Demande en attente', NULL, NULL, NULL, NULL, NULL, '待处理请求'),
(1347, 'accepted_request', NULL, NULL, 'طلب مقبول', 'Demande acceptée', NULL, NULL, NULL, NULL, NULL, '已接受请求'),
(1348, 'suspended_request', NULL, NULL, 'طلب معلق', 'Demande suspendue', NULL, NULL, NULL, NULL, NULL, '暂停的请求'),
(1349, 'offline_payment_settings', NULL, NULL, 'إعدادات الدفع دون اتصال', 'Paramètres de paiement hors ligne', NULL, NULL, NULL, NULL, NULL, '离线支付设置'),
(1350, 'ticket_list', NULL, NULL, 'قائمة التذاكر', 'Liste des tickets', NULL, NULL, NULL, NULL, NULL, '门票清单'),
(1351, 'support_category', NULL, NULL, 'فئة الدعم', 'Catégorie de support', NULL, NULL, NULL, NULL, NULL, '支持类别'),
(1352, 'macro', NULL, NULL, 'دقيق', 'Macro', NULL, NULL, NULL, NULL, NULL, '宏'),
(1353, 'create_ticket', NULL, NULL, 'إنشاء تذكرة', 'Créer un ticket', NULL, NULL, NULL, NULL, NULL, '创建票证'),
(1354, 'certificate_settings', NULL, NULL, 'إعدادات الشهادة', 'Paramètres du certificat', NULL, NULL, NULL, NULL, NULL, '证书设置'),
(1355, 's3_settings', NULL, NULL, 'إعدادات S3', 'Paramètres S3', NULL, NULL, NULL, NULL, NULL, 'S3设置'),
(1356, 'custom_page', NULL, NULL, 'صفحة مخصص', 'Page personnalisée', NULL, NULL, NULL, NULL, NULL, '自定义页面'),
(1357, 'requested_withdrawal_amount', NULL, NULL, 'مبلغ السحب المطلوب', 'Montant du retrait demandé', NULL, NULL, NULL, NULL, NULL, '要求提款金额'),
(1358, 'provide_your_valid_login_credentials', NULL, NULL, 'قدم بيانات اعتماد تسجيل الدخول الصالحة الخاصة بك', 'Fournissez vos identifiants de connexion valides', NULL, NULL, NULL, NULL, NULL, '提供您的有效登录凭据'),
(1359, 'continue_with_email', NULL, NULL, 'تواصل مع البريد الإلكتروني', 'Continuer avec l\'e-mail', NULL, NULL, NULL, NULL, NULL, '继续使用电子邮件'),
(1360, 'forgot_password', NULL, NULL, 'هل نسيت كلمة السر', 'Mot de passe oublié', NULL, NULL, NULL, NULL, NULL, '忘记密码'),
(1361, 'do_not_have_an_account', NULL, NULL, 'لا تملك حساب', 'Vous n\'avez pas de compte', NULL, NULL, NULL, NULL, NULL, '还没有账号'),
(1363, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, ''),
(1364, 'discover_a_world_of_learning_opportunities_through_our_upcoming_courses,_where_industry_experts_and_thought_leaders_will_guide_you_in_acquiring_new_expertise,_expanding_your_horizons,_and_reaching_your_full_potential.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1365, 'top_instructors', NULL, NULL, 'كبار المدربين', 'Meilleurs instructeurs', NULL, NULL, NULL, NULL, NULL, '顶尖导师'),
(1366, 'they_efficiently_serve_large_number_of_students_on_our_platform', NULL, NULL, 'إنهم يخدمون عددًا كبيرًا من الطلاب بكفاءة على منصتنا', 'Ils servent efficacement un grand nombre d\'étudiants sur notre plateforme', NULL, NULL, NULL, NULL, NULL, '他们在我们的平台上有效地为大量学生提供服务'),
(1367, 'thanks_for_subscribing_to_our_newsletter', NULL, NULL, 'نشكرك على الاشتراك في نشرتنا الإخبارية', 'Merci de vous être abonné à notre newsletter', NULL, NULL, NULL, NULL, NULL, '感谢您订阅我们的时事通讯'),
(1368, 'such_script_searches_are_not_allowed', NULL, NULL, 'عمليات البحث عن هذا البرنامج النصي غير مسموح بها', 'De telles recherches de script ne sont pas autorisées', NULL, NULL, NULL, NULL, NULL, '不允许此类脚本搜索'),
(1369, 'bundles', NULL, NULL, 'حزم', 'Liasses', NULL, NULL, NULL, NULL, NULL, '捆绑'),
(1370, 'search_for_bundle', NULL, NULL, 'ابحث عن الحزمة', 'Rechercher un forfait', NULL, NULL, NULL, NULL, NULL, '搜索捆绑包'),
(1371, 'rating_updated_successfully', NULL, NULL, 'تم تحديث التقييم بنجاح', 'Évaluation mise à jour avec succès', NULL, NULL, NULL, NULL, NULL, '评级更新成功'),
(1372, 'please_select_a_rating_greater_than_0', NULL, NULL, 'الرجاء تحديد تصنيف أكبر من 0', 'Veuillez sélectionner une note supérieure à 0', NULL, NULL, NULL, NULL, NULL, '请选择大于 0 的评分'),
(1373, 'your_subscription_date_is_over_please_renew_your_bundle', NULL, NULL, 'انتهى تاريخ اشتراكك يرجى تجديد الباقة الخاصة بك', 'Votre date d\'abonnement est terminée, veuillez renouveler votre forfait', NULL, NULL, NULL, NULL, NULL, 'Your subscription date is over please renew your bundle'),
(1374, 'bundle_details', NULL, NULL, 'تفاصيل الباقة', 'Détails du forfait', NULL, NULL, NULL, NULL, NULL, 'Bundle details'),
(1375, 'buy', NULL, NULL, 'يشتري', 'Acheter', NULL, NULL, NULL, NULL, NULL, 'Buy'),
(1376, 'all_categories', NULL, NULL, 'جميع الفئات', 'Toutes catégories', NULL, NULL, NULL, NULL, NULL, 'All categories'),
(1377, 'send_request', NULL, NULL, 'ارسل طلب', 'Envoyer une demande', NULL, NULL, NULL, NULL, NULL, '发送请求'),
(1378, 'back_to_login', NULL, NULL, 'العودة إلى تسجيل الدخول', 'Retour connexion', NULL, NULL, NULL, NULL, NULL, '回到登入'),
(1379, 'my_course', NULL, NULL, 'المقرر الدراسي الخاص بي', 'Mon parcours', NULL, NULL, NULL, NULL, NULL, '我的课程'),
(1380, 'go_to_wishlist', NULL, NULL, 'اذهب إلى قائمة الرغبات', 'Aller à la liste de souhaits', NULL, NULL, NULL, NULL, NULL, '前往愿望清单'),
(1381, 'become_a_instructor', NULL, NULL, 'كن مدربًا', 'Devenir instructeur', NULL, NULL, NULL, NULL, NULL, '成为一名讲师'),
(1382, 'my_messages', NULL, NULL, 'رسائلي', 'Mes messages', NULL, NULL, NULL, NULL, NULL, '我的留言'),
(1383, 'user_profile', NULL, NULL, 'ملف تعريفي للمستخدم', 'Profil de l\'utilisateur', NULL, NULL, NULL, NULL, NULL, '用户资料'),
(1384, 'support', NULL, NULL, 'يدعم', 'Soutien', NULL, NULL, NULL, NULL, NULL, '支持'),
(1385, 'gift_someone_else', NULL, NULL, 'هدية لشخص آخر', 'Offrir à quelqu\'un d\'autre', NULL, NULL, NULL, NULL, NULL, '送给别人礼物'),
(1386, 'wishlist', NULL, NULL, 'قائمة الرغبات', 'Liste de souhaits', NULL, NULL, NULL, NULL, NULL, '愿望清单'),
(1387, 'messages', NULL, NULL, 'رسائل', 'messages', NULL, NULL, NULL, NULL, NULL, '留言'),
(1388, 'profile', NULL, NULL, 'حساب تعريفي', 'Profil', NULL, NULL, NULL, NULL, NULL, '轮廓'),
(1389, 'account_credentials', NULL, NULL, 'بيانات اعتماد الحساب', 'Identifiants de compte', NULL, NULL, NULL, NULL, NULL, '账户凭证'),
(1390, 'go_to_course_page', NULL, NULL, 'اذهب إلى صفحة الدورة', 'Aller à la page du cours', NULL, NULL, NULL, NULL, NULL, '前往课程页面'),
(1391, 'author_profile', NULL, NULL, 'ملف تعريف المؤلف', 'Profil de l\'auteur', NULL, NULL, NULL, NULL, NULL, '作者简介'),
(1392, 'upcoming_live_class', NULL, NULL, 'فئة حية قادمة', 'Prochain cours en direct', NULL, NULL, NULL, NULL, NULL, '即将上线的直播课'),
(1393, 'instructor_profile', NULL, NULL, 'الملف الشخصي للمدرب', 'Profil de l\'instructeur', NULL, NULL, NULL, NULL, NULL, '导师简介'),
(1394, 'how_to_shoot_cinematic_tech_videos_like_apple', NULL, NULL, 'كيفية تصوير مقاطع فيديو سينمائية مثل Apple', 'Comment tourner des vidéos techniques cinématographiques comme Apple', NULL, NULL, NULL, NULL, NULL, '如何拍摄像苹果一样的电影科技视频'),
(1395, 'certificate', NULL, NULL, 'شهادة', 'Certificat', NULL, NULL, NULL, NULL, NULL, '证书'),
(1396, 'apply_to_become_a_instructor', NULL, NULL, 'تقدم لتصبح مدربًا', 'Postuler pour devenir instructeur', NULL, NULL, NULL, NULL, NULL, '申请成为讲师'),
(1397, 'publication_name', NULL, NULL, 'اسم النشر', 'Nom de publication', NULL, NULL, NULL, NULL, NULL, 'Publication name'),
(1398, 'published_date', NULL, NULL, 'تاريخ النشر', 'Date de publication', NULL, NULL, NULL, NULL, NULL, 'Published date'),
(1399, 'category_name', NULL, NULL, 'اسم التصنيف', 'Nom de catégorie', NULL, NULL, NULL, NULL, NULL, 'Category name'),
(1400, 'read_preview', NULL, NULL, 'قراءة المعاينة', 'Lire l\'aperçu', NULL, NULL, NULL, NULL, NULL, 'Read preview'),
(1401, 'free_download', NULL, NULL, 'تنزيل مجاني', 'Téléchargement Gratuit', NULL, NULL, NULL, NULL, NULL, 'Free download'),
(1402, 'book_specification_and_summary', NULL, NULL, 'مواصفات الكتاب وملخصه', 'Spécification et résumé du livre', NULL, NULL, NULL, NULL, NULL, '书籍规格和摘要'),
(1403, 'specification', NULL, NULL, 'تخصيص', 'spécification', NULL, NULL, NULL, NULL, NULL, '规格'),
(1404, 'other_related_ebooks', NULL, NULL, 'كتب إلكترونية أخرى ذات صلة', 'Autres livres électroniques connexes', NULL, NULL, NULL, NULL, NULL, '其他相关电子书'),
(1405, 'about_instructor', NULL, NULL, 'عن المدرب', 'À propos de l\'instructeur', NULL, NULL, NULL, NULL, NULL, '关于导师'),
(1406, 'ebook_review', NULL, NULL, 'مراجعة الكتاب الاليكترونى', 'Revue de livre électronique', NULL, NULL, NULL, NULL, NULL, '电子书评论'),
(1407, 'wordpress_theme_development_with_bootstrap', NULL, NULL, 'تطوير موضوع Wordpress باستخدام bootstrap', 'Développement de thème wordpress avec bootstrap', NULL, NULL, NULL, NULL, NULL, '使用 bootstrap 进行 WordPress 主题开发'),
(1408, 'home_page_layout', NULL, NULL, 'تخطيط الصفحة الرئيسية', 'Mise en page de la page d\'accueil', NULL, NULL, NULL, NULL, NULL, '主页布局'),
(1409, 'banner_image_update', NULL, NULL, 'تحديث صورة البانر', 'Mise à jour de l\'image de la bannière', NULL, NULL, NULL, NULL, NULL, 'Banner image update'),
(1410, 'your_servers_file_upload_limit_is_512mb', NULL, NULL, 'حد تحميل ملف الخوادم هو 512 ميجا بايت', 'La limite de téléchargement de fichiers de votre serveur est de 512 Mo', NULL, NULL, NULL, NULL, NULL, 'Your servers file upload limit is 512mb'),
(1411, 'blog_page_title', NULL, NULL, 'عنوان صفحة المدونة', 'Titre de la page du blog', NULL, NULL, NULL, NULL, NULL, 'Blog page title'),
(1412, 'blog_page_subtitle', NULL, NULL, 'العنوان الفرعي لصفحة المدونة', 'Sous-titre de la page du blog', NULL, NULL, NULL, NULL, NULL, 'Blog page subtitle'),
(1413, 'instructors_blog_permission', NULL, NULL, 'إذن مدونة المدربين', 'Autorisation du blog des instructeurs', NULL, NULL, NULL, NULL, NULL, 'Instructors blog permission'),
(1414, 'visible', NULL, NULL, 'مرئي', 'Visible', NULL, NULL, NULL, NULL, NULL, 'Visible'),
(1415, 'invisible', NULL, NULL, 'غير مرئى', 'Invisible', NULL, NULL, NULL, NULL, NULL, 'Invisible'),
(1416, 'blog_page_banner', NULL, NULL, 'شعار صفحة المدونة', 'Bannière de la page du blog', NULL, NULL, NULL, NULL, NULL, 'Blog page banner'),
(1417, 'blog_settings_updated_successfully', NULL, NULL, 'تم تحديث إعدادات المدونة بنجاح', 'Paramètres du blog mis à jour avec succès', NULL, NULL, NULL, NULL, NULL, 'Blog settings updated successfully'),
(1418, 'visit_our_latest_blogs', NULL, NULL, 'قم بزيارة أحدث مدوناتنا', 'Visitez nos derniers blogs', NULL, NULL, NULL, NULL, NULL, '访问我们最新的博客'),
(1419, 'visit_our_valuable_articles_to_get_more_information.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1420, 'thu', NULL, NULL, 'خميس', 'Jeu', NULL, NULL, NULL, NULL, NULL, '星期四'),
(1421, 'dec', NULL, NULL, 'ديسمبر', 'Déc', NULL, NULL, NULL, NULL, NULL, '十二月'),
(1422, 'mark_as_active', NULL, NULL, 'وضع علامة نشط', 'Marquer comme actif', NULL, NULL, NULL, NULL, NULL, '标记为活动状态'),
(1423, 'zoom_live_class', NULL, NULL, 'تكبير الطبقة الحية', 'Zoom cours en direct', NULL, NULL, NULL, NULL, NULL, 'Zoom直播课'),
(1424, 'jitsi_live_class', NULL, NULL, 'دروس جيتسي الحية', 'Cours en direct Jitsi', NULL, NULL, NULL, NULL, NULL, '吉西直播课'),
(1425, 'assignment', NULL, NULL, 'تكليف', 'Mission', NULL, NULL, NULL, NULL, NULL, '任务'),
(1426, 'noticeboard', NULL, NULL, 'لوح الإعلانات', 'Tableau d\'affichage', NULL, NULL, NULL, NULL, NULL, '公告栏'),
(1427, 'analytics', NULL, NULL, 'تحليلات', 'Analytique', NULL, NULL, NULL, NULL, NULL, '分析'),
(1428, 'live_class_schedule', NULL, NULL, 'جدول الحصص الحية', 'Horaire des cours en direct', NULL, NULL, NULL, NULL, NULL, 'Live class schedule'),
(1429, 'time', NULL, NULL, 'وقت', 'Temps', NULL, NULL, NULL, NULL, NULL, 'Time'),
(1430, 'note_to_students', NULL, NULL, 'ملاحظة للطلاب', 'Remarque aux étudiants', NULL, NULL, NULL, NULL, NULL, '学生注意事项'),
(1431, 'zoom_meeting_id', NULL, NULL, 'تكبير معرف الاجتماع', 'ID de réunion Zoom', NULL, NULL, NULL, NULL, NULL, 'Zoom 会议 ID'),
(1432, 'enter_meeting_id', NULL, NULL, 'أدخل معرف الاجتماع', 'Saisir l\'identifiant de la réunion', NULL, NULL, NULL, NULL, NULL, '输入会议 ID'),
(1433, 'zoom_meeting_password', NULL, NULL, 'تكبير كلمة مرور الاجتماع', 'Mot de passe de la réunion Zoom', NULL, NULL, NULL, NULL, NULL, 'Zoom 会议密码'),
(1434, 'enter_meeting_password', NULL, NULL, 'أدخل كلمة مرور الاجتماع', 'Entrez le mot de passe de la réunion', NULL, NULL, NULL, NULL, NULL, '输入会议密码'),
(1435, 'course_enrolment_details', NULL, NULL, 'تفاصيل التسجيل في الدورة', 'Détails de l\'inscription au cours', NULL, NULL, NULL, NULL, NULL, '课程报名详情'),
(1436, 'get', NULL, NULL, 'يحصل', 'Obtenir', NULL, NULL, NULL, NULL, NULL, '得到'),
(1437, 'meeting_plans_that_fit_your_business_perfectly', NULL, NULL, 'خطط الاجتماعات التي تناسب عملك تمامًا', 'Des plans de réunion parfaitement adaptés à votre entreprise', NULL, NULL, NULL, NULL, NULL, '完美适合您业务的会议计划'),
(1438, 'zoom_meeting_plans', NULL, NULL, 'تكبير خطط الاجتماع', 'Plans de réunion Zoom', NULL, NULL, NULL, NULL, NULL, 'Zoom 会议计划'),
(1439, 'jitsi_meeting_password', NULL, NULL, 'كلمة مرور اجتماع جيتسي', 'Mot de passe de la réunion Jitsi', NULL, NULL, NULL, NULL, NULL, 'Jitsi 会议密码'),
(1440, 'make_sure_you_save_the_live_class_password_before_starting_the_class', NULL, NULL, 'تأكد من حفظ كلمة مرور الفصل المباشر قبل بدء الفصل الدراسي', 'Assurez-vous d\'enregistrer le mot de passe du cours en direct avant de commencer le cours', NULL, NULL, NULL, NULL, NULL, '请确保在开始课程前保存直播课程密码'),
(1441, 'enter_your_class_topic', NULL, NULL, 'أدخل موضوع فصلك', 'Entrez votre sujet de classe', NULL, NULL, NULL, NULL, NULL, '输入您的课程主题'),
(1442, 'enter_your_message', NULL, NULL, 'أدخل رسالتك', 'entrez votre message', NULL, NULL, NULL, NULL, NULL, '输入您的留言'),
(1443, 'send_a_mail_to_students_to_join_this_live_class', NULL, NULL, 'أرسل بريدًا إلى الطلاب للانضمام إلى هذا الفصل الدراسي المباشر', 'Envoyez un e-mail aux étudiants pour qu\'ils rejoignent ce cours en direct', NULL, NULL, NULL, NULL, NULL, '发送邮件给学生参加直播课'),
(1444, 'start_live_video_class', NULL, NULL, 'ابدأ درس فيديو مباشر', 'Démarrer le cours vidéo en direct', NULL, NULL, NULL, NULL, NULL, '开始视频直播课'),
(1445, 'sending_mail', NULL, NULL, 'إرسال البريد', 'Envoi de mail', NULL, NULL, NULL, NULL, NULL, '发送邮件'),
(1446, 'the_message_field_is_empty', NULL, NULL, 'حقل الرسالة فارغ', 'Le champ message est vide', NULL, NULL, NULL, NULL, NULL, '消息字段为空'),
(1447, 'create_new_assignment', NULL, NULL, 'إنشاء مهمة جديدة', 'Créer un nouveau devoir', NULL, NULL, NULL, NULL, NULL, '创建新作业'),
(1448, 'assignment_title', NULL, NULL, 'عنوان الواجب', 'Titre de la mission', NULL, NULL, NULL, NULL, NULL, '作业标题'),
(1449, 'enter_assignment_title', NULL, NULL, 'أدخل عنوان المهمة', 'Entrez le titre du devoir', NULL, NULL, NULL, NULL, NULL, '输入作业标题'),
(1450, 'questions', NULL, NULL, 'أسئلة', 'Des questions', NULL, NULL, NULL, NULL, NULL, '问题'),
(1451, 'enter_your_assignment_questions', NULL, NULL, 'أدخل أسئلة الواجب الخاص بك', 'Saisissez les questions de votre devoir', NULL, NULL, NULL, NULL, NULL, '输入您的作业问题'),
(1452, 'question_file', NULL, NULL, 'ملف السؤال', 'Fichier de questions', NULL, NULL, NULL, NULL, NULL, '问题档案'),
(1453, 'deadline', NULL, NULL, 'موعد التسليم', 'Date limite', NULL, NULL, NULL, NULL, NULL, '最后期限'),
(1454, 'note', 'Note', NULL, 'ملحوظة', 'Note', NULL, NULL, NULL, NULL, NULL, '笔记'),
(1455, 'submission_status', NULL, NULL, 'حالة تقديم', 'État de la soumission', NULL, NULL, NULL, NULL, NULL, '提交状态'),
(1456, 'draft', NULL, NULL, 'مسودة', 'Brouillon', NULL, NULL, NULL, NULL, NULL, '草稿'),
(1457, 'add_new_assignment', NULL, NULL, 'أضف مهمة جديدة', 'Ajouter un nouveau devoir', NULL, NULL, NULL, NULL, NULL, '添加新任务'),
(1458, 'fill_up_the_required_feilds', NULL, NULL, 'املأ الفراغات المطلوبة', 'Remplissez les champs requis', NULL, NULL, NULL, NULL, NULL, '填写必填字段'),
(1459, 'enter_your_notice_title', NULL, NULL, 'أدخل عنوان الإشعار الخاص بك', 'Entrez le titre de votre avis', NULL, NULL, NULL, NULL, NULL, '输入您的通知标题'),
(1460, 'enter_your_notice_description', NULL, NULL, 'أدخل وصف إشعارك', 'Entrez la description de votre avis', NULL, NULL, NULL, NULL, NULL, 'Enter your notice description'),
(1461, 'send_mail_to_students_if_urgent', NULL, NULL, 'أرسل بريدًا إلى الطلاب إذا كان عاجلاً', 'Envoyer un courrier aux étudiants en cas d\'urgence', NULL, NULL, NULL, NULL, NULL, 'Send mail to students if urgent'),
(1462, 'add_new_notice', NULL, NULL, 'أضف إشعارًا جديدًا', 'Ajouter un nouvel avis', NULL, NULL, NULL, NULL, NULL, 'Add new notice'),
(1463, 'updating', NULL, NULL, 'التحديث', 'Mise à jour', NULL, NULL, NULL, NULL, NULL, 'Updating'),
(1464, 'course_progress_analytics', NULL, NULL, 'تحليلات تقدم الدورة', 'Analyse de la progression du cours', NULL, NULL, NULL, NULL, NULL, 'Course progress analytics'),
(1465, 'completion_percentage', NULL, NULL, 'نسبة الإنجاز', 'Pourcentage d\'achèvement', NULL, NULL, NULL, NULL, NULL, 'Completion percentage'),
(1466, 'enrolled_students', NULL, NULL, 'الطلاب المسجلين', 'Étudiants inscrits', NULL, NULL, NULL, NULL, NULL, 'Enrolled students'),
(1467, 'number_of_students', NULL, NULL, 'عدد الطلاب', 'Nombre d\'étudiants', NULL, NULL, NULL, NULL, NULL, 'Number of students'),
(1468, 'course_enrolments', NULL, NULL, 'التسجيل في الدورة', 'Inscriptions aux cours', NULL, NULL, NULL, NULL, NULL, 'Course enrolments'),
(1469, 'jan', NULL, NULL, 'يناير', 'Jan', NULL, NULL, NULL, NULL, NULL, 'Jan'),
(1470, 'feb', NULL, NULL, 'فبراير', 'Fév', NULL, NULL, NULL, NULL, NULL, 'Feb'),
(1471, 'mar', NULL, NULL, 'مارس', 'Mar', NULL, NULL, NULL, NULL, NULL, 'Mar'),
(1472, 'apr', NULL, NULL, 'أبريل', 'Avr', NULL, NULL, NULL, NULL, NULL, 'Apr'),
(1473, 'jun', NULL, NULL, 'يونيو', 'Juin', NULL, NULL, NULL, NULL, NULL, 'Jun'),
(1474, 'jul', NULL, NULL, 'يوليو', 'Juil', NULL, NULL, NULL, NULL, NULL, 'Jul'),
(1475, 'aug', NULL, NULL, 'أغسطس', 'Août', NULL, NULL, NULL, NULL, NULL, 'Aug'),
(1476, 'sep', NULL, NULL, 'سبتمبر', 'Sep', NULL, NULL, NULL, NULL, NULL, 'Sep'),
(1477, 'oct', NULL, NULL, 'أكتوبر', 'Oct', NULL, NULL, NULL, NULL, NULL, 'Oct'),
(1478, 'nov', NULL, NULL, 'نوفمبر', 'Nov', NULL, NULL, NULL, NULL, NULL, 'Nov'),
(1479, 'go', NULL, NULL, 'يذهب', 'Aller', NULL, NULL, NULL, NULL, NULL, 'Go'),
(1480, 'the_dates_of_month', NULL, NULL, 'مواعيد الشهر', 'Les dates du mois', NULL, NULL, NULL, NULL, NULL, 'The dates of month'),
(1481, 'upload_scorm_course', NULL, NULL, 'تحميل دورة scorm', 'Télécharger le cours scorm', NULL, NULL, NULL, NULL, NULL, '上传scorm课程'),
(1482, 'upload_course', NULL, NULL, 'تحميل الدورة', 'Téléchargez le cours', NULL, NULL, NULL, NULL, NULL, '上传课程'),
(1483, 'click_the_upload_course_button', NULL, NULL, 'انقر فوق زر تحميل الدورة', 'Cliquez sur le bouton de téléchargement de cours', NULL, NULL, NULL, NULL, NULL, '点击上传课程按钮'),
(1484, 'you_will_get_a_floating_form_after_clicking_the_button', NULL, NULL, 'ستحصل على نموذج عائم بعد النقر فوق الزر', 'Vous obtiendrez un formulaire flottant après avoir cliqué sur le bouton', NULL, NULL, NULL, NULL, NULL, '点击按钮后你会得到一个浮动表单'),
(1485, 'select_a_scorm_provider_first', NULL, NULL, 'حدد مزود scorm أولا', 'Sélectionnez d\'abord un fournisseur scorm', NULL, NULL, NULL, NULL, NULL, '首先选择 scorm 提供商'),
(1486, 'choose_your_scorm_zip_file', NULL, NULL, 'اختر ملف مضغوط scorm الخاص بك', 'Choisissez votre fichier zip scorm', NULL, NULL, NULL, NULL, NULL, '选择您的 scorm zip 文件'),
(1487, 'click_the_upload_button_to_save_the_course_file', NULL, NULL, 'انقر فوق الزر \"تحميل\" لحفظ ملف الدورة التدريبية', 'Cliquez sur le bouton de téléchargement pour enregistrer le fichier de cours', NULL, NULL, NULL, NULL, NULL, '单击上传按钮保存课程文件'),
(1488, 'scorm', NULL, NULL, 'سكورم', 'scorme', NULL, NULL, NULL, NULL, NULL, '斯科姆'),
(1489, 'upload_h5p_file', NULL, NULL, 'تحميل ملف h5p', 'Télécharger le fichier h5p', NULL, NULL, NULL, NULL, NULL, '上传h5p文件'),
(1490, 'remove', 'Remove', NULL, 'يزيل', 'Retirer', NULL, NULL, NULL, NULL, NULL, '消除'),
(1491, 'click_the_upload_h5p_course_button.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1492, 'choose_your_h5p_file.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1493, 'h5p', NULL, NULL, 'H5p', 'H5p', NULL, NULL, NULL, NULL, NULL, 'H5p'),
(1494, 'deactivate', NULL, NULL, 'تعطيل', 'Désactiver', NULL, NULL, NULL, NULL, NULL, '停用'),
(1495, 'blog_details', NULL, NULL, 'تفاصيل المدونة', 'Détails du blog', NULL, NULL, NULL, NULL, NULL, '博客详细信息'),
(1496, 'inspirational_journeys', NULL, NULL, 'رحلات ملهمة', 'Voyages inspirants', NULL, NULL, NULL, NULL, NULL, '励志之旅'),
(1497, 'follow_the_stories_of_academics_and_their_research_expeditions', NULL, NULL, 'تابع قصص الأكاديميين وبعثاتهم البحثية', 'Suivez les histoires d\'universitaires et leurs expéditions de recherche', NULL, NULL, NULL, NULL, NULL, '关注学者及其研究探险的故事'),
(1498, 'comments', NULL, NULL, 'تعليقات', 'commentaires', NULL, NULL, NULL, NULL, NULL, '评论'),
(1499, 'leave_a_comment', NULL, NULL, 'اترك تعليقا', 'laissez un commentaire', NULL, NULL, NULL, NULL, NULL, '发表评论'),
(1500, 'enter_your_comments_here', NULL, NULL, 'أدخل تعليقاتك هنا', 'Entrez vos commentaires ici', NULL, NULL, NULL, NULL, NULL, '在此输入您的评论'),
(1501, 'type_your_keywords', NULL, NULL, 'اكتب كلماتك الرئيسية', 'Tapez vos mots clés', NULL, NULL, NULL, NULL, NULL, '输入您的关键字'),
(1502, 'recent_posts', NULL, NULL, 'المشاركات الاخيرة', 'Messages récents', NULL, NULL, NULL, NULL, NULL, '最近的帖子'),
(1503, 'edit_blog', NULL, NULL, 'تحرير المدونة', 'Modifier le blog', NULL, NULL, NULL, NULL, NULL, '编辑博客'),
(1504, 'edit_your_blog', NULL, NULL, 'قم بتحرير مدونتك', 'Modifier votre blog', NULL, NULL, NULL, NULL, NULL, '编辑您的博客'),
(1505, 'update_blog', NULL, NULL, 'تحديث المدونة', 'Mettre à jour le blog', NULL, NULL, NULL, NULL, NULL, 'Update blog'),
(1506, 'blog_updated_successfully', NULL, NULL, 'تم تحديث المدونة بنجاح', 'Blog mis à jour avec succès', NULL, NULL, NULL, NULL, NULL, 'Blog updated successfully'),
(1507, 'add_instructor', NULL, NULL, 'أضف مدرسًا', 'Ajouter un instructeur', NULL, NULL, NULL, NULL, NULL, 'Add instructor'),
(1508, 'instructor_edit', NULL, NULL, 'مدرس تحرير', 'Modification de l\'instructeur', NULL, NULL, NULL, NULL, NULL, 'Instructor edit'),
(1509, 'instructor_edit_form', NULL, NULL, 'استمارة تحرير المدرس', 'Formulaire de modification de l\'instructeur', NULL, NULL, NULL, NULL, NULL, 'Instructor edit form'),
(1510, 'short_title', NULL, NULL, 'عنوان قصير', 'Titre court', NULL, NULL, NULL, NULL, NULL, 'Short title'),
(1511, 'ccavenue', NULL, NULL, 'ككافينيو', 'Ccavenue', NULL, NULL, NULL, NULL, NULL, '卡文尼'),
(1512, 'ccavenue_merchant_id', NULL, NULL, 'معرف تاجر Ccavenue', 'Identifiant du marchand Ccavenue', NULL, NULL, NULL, NULL, NULL, 'Ccavenue商户ID'),
(1513, 'ccavenue_working_key', NULL, NULL, 'مفتاح عمل Ccavenue', 'Clé de travail Ccavenue', NULL, NULL, NULL, NULL, NULL, 'Ccavenue工作钥匙'),
(1514, 'ccavenue_access_code', NULL, NULL, 'رمز الوصول Ccavenue', 'Code d\'accès Ccavenue', NULL, NULL, NULL, NULL, NULL, 'Ccavenue访问代码'),
(1515, 'iyzico', NULL, NULL, 'ايزيكو', 'Iyzico', NULL, NULL, NULL, NULL, NULL, '伊济科'),
(1516, 'api_test_key', NULL, NULL, 'مفتاح اختبار Api', 'Clé de test API', NULL, NULL, NULL, NULL, NULL, 'API测试密钥'),
(1517, 'secret_test_key', NULL, NULL, 'مفتاح الاختبار السري', 'Clé de test secrète', NULL, NULL, NULL, NULL, NULL, '秘密测试密钥'),
(1518, 'api_live_key', NULL, NULL, 'مفتاح Api المباشر', 'Clé en direct API', NULL, NULL, NULL, NULL, NULL, 'API 实时密钥'),
(1519, 'paystack', NULL, NULL, 'Paystack', 'Pile de paie', NULL, NULL, NULL, NULL, NULL, '支付宝'),
(1520, 'public_test_key', NULL, NULL, 'مفتاح الاختبار العام', 'Clé de test publique', NULL, NULL, NULL, NULL, NULL, '公共测试密钥'),
(1521, 'paytm', NULL, NULL, 'Paytm', 'Paiement', NULL, NULL, NULL, NULL, NULL, '支付宝'),
(1522, 'paytm_merchant_key', NULL, NULL, 'مفتاح التاجر Paytm', 'Clé marchand Paytm', NULL, NULL, NULL, NULL, NULL, 'Paytm 商户密钥'),
(1523, 'paytm_merchant_mid', NULL, NULL, 'تاجر Paytm mid', 'Paytm commerçant milieu', NULL, NULL, NULL, NULL, NULL, 'Paytm 商户中'),
(1524, 'paytm_merchant_website', NULL, NULL, 'موقع التاجر Paytm', 'Site marchand Paytm', NULL, NULL, NULL, NULL, NULL, 'Paytm 商户网站'),
(1525, 'industry_type_id', NULL, NULL, 'معرف نوع الصناعة', 'Identifiant du type de secteur', NULL, NULL, NULL, NULL, NULL, '行业类型 ID'),
(1526, 'channel_id', NULL, NULL, 'معرف القناة', 'Identifiant de la chaine', NULL, NULL, NULL, NULL, NULL, '频道编号'),
(1527, 'current_course_provider', NULL, NULL, 'مزود الدورة الحالية', 'Fournisseur de cours actuel', NULL, NULL, NULL, NULL, NULL, '当前课程提供者'),
(1528, 'ispring', NULL, NULL, 'اسبرينج', 'Iprintemps', NULL, NULL, NULL, NULL, NULL, '爱泉'),
(1529, 'update_scorm_course', NULL, NULL, 'تحديث الدورة التدريبية', 'Mettre à jour le cours scorm', NULL, NULL, NULL, NULL, NULL, '更新scorm课程'),
(1530, 'update_course', NULL, NULL, 'تحديث الدورة', 'Mettre à jour le cours', NULL, NULL, NULL, NULL, NULL, '更新课程'),
(1531, 'not_started_yet', NULL, NULL, 'لم تبدأ بعد', 'Pas encore commencé', NULL, NULL, NULL, NULL, NULL, 'Not started yet'),
(1532, 'not_completed_yet', NULL, NULL, 'لم تكتمل بعد', 'Pas encore complété', NULL, NULL, NULL, NULL, NULL, 'Not completed yet'),
(1533, 'enrolled_from', NULL, NULL, 'مسجل من', 'Inscrit depuis', NULL, NULL, NULL, NULL, NULL, 'Enrolled from'),
(1534, 'last_seen_on', NULL, NULL, 'شوهد آخر مرة في', 'Vu pour la dernière fois le', NULL, NULL, NULL, NULL, NULL, 'Last seen on'),
(1535, 'completed_on', NULL, NULL, 'اكتمل في', 'Terminé le', NULL, NULL, NULL, NULL, NULL, 'Completed on'),
(1536, 'completed_lesson', NULL, NULL, 'الدرس مكتمل', 'Leçon terminée', NULL, NULL, NULL, NULL, NULL, 'Completed lesson'),
(1537, 'out_of', NULL, NULL, 'بعيدا عن المكان', 'Hors de', NULL, NULL, NULL, NULL, NULL, 'Out of'),
(1538, 'watched_duration', NULL, NULL, 'مدة المشاهدة', 'Durée visionnée', NULL, NULL, NULL, NULL, NULL, 'Watched duration'),
(1539, 'instructor_add', 'Instructor add', NULL, 'إضافة المدرب', 'Instructeur ajouter', NULL, NULL, NULL, NULL, NULL, 'Instructor add'),
(1540, 'instructor_add_form', 'Instructor add form', NULL, 'المدرب إضافة النموذج', 'L\'instructeur ajoute un formulaire', NULL, NULL, NULL, NULL, NULL, 'Instructor add form'),
(1541, 'logo_updated', 'Logo updated', NULL, 'تم تحديث الشعار', 'Logo mis à jour', NULL, NULL, NULL, NULL, NULL, '标志已更新'),
(1542, 'favicon_updated', NULL, NULL, 'تم تحديث الأيقونة المفضلة', 'Favicon mis à jour', NULL, NULL, NULL, NULL, NULL, '网站图标已更新'),
(1543, 'welcome_to', NULL, NULL, 'مرحبا بك في', 'Bienvenue à', NULL, NULL, NULL, NULL, NULL, '欢迎来到'),
(1544, 'join_for_free', NULL, NULL, 'انضم مجانا', 'Rejoignez gratuitement', NULL, NULL, NULL, NULL, NULL, '免费加入'),
(1545, 'experienced_instructor', NULL, NULL, 'مدرب من ذوي الخبرة', 'Instructeur expérimenté', NULL, NULL, NULL, NULL, NULL, '经验丰富的教练'),
(1546, 'quality_courses', NULL, NULL, 'دورات الجودة', 'Des cours de qualité', NULL, NULL, NULL, NULL, NULL, '精品课程'),
(1547, 'latest_top_skills', NULL, NULL, 'أحدث المهارات', 'Dernières meilleures compétences', NULL, NULL, NULL, NULL, NULL, '最新顶级技能'),
(1548, 'stay_ahead_with_our_curated_courses,_mastering_in-demand_skills.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1549, 'unlock_new_expertise_with_industry_experts_and_thought_leaders_in_our_upcoming_courses.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1550, 'quality_educators', NULL, NULL, 'معلمو الجودة', 'Éducateurs de qualité', NULL, NULL, NULL, NULL, NULL, 'Quality educators'),
(1551, 'cost-free_course', NULL, NULL, 'دورة مجانية', 'Cours gratuit', NULL, NULL, NULL, NULL, NULL, 'Cost-free course'),
(1552, 'popular_instructor', NULL, NULL, 'مدرب شعبي', 'Instructeur populaire', NULL, NULL, NULL, NULL, NULL, 'Popular instructor'),
(1553, 'our_popular_instructor_is_a_charismatic_and_knowledgeable_individual_who_captivates_students_with_engaging_lessons,_making_learning_a_delightful_and_enriching_experience.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1554, 'follow_the_latest_news', NULL, NULL, 'تابع آخر الأخبار', 'Suivez les dernières nouvelles', NULL, NULL, NULL, NULL, NULL, 'Follow the latest news'),
(1555, 'course_eligibility_notification', NULL, NULL, 'إخطار الأهلية للدورة', 'Avis d\'éligibilité au cours', NULL, NULL, NULL, NULL, NULL, 'Course eligibility notification'),
(1556, 'stay_up_to_date_on_course_certificate_eligibility.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1557, 'offline_payment_suspended_mail', NULL, NULL, 'تم تعليق الدفع دون اتصال بالبريد', 'Courrier suspendu de paiement hors ligne', NULL, NULL, NULL, NULL, NULL, 'Offline payment suspended mail'),
(1558, 'if_students_provides_fake_information,_notify_them_of_the_suspension', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1559, 'course_bundle_purchase_notification', NULL, NULL, 'إشعار شراء حزمة الدورة التدريبية', 'Notification d\'achat d\'un ensemble de cours', NULL, NULL, NULL, NULL, NULL, 'Course bundle purchase notification'),
(1560, 'stay_up-to-date_on_student_course_bundle_purchases.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1561, 'new_user_added_as_affiliator', NULL, NULL, 'تمت إضافة مستخدم جديد كعضو تابع', 'Nouvel utilisateur ajouté en tant qu\'affilieur', NULL, NULL, NULL, NULL, NULL, 'New user added as affiliator'),
(1562, 'send_account_information_to_the_new_user', NULL, NULL, 'أرسل معلومات الحساب إلى المستخدم الجديد', 'Envoyer les informations de compte au nouvel utilisateur', NULL, NULL, NULL, NULL, NULL, 'Send account information to the new user'),
(1563, 'configure_for_affiliator', NULL, NULL, 'تكوين للجهة التابعة', 'Configurer pour l\'affilieur', NULL, NULL, NULL, NULL, NULL, 'Configure for affiliator'),
(1564, 'affiliate_approval_notification', NULL, NULL, 'إخطار موافقة المنتسبين', 'Notification d\'approbation d\'affiliation', NULL, NULL, NULL, NULL, NULL, 'Affiliate approval notification'),
(1565, 'send_affiliate_approval_mail_to_the_user_account', NULL, NULL, 'إرسال بريد الموافقة التابعة لحساب المستخدم', 'Envoyer un e-mail d\'approbation d\'affiliation au compte d\'utilisateur', NULL, NULL, NULL, NULL, NULL, 'Send affiliate approval mail to the user account'),
(1566, 'affiliator_request_cancellation', NULL, NULL, 'إلغاء طلب التابع', 'Annulation de la demande d\'affiliation', NULL, NULL, NULL, NULL, NULL, 'Affiliator request cancellation'),
(1567, 'send_mail,_when_you_cancel_the_affiliation_request', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1568, 'affiliation_money_withdrawal_request', NULL, NULL, 'طلب سحب أموال الانتساب', 'Demande de retrait d\'argent d\'affiliation', NULL, NULL, NULL, NULL, NULL, 'Affiliation money withdrawal request'),
(1569, 'send_mail,_when_the_users_request_the_withdrawal_of_money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1570, 'approval_of_withdrawal_request_of_affiliation', NULL, NULL, 'الموافقة على طلب سحب الانتساب', 'Approbation de la demande de retrait d\'affiliation', NULL, NULL, NULL, NULL, NULL, 'Approval of withdrawal request of affiliation'),
(1571, 'send_mail,_when_you_approved_the_affiliation_withdrawal_request', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1572, 'completed', NULL, NULL, 'مكتمل', 'Complété', NULL, NULL, NULL, NULL, NULL, 'Completed'),
(1573, 'this_video_will_be_shown_on_web_application', NULL, NULL, 'سيُعرض هذا الفيديو في تطبيق الويب', 'Cette vidéo sera diffusée sur l\'application Web', NULL, NULL, NULL, NULL, NULL, 'This video will be shown on web application'),
(1574, 'thumbnail', NULL, NULL, 'ظفري', 'Vignette', NULL, NULL, NULL, NULL, NULL, 'Thumbnail'),
(1575, 'caption', NULL, NULL, 'التسمية التوضيحية', 'Légende', NULL, NULL, NULL, NULL, NULL, 'Caption'),
(1576, '.vtt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1577, 'choose_your_caption_file', NULL, NULL, 'اختر ملف التسمية التوضيحية الخاص بك', 'Choisissez votre fichier de sous-titres', NULL, NULL, NULL, NULL, NULL, 'Choose your caption file'),
(1578, 'lesson_provider', NULL, NULL, 'مزود الدرس', 'Prestataire de cours', NULL, NULL, NULL, NULL, NULL, 'Lesson provider'),
(1579, 'for_mobile_application', NULL, NULL, 'لتطبيقات الهاتف المحمول', 'Pour application mobile', NULL, NULL, NULL, NULL, NULL, 'For mobile application'),
(1580, 'only', NULL, NULL, 'فقط', 'Seul', NULL, NULL, NULL, NULL, NULL, 'Only'),
(1581, 'type_video_is_acceptable_for_mobile_application', NULL, NULL, 'نوع الفيديو مقبول لتطبيقات الهاتف المحمول', 'Le type vidéo est acceptable pour l\'application mobile', NULL, NULL, NULL, NULL, NULL, 'Type video is acceptable for mobile application'),
(1582, 'iframe', NULL, NULL, 'Iframe', 'Iframe', NULL, NULL, NULL, NULL, NULL, '内嵌框架'),
(1583, 'forum', NULL, NULL, 'المنتدى', 'Forum', NULL, NULL, NULL, NULL, NULL, '论坛'),
(1585, 'please_ensure_that_your_course_has_at_least_one_section_and_one_lesson.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1586, 'total_questions', NULL, NULL, 'مجموع الأسئلة', 'Nombre total de questions', NULL, NULL, NULL, NULL, NULL, 'Total questions'),
(1587, 'total_participant_students', NULL, NULL, 'مجموع الطلاب المشاركين', 'Nombre total d\'étudiants participants', NULL, NULL, NULL, NULL, NULL, 'Total participant students'),
(1588, 'participant_students', NULL, NULL, 'الطلاب المشاركون', 'Étudiants participants', NULL, NULL, NULL, NULL, NULL, 'Participant students'),
(1589, 'select_student', NULL, NULL, 'اختر الطالب', 'Sélectionnez un étudiant', NULL, NULL, NULL, NULL, NULL, 'Select student'),
(1590, 'select_a_student_to_view_the_answer_sheet', NULL, NULL, 'حدد طالبًا لعرض ورقة الإجابة', 'Sélectionnez un élève pour afficher la feuille de réponses', NULL, NULL, NULL, NULL, NULL, 'Select a student to view the answer sheet'),
(1591, 'courses_included', NULL, NULL, 'وشملت الدورات', 'Cours inclus', NULL, NULL, NULL, NULL, NULL, 'Courses included'),
(1592, 'subscription', NULL, NULL, 'الاشتراك', 'Abonnement', NULL, NULL, NULL, NULL, NULL, 'Subscription'),
(1593, 'days', NULL, NULL, 'أيام', 'Jours', NULL, NULL, NULL, NULL, NULL, 'Days'),
(1594, 'included_courses', NULL, NULL, 'الدورات المضمنة', 'Cours inclus', NULL, NULL, NULL, NULL, NULL, 'Included courses'),
(1595, 'copyed', NULL, NULL, 'منسوخ', 'Copié', NULL, NULL, NULL, NULL, NULL, 'Copyed'),
(1596, '_learning_animal_name_', NULL, NULL, 'تعلم اسم الحيوان', 'apprendre le nom de l\'animal', NULL, NULL, NULL, NULL, NULL, '学习动物名字'),
(1597, 'share_and_earn', NULL, NULL, 'شارك واكسب', 'Partagez et gagnez', NULL, NULL, NULL, NULL, NULL, '分享并赚取'),
(1598, 'supreme_photoshop_training:_from_beginner_to_expert', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1599, 'write_a_review', NULL, NULL, 'أكتب مراجعة', 'Écrire une critique', NULL, NULL, NULL, NULL, NULL, '写评论'),
(1600, '1_start_rating', NULL, NULL, '1 بدء التصويت', '1 note de départ', NULL, NULL, NULL, NULL, NULL, '1 开始评级'),
(1601, '2_start_rating', NULL, NULL, '2 بدء التصويت', '2 cote de départ', NULL, NULL, NULL, NULL, NULL, '2 起始评级'),
(1602, '3_start_rating', NULL, NULL, '3 بدء التصويت', '3 cote de départ', NULL, NULL, NULL, NULL, NULL, '3 开始评级'),
(1603, '4_start_rating', NULL, NULL, '4 بدء التصويت', '4 cote de départ', NULL, NULL, NULL, NULL, NULL, '4 开始评级'),
(1604, '5_start_rating', NULL, NULL, '5 بدء التصويت', '5 cote de départ', NULL, NULL, NULL, NULL, NULL, '5 开始评级'),
(1605, 'write_your_comment', NULL, NULL, 'اكتب تعليقك', 'Écrivez votre commentaire', NULL, NULL, NULL, NULL, NULL, '写下您的评论'),
(1606, 'adobe_illustrator_cc_-_essentials_training_course', NULL, NULL, 'Adobe Illustrator CC - دورة تدريبية في الأساسيات', 'Adobe illustrator cc - cours de formation de base', NULL, NULL, NULL, NULL, NULL, 'Adobe illustrator cc - essentials training course'),
(1607, 'mon', NULL, NULL, 'الإثنين', 'Lun', NULL, NULL, NULL, NULL, NULL, 'Mon'),
(1608, 'purchased_courses', NULL, NULL, 'الدورات المشتراة', 'Cours achetés', NULL, NULL, NULL, NULL, NULL, 'Purchased courses'),
(1609, 'invoice', NULL, NULL, 'فاتورة', 'Facture', NULL, NULL, NULL, NULL, NULL, 'Invoice'),
(1610, 'assignment_list', NULL, NULL, 'قائمة الواجبات', 'Liste des affectations', NULL, NULL, NULL, NULL, NULL, 'Assignment list'),
(1611, 'uncheck', NULL, NULL, 'قم بإلغاء التحديد', 'Décochez', NULL, NULL, NULL, NULL, NULL, 'Uncheck'),
(1612, 'latest_from_our_blog', NULL, NULL, 'الأحدث من مدونتنا', 'Dernières nouvelles de notre blog', NULL, NULL, NULL, NULL, NULL, 'Latest from our blog'),
(1613, 'exploring_the_cutting-edge_insights_and_updates_on_our_blog', NULL, NULL, 'استكشاف أحدث الرؤى والتحديثات على مدونتنا', 'Explorer les informations et les mises à jour de pointe sur notre blog', NULL, NULL, NULL, NULL, NULL, 'Exploring the cutting-edge insights and updates on our blog'),
(1614, 'see_all', NULL, NULL, 'اظهار الكل', 'Voir tout', NULL, NULL, NULL, NULL, NULL, 'See all'),
(1615, 'popular_blogs', NULL, NULL, 'مدونات شعبية', 'Blogues populaires', NULL, NULL, NULL, NULL, NULL, 'Popular blogs'),
(1616, 'learn_from_expert_bloggers_and_expand_your_knowledge', NULL, NULL, 'تعلم من المدونين الخبراء ووسع معرفتك', 'Apprenez des blogueurs experts et élargissez vos connaissances', NULL, NULL, NULL, NULL, NULL, 'Learn from expert bloggers and expand your knowledge'),
(1617, 'quiz_submission_successfully', NULL, NULL, 'إرسال الاختبار بنجاح', 'Soumission du quiz réussie', NULL, NULL, NULL, NULL, NULL, 'Quiz submission successfully'),
(1618, 'obtained_marks', NULL, NULL, 'حصل على العلامات', 'Notes obtenues', NULL, NULL, NULL, NULL, NULL, 'Obtained marks'),
(1619, 'correct', NULL, NULL, 'صحيح', 'Correct', NULL, NULL, NULL, NULL, NULL, 'Correct'),
(1620, 'wrong', NULL, NULL, 'خطأ', 'Faux', NULL, NULL, NULL, NULL, NULL, 'Wrong'),
(1621, 'correct_answer', NULL, NULL, 'اجابة صحيحة', 'Bonne réponse', NULL, NULL, NULL, NULL, NULL, 'Correct answer'),
(1622, 'user_added_successfully', 'User added successfully', NULL, 'تمت إضافة المستخدم بنجاح', 'Utilisateur ajouté avec succès', NULL, NULL, NULL, NULL, NULL, 'User added successfully'),
(1623, 'pay', NULL, NULL, 'يدفع', 'Payer', NULL, NULL, NULL, NULL, NULL, '支付'),
(1624, 'public_instructor_settings', NULL, NULL, 'إعدادات المعلم العام', 'Paramètres de l\'instructeur public', NULL, NULL, NULL, NULL, NULL, '公共导师设置'),
(1625, 'allow_public_instructor', NULL, NULL, 'السماح للمدرس العام', 'Autoriser l\'instructeur public', NULL, NULL, NULL, NULL, NULL, '允许公共教练'),
(1626, 'instructor_application_note', NULL, NULL, 'مذكرة طلب المدرب', 'Note d\'application de l\'instructeur', NULL, NULL, NULL, NULL, NULL, '讲师应用说明'),
(1627, 'instructor_commission_ettings', NULL, NULL, 'اعدادات عمولة المدرب', 'Réglages de la commission de l\'instructeur', NULL, NULL, NULL, NULL, NULL, '导师佣金设置'),
(1628, 'instructor_revenue_percentage', NULL, NULL, 'نسبة إيراد المدرب', 'Pourcentage des revenus de l\'instructeur', NULL, NULL, NULL, NULL, NULL, '教练收入百分比'),
(1629, 'admin_revenue_percentage', NULL, NULL, 'نسبة الايرادات الادارية', 'Pourcentage des revenus d\'administration', NULL, NULL, NULL, NULL, NULL, '管理收入百分比'),
(1630, 'applicant_details', NULL, NULL, 'تفاصيل مقدم الطلب', 'Coordonnées du demandeur', NULL, NULL, NULL, NULL, NULL, 'Applicant details'),
(1631, 'application_details', NULL, NULL, 'تفاصيل التطبيق', 'Détails de la demande', NULL, NULL, NULL, NULL, NULL, 'Application details'),
(1632, 'download', NULL, NULL, 'تحميل', 'Télécharger', NULL, NULL, NULL, NULL, NULL, 'Download'),
(1633, 'approve', NULL, NULL, 'يعتمد', 'Approuver', NULL, NULL, NULL, NULL, NULL, 'Approve'),
(1634, 'approved', NULL, NULL, 'موافقة', 'Approuvé', NULL, NULL, NULL, NULL, NULL, 'Approved'),
(1635, 'assign_permission', 'Assign permission', NULL, 'منح الإذن', 'Attribuer une autorisation', NULL, NULL, NULL, NULL, NULL, 'Assign permission'),
(1636, 'manage_profil', NULL, NULL, 'إدارة الملف الشخصي', 'Gérer le profil', NULL, NULL, NULL, NULL, NULL, 'Manage profile'),
(1637, 'educator_profile', NULL, NULL, NULL, 'Profil de l\'éducateur', NULL, NULL, NULL, NULL, NULL, 'Educator profile'),
(1638, 'statistics', NULL, NULL, NULL, 'Statistiques', NULL, NULL, NULL, NULL, NULL, 'Statistics'),
(1639, 'total_students', NULL, NULL, NULL, 'Nombre total d\'étudiants', NULL, NULL, NULL, NULL, NULL, 'Total students'),
(1640, 'the_complete_python_bootcamp_from_zero_to_hero', NULL, NULL, NULL, 'Le bootcamp python complet de zéro à héros', NULL, NULL, NULL, NULL, NULL, 'The complete python bootcamp from zero to hero'),
(1641, 'course_added_to_wishlist', NULL, NULL, NULL, 'Cours ajouté à la liste de souhaits', NULL, NULL, NULL, NULL, NULL, 'Course added to wishlist'),
(1642, 'manage_course_bundle', NULL, NULL, NULL, 'Gérer l\'ensemble de cours', NULL, NULL, NULL, NULL, NULL, 'Manage course bundle'),
(1643, 'bundle', NULL, NULL, NULL, 'Empaqueter', NULL, NULL, NULL, NULL, NULL, 'Bundle'),
(1644, 'subscription_limit', NULL, NULL, NULL, 'Limite d\'abonnement', NULL, NULL, NULL, NULL, NULL, 'Subscription limit'),
(1645, 'edit_course_bundle', NULL, NULL, NULL, 'Modifier l\'ensemble de cours', NULL, NULL, NULL, NULL, NULL, 'Edit course bundle'),
(1646, 'bundle_add_form', NULL, NULL, NULL, 'Formulaire d\'ajout groupé', NULL, NULL, NULL, NULL, NULL, '捆绑添加表格'),
(1647, 'course_bundle_title', NULL, NULL, NULL, 'Titre de l\'ensemble de cours', NULL, NULL, NULL, NULL, NULL, '课程包标题'),
(1648, 'select_courses', NULL, NULL, NULL, 'Sélectionnez des cours', NULL, NULL, NULL, NULL, NULL, '选择课程'),
(1649, 'current_price_of_the_courses_is', NULL, NULL, NULL, 'Le prix actuel des cours est', NULL, NULL, NULL, NULL, NULL, '目前课程价格为'),
(1650, 'bundle_price', NULL, NULL, NULL, 'Prix ​​du forfait', NULL, NULL, NULL, NULL, NULL, '捆绑价格'),
(1651, 'subscription_renew_days', NULL, NULL, NULL, 'Jours de renouvellement de l\'abonnement', NULL, NULL, NULL, NULL, NULL, '订阅续订天数'),
(1652, 'count_day', NULL, NULL, NULL, 'Compter le jour', NULL, NULL, NULL, NULL, NULL, '计算日'),
(1653, 'banner', NULL, NULL, NULL, 'Bannière', NULL, NULL, NULL, NULL, NULL, '横幅'),
(1654, 'update_bundle', NULL, NULL, NULL, 'Ensemble de mise à jour', NULL, NULL, NULL, NULL, NULL, '更新包');
INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `spanish`, `arabic`, `french`, `georgian`, `german`, `hindi`, `indonesia`, `italian`, `chinese`) VALUES
(1655, 'complete_guitar_lessons_system_', NULL, NULL, NULL, 'Système complet de cours de guitare', NULL, NULL, NULL, NULL, NULL, '完整的吉他课程系统'),
(1656, 'after_effects_cc_2019:_complete_course', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1657, 'how_to_use_lighting_design_to_transform_your_home', NULL, NULL, NULL, 'Comment utiliser la conception d\'éclairage pour transformer votre maison', NULL, NULL, NULL, NULL, NULL, '如何利用照明设计来改造你的家'),
(1658, 'invoice_id', NULL, NULL, NULL, 'Identifiant de facture', NULL, NULL, NULL, NULL, NULL, '发票编号'),
(1659, 'billed_to', NULL, NULL, NULL, 'Facturé à', NULL, NULL, NULL, NULL, NULL, '付款人'),
(1660, 'invoice_total', NULL, NULL, NULL, 'Montant de la facture', NULL, NULL, NULL, NULL, NULL, '发票总计'),
(1661, 'qty', NULL, NULL, NULL, 'Qté', NULL, NULL, NULL, NULL, NULL, 'Qty'),
(1662, 'paid_by', NULL, NULL, NULL, 'Payé par', NULL, NULL, NULL, NULL, NULL, 'Paid by'),
(1663, 'grand_total', NULL, NULL, NULL, 'total', NULL, NULL, NULL, NULL, NULL, 'Grand total'),
(1664, 'print', NULL, NULL, NULL, 'Imprimer', NULL, NULL, NULL, NULL, NULL, 'Print'),
(1665, 'the_data_science_course:_complete_data_science', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1666, 'your_phone', NULL, NULL, NULL, 'Ton téléphone', NULL, NULL, NULL, NULL, NULL, 'Your phone'),
(1667, 'newsletter_added_successfully', NULL, NULL, NULL, 'Newsletter ajoutée avec succès', NULL, NULL, NULL, NULL, NULL, 'Newsletter added successfully'),
(1668, 'edit_newsletter_template', NULL, NULL, NULL, 'Modifier le modèle de newsletter', NULL, NULL, NULL, NULL, NULL, 'Edit newsletter template'),
(1669, 'send_newsletter', NULL, NULL, NULL, 'Envoyer la newsletter', NULL, NULL, NULL, NULL, NULL, 'Send newsletter'),
(1670, 'send_to', NULL, NULL, NULL, 'Envoyer à', NULL, NULL, NULL, NULL, NULL, 'Send to'),
(1671, 'selected_user', NULL, NULL, NULL, 'Utilisateur sélectionné', NULL, NULL, NULL, NULL, NULL, 'Selected user'),
(1672, 'all_users', NULL, NULL, NULL, 'Tous les utilisateurs', NULL, NULL, NULL, NULL, NULL, 'All users'),
(1673, 'all_student', NULL, NULL, NULL, 'Tout étudiant', NULL, NULL, NULL, NULL, NULL, 'All student'),
(1674, 'all_instructor', NULL, NULL, NULL, 'Tout instructeur', NULL, NULL, NULL, NULL, NULL, 'All instructor'),
(1675, 'newsletter_subscriber', NULL, NULL, NULL, 'Abonné à la newsletter', NULL, NULL, NULL, NULL, NULL, 'Newsletter subscriber'),
(1676, 'all_subscriber', NULL, NULL, NULL, 'Tout abonné', NULL, NULL, NULL, NULL, NULL, 'All subscriber'),
(1677, 'registered_user', NULL, NULL, NULL, 'Utilisateur enregistré', NULL, NULL, NULL, NULL, NULL, 'Registered user'),
(1678, 'non_registered_user', NULL, NULL, NULL, 'Utilisateur non enregistré', NULL, NULL, NULL, NULL, NULL, 'Non registered user'),
(1679, 'select_your_users', NULL, NULL, NULL, 'Sélectionnez vos utilisateurs', NULL, NULL, NULL, NULL, NULL, 'Select your users'),
(1680, 'newsletter_deleted_successfully', NULL, NULL, NULL, 'Newsletter supprimée avec succès', NULL, NULL, NULL, NULL, NULL, 'Newsletter deleted successfully'),
(1681, 'add_phrase', NULL, NULL, NULL, 'Ajouter une phrase', NULL, NULL, NULL, NULL, NULL, '添加短语'),
(1682, 'language_deleted_successfully', 'Language deleted successfully', NULL, 'Language deleted successfully', NULL, NULL, NULL, NULL, NULL, NULL, '语言删除成功'),
(1683, 'paramètres_multilingues', NULL, NULL, NULL, 'Paramètres multilingues', NULL, NULL, NULL, NULL, NULL, NULL),
(1684, 'it_is_permanently_enabled_for_student_email_verification', NULL, NULL, NULL, 'Elle est activée en permanence pour la vérification des e-mails des étudiants', NULL, NULL, NULL, NULL, NULL, NULL),
(1685, 'stay_up-to-date_on_student_course_purchases', NULL, NULL, NULL, 'Restez à jour sur les achats de cours des étudiants', NULL, NULL, NULL, NULL, NULL, NULL),
(1686, 'stay_up_to_date_on_student_course_completion', NULL, NULL, NULL, 'Restez à jour sur la fin de cours des étudiants', NULL, NULL, NULL, NULL, NULL, NULL),
(1687, 'go_to_addon_list', NULL, NULL, NULL, 'Aller à la liste des modules complémentaires', NULL, NULL, NULL, NULL, NULL, NULL),
(1688, 'affiliator_list', NULL, NULL, NULL, 'Liste des affiliés', NULL, NULL, NULL, NULL, NULL, NULL),
(1689, 'ticket_details', NULL, NULL, NULL, 'Détails du ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1690, 'closed_ticket', NULL, NULL, NULL, 'Ticket fermé', NULL, NULL, NULL, NULL, NULL, NULL),
(1691, 'assigned_ticket', NULL, NULL, NULL, 'Ticket assigné', NULL, NULL, NULL, NULL, NULL, NULL),
(1692, 'open_ticket', NULL, NULL, NULL, 'Ticket ouvert', NULL, NULL, NULL, NULL, NULL, NULL),
(1693, 'pending_ticket', NULL, NULL, NULL, 'Ticket en attente', NULL, NULL, NULL, NULL, NULL, NULL),
(1694, 'support_dashboard', NULL, NULL, NULL, 'Tableau de bord de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1695, 'subject_name', NULL, NULL, NULL, 'Nom du sujet', NULL, NULL, NULL, NULL, NULL, NULL),
(1696, 'created_at', NULL, NULL, NULL, 'Créé le', NULL, NULL, NULL, NULL, NULL, NULL),
(1697, 'customer_ticket', NULL, NULL, NULL, 'Ticket client', NULL, NULL, NULL, NULL, NULL, NULL),
(1698, 'change_ticket_status', NULL, NULL, NULL, 'Changer le statut du ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1699, 'no_support_ticket_found', NULL, NULL, NULL, 'Aucun ticket de support trouvé', NULL, NULL, NULL, NULL, NULL, NULL),
(1700, 'total_ticket', NULL, NULL, NULL, 'Total des tickets', NULL, NULL, NULL, NULL, NULL, NULL),
(1701, 'open_support_ticket', NULL, NULL, NULL, 'Ouvrir un ticket de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1702, 'submitted_tickets', NULL, NULL, NULL, 'Tickets soumis', NULL, NULL, NULL, NULL, NULL, NULL),
(1703, 'support_team', NULL, NULL, NULL, 'Équipe de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1704, 'faq_category', NULL, NULL, NULL, 'Catégorie FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1705, 'add_faq_category', NULL, NULL, NULL, 'Ajouter une catégorie FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1706, 'support_macro', NULL, NULL, NULL, 'Macro de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1707, 'add_new_support_macro', NULL, NULL, NULL, 'Ajouter une nouvelle macro de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1708, 'faq_report', NULL, NULL, NULL, 'Rapport FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1709, 'view_more_faq', NULL, NULL, NULL, 'Voir plus de FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1710, 'assigned_to', NULL, NULL, NULL, 'Assigné à', NULL, NULL, NULL, NULL, NULL, NULL),
(1711, 'affiliate_marketing_settings', NULL, NULL, NULL, 'Paramètres de marketing d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1712, 'affiliate_link', NULL, NULL, NULL, 'Lien d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1713, 'affiliate_revenue', NULL, NULL, NULL, 'Revenu d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1714, 'withdraw_affiliate_revenue', NULL, NULL, NULL, 'Retirer les revenus d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1715, 'withdraw_request_list', NULL, NULL, NULL, 'Liste des demandes de retrait', NULL, NULL, NULL, NULL, NULL, NULL),
(1716, 'submit_ticket', NULL, NULL, NULL, 'Soumettre un ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1717, 'support_requests', NULL, NULL, NULL, 'Demandes de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1718, 'ticket_submitted_successfully', NULL, NULL, NULL, 'Ticket soumis avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1719, 'open_tickets', NULL, NULL, NULL, 'Tickets ouverts', NULL, NULL, NULL, NULL, NULL, NULL),
(1720, 'new_ticket', NULL, NULL, NULL, 'Nouveau ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1721, 'resolved_ticket', NULL, NULL, NULL, 'Ticket résolu', NULL, NULL, NULL, NULL, NULL, NULL),
(1722, 'ticket_assigned_to_you', NULL, NULL, NULL, 'Ticket assigné à vous', NULL, NULL, NULL, NULL, NULL, NULL),
(1723, 'macro_replacement', NULL, NULL, NULL, 'Remplacement macro', NULL, NULL, NULL, NULL, NULL, NULL),
(1724, 'assigned_support_team', NULL, NULL, NULL, 'Équipe de support assignée', NULL, NULL, NULL, NULL, NULL, NULL),
(1725, 'ticket_priority', NULL, NULL, NULL, 'Priorité du ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1726, 'closed_tickets', NULL, NULL, NULL, 'Tickets fermés', NULL, NULL, NULL, NULL, NULL, NULL),
(1727, 'tickets', NULL, NULL, NULL, 'Tickets', NULL, NULL, NULL, NULL, NULL, NULL),
(1728, 'ticket_listings', NULL, NULL, NULL, 'Liste des tickets', NULL, NULL, NULL, NULL, NULL, NULL),
(1729, 'update_ticket', NULL, NULL, NULL, 'Mettre à jour le ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1730, 'macro_templates', NULL, NULL, NULL, 'Modèles de macro', NULL, NULL, NULL, NULL, NULL, NULL),
(1731, 'support_settings', NULL, NULL, NULL, 'Paramètres de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1732, 'macro_name', NULL, NULL, NULL, 'Nom de la macro', NULL, NULL, NULL, NULL, NULL, NULL),
(1733, 'reply_macro', NULL, NULL, NULL, 'Réponse macro', NULL, NULL, NULL, NULL, NULL, NULL),
(1734, 'add_macro', NULL, NULL, NULL, 'Ajouter une macro', NULL, NULL, NULL, NULL, NULL, NULL),
(1735, 'ticket_replied_successfully', NULL, NULL, NULL, 'Réponse au ticket envoyée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1736, 'reply', NULL, NULL, NULL, 'Répondre', NULL, NULL, NULL, NULL, NULL, NULL),
(1737, 'view_ticket', NULL, NULL, NULL, 'Voir le ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1738, 'filter_tickets', NULL, NULL, NULL, 'Filtrer les tickets', NULL, NULL, NULL, NULL, NULL, NULL),
(1739, 'view_all_tickets', NULL, NULL, NULL, 'Voir tous les tickets', NULL, NULL, NULL, NULL, NULL, NULL),
(1740, 'total_revenue', NULL, NULL, NULL, 'Revenu total', NULL, NULL, NULL, NULL, NULL, NULL),
(1741, 'withdraw_requests', NULL, NULL, NULL, 'Demandes de retrait', NULL, NULL, NULL, NULL, NULL, NULL),
(1742, 'withdraw_history', NULL, NULL, NULL, 'Historique des retraits', NULL, NULL, NULL, NULL, NULL, NULL),
(1743, 'view_affiliate_details', NULL, NULL, NULL, 'Voir les détails de l\'affilié', NULL, NULL, NULL, NULL, NULL, NULL),
(1744, 'click_statistics', NULL, NULL, NULL, 'Statistiques de clics', NULL, NULL, NULL, NULL, NULL, NULL),
(1745, 'clicks', NULL, NULL, NULL, 'Clics', NULL, NULL, NULL, NULL, NULL, NULL),
(1746, 'last_withdraw', NULL, NULL, NULL, 'Dernier retrait', NULL, NULL, NULL, NULL, NULL, NULL),
(1747, 'total_affiliate_revenue', NULL, NULL, NULL, 'Revenu total de l\'affilié', NULL, NULL, NULL, NULL, NULL, NULL),
(1748, 'affiliation_request_approved', NULL, NULL, NULL, 'Demande d\'affiliation approuvée', NULL, NULL, NULL, NULL, NULL, NULL),
(1749, 'affiliation_request_rejected', NULL, NULL, NULL, 'Demande d\'affiliation rejetée', NULL, NULL, NULL, NULL, NULL, NULL),
(1750, 'support_categories', NULL, NULL, NULL, 'Catégories de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1751, 'help_articles', NULL, NULL, NULL, 'Articles d\'aide', NULL, NULL, NULL, NULL, NULL, NULL),
(1752, 'all_articles', NULL, NULL, NULL, 'Tous les articles', NULL, NULL, NULL, NULL, NULL, NULL),
(1753, 'add_help_article', NULL, NULL, NULL, 'Ajouter un article d\'aide', NULL, NULL, NULL, NULL, NULL, NULL),
(1754, 'edit_help_article', NULL, NULL, NULL, 'Modifier l\'article d\'aide', NULL, NULL, NULL, NULL, NULL, NULL),
(1755, 'frequent_questions', NULL, NULL, NULL, 'Questions fréquentes', NULL, NULL, NULL, NULL, NULL, NULL),
(1756, 'back_to_faq', NULL, NULL, NULL, 'Retour à la FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1757, 'blog_view_count', NULL, NULL, NULL, 'Nombre de vues du blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1758, 'total_blogs', NULL, NULL, NULL, 'Total des blogs', NULL, NULL, NULL, NULL, NULL, NULL),
(1759, 'view_blog', NULL, NULL, NULL, 'Voir le blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1760, 'blog_comments', NULL, NULL, NULL, 'Commentaires sur le blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1761, 'submit_comment', NULL, NULL, NULL, 'Soumettre un commentaire', NULL, NULL, NULL, NULL, NULL, NULL),
(1762, 'view_all_comments', NULL, NULL, NULL, 'Voir tous les commentaires', NULL, NULL, NULL, NULL, NULL, NULL),
(1763, 'delete_blog', NULL, NULL, NULL, 'Supprimer le blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1764, 'faq_ask_question', NULL, NULL, NULL, 'Poser une question', NULL, NULL, NULL, NULL, NULL, NULL),
(1765, 'support_faqs', NULL, NULL, NULL, 'FAQs de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1766, 'last_edited', NULL, NULL, NULL, 'Dernière modification', NULL, NULL, NULL, NULL, NULL, NULL),
(1767, 'no_faq_found', NULL, NULL, NULL, 'Aucune FAQ trouvée', NULL, NULL, NULL, NULL, NULL, NULL),
(1768, 'feedback', NULL, NULL, NULL, 'Retour d\'information', NULL, NULL, NULL, NULL, NULL, NULL),
(1769, 'submit_feedback', NULL, NULL, NULL, 'Soumettre un retour d\'information', NULL, NULL, NULL, NULL, NULL, NULL),
(1770, 'course_feedback', NULL, NULL, NULL, 'Retour sur le cours', NULL, NULL, NULL, NULL, NULL, NULL),
(1771, 'delete_faq', NULL, NULL, NULL, 'Supprimer la FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1772, 'replied_on', NULL, NULL, NULL, 'Répondu le', NULL, NULL, NULL, NULL, NULL, NULL),
(1773, 'view_feedback', NULL, NULL, NULL, 'Voir les retours d\'information', NULL, NULL, NULL, NULL, NULL, NULL),
(1774, 'macro_updated_successfully', NULL, NULL, NULL, 'Macro mise à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1775, 'manage_help_articles', NULL, NULL, NULL, 'Gérer les articles d\'aide', NULL, NULL, NULL, NULL, NULL, NULL),
(1776, 'manage_blog_comments', NULL, NULL, NULL, 'Gérer les commentaires du blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1777, 'content', NULL, NULL, NULL, 'Contenu', NULL, NULL, NULL, NULL, NULL, NULL),
(1778, 'comment_status', NULL, NULL, NULL, 'Statut du commentaire', NULL, NULL, NULL, NULL, NULL, NULL),
(1779, 'comment_added_successfully', NULL, NULL, NULL, 'Commentaire ajouté avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1780, 'email_list', NULL, NULL, NULL, 'Liste d\'e-mails', NULL, NULL, NULL, NULL, NULL, NULL),
(1781, 'email_configuration', NULL, NULL, NULL, 'Configuration des e-mails', NULL, NULL, NULL, NULL, NULL, NULL),
(1782, 'email_settings_updated', NULL, NULL, NULL, 'Paramètres des e-mails mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1783, 'add_faq', NULL, NULL, NULL, 'Ajouter une FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1784, 'view_affiliation_revenue', NULL, NULL, NULL, 'Voir les revenus d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1785, 'support_ticket_resolved', NULL, NULL, NULL, 'Ticket de support résolu', NULL, NULL, NULL, NULL, NULL, NULL),
(1786, 'add_article', NULL, NULL, NULL, 'Ajouter un article', NULL, NULL, NULL, NULL, NULL, NULL),
(1787, 'article_title', NULL, NULL, NULL, 'Titre de l\'article', NULL, NULL, NULL, NULL, NULL, NULL),
(1788, 'submit_article', NULL, NULL, NULL, 'Soumettre un article', NULL, NULL, NULL, NULL, NULL, NULL),
(1789, 'last_resolved_ticket', NULL, NULL, NULL, 'Dernier ticket résolu', NULL, NULL, NULL, NULL, NULL, NULL),
(1790, 'open_ticket_details', NULL, NULL, NULL, 'Détails du ticket ouvert', NULL, NULL, NULL, NULL, NULL, NULL),
(1791, 'comment', NULL, NULL, NULL, 'Commentaire', NULL, NULL, NULL, NULL, NULL, NULL),
(1792, 'mark_as_resolved', NULL, NULL, NULL, 'Marquer comme résolu', NULL, NULL, NULL, NULL, NULL, NULL),
(1793, 'affiliation_payment_settings', NULL, NULL, NULL, 'Paramètres de paiement d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1794, 'affiliation_dashboard', NULL, NULL, NULL, 'Tableau de bord d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1795, 'support_dashboard_updated', NULL, NULL, NULL, 'Tableau de bord de support mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1796, 'filter_by_status', NULL, NULL, NULL, 'Filtrer par statut', NULL, NULL, NULL, NULL, NULL, NULL),
(1797, 'total_revenue_generated', NULL, NULL, NULL, 'Revenu total généré', NULL, NULL, NULL, NULL, NULL, NULL),
(1798, 'view_all_transactions', NULL, NULL, NULL, 'Voir toutes les transactions', NULL, NULL, NULL, NULL, NULL, NULL),
(1799, 'affiliate_list_updated_successfully', NULL, NULL, NULL, 'Liste des affiliés mise à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1800, 'macro_added_successfully', NULL, NULL, NULL, 'Macro ajoutée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1801, 'edit_ticket', NULL, NULL, NULL, 'Modifier le ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1802, 'filter_by_priority', NULL, NULL, NULL, 'Filtrer par priorité', NULL, NULL, NULL, NULL, NULL, NULL),
(1803, 'filter_by_category', NULL, NULL, NULL, 'Filtrer par catégorie', NULL, NULL, NULL, NULL, NULL, NULL),
(1804, 'view_withdrawal_requests', NULL, NULL, NULL, 'Voir les demandes de retrait', NULL, NULL, NULL, NULL, NULL, NULL),
(1805, 'edit_blog_comment', NULL, NULL, NULL, 'Modifier le commentaire du blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1806, 'delete_ticket', NULL, NULL, NULL, 'Supprimer le ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1807, 'export_data', NULL, NULL, NULL, 'Exporter les données', NULL, NULL, NULL, NULL, NULL, NULL),
(1808, 'manage_transactions', NULL, NULL, NULL, 'Gérer les transactions', NULL, NULL, NULL, NULL, NULL, NULL),
(1809, 'edit_faq', NULL, NULL, NULL, 'Modifier la FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1810, 'create_category', NULL, NULL, NULL, 'Créer une catégorie', NULL, NULL, NULL, NULL, NULL, NULL),
(1811, 'faq_description', NULL, NULL, NULL, 'Description de la FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1812, 'transaction_id', NULL, NULL, NULL, 'ID de la transaction', NULL, NULL, NULL, NULL, NULL, NULL),
(1813, 'transaction_history', NULL, NULL, NULL, 'Historique des transactions', NULL, NULL, NULL, NULL, NULL, NULL),
(1814, 'filter_by_date', NULL, NULL, NULL, 'Filtrer par date', NULL, NULL, NULL, NULL, NULL, NULL),
(1815, 'delete_transaction', NULL, NULL, NULL, 'Supprimer la transaction', NULL, NULL, NULL, NULL, NULL, NULL),
(1816, 'payout_status', NULL, NULL, NULL, 'Statut du paiement', NULL, NULL, NULL, NULL, NULL, NULL),
(1817, 'view_payment_history', NULL, NULL, NULL, 'Voir l\'historique des paiements', NULL, NULL, NULL, NULL, NULL, NULL),
(1818, 'edit_transaction', NULL, NULL, NULL, 'Modifier la transaction', NULL, NULL, NULL, NULL, NULL, NULL),
(1819, 'affiliate_program', NULL, NULL, NULL, 'Programme d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1820, 'edit_affiliate_settings', NULL, NULL, NULL, 'Modifier les paramètres d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1821, 'delete_affiliate', NULL, NULL, NULL, 'Supprimer l\'affilié', NULL, NULL, NULL, NULL, NULL, NULL),
(1822, 'affiliation_commission_rate', NULL, NULL, NULL, 'Taux de commission d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1823, 'view_affiliation_history', NULL, NULL, NULL, 'Voir l\'historique d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1824, 'support_status', NULL, NULL, NULL, 'Statut du support', NULL, NULL, NULL, NULL, NULL, NULL),
(1825, 'support_team_member', NULL, NULL, NULL, 'Membre de l\'équipe de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1826, 'support_team_updated_successfully', NULL, NULL, NULL, 'Équipe de support mise à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1827, 'customer_query', NULL, NULL, NULL, 'Demande client', NULL, NULL, NULL, NULL, NULL, NULL),
(1828, 'add_support_category', NULL, NULL, NULL, 'Ajouter une catégorie de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1829, 'support_ticket_details', NULL, NULL, NULL, 'Détails du ticket de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1830, 'blog_article', NULL, NULL, NULL, 'Article de blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1831, 'blog_article_details', NULL, NULL, NULL, 'Détails de l\'article de blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1832, 'submit_blog', NULL, NULL, NULL, 'Soumettre un blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1833, 'view_blog_article', NULL, NULL, NULL, 'Voir l\'article de blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1834, 'edit_support_ticket', NULL, NULL, NULL, 'Modifier le ticket de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1835, 'view_support_requests', NULL, NULL, NULL, 'Voir les demandes de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1836, 'create_new_ticket', NULL, NULL, NULL, 'Créer un nouveau ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1837, 'ticket_subject', NULL, NULL, NULL, 'Objet du ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1838, 'ticket_content', NULL, NULL, NULL, 'Contenu du ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1839, 'assign_ticket', NULL, NULL, NULL, 'Attribuer un ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1840, 'support_ticket_updated', NULL, NULL, NULL, 'Ticket de support mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1841, 'blog_submitted_successfully', NULL, NULL, NULL, 'Blog soumis avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1842, 'affiliation_details', NULL, NULL, NULL, 'Détails d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1843, 'submit_blog_comment', NULL, NULL, NULL, 'Soumettre un commentaire de blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1844, 'comment_submitted', NULL, NULL, NULL, 'Commentaire soumis', NULL, NULL, NULL, NULL, NULL, NULL),
(1845, 'comment_approved', NULL, NULL, NULL, 'Commentaire approuvé', NULL, NULL, NULL, NULL, NULL, NULL),
(1846, 'view_blog_comments', NULL, NULL, NULL, 'Voir les commentaires du blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1847, 'delete_blog_comment', NULL, NULL, NULL, 'Supprimer le commentaire du blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1848, 'faq_answer', NULL, NULL, NULL, 'Réponse FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1849, 'delete_faq_category', NULL, NULL, NULL, 'Supprimer la catégorie FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1850, 'article_updated_successfully', NULL, NULL, NULL, 'Article mis à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1851, 'support_requests_handled', NULL, NULL, NULL, 'Demandes de support traitées', NULL, NULL, NULL, NULL, NULL, NULL),
(1852, 'blog_comment_submitted', NULL, NULL, NULL, 'Commentaire de blog soumis', NULL, NULL, NULL, NULL, NULL, NULL),
(1853, 'blog_category_updated', NULL, NULL, NULL, 'Catégorie de blog mise à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1854, 'comment_deleted_successfully', NULL, NULL, NULL, 'Commentaire supprimé avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1855, 'macro_deleted_successfully', NULL, NULL, NULL, 'Macro supprimée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1856, 'ticket_resolved', NULL, NULL, NULL, 'Ticket résolu', NULL, NULL, NULL, NULL, NULL, NULL),
(1857, 'support_faq_updated', NULL, NULL, NULL, 'FAQ de support mise à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1858, 'affiliation_payout_updated', NULL, NULL, NULL, 'Paiement d\'affiliation mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1859, 'update_affiliate_payout', NULL, NULL, NULL, 'Mettre à jour le paiement d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1860, 'delete_affiliation_payout', NULL, NULL, NULL, 'Supprimer le paiement d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1861, 'support_ticket_closed', NULL, NULL, NULL, 'Ticket de support fermé', NULL, NULL, NULL, NULL, NULL, NULL),
(1862, 'transaction_exported', NULL, NULL, NULL, 'Transaction exportée', NULL, NULL, NULL, NULL, NULL, NULL),
(1863, 'transaction_deleted', NULL, NULL, NULL, 'Transaction supprimée', NULL, NULL, NULL, NULL, NULL, NULL),
(1864, 'support_macro_deleted', NULL, NULL, NULL, 'Macro de support supprimée', NULL, NULL, NULL, NULL, NULL, NULL),
(1865, 'ticket_priority_updated', NULL, NULL, NULL, 'Priorité du ticket mise à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1866, 'support_status_updated', NULL, NULL, NULL, 'Statut du support mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1867, 'edit_faq_category', NULL, NULL, NULL, 'Modifier la catégorie FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1868, 'transaction_details_updated', NULL, NULL, NULL, 'Détails de la transaction mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1869, 'affiliate_payout_status_updated', NULL, NULL, NULL, 'Statut du paiement d\'affiliation mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1870, 'transaction_export_successful', NULL, NULL, NULL, 'Exportation de la transaction réussie', NULL, NULL, NULL, NULL, NULL, NULL),
(1871, 'support_faq_added_successfully', NULL, NULL, NULL, 'FAQ de support ajoutée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1872, 'support_ticket_list', NULL, NULL, NULL, 'Liste des tickets de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1873, 'blog_list', NULL, NULL, NULL, 'Liste des blogs', NULL, NULL, NULL, NULL, NULL, NULL),
(1874, 'update_affiliation_settings', NULL, NULL, NULL, 'Mettre à jour les paramètres d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1875, 'blog_submitted_for_review', NULL, NULL, NULL, 'Blog soumis pour examen', NULL, NULL, NULL, NULL, NULL, NULL),
(1876, 'ticket_priority_set', NULL, NULL, NULL, 'Priorité du ticket définie', NULL, NULL, NULL, NULL, NULL, NULL),
(1877, 'view_faq_category', NULL, NULL, NULL, 'Voir la catégorie FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1878, 'delete_affiliate_program', NULL, NULL, NULL, 'Supprimer le programme d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1879, 'support_ticket_resolved_successfully', NULL, NULL, NULL, 'Ticket de support résolu avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1880, 'ticket_closed_successfully', NULL, NULL, NULL, 'Ticket fermé avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1881, 'support_ticket_deleted', NULL, NULL, NULL, 'Ticket de support supprimé', NULL, NULL, NULL, NULL, NULL, NULL),
(1882, 'support_category_added_successfully', NULL, NULL, NULL, 'Catégorie de support ajoutée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1883, 'support_ticket_assigned', NULL, NULL, NULL, 'Ticket de support assigné', NULL, NULL, NULL, NULL, NULL, NULL),
(1884, 'support_category_updated_successfully', NULL, NULL, NULL, 'Catégorie de support mise à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1885, 'comment_rejected', NULL, NULL, NULL, 'Commentaire rejeté', NULL, NULL, NULL, NULL, NULL, NULL),
(1886, 'payout_request_submitted', NULL, NULL, NULL, 'Demande de paiement soumise', NULL, NULL, NULL, NULL, NULL, NULL),
(1887, 'delete_payout_request', NULL, NULL, NULL, 'Supprimer la demande de paiement', NULL, NULL, NULL, NULL, NULL, NULL),
(1888, 'payout_request_approved', NULL, NULL, NULL, 'Demande de paiement approuvée', NULL, NULL, NULL, NULL, NULL, NULL),
(1889, 'payout_request_rejected', NULL, NULL, NULL, 'Demande de paiement rejetée', NULL, NULL, NULL, NULL, NULL, NULL),
(1890, 'support_ticket_reopened', NULL, NULL, NULL, 'Ticket de support rouvert', NULL, NULL, NULL, NULL, NULL, NULL),
(1891, 'support_category_deleted', NULL, NULL, NULL, 'Catégorie de support supprimée', NULL, NULL, NULL, NULL, NULL, NULL),
(1892, 'ticket_reopened', NULL, NULL, NULL, 'Ticket rouvert', NULL, NULL, NULL, NULL, NULL, NULL),
(1893, 'support_ticket_replied_successfully', NULL, NULL, NULL, 'Réponse au ticket de support envoyée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1894, 'transaction_list_updated', NULL, NULL, NULL, 'Liste des transactions mise à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1895, 'view_all_affiliations', NULL, NULL, NULL, 'Voir toutes les affiliations', NULL, NULL, NULL, NULL, NULL, NULL),
(1896, 'delete_faq_article', NULL, NULL, NULL, 'Supprimer l\'article FAQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1897, 'blog_published_successfully', NULL, NULL, NULL, 'Blog publié avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1898, 'update_ticket_status', NULL, NULL, NULL, 'Mettre à jour le statut du ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1899, 'payout_request_updated', NULL, NULL, NULL, 'Demande de paiement mise à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1900, 'view_blog_list', NULL, NULL, NULL, 'Voir la liste des blogs', NULL, NULL, NULL, NULL, NULL, NULL),
(1901, 'affiliate_payout_submitted', NULL, NULL, NULL, 'Paiement d\'affiliation soumis', NULL, NULL, NULL, NULL, NULL, NULL),
(1902, 'comment_approved_successfully', NULL, NULL, NULL, 'Commentaire approuvé avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1903, 'edit_support_category', NULL, NULL, NULL, 'Modifier la catégorie de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1904, 'ticket_subject_updated', NULL, NULL, NULL, 'Objet du ticket mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1905, 'faq_deleted_successfully', NULL, NULL, NULL, 'FAQ supprimée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1906, 'blog_deleted_successfully', NULL, NULL, NULL, 'Blog supprimé avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1907, 'view_all_transactions_list', NULL, NULL, NULL, 'Voir la liste de toutes les transactions', NULL, NULL, NULL, NULL, NULL, NULL),
(1908, 'support_ticket_priority_updated', NULL, NULL, NULL, 'Priorité du ticket de support mise à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1909, 'payout_request_rejected_successfully', NULL, NULL, NULL, 'Demande de paiement rejetée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1910, 'transaction_status_updated', NULL, NULL, NULL, 'Statut de la transaction mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1911, 'edit_ticket_priority', NULL, NULL, NULL, 'Modifier la priorité du ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1912, 'view_blog_details', NULL, NULL, NULL, 'Voir les détails du blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1913, 'faq_category_deleted_successfully', NULL, NULL, NULL, 'Catégorie FAQ supprimée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1914, 'ticket_status_updated', NULL, NULL, NULL, 'Statut du ticket mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1915, 'transaction_details_viewed', NULL, NULL, NULL, 'Détails de la transaction consultés', NULL, NULL, NULL, NULL, NULL, NULL),
(1916, 'affiliation_payout_rejected', NULL, NULL, NULL, 'Paiement d\'affiliation rejeté', NULL, NULL, NULL, NULL, NULL, NULL),
(1917, 'ticket_priority_resolved', NULL, NULL, NULL, 'Priorité du ticket résolue', NULL, NULL, NULL, NULL, NULL, NULL),
(1918, 'support_category_deleted_successfully', NULL, NULL, NULL, 'Catégorie de support supprimée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1919, 'delete_ticket_status', NULL, NULL, NULL, 'Supprimer le statut du ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1920, 'blog_category_deleted_successfully', NULL, NULL, NULL, 'Catégorie de blog supprimée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1921, 'view_blog_comment_list', NULL, NULL, NULL, 'Voir la liste des commentaires du blog', NULL, NULL, NULL, NULL, NULL, NULL),
(1922, 'faq_updated_successfully', NULL, NULL, NULL, 'FAQ mise à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1923, 'affiliate_payout_details', NULL, NULL, NULL, 'Détails du paiement d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1924, 'view_support_ticket_list', NULL, NULL, NULL, 'Voir la liste des tickets de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1925, 'transaction_list_viewed', NULL, NULL, NULL, 'Liste des transactions consultée', NULL, NULL, NULL, NULL, NULL, NULL),
(1926, 'delete_blog_list', NULL, NULL, NULL, 'Supprimer la liste des blogs', NULL, NULL, NULL, NULL, NULL, NULL),
(1927, 'update_payout_status', NULL, NULL, NULL, 'Mettre à jour le statut du paiement', NULL, NULL, NULL, NULL, NULL, NULL),
(1928, 'payout_status_resolved', NULL, NULL, NULL, 'Statut du paiement résolu', NULL, NULL, NULL, NULL, NULL, NULL),
(1929, 'support_ticket_subject', NULL, NULL, NULL, 'Objet du ticket de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1930, 'view_ticket_history', NULL, NULL, NULL, 'Voir l\'historique du ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1931, 'support_ticket_history_viewed', NULL, NULL, NULL, 'Historique du ticket de support consulté', NULL, NULL, NULL, NULL, NULL, NULL),
(1932, 'ticket_details_updated', NULL, NULL, NULL, 'Détails du ticket mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1933, 'affiliate_list_viewed', NULL, NULL, NULL, 'Liste des affiliés consultée', NULL, NULL, NULL, NULL, NULL, NULL),
(1934, 'view_payout_request_list', NULL, NULL, NULL, 'Voir la liste des demandes de paiement', NULL, NULL, NULL, NULL, NULL, NULL),
(1935, 'support_team_added_successfully', NULL, NULL, NULL, 'Équipe de support ajoutée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1936, 'support_ticket_priority_resolved', NULL, NULL, NULL, 'Priorité du ticket de support résolue', NULL, NULL, NULL, NULL, NULL, NULL),
(1937, 'payout_request_approved_successfully', NULL, NULL, NULL, 'Demande de paiement approuvée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1938, 'support_ticket_status_updated_successfully', NULL, NULL, NULL, 'Statut du ticket de support mis à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1939, 'transaction_history_viewed', NULL, NULL, NULL, 'Historique des transactions consulté', NULL, NULL, NULL, NULL, NULL, NULL),
(1940, 'affiliate_program_updated', NULL, NULL, NULL, 'Programme d\'affiliation mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1941, 'view_affiliate_history', NULL, NULL, NULL, 'Voir l\'historique des affiliés', NULL, NULL, NULL, NULL, NULL, NULL),
(1942, 'support_ticket_created_successfully', NULL, NULL, NULL, 'Ticket de support créé avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1943, 'view_support_faq', NULL, NULL, NULL, 'Voir la FAQ de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1944, 'affiliate_payout_approved', NULL, NULL, NULL, 'Paiement d\'affiliation approuvé', NULL, NULL, NULL, NULL, NULL, NULL),
(1945, 'payout_status_updated_successfully', NULL, NULL, NULL, 'Statut du paiement mis à jour avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1946, 'support_ticket_subject_updated', NULL, NULL, NULL, 'Objet du ticket de support mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1947, 'view_ticket_status', NULL, NULL, NULL, 'Voir le statut du ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1948, 'faq_category_viewed', NULL, NULL, NULL, 'Catégorie FAQ consultée', NULL, NULL, NULL, NULL, NULL, NULL),
(1949, 'transaction_status_resolved', NULL, NULL, NULL, 'Statut de la transaction résolu', NULL, NULL, NULL, NULL, NULL, NULL),
(1950, 'affiliation_revenue_updated', NULL, NULL, NULL, 'Revenu d\'affiliation mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1951, 'support_ticket_closed_successfully', NULL, NULL, NULL, 'Ticket de support fermé avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1952, 'affiliation_request_submitted', NULL, NULL, NULL, 'Demande d\'affiliation soumise', NULL, NULL, NULL, NULL, NULL, NULL),
(1953, 'view_ticket_priority', NULL, NULL, NULL, 'Voir la priorité du ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1954, 'payout_status_viewed', NULL, NULL, NULL, 'Statut du paiement consulté', NULL, NULL, NULL, NULL, NULL, NULL),
(1955, 'support_ticket_viewed', NULL, NULL, NULL, 'Ticket de support consulté', NULL, NULL, NULL, NULL, NULL, NULL),
(1956, 'ticket_resolved_successfully', NULL, NULL, NULL, 'Ticket résolu avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1957, 'delete_affiliate_payout', NULL, NULL, NULL, 'Supprimer le paiement d\'affiliation', NULL, NULL, NULL, NULL, NULL, NULL),
(1958, 'view_ticket_priority_list', NULL, NULL, NULL, 'Voir la liste des priorités de tickets', NULL, NULL, NULL, NULL, NULL, NULL),
(1959, 'affiliation_payout_submitted_successfully', NULL, NULL, NULL, 'Paiement d\'affiliation soumis avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1960, 'support_ticket_created', NULL, NULL, NULL, 'Ticket de support créé', NULL, NULL, NULL, NULL, NULL, NULL),
(1961, 'affiliation_request_rejected_successfully', NULL, NULL, NULL, 'Demande d\'affiliation rejetée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1962, 'affiliation_revenue_viewed', NULL, NULL, NULL, 'Revenu d\'affiliation consulté', NULL, NULL, NULL, NULL, NULL, NULL),
(1963, 'support_ticket_history_updated', NULL, NULL, NULL, 'Historique du ticket de support mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1964, 'transaction_details_deleted', NULL, NULL, NULL, 'Détails de la transaction supprimés', NULL, NULL, NULL, NULL, NULL, NULL),
(1965, 'support_ticket_list_viewed', NULL, NULL, NULL, 'Liste des tickets de support consultée', NULL, NULL, NULL, NULL, NULL, NULL),
(1966, 'ticket_deleted_successfully', NULL, NULL, NULL, 'Ticket supprimé avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1967, 'support_category_created_successfully', NULL, NULL, NULL, 'Catégorie de support créée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1968, 'support_ticket_assigned_successfully', NULL, NULL, NULL, 'Ticket de support assigné avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1969, 'transaction_history_updated', NULL, NULL, NULL, 'Historique des transactions mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1970, 'support_faq_deleted_successfully', NULL, NULL, NULL, 'FAQ de support supprimée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1971, 'affiliate_program_deleted_successfully', NULL, NULL, NULL, 'Programme d\'affiliation supprimé avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1972, 'view_ticket_details', NULL, NULL, NULL, 'Voir les détails du ticket', NULL, NULL, NULL, NULL, NULL, NULL),
(1973, 'affiliation_revenue_resolved', NULL, NULL, NULL, 'Revenu d\'affiliation résolu', NULL, NULL, NULL, NULL, NULL, NULL),
(1974, 'payout_request_resolved_successfully', NULL, NULL, NULL, 'Demande de paiement résolue avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1975, 'view_support_team', NULL, NULL, NULL, 'Voir l\'équipe de support', NULL, NULL, NULL, NULL, NULL, NULL),
(1976, 'support_team_viewed', NULL, NULL, NULL, 'Équipe de support consultée', NULL, NULL, NULL, NULL, NULL, NULL),
(1977, 'payout_status_deleted', NULL, NULL, NULL, 'Statut du paiement supprimé', NULL, NULL, NULL, NULL, NULL, NULL),
(1978, 'transaction_status_deleted', NULL, NULL, NULL, 'Statut de la transaction supprimé', NULL, NULL, NULL, NULL, NULL, NULL),
(1979, 'support_ticket_status_deleted', NULL, NULL, NULL, 'Statut du ticket de support supprimé', NULL, NULL, NULL, NULL, NULL, NULL),
(1980, 'view_payout_status_list', NULL, NULL, NULL, 'Voir la liste des statuts de paiement', NULL, NULL, NULL, NULL, NULL, NULL),
(1981, 'affiliate_list_deleted_successfully', NULL, NULL, NULL, 'Liste des affiliés supprimée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1982, 'ticket_priority_deleted_successfully', NULL, NULL, NULL, 'Priorité du ticket supprimée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1983, 'support_ticket_priority_deleted', NULL, NULL, NULL, 'Priorité du ticket de support supprimée', NULL, NULL, NULL, NULL, NULL, NULL),
(1984, 'view_affiliation_history_list', NULL, NULL, NULL, 'Voir la liste de l\'historique des affiliations', NULL, NULL, NULL, NULL, NULL, NULL),
(1985, 'affiliate_payout_deleted_successfully', NULL, NULL, NULL, 'Paiement d\'affiliation supprimé avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1986, 'support_ticket_priority_set_successfully', NULL, NULL, NULL, 'Priorité du ticket de support définie avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1987, 'transaction_deleted_successfully', NULL, NULL, NULL, 'Transaction supprimée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1988, 'affiliation_details_updated', NULL, NULL, NULL, 'Détails de l\'affiliation mis à jour', NULL, NULL, NULL, NULL, NULL, NULL),
(1989, 'ticket_priority_viewed', NULL, NULL, NULL, 'Priorité du ticket consultée', NULL, NULL, NULL, NULL, NULL, NULL),
(1990, 'support_faq_viewed', NULL, NULL, NULL, 'FAQ de support consultée', NULL, NULL, NULL, NULL, NULL, NULL),
(1991, 'transaction_status_viewed', NULL, NULL, NULL, 'Statut de la transaction consulté', NULL, NULL, NULL, NULL, NULL, NULL),
(1992, 'payout_request_deleted_successfully', NULL, NULL, NULL, 'Demande de paiement supprimée avec succès', NULL, NULL, NULL, NULL, NULL, NULL),
(1993, 'support_category_created', NULL, NULL, NULL, 'Catégorie de support créée', NULL, NULL, NULL, NULL, NULL, NULL),
(1994, 'view_affiliate_list', NULL, NULL, NULL, 'Voir la liste des affiliés', NULL, NULL, NULL, NULL, NULL, NULL),
(1995, 'support_ticket_list_resolved', NULL, NULL, NULL, 'Liste des tickets de support résolue', NULL, NULL, NULL, NULL, NULL, NULL),
(1996, 'support_ticket_status_resolved', NULL, NULL, NULL, 'Statut du ticket de support résolu', NULL, NULL, NULL, NULL, NULL, NULL),
(1997, 'لوحة_القيادة', NULL, NULL, 'لوحة القيادة', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1998, 'welcome_to_mile!_your_companion_to_multiply,_influence,_lead,_engage.', 'Welcome to mile! your companion to multiply, influence, lead, engage.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1999, 'contact_information_updated_successfully', 'Contact information updated successfully', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000, 'you_are_not_authorized_to_access_this_page', 'You are not authorized to access this page', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2001, 'assign_permission_for', 'Assign permission for', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2002, 'you_can_toggle_the_switch_for_enabling_or_disabling_a_feature_to_access', 'You can toggle the switch for enabling or disabling a feature to access', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2003, 'feature', 'Feature', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2004, 'revenue', 'Revenue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2005, 'messaging', 'Messaging', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2006, 'addon', 'Addon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2007, 'theme', 'Theme', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2008, 'coupon', 'Coupon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2009, 'permission_updated', 'Permission updated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2010, 'add_new_coupon', 'Add new coupon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2011, 'coupon_code', 'Coupon code', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2012, 'discount_percentage', 'Discount percentage', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2013, 'validity_till', 'Validity till', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2014, 'تحرير_الدورة', NULL, NULL, 'تحرير الدورة', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2015, 'months', 'Months', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2016, 'successfully_enabled', 'Successfully enabled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2017, 'successfully_disabled', 'Successfully disabled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `video_type` varchar(255) DEFAULT NULL,
  `cloud_video_id` int(20) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `audio_url` varchar(400) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `lesson_type` varchar(255) DEFAULT NULL,
  `attachment` longtext DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `is_free` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `quiz_attempt` int(11) NOT NULL DEFAULT 0,
  `video_type_for_mobile_application` varchar(255) DEFAULT NULL,
  `video_url_for_mobile_application` varchar(255) DEFAULT NULL,
  `duration_for_mobile_application` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`id`, `title`, `duration`, `course_id`, `section_id`, `video_type`, `cloud_video_id`, `video_url`, `audio_url`, `date_added`, `last_modified`, `lesson_type`, `attachment`, `attachment_type`, `caption`, `summary`, `is_free`, `order`, `quiz_attempt`, `video_type_for_mobile_application`, `video_url_for_mobile_application`, `duration_for_mobile_application`) VALUES
(1, 'Introduction', NULL, 1, 1, NULL, NULL, NULL, NULL, 1724437800, NULL, 'other', '16b0a4e56231078303b7c1b702a30658.pdf', 'pdf', NULL, '&lt;p&gt;Test Summary&lt;/p&gt;', 1, 0, 0, NULL, NULL, NULL),
(2, 'Q1', '0:00:00', 4, 2, NULL, NULL, NULL, NULL, 1725215400, NULL, 'quiz', '{\"total_marks\":\"10\",\"pass_mark\":\"7\",\"drip_content_for_passing_rule\":null}', 'json', NULL, 'Hello Dev', 0, 0, 3, NULL, NULL, NULL),
(3, 'Shri Ganesh', NULL, 5, 3, NULL, NULL, NULL, NULL, 1728498600, NULL, 'text', '&lt;p&gt;Shri Ganesh&amp;nbsp;&lt;/p&gt;', 'description', NULL, '&lt;p&gt;Ganeshaya namah&lt;/p&gt;', 1, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `from` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(20) NOT NULL,
  `message_thread_code` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `sender` int(20) DEFAULT NULL,
  `receiver` int(20) DEFAULT NULL,
  `timestamp` varchar(255) DEFAULT NULL,
  `read_status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_thread`
--

CREATE TABLE `message_thread` (
  `message_thread_id` int(11) NOT NULL,
  `message_thread_code` varchar(255) DEFAULT NULL,
  `sender` varchar(255) DEFAULT '',
  `receiver` varchar(255) DEFAULT '',
  `last_message_timestamp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_histories`
--

CREATE TABLE `newsletter_histories` (
  `id` int(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `tried_times` int(11) DEFAULT NULL,
  `sent_at` varchar(100) DEFAULT NULL,
  `created_at` varchar(100) DEFAULT NULL,
  `updated_at` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscriber`
--

CREATE TABLE `newsletter_subscriber` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_editable` int(11) DEFAULT NULL,
  `addon_identifier` varchar(255) DEFAULT NULL,
  `user_types` varchar(400) DEFAULT NULL,
  `system_notification` varchar(400) DEFAULT NULL,
  `email_notification` varchar(400) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `template` longtext DEFAULT NULL,
  `setting_title` varchar(255) DEFAULT NULL,
  `setting_sub_title` varchar(255) DEFAULT NULL,
  `date_updated` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notification_settings`
--

INSERT INTO `notification_settings` (`id`, `type`, `is_editable`, `addon_identifier`, `user_types`, `system_notification`, `email_notification`, `subject`, `template`, `setting_title`, `setting_sub_title`, `date_updated`) VALUES
(1, 'signup', 1, NULL, '[\"admin\",\"user\"]', '{\"admin\":\"1\",\"user\":\"1\"}', '{\"admin\":\"0\",\"user\":\"0\"}', '{\"admin\":\"New user registered\",\"user\":\"Registered successfully\"}', '{\"admin\":\"New user registered [user_name] \\r\\n<br>User email: <b>[user_email]<\\/b>\",\"user\":\"You have successfully registered with us at [system_name].\"}', 'New user registration', 'Get notified when a new user signs up', '1728576444'),
(2, 'email_verification', 0, NULL, '[\"user\"]', '{\"user\":\"0\"}', '{\"user\":\"1\"}', '{\"user\":\"Email verification code\"}', '{\"user\":\"You have received a email verification code. Your verification code is [email_verification_code]\"}', 'Email verification', 'It is permanently enabled for student email verification.', '1684135777'),
(3, 'forget_password_mail', 0, NULL, '[\"user\"]', '{\"user\":\"0\"}', '{\"user\":\"1\"}', '{\"user\":\"Forgot password verification code\"}', '{\"user\":\"You have received a email verification code. Your verification code is [system_name] [verification_link] [minutes]\"}', 'Forgot password mail', 'It is permanently enabled for student email verification.', '1684145383'),
(4, 'new_device_login_confirmation', 0, NULL, '[\"user\"]', '{\"user\":\"0\"}', '{\"user\":\"1\"}', '{\"user\":\"Please confirm your login\"}', '{\"user\":\"Have you tried logging in with a different device? Confirm using the verification code. Your verification code is [verification_code]. Remember that you will lose access to your previous device after logging in to the new device <b>[user_agent]<\\/b>.<br> Use the verification code within [minutes] minutes\"}', 'Account security alert', 'Send verification code for login from a new device', '1684145383'),
(6, 'course_purchase', 1, NULL, '[\"admin\",\"student\",\"instructor\"]', '{\"admin\":\"1\",\"student\":\"1\",\"instructor\":\"1\"}', '{\"admin\":\"0\",\"student\":\"0\",\"instructor\":\"0\"}', '{\"admin\":\"A new course has been sold\",\"instructor\":\"A new course has been sold\",\"student\":\"You have purchased a new course\"}', '{\"admin\":\"<p>Course title: [course_title]<\\/p><p>Student: [student_name]\\r\\n<\\/p><p>Paid amount: [paid_amount]<\\/p><p>Instructor: [instructor_name]<\\/p>\",\"instructor\":\"Course title: [course_title]\\r\\nStudent: [student_name]\\r\\nPaid amount: [paid_amount]\",\"student\":\"Course title: [course_title]\\r\\nPaid amount: [paid_amount]\\r\\nInstructor: [instructor_name]\"}', 'Course purchase notification', 'Stay up-to-date on student course purchases.', '1684303456'),
(7, 'course_completion_mail', 1, NULL, '[\"student\",\"instructor\"]', '{\"student\":\"1\",\"instructor\":\"1\"}', '{\"student\":\"0\",\"instructor\":\"0\"}', '{\"instructor\":\"Course completion\",\"student\":\"You have completed a new course\"}', '{\"instructor\":\"Course completed [course_title]\\r\\nStudent: [student_name]\",\"student\":\"Course: [course_title]\\r\\nInstructor: [instructor_name]\"}', 'Course completion mail', 'Stay up to date on student course completion.', '1699431547'),
(8, 'certificate_eligibility', 1, 'certificate', '[\"student\",\"instructor\"]', '{\"student\":\"1\",\"instructor\":\"1\"}', '{\"student\":\"0\",\"instructor\":\"0\"}', '{\"instructor\":\"Certificate eligibility\",\"student\":\"certificate eligibility\"}', '{\"instructor\":\"Course: [course_title]\\r\\nStudent: [student_name]\\r\\nCertificate link: [certificate_link]\",\"student\":\"Course: [course_title]\\r\\nInstructor: [instructor_name]\\r\\nCertificate link: [certificate_link]\"}', 'Course eligibility notification', 'Stay up to date on course certificate eligibility.', '1684303460'),
(9, 'offline_payment_suspended_mail', 1, 'offline_payment', '[\"student\"]', '{\"student\":\"1\"}', '{\"student\":\"0\"}', '{\"student\":\"Your payment has been suspended\"}', '{\"student\":\"<p>Your offline payment has been <b style=\'color: red;\'>suspended</b> !</p><p>Please provide a valid document of your payment.</p>\"}', 'Offline payment suspended mail', 'If students provides fake information, notify them of the suspension', '1684303463'),
(10, 'bundle_purchase', 1, 'course_bundle', '[\"admin\",\"student\",\"instructor\"]', '{\"admin\":\"1\",\"student\":\"1\",\"instructor\":\"1\"}', '{\"admin\":\"0\",\"student\":\"0\",\"instructor\":\"0\"}', '{\"admin\":\"A new course bundle has been sold \",\"instructor\":\"A new course bundle has been sold \",\"student\":\"You have purchased a new course bundle test\"}', '{\"admin\":\"Course bundle: [bundle_title]\\r\\nStudent: [student_name]\\r\\nInstructor: [instructor_name] \",\"instructor\":\"Course bundle: [bundle_title]\\r\\nStudent: [student_name] \",\"student\":\"Course bundle: [bundle_title]\\r\\nInstructor: [instructor_name] \"}', 'Course bundle purchase notification', 'Stay up-to-date on student course bundle purchases.', '1684303467'),
(13, 'add_new_user_as_affiliator', 0, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"Congratulation ! You are assigned as an affiliator\"}', '{\"affiliator\":\"You are assigned as a website Affiliator.\\r\\nWebsite: [website_link]\\r\\n<br>\\r\\nPassword: [password]\"}', 'New user added as affiliator', 'Send account information to the new user', '1684135777'),
(14, 'affiliator_approval_notification', 1, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"Congratulations! Your affiliate request has been approved\"}', '{\"affiliator\":\"Congratulations! Your affiliate request has been approved\"}', 'Affiliate approval notification', 'Send affiliate approval mail to the user account', '1684303472'),
(15, 'affiliator_request_cancellation', 1, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"Sorry ! Your request has been currently refused\"}', '{\"affiliator\":\"Sorry ! Your request has been currently refused.\"}', 'Affiliator request cancellation', 'Send mail, when you cancel the affiliation request', '1684303473'),
(16, 'affiliation_amount_withdrawal_request', 1, 'affiliate_course', '[\"admin\",\"affiliator\"]', '{\"admin\":\"1\",\"affiliator\":\"1\"}', '{\"admin\":\"0\",\"affiliator\":\"0\"}', '{\"admin\":\"New money withdrawal request\",\"affiliator\":\"New money withdrawal request\"}', '{\"admin\":\"New money withdrawal request by [user_name] [amount]\",\"affiliator\":\"Your Withdrawal request of [amount] has been sent to authority\"}', 'Affiliation money withdrawal request', 'Send mail, when the users request the withdrawal of money', '1684303476'),
(17, 'approval_affiliation_amount_withdrawal_request', 1, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"Congartulation ! Your withdrawal request has been approved\"}', '{\"affiliator\":\"Congartulation ! Your payment request has been approved.\"}', 'Approval of withdrawal request of affiliation', 'Send mail, when you approved the affiliation withdrawal request', '1684303480'),
(18, 'course_gift', 1, NULL, '[\"payer\",\"receiver\"]', '{\"payer\":\"1\",\"receiver\":\"1\"}', '{\"payer\":\"1\",\"receiver\":\"1\"}', '{\"payer\":\"You have gift a course\",\"receiver\":\"You have received a course gift\"}', '{\"payer\":\"You have gift a course to [user_name] [course_title][instructor]\",\"receiver\":\"You have received a course gift by [payer][course_title][instructor]\"}', 'Course gift notification', 'Notify users after course gift', '1691818623'),
(20, 'noticeboard', 1, 'noticeboard', '[\"student\"]', '{\"student\":\"1\"}', '{\"student\":\"1\"}', '{\"student\":\"Noticeboard\"}', '{\"student\":\"Hi, You have a new notice by [instructor_name]. The course [course_title] [notice_title][notice_description]\"}', 'Course Noticeboard', 'Notify to enrolled students when announcements are created by the instructor for a particular course.\n', '1699525375');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `admin_revenue` varchar(255) DEFAULT NULL,
  `instructor_revenue` varchar(255) DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `instructor_payment_status` int(11) DEFAULT 0,
  `transaction_id` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `coupon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `currency` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `keys` text NOT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `enabled_test_mode` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_addon` int(11) NOT NULL,
  `created_at` varchar(100) NOT NULL,
  `updated_at` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `identifier`, `currency`, `title`, `description`, `keys`, `model_name`, `enabled_test_mode`, `status`, `is_addon`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'USD', 'Paypal', '', '{\"sandbox_client_id\":\"\",\"sandbox_secret_key\":\"\",\"production_client_id\":\"1234\",\"production_secret_key\":\"12345\"}', 'Payment_model', 1, 1, 0, '', '1673263724'),
(2, 'stripe', 'USD', 'Stripe', '', '{\"public_key\":\"\",\"secret_key\":\"\",\"public_live_key\":\"\",\"secret_live_key\":\"\"}', 'Payment_model', 1, 1, 0, '', '1673263724'),
(3, 'razorpay', 'INR', 'Razorpay', '', '{\"key_id\":\"\",\"secret_key\":\"\",\"theme_color\":\"#ffae52\"}', 'Payment_model', 1, 1, 0, '', '1727611314'),
(4, 'xendit', 'USD', 'Xendit', '', '{\"api_key\":\"\",\"secret_key\":\"your_xendit_secret_key\",\"other_parameter\":\"value\"}', 'Payment_model', 1, 1, 0, '', '1700647736'),
(5, 'payu', 'PLN', 'Payu', '', '{\"pos_id\":\"\",\"second_key\":\"\",\"client_id\":\"\",\"client_secret\":\"\"}', 'Payment_model', 1, 1, 0, '', '1707980726'),
(6, 'pagseguro', 'BRL', 'Pagseguro', '', '{\"api_key\":\"\",\"secret_key\":\"\",\"other_parameter\":\"value\"}', 'Payment_model', 1, 1, 0, '', '1705559611'),
(7, 'sslcommerz', 'USD', 'SSL Commerz', '', '{\"store_id\":\"sslcommerz_store_id\",\"store_password\":\"sslcommerz_store_password\"}', 'Payment_model', 1, 1, 0, '', '1673264610'),
(8, 'skrill', 'USD', 'Skrill', '', '{\"skrill_merchant_email\":\"urwatech@gmail.com\",\"secret_passphrase\":\"your_skrill_secret_key\"}', 'Payment_model', 1, 1, 0, '', '1700647745'),
(10, 'doku', 'USD', 'Doku', '', '{\"client_id\":\"BRN-0271-1700996849302\",\"shared_key\":\"\"}', 'Payment_model', 1, 1, 0, '', '1708603994'),
(11, 'bkash', 'BDT', 'Bkash', '', '{\"app_key\":\"app-key\",\"app_secret\":\"app-secret\",\"username\":\"username\",\"password\":\"passwoed\"}', 'Payment_model', 1, 1, 0, '1700997440', '1701596645'),
(12, 'cashfree', 'INR', 'CashFree', '', '{\"client_id\":\"\",\"client_secret\":\"\"}', 'Payment_model', 1, 1, 0, '1700997440', '1701688995'),
(13, 'maxicash', 'USD', 'Maxicash', '', '{\"merchant_id\":\"\",\"merchant_password\":\"\"}', 'Payment_model', 1, 1, 0, '1700997440', '1701688995'),
(14, 'aamarpay', 'BDT', 'Aamarpay', '', '{\"store_id\":\"aamarpaytest\",\"signature_key\":\"\"}', 'Payment_model', 1, 1, 0, '1700997440', '1711366991'),
(15, 'flutterwave', 'NGN', 'Flutterwave', '', '{\"public_key\":\"\",\"secret_key\":\"\"}', 'Payment_model', 1, 1, 0, '1700997440', '1711366991'),
(16, 'tazapay', 'USD', 'Tazapay', '', '{\"public_key\":\"\",\"api_key\":\"\",\"api_secret\":\"\"}', 'Payment_model', 1, 1, 0, '1700997440', '1711366991');

-- --------------------------------------------------------

--
-- Table structure for table `payout`
--

CREATE TABLE `payout` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `permissions` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `admin_id`, `permissions`) VALUES
(1, 5, '[\"category\",\"course\",\"user\",\"instructor\",\"student\",\"enrolment\",\"revenue\",\"messaging\",\"blog\",\"theme\",\"settings\",\"coupon\",\"academy_cloud\",\"newsletter\",\"contact\",\"admin\",\"root\"]'),
(2, 4, '[\"category\",\"course\",\"user\",\"instructor\",\"student\",\"enrolment\",\"revenue\",\"messaging\",\"blog\",\"theme\",\"settings\",\"coupon\",\"newsletter\",\"contact\"]');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) UNSIGNED NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `number_of_options` int(11) DEFAULT NULL,
  `options` longtext DEFAULT NULL,
  `correct_answers` longtext DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

CREATE TABLE `quiz_results` (
  `quiz_result_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_answers` longtext NOT NULL,
  `correct_answers` longtext NOT NULL COMMENT 'question_id',
  `total_obtained_marks` double NOT NULL,
  `date_added` varchar(100) NOT NULL,
  `date_updated` varchar(100) NOT NULL,
  `is_submitted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) UNSIGNED NOT NULL,
  `rating` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ratable_id` int(11) DEFAULT NULL,
  `ratable_type` varchar(50) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `review` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_files`
--

CREATE TABLE `resource_files` (
  `id` int(11) NOT NULL,
  `lesson_id` int(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `resource_files`
--

INSERT INTO `resource_files` (`id`, `lesson_id`, `title`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Book 2', '1IrjdSEoJR68bwMXADk4.pdf', '1724475128', '1724475163'),
(2, 1, 'Book', 'janJxFMlD9mkbVGip4UE.pdf', '1724475156', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `date_added`, `last_modified`) VALUES
(1, 'Admin', 1234567890, 1234567890),
(2, 'User', 1234567890, 1234567890);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `restricted_by` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `title`, `course_id`, `start_date`, `end_date`, `restricted_by`, `order`) VALUES
(1, 'Introduction', 1, NULL, NULL, NULL, 0),
(2, 'Chap 1', 4, NULL, NULL, NULL, 0),
(3, 'Intro', 5, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'language', 'english'),
(2, 'system_name', 'MKraft Capability LMS'),
(3, 'system_title', 'MKraft Capability Learning Management System'),
(4, 'system_email', 'support@multiplierskraft.com'),
(5, 'address', 'MKraft Capability Solutions Pvt. Ltd.\r\nCSV, Electronic City Ph2, Bangalore 560100\r\n'),
(6, 'phone', '+(91) 961-105-8522'),
(7, 'purchase_code', 'your-purchase-code'),
(8, 'paypal', '[{\"active\":\"1\",\"mode\":\"sandbox\",\"sandbox_client_id\":\"AfGaziKslex-scLAyYdDYXNFaz2aL5qGau-SbDgE_D2E80D3AFauLagP8e0kCq9au7W4IasmFbirUUYc\",\"sandbox_secret_key\":\"EMa5pCTuOpmHkhHaCGibGhVUcKg0yt5-C3CzJw-OWJCzaXXzTlyD17SICob_BkfM_0Nlk7TWnN42cbGz\",\"production_client_id\":\"1234\",\"production_secret_key\":\"12345\"}]'),
(9, 'stripe_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"public_key\":\"\",\"secret_key\":\"\",\"public_live_key\":\"\",\"secret_live_key\":\"\"}]'),
(10, 'youtube_api_key', 'youtube-and-google-drive-api-key'),
(11, 'vimeo_api_key', 'vimeo-api-key'),
(12, 'slogan', 'Empower Learning, Elevate Success with MKraft Capability Solutions'),
(13, 'text_align', NULL),
(14, 'allow_instructor', '1'),
(15, 'instructor_revenue', '70'),
(16, 'system_currency', 'INR'),
(17, 'paypal_currency', 'USD'),
(18, 'stripe_currency', 'USD'),
(19, 'author', 'Debashish Mishra'),
(20, 'currency_position', 'left'),
(21, 'website_description', 'MKraft Capability Learning Management System\r\n\r\nAt MKraft, we specialize in designing and developing e-learning courses crafted by subject matter experts, ensuring a focus on effective learner skill development. Our courses are tailored to meet the unique needs of specific industries and organizations, providing targeted knowledge that drives performance.\r\n\r\nWhether you seek to enhance workforce skills, improve compliance, or foster innovation, our expertise in customizing e-learning solutions sets us apart. Reach out to us today to discuss how we can address your specific e-learning needs and empower your team with the skills they need to excel.'),
(22, 'website_keywords', 'LMS,Learning Management System,Creativeitem,MKraft,MKraft Capability'),
(23, 'footer_text', 'MKraft Capability Solutions LLP'),
(24, 'footer_link', 'https://multiplierskraft.com/services/e-learning-solutions/'),
(25, 'protocol', 'smtp'),
(26, 'smtp_host', 'smtp.gmail.com'),
(27, 'smtp_port', '587'),
(28, 'smtp_user', 'admin@example.com'),
(29, 'smtp_pass', 'Enter-your-app-password'),
(30, 'version', '6.9.1'),
(31, 'student_email_verification', 'enable'),
(32, 'instructor_application_note', 'Fill all the fields carefully and share if you want to share any document with us it will help us to evaluate you as an instructor.'),
(33, 'razorpay_keys', '[{\"active\":\"1\",\"key\":\"rzp_test_J60bqBOi1z1aF5\",\"secret_key\":\"uk935K7p4j96UCJgHK8kAU4q\",\"theme_color\":\"#c7a600\"}]'),
(34, 'razorpay_currency', 'USD'),
(35, 'fb_app_id', NULL),
(36, 'fb_app_secret', NULL),
(37, 'fb_social_login', NULL),
(38, 'drip_content_settings', '{\"lesson_completion_role\":\"percentage\",\"minimum_duration\":15,\"minimum_percentage\":\"30\",\"locked_lesson_message\":\"&lt;h3 xss=&quot;removed&quot; style=&quot;text-align: center; &quot;&gt;&lt;span xss=&quot;removed&quot;&gt;&lt;strong&gt;Permission denied!&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/h3&gt;&lt;p xss=&quot;removed&quot; style=&quot;text-align: center; &quot;&gt;&lt;span xss=&quot;removed&quot;&gt;This course supports drip content, so you must complete the previous lessons.&lt;\\/span&gt;&lt;\\/p&gt;\"}'),
(41, 'course_accessibility', 'publicly'),
(42, 'smtp_crypto', 'tls'),
(43, 'allowed_device_number_of_loging', '5'),
(47, 'edubuk_cloud_access_token', 'jdfghasdfasdfasdfasdfasdf'),
(48, 'course_selling_tax', '18'),
(49, 'ccavenue_keys', '[{\"active\":\"1\",\"ccavenue_merchant_id\":\"cmi_xxxxxx\",\"ccavenue_working_key\":\"cwk_xxxxxxxxxxxx\",\"ccavenue_access_code\":\"ccc_xxxxxxxxxxxxx\"}]'),
(50, 'ccavenue_currency', 'INR'),
(51, 'iyzico_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"iyzico_currency\":\"TRY\",\"api_test_key\":\"atk_xxxxxxxx\",\"secret_test_key\":\"stk_xxxxxxxx\",\"api_live_key\":\"alk_xxxxxxxx\",\"secret_live_key\":\"slk_xxxxxxxx\"}]'),
(52, 'iyzico_currency', 'TRY'),
(53, 'paystack_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"secret_test_key\":\"sk_test_c746060e693dd50c6f397dffc6c3b2f655217c94\",\"public_test_key\":\"pk_test_0816abbed3c339b8473ff22f970c7da1c78cbe1b\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxx\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxx\"}]'),
(54, 'paystack_currency', 'NGN'),
(55, 'paytm_keys', '[{\"PAYTM_MERCHANT_KEY\":\"PAYTM_MERCHANT_KEY\",\"PAYTM_MERCHANT_MID\":\"PAYTM_MERCHANT_MID\",\"PAYTM_MERCHANT_WEBSITE\":\"DEFAULT\",\"INDUSTRY_TYPE_ID\":\"Retail\",\"CHANNEL_ID\":\"WEB\"}]'),
(57, 'google_analytics_id', ''),
(58, 'meta_pixel_id', ''),
(59, 'smtp_from_email', 'admin@example.com'),
(61, 'language_dirs', '{\"english\":\"ltr\",\"hindi\":\"rtl\",\"arabic\":\"rtl\"}'),
(62, 'timezone', 'Asia/Kolkata'),
(63, 'account_disable', '0'),
(64, 'offline_bank_information', 'Enter your bank information'),
(65, 'randCallRange', '20'),
(70, 'wasabi_key', 'access-key'),
(71, 'wasabi_secret_key', 'secret-key'),
(72, 'wasabi_bucketname', 'bucket-name'),
(73, 'wasabi_region', 'region-name'),
(74, 'bbb_setting', '{\"endpoint\":\"https:\\/\\/manager.bigbluemeeting.com\\/bigbluebutton\\/\",\"secret\":\"shared-secret-or-salt\"}'),
(75, 'iso_country_codes', '{\"AF\": \"Afghanistan\",\"AX\": \"Åland Islands\",\"AL\": \"Albania\",\"DZ\": \"Algeria\",\"AS\": \"American Samoa\",\"AD\": \"Andorra\",\"AO\": \"Angola\",\"AI\": \"Anguilla\",\"AQ\": \"Antarctica\",\"AG\": \"Antigua and Barbuda\",\"AR\": \"Argentina\",\"AM\": \"Armenia\",\"AW\": \"Aruba\",\"AU\": \"Australia\",\"AT\": \"Austria\",\"AZ\": \"Azerbaijan\",\"BS\": \"Bahamas\",\"BH\": \"Bahrain\",\"BD\": \"Bangladesh\",\"BB\": \"Barbados\",\"BY\": \"Belarus\",\"BE\": \"Belgium\",\"BZ\": \"Belize\",\"BJ\": \"Benin\",\"BM\": \"Bermuda\",\"BT\": \"Bhutan\",\"BO\": \"Bolivia (Plurinational State of)\",\"BQ\": \"Bonaire, Sint Eustatius and Saba\",\"BA\": \"Bosnia and Herzegovina\",\"BW\": \"Botswana\",\"BV\": \"Bouvet Island\",\"BR\": \"Brazil\",\"IO\": \"British Indian Ocean Territory\",\"BN\": \"Brunei Darussalam\",\"BG\": \"Bulgaria\",\"BF\": \"Burkina Faso\",\"BI\": \"Burundi\",\"CV\": \"Cabo Verde\",\"KH\": \"Cambodia\",\"CM\": \"Cameroon\",\"CA\": \"Canada\",\"KY\": \"Cayman Islands\",\"CF\": \"Central African Republic\",\"TD\": \"Chad\",\"CL\": \"Chile\",\"CN\": \"China\",\"CX\": \"Christmas Island\",\"CC\": \"Cocos (Keeling) Islands\",\"CO\": \"Colombia\",\"KM\": \"Comoros\",\"CG\": \"Congo\",\"CD\": \"Congo (Democratic Republic of the)\",\"CK\": \"Cook Islands\",\"CR\": \"Costa Rica\",\"CI\": \"Côte d\'Ivoire\",\"HR\": \"Croatia\",\"CU\": \"Cuba\",\"CW\": \"Curaçao\",\"CY\": \"Cyprus\",\"CZ\": \"Czech Republic\",\"DK\": \"Denmark\",\"DJ\": \"Djibouti\",\"DM\": \"Dominica\",\"DO\": \"Dominican Republic\",\"EC\": \"Ecuador\",\"EG\": \"Egypt\",\"SV\": \"El Salvador\",\"GQ\": \"Equatorial Guinea\",\"ER\": \"Eritrea\",\"EE\": \"Estonia\",\"ET\": \"Ethiopia\",\"FK\": \"Falkland Islands (Malvinas)\",\"FO\": \"Faroe Islands\",\"FJ\": \"Fiji\",\"FI\": \"Finland\",\"FR\": \"France\",\"GF\": \"French Guiana\",\"PF\": \"French Polynesia\",\"TF\": \"French Southern Territories\",\"GA\": \"Gabon\",\"GM\": \"Gambia\",\"GE\": \"Georgia\",\"DE\": \"Germany\",\"GH\": \"Ghana\",\"GI\": \"Gibraltar\",\"GR\": \"Greece\",\"GL\": \"Greenland\",\"GD\": \"Grenada\",\"GP\": \"Guadeloupe\",\"GU\": \"Guam\",\"GT\": \"Guatemala\",\"GG\": \"Guernsey\",\"GN\": \"Guinea\",\"GW\": \"Guinea-Bissau\",\"GY\": \"Guyana\",\"HT\": \"Haiti\",\"HM\": \"Heard Island and McDonald Islands\",\"VA\": \"Holy See\",\"HN\": \"Honduras\",\"HK\": \"Hong Kong\",\"HU\": \"Hungary\",\"IS\": \"Iceland\",\"IN\": \"India\",\"ID\": \"Indonesia\",\"IR\": \"Iran (Islamic Republic of)\",\"IQ\": \"Iraq\",\"IE\": \"Ireland\",\"IM\": \"Isle of Man\",\"IL\": \"Israel\",\"IT\": \"Italy\",\"JM\": \"Jamaica\",\"JP\": \"Japan\",\"JE\": \"Jersey\",\"JO\": \"Jordan\",\"KZ\": \"Kazakhstan\",\"KE\": \"Kenya\",\"KI\": \"Kiribati\",\"KP\": \"Korea (Democratic People\'s Republic of)\",\"KR\": \"Korea (Republic of)\",\"KW\": \"Kuwait\",\"KG\": \"Kyrgyzstan\",\"LA\": \"Lao People\'s Democratic Republic\",\"LV\": \"Latvia\",\"LB\": \"Lebanon\",\"LS\": \"Lesotho\",\"LR\": \"Liberia\",\"LY\": \"Libya\",\"LI\": \"Liechtenstein\",\"LT\": \"Lithuania\",\"LU\": \"Luxembourg\",\"MO\": \"Macao\",\"MK\": \"North Macedonia\",\"MG\": \"Madagascar\",\"MW\": \"Malawi\",\"MY\": \"Malaysia\",\"MV\": \"Maldives\",\"ML\": \"Mali\",\"MT\": \"Malta\",\"MH\": \"Marshall Islands\",\"MQ\": \"Martinique\",\"MR\": \"Mauritania\",\"MU\": \"Mauritius\",\"YT\": \"Mayotte\",\"MX\": \"Mexico\",\"FM\": \"Micronesia (Federated States of)\",\"MD\": \"Moldova (Republic of)\",\"MC\": \"Monaco\",\"MN\": \"Mongolia\",\"ME\": \"Montenegro\",\"MS\": \"Montserrat\",\"MA\": \"Morocco\",\"MZ\": \"Mozambique\",\"MM\": \"Myanmar\",\"NA\": \"Namibia\",\"NR\": \"Nauru\",\"NP\": \"Nepal\",\"NL\": \"Netherlands\",\"NC\": \"New Caledonia\",\"NZ\": \"New Zealand\",\"NI\": \"Nicaragua\",\"NE\": \"Niger\",\"NG\": \"Nigeria\",\"NU\": \"Niue\",\"NF\": \"Norfolk Island\",\"MP\": \"Northern Mariana Islands\",\"NO\": \"Norway\",\"OM\": \"Oman\",\"PK\": \"Pakistan\",\"PW\": \"Palau\",\"PS\": \"Palestine, State of\",\"PA\": \"Panama\",\"PG\": \"Papua New Guinea\",\"PY\": \"Paraguay\",\"PE\": \"Peru\",\"PH\": \"Philippines\",\"PN\": \"Pitcairn\",\"PL\": \"Poland\",\"PT\": \"Portugal\",\"PR\": \"Puerto Rico\",\"QA\": \"Qatar\",\"RE\": \"Réunion\",\"RO\": \"Romania\",\"RU\": \"Russian Federation\",\"RW\": \"Rwanda\",\"BL\": \"Saint Barthélemy\",\"SH\": \"Saint Helena, Ascension and Tristan da Cunha\",\"KN\": \"Saint Kitts and Nevis\",\"LC\": \"Saint Lucia\",\"MF\": \"Saint Martin (French part)\",\"PM\": \"Saint Pierre and Miquelon\",\"VC\": \"Saint Vincent and the Grenadines\",\"WS\": \"Samoa\",\"SM\": \"San Marino\",\"ST\": \"Sao Tome and Principe\",\"SA\": \"Saudi Arabia\",\"SN\": \"Senegal\",\"RS\": \"Serbia\",\"SC\": \"Seychelles\",\"SL\": \"Sierra Leone\",\"SG\": \"Singapore\",\"SX\": \"Sint Maarten (Dutch part)\",\"SK\": \"Slovakia\",\"SI\": \"Slovenia\",\"SB\": \"Solomon Islands\",\"SO\": \"Somalia\",\"ZA\": \"South Africa\",\"GS\": \"South Georgia and the South Sandwich Islands\",\"SS\": \"South Sudan\",\"ES\": \"Spain\",\"LK\": \"Sri Lanka\",\"SD\": \"Sudan\",\"SR\": \"Suriname\",\"SJ\": \"Svalbard and Jan Mayen\",\"SE\": \"Sweden\",\"CH\": \"Switzerland\",\"SY\": \"Syrian Arab Republic\",\"TW\": \"Taiwan, Province of China\",\"TJ\": \"Tajikistan\",\"TZ\": \"Tanzania, United Republic of\",\"TH\": \"Thailand\",\"TL\": \"Timor-Leste\",\"TG\": \"Togo\",\"TK\": \"Tokelau\",\"TO\": \"Tonga\",\"TT\": \"Trinidad and Tobago\",\"TN\": \"Tunisia\",\"TR\": \"Turkey\",\"TM\": \"Turkmenistan\",\"TC\": \"Turks and Caicos Islands\",\"TV\": \"Tuvalu\",\"UG\": \"Uganda\",\"UA\": \"Ukraine\",\"AE\": \"United Arab Emirates\",\"GB\": \"United Kingdom of Great Britain and Northern Ireland\",\"UM\": \"United States Minor Outlying Islands\",\"US\": \"United States of America\",\"UY\": \"Uruguay\",\"UZ\": \"Uzbekistan\",\"VU\": \"Vanuatu\",\"VE\": \"Venezuela (Bolivarian Republic of)\",\"VN\": \"Viet Nam\",\"VG\": \"Virgin Islands (British)\",\"VI\": \"Virgin Islands (U.S.)\",\"WF\": \"Wallis and Futuna\",\"EH\": \"Western Sahara\",\"YE\": \"Yemen\",\"ZM\": \"Zambia\",\"ZW\": \"Zimbabwe\"}'),
(76, 'open_ai', '{\"model\":\"gpt-3.5-turbo-0125\",\"max_tokens\":\"200\",\"number_of_image_creation\":\"6\",\"ai_secret_key\":\"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\"}');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) UNSIGNED NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `tagable_id` int(11) DEFAULT NULL,
  `tagable_type` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `skills` longtext NOT NULL,
  `social_links` longtext DEFAULT NULL,
  `biography` longtext DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `wishlist` longtext DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `payment_keys` longtext NOT NULL,
  `verification_code` longtext DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_instructor` int(11) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `temp` longtext DEFAULT NULL,
  `sessions` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `password`, `skills`, `social_links`, `biography`, `role_id`, `date_added`, `last_modified`, `wishlist`, `title`, `payment_keys`, `verification_code`, `status`, `is_instructor`, `image`, `temp`, `sessions`) VALUES
(2, 'Dhanraj', 'Dadhich', 'dhanraj@multiplierskraft.com', NULL, NULL, '4d4723f195587c54ea2bff7d90c660a9bfdea886', '', '{\"facebook\":\"\",\"twitter\":\"\",\"linkedin\":\"https:\\/\\/www.linkedin.com\\/in\\/dhanrajdadhich\"}', '', 1, 1727113264, 1727113264, NULL, '', '', NULL, 1, 1, 'a5dcf441483c52f474d280e26bf88121', NULL, ''),
(3, 'Debashish', 'Mishra', 'deb@multiplierskraft.com', '+91-9945813510', '193, Concorde Sylvan View, Ramasagara Village, Electronic City Phase 2, Bangalore - 560100', '15f7b28dc68a80702c493fcb074c37bf8fc20bcc', '', '{\"facebook\":\"\",\"twitter\":\"\",\"linkedin\":\"https:\\/\\/www.linkedin.com\\/in\\/debashishmishramkraft\"}', '<p>Debashish brings in over two decades of HR experience with Industries like IT, Engineering, Product, Financial Services, SaaS, FinTech, ITES, and so on. Deb bas set up and led various functions like Organization Development, Talent, Performance, L&D, HR and he has been passionate about facilitation. Besides being an HR professional he is a Gallup Strengths Coach, Master Trainer & Facilitator, Trained more than 65 thousand professionals on different high impact organizational and behavioral topics. His deep expertise has enabled many transformational journeys and initiatives for individuals, groups, and organizations and some of them have been radical. He is also a mentor to several startup founders/board/CXOs. Loves to invest his time on technology, Human Psychology, Leadership & Management areas. Deb is fond of this space of advisory and consulting where he works with seasoned HR professionals, organization leaders, coaches and facilitators for maximizing the impact of key roles and functions. He identifies himself as a ‘Student for Life’ and commitment to serve the purpose resides at the core of his heart.<br></p>', 1, 1728500337, NULL, NULL, NULL, '', NULL, 1, 1, '250384f638f9f6f890a662b2cc419ada', NULL, ''),
(4, 'Pallavi ', 'Singh', 'pallavi.singh@multiplierskraft.com', '', '', '15f7b28dc68a80702c493fcb074c37bf8fc20bcc', '', '{\"facebook\":\"\",\"twitter\":\"\",\"linkedin\":\"\"}', '', 1, 1728503000, NULL, '[]', NULL, '', NULL, 1, 1, 'a5dce92079cfeea6d17bb599f2945ad0', NULL, ''),
(5, 'Bonny', 'Mukherjee', 'bonny.mukherjee@multiplierskraft.com', '', '', '15f7b28dc68a80702c493fcb074c37bf8fc20bcc', '', '{\"facebook\":\"\",\"twitter\":\"\",\"linkedin\":\"\"}', '', 1, 1728503149, NULL, '[]', NULL, '', NULL, 1, 1, '54b5228813d6b90821cea47399d2555d', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `watched_duration`
--

CREATE TABLE `watched_duration` (
  `watched_id` int(11) UNSIGNED NOT NULL,
  `watched_student_id` int(11) DEFAULT NULL,
  `watched_course_id` int(11) DEFAULT NULL,
  `watched_lesson_id` int(11) DEFAULT NULL,
  `current_duration` int(20) DEFAULT NULL,
  `watched_counter` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `watch_histories`
--

CREATE TABLE `watch_histories` (
  `watch_history_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `completed_lesson` longtext NOT NULL,
  `course_progress` int(11) NOT NULL,
  `watching_lesson_id` int(11) NOT NULL,
  `quiz_result` longtext NOT NULL,
  `completed_date` varchar(255) DEFAULT NULL,
  `date_added` varchar(100) DEFAULT NULL,
  `date_updated` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `watch_histories`
--

INSERT INTO `watch_histories` (`watch_history_id`, `course_id`, `student_id`, `completed_lesson`, `course_progress`, `watching_lesson_id`, `quiz_result`, `completed_date`, `date_added`, `date_updated`) VALUES
(1, 1, 2, '', 0, 1, '', NULL, '1724475009', '1724475181');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bbb_meetings`
--
ALTER TABLE `bbb_meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`blog_category_id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`blog_comment_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_page`
--
ALTER TABLE `custom_page`
  ADD PRIMARY KEY (`custom_page_id`);

--
-- Indexes for table `enrol`
--
ALTER TABLE `enrol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`phrase_id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `message_thread`
--
ALTER TABLE `message_thread`
  ADD PRIMARY KEY (`message_thread_id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_histories`
--
ALTER TABLE `newsletter_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout`
--
ALTER TABLE `payout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`quiz_result_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource_files`
--
ALTER TABLE `resource_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `watched_duration`
--
ALTER TABLE `watched_duration`
  ADD PRIMARY KEY (`watched_id`);

--
-- Indexes for table `watch_histories`
--
ALTER TABLE `watch_histories`
  ADD PRIMARY KEY (`watch_history_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bbb_meetings`
--
ALTER TABLE `bbb_meetings`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `blog_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `blog_comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `custom_page`
--
ALTER TABLE `custom_page`
  MODIFY `custom_page_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrol`
--
ALTER TABLE `enrol`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `phrase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2018;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_thread`
--
ALTER TABLE `message_thread`
  MODIFY `message_thread_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletter_histories`
--
ALTER TABLE `newsletter_histories`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `payout`
--
ALTER TABLE `payout`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `quiz_result_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resource_files`
--
ALTER TABLE `resource_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `watched_duration`
--
ALTER TABLE `watched_duration`
  MODIFY `watched_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `watch_histories`
--
ALTER TABLE `watch_histories`
  MODIFY `watch_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
