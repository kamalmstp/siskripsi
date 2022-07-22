-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2022 at 09:06 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siskripsi`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment_components`
--

CREATE TABLE `assessment_components` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assessment_type` enum('SEMINAR','TRIAL','COLLOQUIUM') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SEMINAR',
  `weight` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment_components`
--

INSERT INTO `assessment_components` (`id`, `name`, `assessment_type`, `weight`) VALUES
('07aff836-16b5-4a9f-8fc9-cac2aa19b1d8', 'Penguasaan Materi', 'SEMINAR', 40),
('27845f6d-4e88-436a-b596-cc4578812c9f', 'Metodologi Penelitian', 'TRIAL', 25),
('47ccdfba-3997-4fa1-ba52-546cc14dfc8e', 'Penggunaan Kepustakaan', 'TRIAL', 10),
('5b50791e-dac4-47ac-97f6-fab40dd44ce0', 'Sikap dan Tingkah Laku', 'TRIAL', 25),
('a3cb14eb-280e-4750-a1b1-49aaa00656fc', 'Konsep Pemikiran', 'TRIAL', 10),
('af1df4db-9bac-42ff-8401-f7be90c2cd3d', 'Teknik Presentasi', 'SEMINAR', 20),
('d0d6e2b8-e54f-4e35-91f9-14b4f13ee530', 'ETIKA', 'SEMINAR', 10),
('d5f5f713-94f1-4d49-9712-5f0ecc5ea88a', 'Penyajian dan Tanggung Jawab', 'TRIAL', 25),
('d715a666-8045-4b25-8727-2ad4722ef062', 'Argumentasi', 'SEMINAR', 30),
('d82373f1-c7ae-4d0e-a122-e87d08a2630f', 'Hasil dan Pembahasan Penelitian', 'TRIAL', 25);

-- --------------------------------------------------------

--
-- Table structure for table `assessment_schedules`
--

CREATE TABLE `assessment_schedules` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `start_at` time DEFAULT NULL,
  `finished_at` time DEFAULT NULL,
  `room_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_done` tinyint(1) NOT NULL DEFAULT 0,
  `submission_assessment_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_scores`
--

CREATE TABLE `assessment_scores` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `submission_assessment_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assessment_component_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nidn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_sets`
--

CREATE TABLE `data_sets` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `study_program_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thesis_year` year(4) NOT NULL,
  `research_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `science_field_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_supervisor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_supervisor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_seminar_examiner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_seminar_examiner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_trial_examiner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_trial_examiner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deadlines`
--

CREATE TABLE `deadlines` (
  `id` char(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `form_name` varchar(100) DEFAULT NULL,
  `time_start` datetime DEFAULT NULL,
  `time_end` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deadlines`
--

INSERT INTO `deadlines` (`id`, `name`, `form_name`, `time_start`, `time_end`, `status`, `created_at`, `updated_at`) VALUES
('ac0b6302-aa5d-4937-927f-4fc84198e835', 'Persyaratan Proposal Skripsi Tahun Ajaran 2021/2022 Genap', 'thesis-requirement-submission', '2022-07-02 00:00:00', '2022-07-04 00:00:00', 1, '2022-07-03 17:30:09', '2022-07-03 17:39:00'),
('f5d60105-9429-4558-8f8d-58d1a4f707a9', 'Persyaratan Skripsi Tahun Ajaran 2021/2022 Genap', 'final-requirement-submission', '2022-07-04 02:56:00', '2022-07-09 02:57:00', 1, '2022-07-03 17:57:08', '2022-07-03 17:57:08');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faculty_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faculty_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dean_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`id`, `faculty_code`, `faculty_name`, `dean_code`, `created_at`, `updated_at`) VALUES
('0eea139a-f556-423e-b0b4-9e28afe439ed', 'FH', 'Fakultas Hukum', NULL, '2022-02-14 05:18:36', '2022-02-14 05:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_requirements`
--

CREATE TABLE `final_requirements` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 1,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `final_requirements`
--

INSERT INTO `final_requirements` (`id`, `document_name`, `document_type`, `is_required`, `note`, `created_at`, `updated_at`) VALUES
('ac1cba6a-4a7b-45b6-9c25-2481ef65820f', 'KHS', 'document', 1, NULL, '2022-06-28 00:03:15', '2022-06-28 00:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `guidance`
--

CREATE TABLE `guidance` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thesis_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nidn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('SENT','REVIEW','REPLIED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SENT',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guidance`
--

INSERT INTO `guidance` (`id`, `thesis_id`, `nim`, `title`, `note`, `document`, `nidn`, `status`, `created_at`, `updated_at`) VALUES
('a27d0101-79a2-4909-ba50-6bce4a47502b', '9ee39335-e461-4fee-bf21-05e4e6ef95ba', '123123', 'Konsul BAB 1', '<p>konsul bab 1</p>', 'documents/guidance/CGR8PvXnRJZWSWvihUJkTHZYcvhuO8SAoACV8Wkl.docx', '22222', 'REPLIED', '2022-02-14 05:56:14', '2022-02-14 05:57:01'),
('3f668e46-dec0-4a4b-a3b5-a643b2d7f9c6', '9ee39335-e461-4fee-bf21-05e4e6ef95ba', '123123', 'Konsul BAB 2', '<p>fgdfgfdgfd</p>', 'documents/guidance/oibbfKaem8mEd4ahrfHhPv0MZwmYaYLXTE4NiWQH.docx', '22222', 'REPLIED', '2022-02-14 05:59:27', '2022-02-14 06:02:56'),
('a27d0101-79a2-4909-ba50-6bce4a47502b', '9ee39335-e461-4fee-bf21-05e4e6ef95ba', '123123', 'Konsul BAB 1', '<p>konsul bab 1</p>', 'documents/guidance/CGR8PvXnRJZWSWvihUJkTHZYcvhuO8SAoACV8Wkl.docx', '22222', 'REPLIED', '2022-02-14 05:56:14', '2022-02-14 05:57:01'),
('3f668e46-dec0-4a4b-a3b5-a643b2d7f9c6', '9ee39335-e461-4fee-bf21-05e4e6ef95ba', '123123', 'Konsul BAB 2', '<p>fgdfgfdgfd</p>', 'documents/guidance/oibbfKaem8mEd4ahrfHhPv0MZwmYaYLXTE4NiWQH.docx', '22222', 'REPLIED', '2022-02-14 05:59:27', '2022-02-14 06:02:56');

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nidn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `study_program_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `functional` enum('EXPERT_ASSISTANT','LECTURER','CHIEF_LECTURER','PROFESSOR') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('M','F') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'M',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certification_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 8,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`id`, `nidn`, `full_name`, `degree`, `study_program_code`, `functional`, `gender`, `phone`, `email`, `certification_number`, `quota`, `created_at`, `updated_at`) VALUES
('4d55b422-b189-4598-89b4-e8316dd2bc21', '111111', 'DOSEN 1', 'S.H., M.H', '61201', 'EXPERT_ASSISTANT', 'M', NULL, 'dosen@gmail.com', NULL, 8, '2022-02-14 05:30:05', '2022-02-14 05:30:05'),
('703bf1ec-441a-4f66-9126-bfa96d10059f', '77777', 'PENGUJI1', 'S.H., M.H', '61201', 'EXPERT_ASSISTANT', 'M', NULL, 'penguji1@gmail.com', NULL, 8, '2022-07-05 01:27:48', '2022-07-05 01:27:48'),
('ad736d62-3e1c-49f8-93d6-ab3a7c1a3756', '88888', 'PENGUJI 2', 'S.H., M.H', '61201', 'EXPERT_ASSISTANT', 'M', NULL, 'penguji2@gmail.com', NULL, 8, '2022-07-05 01:28:20', '2022-07-05 01:28:20'),
('e403e341-5537-4448-9e2f-aba00e55aea8', '33333', 'PEMBIMBING 2', 'S.H', '61201', 'EXPERT_ASSISTANT', 'F', NULL, 'pembimbing2@gmail.com', NULL, 8, '2022-02-14 05:49:26', '2022-02-14 05:49:26'),
('e8f2a30c-ba86-4ea1-95b8-0f5eeec79786', '22222', 'PEMBIMBING 1', 'S.H', '61201', 'EXPERT_ASSISTANT', 'M', NULL, 'pembimbing1@gmail.com', NULL, 8, '2022-02-14 05:48:53', '2022-02-14 05:48:53');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_competency`
--

CREATE TABLE `lecturer_competency` (
  `lecturer_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `science_field_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lecturer_competency`
--

INSERT INTO `lecturer_competency` (`lecturer_id`, `science_field_id`) VALUES
('4d55b422-b189-4598-89b4-e8316dd2bc21', '793dd6dc-8903-4c22-a4e8-07f99de27daf'),
('4d55b422-b189-4598-89b4-e8316dd2bc21', 'cb5c4ab8-3cac-4b6d-b4b2-dfe3eacc2c01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_29_114356_create_faculties_table', 1),
(5, '2021_05_29_114429_create_study_programs_table', 1),
(6, '2021_05_29_114506_create_lecturers_table', 1),
(7, '2021_05_29_114514_create_students_table', 1),
(8, '2021_05_29_122517_create_science_fields_table', 1),
(9, '2021_05_29_122557_create_thesis_requirements_table', 1),
(10, '2021_05_29_124314_create_submission_of_thesis_requirements_table', 1),
(11, '2021_05_29_125003_create_submission_details_thesis_requirements_table', 1),
(12, '2021_05_29_132224_create_assessment_components_table', 1),
(13, '2021_05_29_134743_create_thesis_submission_table', 1),
(14, '2021_05_29_135621_create_theses_table', 1),
(15, '2021_05_29_143929_create_submission_of_assessments_table', 1),
(16, '2021_05_29_145742_create_assessment_schedules_table', 1),
(17, '2021_05_29_233242_create_assessment_scores_table', 1),
(18, '2021_05_29_234008_create_guidance_table', 1),
(19, '2021_07_03_103843_create_data_sets_table', 1),
(20, '2021_07_09_171237_change_guide_to_supervisor', 1),
(21, '2021_07_23_101559_add_thesis_id_to_guidance_table', 1),
(22, '2021_07_24_072620_create_supervisor_responses_table', 1),
(23, '2021_07_24_072713_drop_guide_response_in_guidance_table', 1),
(24, '2021_07_24_235136_add_document_and_guidance_card_to_sub_assessment', 1),
(25, '2021_07_25_220700_create_lecturer_competency_table', 1),
(26, '2021_07_27_144242_remove_day_and_add_is_done_to_schedule', 1),
(27, '2021_08_01_215905_add_lecturer_certification_number_and_quota_to_lecturer', 1),
(28, '2021_08_03_082004_create_data_testings_table', 1),
(29, '2021_08_03_082013_create_roots_table', 1),
(30, '2021_08_03_082044_create_rules_table', 1),
(31, '2021_08_14_083406_change_response_note_to_text', 1),
(32, '2021_08_20_214404_create_scores_table', 1),
(33, '2021_08_22_221917_remove_guidance_card_from_submission_assessment', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `science_fields`
--

CREATE TABLE `science_fields` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `science_fields`
--

INSERT INTO `science_fields` (`id`, `code`, `name`) VALUES
('793dd6dc-8903-4c22-a4e8-07f99de27daf', '0002', 'Hukum Pidana'),
('cb5c4ab8-3cac-4b6d-b4b2-dfe3eacc2c01', '0001', 'Hukum Keluarga');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thesis_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seminar` double DEFAULT NULL,
  `colloquium` double DEFAULT NULL,
  `trial` double DEFAULT NULL,
  `final_score` double DEFAULT NULL,
  `predicate_value` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `study_program_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('M','F') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'M',
  `place_of_birth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester` int(11) NOT NULL DEFAULT 8,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `nim`, `full_name`, `study_program_code`, `gender`, `place_of_birth`, `date_of_birth`, `address`, `phone`, `email`, `semester`, `created_at`, `updated_at`) VALUES
('8d80e93a-033a-4188-bc1e-a35de03118c5', '989898', 'TEST LAST', '61201', 'M', 'Amuntai', '1997-07-11', 'tes', NULL, 'testlast@gmail.com', 7, '2022-07-04 06:39:31', '2022-07-04 06:39:31'),
('954d9855-5642-490d-a790-180d857b9139', '123123', 'MAHASISWA', '61201', 'M', 'Amuntai', '1997-07-11', 'Amuntai', '87354656', 'mahasiswa@gmail.com', 8, '2022-02-14 05:32:04', '2022-02-14 05:32:04'),
('bccb6919-876b-4487-9154-abe74cb2b20c', 'H1G115223', 'MUSTAPA AHMAD KAMAL', '61201', 'M', 'amuntai', '1997-07-11', 'amuntai', NULL, 'mustapakamalkml@gmail.com', 8, '2022-06-26 23:44:31', '2022-06-26 23:44:31');

-- --------------------------------------------------------

--
-- Table structure for table `study_programs`
--

CREATE TABLE `study_programs` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `study_program_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faculty_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lecturer_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('D1','D2','D3','D4','S1','S2','S3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'S1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `study_programs`
--

INSERT INTO `study_programs` (`id`, `study_program_code`, `name`, `faculty_code`, `lecturer_code`, `level`, `created_at`, `updated_at`) VALUES
('19137446-65c3-4325-9cd1-8c76dd4879fd', '61201', 'Sarjana Ilmu Hukum', 'FH', '111111', 'S1', '2022-02-14 04:25:22', '2022-02-14 05:30:46'),
('19137446-65c3-76457-9cd1-8c76dd4879f', '98767', 'Magister Kenotariatan', 'FH', NULL, 'S2', NULL, '2022-02-14 05:28:35'),
('227b274e-b433-4546-ae43-b8f4d01c5cb8', '90241', 'Magister Ilmu Hukum', 'FH', NULL, 'S2', '2022-02-14 04:25:22', '2022-06-27 22:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `submission_details_final_requirements`
--

CREATE TABLE `submission_details_final_requirements` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `submission_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `final_requirement_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `submission_details_thesis_requirements`
--

CREATE TABLE `submission_details_thesis_requirements` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `submission_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thesis_requirement_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `submission_details_thesis_requirements`
--

INSERT INTO `submission_details_thesis_requirements` (`id`, `submission_id`, `thesis_requirement_id`, `document`, `created_at`, `updated_at`) VALUES
('1a672a31-8d25-497f-9ea5-58346eecf9bc', 'eb8cb104-3666-4d19-aaf9-1b4e6b5bcaad', 'c2e1f589-5758-4326-8356-716c03841cc6', 'documents/thesis-requirement/MsmcL4Bc8laLr4uYtsv5D10i2nlP0xiuGmZYzB08.pdf', '2022-06-27 01:08:58', '2022-06-27 01:08:58'),
('20049e33-fa93-4bbb-a318-63cdccb4ab70', 'f7e38abe-2def-4de8-bb65-dd78ec32a69b', '72605123-703e-42e8-b722-baba233105a9', 'documents/thesis-requirement/6Ow8Pu5bvuVL4oRdkm6331I4GoQKho5zzTp1yBva.pdf', '2022-02-14 05:39:39', '2022-02-14 05:39:39'),
('49fbbbdd-d2b3-4e1c-8454-a099004e5389', 'f7e38abe-2def-4de8-bb65-dd78ec32a69b', '6a9f2660-fcb6-4854-8e14-f67185c2ec6c', 'documents/thesis-requirement/wub1PQpjRfQZiMiLEpFW8Wpza7PoNPNSu5btftWQ.pdf', '2022-02-14 05:39:22', '2022-02-14 05:39:22'),
('4bba1a3d-d36d-4620-a9cb-cd99aeed418e', 'f7e38abe-2def-4de8-bb65-dd78ec32a69b', 'c2e1f589-5758-4326-8356-716c03841cc6', 'documents/thesis-requirement/Mh3oA3NK5q5anVo0mtxzCPS9QXtYLm5tebdctrxo.pdf', '2022-02-14 05:39:53', '2022-02-14 05:39:53'),
('7ac39fb3-11d8-4d6b-87dc-80419fa91395', 'f7e38abe-2def-4de8-bb65-dd78ec32a69b', '2b8814d2-65ab-479d-96e9-b1a0451784cb', 'documents/thesis-requirement/F0tZXz7gXir4nQIFrcYXbv3zBgHWI7FKH59ThP1r.pdf', '2022-02-14 05:37:15', '2022-02-14 05:37:15'),
('82a3e17f-f288-4640-857d-d2e8fb761bd5', 'eb8cb104-3666-4d19-aaf9-1b4e6b5bcaad', '310f0206-bcce-4860-9dc4-622babe202ba', 'documents/thesis-requirement/RiJXbgArXxA1eu0yeUVk9KU1yqcB6cvUtLoQqftc.pdf', '2022-06-27 01:08:38', '2022-06-27 01:08:38'),
('924458f2-4fc0-4a94-b358-bb13f4c8aed5', 'eb8cb104-3666-4d19-aaf9-1b4e6b5bcaad', '72605123-703e-42e8-b722-baba233105a9', 'documents/thesis-requirement/S4b6oi1NZJfsQRirRggvgGRoB4jto9fncT71e9oG.pdf', '2022-06-27 01:08:49', '2022-06-27 01:08:49'),
('b4398f86-ac9a-4875-9f6b-5a3a899dc5e0', 'f7e38abe-2def-4de8-bb65-dd78ec32a69b', '310f0206-bcce-4860-9dc4-622babe202ba', 'documents/thesis-requirement/yyS9gwHCoxiaBrQQ6ISNcftCtZjKSHqjhbEbePhG.pdf', '2022-02-14 05:37:37', '2022-02-14 05:37:37'),
('c3bcbb61-6942-4f8f-b535-3fd75312822e', 'eb8cb104-3666-4d19-aaf9-1b4e6b5bcaad', '2b8814d2-65ab-479d-96e9-b1a0451784cb', 'documents/thesis-requirement/ugOCVIOnCm5wwtdOjvVQC6DTr6htXJfP8eehceRQ.pdf', '2022-06-27 00:52:54', '2022-06-27 00:52:54'),
('e68df726-b6b9-411a-b290-3f306cd274cc', 'eb8cb104-3666-4d19-aaf9-1b4e6b5bcaad', '6a9f2660-fcb6-4854-8e14-f67185c2ec6c', 'documents/thesis-requirement/8xr9JB9mWjErZhBnafKRn4jxoFvnJrEZpTDbGCwk.pdf', '2022-06-27 01:07:47', '2022-06-27 01:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `submission_of_assessments`
--

CREATE TABLE `submission_of_assessments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thesis_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assessment_type` enum('SEMINAR','TRIAL','COLLOQUIUM') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SEMINAR',
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_examiner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_examiner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_first_supervisor` enum('APPLY','APPROVE','REJECT','WAITING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'APPLY',
  `status_second_supervisor` enum('APPLY','APPROVE','REJECT','WAITING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'APPLY',
  `note_first_supervisor` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_second_supervisor` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response_date_first_supervisor` datetime DEFAULT NULL,
  `response_date_second_supervisor` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `submission_of_assessments`
--

INSERT INTO `submission_of_assessments` (`id`, `nim`, `thesis_id`, `assessment_type`, `document`, `first_examiner`, `second_examiner`, `status_first_supervisor`, `status_second_supervisor`, `note_first_supervisor`, `note_second_supervisor`, `response_date_first_supervisor`, `response_date_second_supervisor`, `created_at`, `updated_at`) VALUES
('7408570c-d1a6-49eb-8b2d-cf186c45e415', '123123', '9ee39335-e461-4fee-bf21-05e4e6ef95ba', 'SEMINAR', 'documents/seminar/qxzsKDMF3vAu6AH0k3hUZ8nNDu4bn08YVtGzPBFq.rar', NULL, NULL, 'APPROVE', 'APPROVE', NULL, NULL, '2022-02-14 14:07:27', '2022-06-27 07:32:21', '2022-02-14 06:06:19', '2022-06-26 23:32:21'),
('95af352e-94fd-4c1d-8569-1ca37416c3f7', 'H1G115223', '516a290d-3999-4028-bbb6-da797ec8702a', 'SEMINAR', 'documents/seminar/KXAId42JLwlxn39teDkx1ATAhpZPQ2CRBG6tBXdC.pdf', NULL, NULL, 'APPROVE', 'APPROVE', NULL, NULL, '2022-07-05 09:17:44', '2022-07-05 09:18:22', '2022-07-04 06:52:35', '2022-07-05 01:18:22');

-- --------------------------------------------------------

--
-- Table structure for table `submission_of_final_requirements`
--

CREATE TABLE `submission_of_final_requirements` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_filling` datetime NOT NULL,
  `response_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response_date` datetime NOT NULL,
  `status` enum('DRAFT','APPLY','WAITING','APPROVE','REJECT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'WAITING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `submission_of_thesis_requirements`
--

CREATE TABLE `submission_of_thesis_requirements` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_filling` datetime NOT NULL,
  `response_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response_date` datetime NOT NULL,
  `status` enum('DRAFT','APPLY','WAITING','APPROVE','REJECT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'WAITING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `submission_of_thesis_requirements`
--

INSERT INTO `submission_of_thesis_requirements` (`id`, `nim`, `date_of_filling`, `response_note`, `response_date`, `status`, `created_at`, `updated_at`) VALUES
('eb8cb104-3666-4d19-aaf9-1b4e6b5bcaad', 'H1G115223', '2022-07-04 14:07:22', NULL, '2022-07-04 14:10:48', 'APPROVE', '2022-06-26 23:46:50', '2022-07-04 06:10:48'),
('f7e38abe-2def-4de8-bb65-dd78ec32a69b', '123123', '2022-02-14 13:40:25', NULL, '2022-02-14 13:41:49', 'APPROVE', '2022-02-14 05:37:15', '2022-02-14 05:41:49');

-- --------------------------------------------------------

--
-- Table structure for table `supervisor_responses`
--

CREATE TABLE `supervisor_responses` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guidance_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supervisor_responses`
--

INSERT INTO `supervisor_responses` (`id`, `guidance_id`, `response`, `document`, `created_at`, `updated_at`) VALUES
('57dc5366-21bc-4981-a9f1-a69c24ad79fd', 'a27d0101-79a2-4909-ba50-6bce4a47502b', '<p>Masih ada yang salah, harap perbaiki</p>', NULL, '2022-02-14 05:57:01', '2022-02-14 05:57:01'),
('df2c7d45-a422-4df4-b1ae-98ebfbd6024b', '3f668e46-dec0-4a4b-a3b5-a643b2d7f9c6', '<p>Halamannya salah, mohon periksa kembali</p>', NULL, '2022-02-14 06:02:55', '2022-02-14 06:02:55'),
('57dc5366-21bc-4981-a9f1-a69c24ad79fd', 'a27d0101-79a2-4909-ba50-6bce4a47502b', '<p>Masih ada yang salah, harap perbaiki</p>', NULL, '2022-02-14 05:57:01', '2022-02-14 05:57:01'),
('df2c7d45-a422-4df4-b1ae-98ebfbd6024b', '3f668e46-dec0-4a4b-a3b5-a643b2d7f9c6', '<p>Halamannya salah, mohon periksa kembali</p>', NULL, '2022-02-14 06:02:55', '2022-02-14 06:02:55');

-- --------------------------------------------------------

--
-- Table structure for table `theses`
--

CREATE TABLE `theses` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `research_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `science_field_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `application` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `journal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_supervisor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_supervisor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `theses`
--

INSERT INTO `theses` (`id`, `nim`, `research_title`, `science_field_id`, `document`, `application`, `journal`, `first_supervisor`, `second_supervisor`, `created_at`, `updated_at`) VALUES
('516a290d-3999-4028-bbb6-da797ec8702a', 'H1G115223', 'Tes Judul Penelitian Untuk Unggah Proposal Skripsi', '793dd6dc-8903-4c22-a4e8-07f99de27daf', 'documents/report/SwIZv3WnWy8waMPNiJ7KG3S8nA6Mu6a1drZcNr7o.pdf', NULL, NULL, '22222', '33333', '2022-07-04 06:43:40', '2022-07-04 06:51:22'),
('9ee39335-e461-4fee-bf21-05e4e6ef95ba', '123123', 'Tes Judul Proposal Skripsi', '793dd6dc-8903-4c22-a4e8-07f99de27daf', 'documents/report/tawq71vDSlXr60r9qeyzBbao5Up49iyL9H86RL1h.pdf', NULL, NULL, '22222', '33333', '2022-02-14 05:47:43', '2022-02-14 05:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `thesis_requirements`
--

CREATE TABLE `thesis_requirements` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 1,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thesis_requirements`
--

INSERT INTO `thesis_requirements` (`id`, `document_name`, `document_type`, `is_required`, `note`, `created_at`, `updated_at`) VALUES
('2b8814d2-65ab-479d-96e9-b1a0451784cb', 'KHS Semester 7', 'document', 1, NULL, '2022-02-14 04:25:22', '2022-02-14 04:25:22'),
('310f0206-bcce-4860-9dc4-622babe202ba', 'KRS Semester 8', 'document', 1, NULL, '2022-02-14 04:25:22', '2022-02-14 04:25:22'),
('6a9f2660-fcb6-4854-8e14-f67185c2ec6c', 'Form Pendaftaran Skripsi', 'document', 1, NULL, '2022-02-14 04:25:22', '2022-02-14 04:25:22'),
('72605123-703e-42e8-b722-baba233105a9', 'Transkrip Nilai', 'document', 1, 'Lampiran nilai semester 1-7', '2022-02-14 04:25:22', '2022-02-14 04:25:22'),
('c2e1f589-5758-4326-8356-716c03841cc6', 'Sertifikat PKKMB', 'document', 1, NULL, '2022-02-14 05:38:47', '2022-02-14 05:38:47');

-- --------------------------------------------------------

--
-- Table structure for table `thesis_submissions`
--

CREATE TABLE `thesis_submissions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `research_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `science_field_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_filling` timestamp NOT NULL DEFAULT current_timestamp(),
  `response_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response_document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response_date` datetime DEFAULT NULL,
  `status` enum('APPLY','WAITING','APPROVE','REVISION','REJECT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'WAITING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thesis_submissions`
--

INSERT INTO `thesis_submissions` (`id`, `nim`, `research_title`, `science_field_id`, `document`, `date_of_filling`, `response_note`, `response_document`, `response_date`, `status`, `created_at`, `updated_at`) VALUES
('ce23d296-3fad-4ff9-a60a-0ad3f76e7a25', '123123', 'Tes Judul Proposal Skripsi', '793dd6dc-8903-4c22-a4e8-07f99de27daf', 'documents/thesis-submission/TeWLNc10n7Rtc0Nkq6bADJkVK8dmsjEfF5pbiafu.docx', '2022-02-14 05:44:53', 'Disetujui,', NULL, '2022-02-14 13:47:43', 'APPROVE', '2022-02-14 05:44:53', '2022-02-14 05:47:43'),
('d641a7e7-0fc3-4768-b150-0176dff816d5', 'H1G115223', 'Tes Judul Penelitian Untuk Unggah Proposal Skripsi', '793dd6dc-8903-4c22-a4e8-07f99de27daf', 'documents/thesis-submission/ADbIbwfh17TluqG5Nux4c6OeQEbumgWiuyQf75Hl.pdf', '2022-07-04 06:41:42', 'Disetujui', NULL, '2022-07-04 14:43:40', 'APPROVE', '2022-07-04 06:41:42', '2022-07-04 06:43:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('ACADEMIC_STAFF','STUDENT','STUDY_PROGRAM_LEADER','LECTURER') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACADEMIC_STAFF',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `email`, `email_verified_at`, `password`, `level`, `avatar`, `registration_number`, `remember_token`, `created_at`, `updated_at`) VALUES
('17a83232-2e24-48ad-8f91-420ad1a70eb7', 'PENGUJI 2', '88888', 'penguji2@gmail.com', NULL, '$2y$10$uEVppL1nxcR6..SfZqRUCeoUsoVG87gtc9YXj4WD0QxnR422Uszfm', 'LECTURER', NULL, '88888', NULL, '2022-07-05 01:28:20', '2022-07-05 01:28:20'),
('31fe163b-13cb-4be0-a4c4-46b5dcd324ac', 'DOSEN 1', '111111', 'dosen@gmail.com', NULL, '$2y$10$XJiiuogTg7b9wIiTexd.g.FyTEjWnWd1q9KjBg4FEIP/8lg7LRMxO', 'STUDY_PROGRAM_LEADER', NULL, '111111', NULL, '2022-02-14 05:30:05', '2022-02-14 05:30:46'),
('51d41ea0-2600-4e0f-8521-635ff539fa24', 'MAHASISWA', '123123', 'mahasiswa@gmail.com', NULL, '$2y$10$h2/u.lGtKPpH64OygkXhquJDxrEWlAH4SZqz/b9BDa43X22eudDW6', 'STUDENT', NULL, '123123', NULL, '2022-02-14 05:32:04', '2022-02-14 05:32:04'),
('5cc48647-9efd-4410-b6b2-e829693af4d8', 'Administrator', 'admin', 'administrator@gmail.com', NULL, '$2y$10$Aig043joM1D7CWkjRlz8W.YTO79N6PuH0Bg4vTKiYKMRihRBggIuK', 'ACADEMIC_STAFF', NULL, NULL, NULL, '2022-02-14 04:25:21', '2022-02-14 04:25:21'),
('780709d8-2eb7-419c-a17b-c128a2be68e1', 'MUSTAPA AHMAD KAMAL', 'H1G115223', 'mustapakamalkml@gmail.com', NULL, '$2y$10$yXETljk5EEFIY1JImPHvnuG1AotU6PTbNPBqnmU5jFn/fHGrKZJda', 'STUDENT', 'public/student/NNPJK1eQP9e2VMogUBh5xUwEiTMUvgWmpaUFMJEj.png', 'H1G115223', NULL, '2022-06-26 23:44:31', '2022-06-26 23:45:27'),
('949a07cc-9e34-4130-bf72-1599072a4e87', 'PENGUJI1', '77777', 'penguji1@gmail.com', NULL, '$2y$10$rNWyVMMTlLdkJTTtW1GrkOSfJa18hsbOn8fZ2/sScSfLcLinXbf1W', 'LECTURER', NULL, '77777', NULL, '2022-07-05 01:27:48', '2022-07-05 01:27:48'),
('ed4bb59b-bad8-4dd7-aa2d-c4a257ee5475', 'TEST LAST', '989898', 'testlast@gmail.com', NULL, '$2y$10$kxU97H2Ba00QMD7NKOnyoOMfudRb.RPJK94XOPkiuHWN7nfmv4mnm', 'STUDENT', NULL, '989898', NULL, '2022-07-04 06:39:31', '2022-07-04 06:39:31'),
('f085299f-aec0-471a-99d7-4bbc9f1a8d12', 'PEMBIMBING 1', '22222', 'pembimbing1@gmail.com', NULL, '$2y$10$tFMxp4Zh9xsnlv6AGZb3.uNWY/GfVWNihj1E6SNRLK9j0YyOTO4Vi', 'LECTURER', NULL, '22222', NULL, '2022-02-14 05:48:53', '2022-02-14 05:48:53'),
('f9595dc7-d25d-45eb-a426-b3bc233123f0', 'PEMBIMBING 2', '33333', 'pembimbing2@gmail.com', NULL, '$2y$10$V2kPS8is6jA6oK3RaDDYxezBTb0IzWigmTsIVwIuUqFlLjYDq2GGG', 'LECTURER', NULL, '33333', NULL, '2022-02-14 05:49:26', '2022-02-14 05:49:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment_components`
--
ALTER TABLE `assessment_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assessment_schedules`
--
ALTER TABLE `assessment_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assessment_schedules_submission_assessment_id_foreign` (`submission_assessment_id`);

--
-- Indexes for table `assessment_scores`
--
ALTER TABLE `assessment_scores`
  ADD KEY `assessment_scores_submission_assessment_id_foreign` (`submission_assessment_id`),
  ADD KEY `assessment_scores_assessment_component_id_foreign` (`assessment_component_id`),
  ADD KEY `assessment_scores_nidn_foreign` (`nidn`);

--
-- Indexes for table `data_sets`
--
ALTER TABLE `data_sets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deadlines`
--
ALTER TABLE `deadlines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faculties_faculty_code_unique` (`faculty_code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `final_requirements`
--
ALTER TABLE `final_requirements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guidance`
--
ALTER TABLE `guidance`
  ADD KEY `guidance_nim_foreign` (`nim`),
  ADD KEY `guidance_nidn_foreign` (`nidn`),
  ADD KEY `guidance_thesis_id_foreign` (`thesis_id`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lecturers_nidn_unique` (`nidn`);

--
-- Indexes for table `lecturer_competency`
--
ALTER TABLE `lecturer_competency`
  ADD PRIMARY KEY (`lecturer_id`,`science_field_id`),
  ADD KEY `lecturer_competency_science_field_id_foreign` (`science_field_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `science_fields`
--
ALTER TABLE `science_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `science_fields_code_unique` (`code`),
  ADD UNIQUE KEY `science_fields_name_unique` (`name`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scores_thesis_id_foreign` (`thesis_id`),
  ADD KEY `scores_nim_foreign` (`nim`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_nim_unique` (`nim`);

--
-- Indexes for table `study_programs`
--
ALTER TABLE `study_programs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `study_programs_study_program_code_unique` (`study_program_code`),
  ADD KEY `study_programs_faculty_code_foreign` (`faculty_code`);

--
-- Indexes for table `submission_details_final_requirements`
--
ALTER TABLE `submission_details_final_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submission_details_thesis_requirements_submission_id_foreign` (`submission_id`),
  ADD KEY `submission_details_thesis_requirements_id` (`final_requirement_id`);

--
-- Indexes for table `submission_details_thesis_requirements`
--
ALTER TABLE `submission_details_thesis_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submission_details_thesis_requirements_submission_id_foreign` (`submission_id`),
  ADD KEY `submission_details_thesis_requirements_id` (`thesis_requirement_id`);

--
-- Indexes for table `submission_of_assessments`
--
ALTER TABLE `submission_of_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submission_of_assessments_nim_foreign` (`nim`),
  ADD KEY `submission_of_assessments_thesis_id_foreign` (`thesis_id`),
  ADD KEY `submission_of_assessments_first_examiner_foreign` (`first_examiner`),
  ADD KEY `submission_of_assessments_second_examiner_foreign` (`second_examiner`);

--
-- Indexes for table `submission_of_final_requirements`
--
ALTER TABLE `submission_of_final_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submission_of_thesis_requirements_nim_foreign` (`nim`);

--
-- Indexes for table `submission_of_thesis_requirements`
--
ALTER TABLE `submission_of_thesis_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submission_of_thesis_requirements_nim_foreign` (`nim`);

--
-- Indexes for table `theses`
--
ALTER TABLE `theses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theses_nim_foreign` (`nim`),
  ADD KEY `theses_science_field_id_foreign` (`science_field_id`),
  ADD KEY `theses_first_supervisor_foreign` (`first_supervisor`),
  ADD KEY `theses_second_supervisor_foreign` (`second_supervisor`);

--
-- Indexes for table `thesis_requirements`
--
ALTER TABLE `thesis_requirements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thesis_submissions`
--
ALTER TABLE `thesis_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thesis_submissions_nim_foreign` (`nim`),
  ADD KEY `thesis_submissions_science_field_id_foreign` (`science_field_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_registration_number_unique` (`registration_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment_schedules`
--
ALTER TABLE `assessment_schedules`
  ADD CONSTRAINT `assessment_schedules_submission_assessment_id_foreign` FOREIGN KEY (`submission_assessment_id`) REFERENCES `submission_of_assessments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assessment_scores`
--
ALTER TABLE `assessment_scores`
  ADD CONSTRAINT `assessment_scores_assessment_component_id_foreign` FOREIGN KEY (`assessment_component_id`) REFERENCES `assessment_components` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assessment_scores_nidn_foreign` FOREIGN KEY (`nidn`) REFERENCES `lecturers` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assessment_scores_submission_assessment_id_foreign` FOREIGN KEY (`submission_assessment_id`) REFERENCES `submission_of_assessments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `guidance`
--
ALTER TABLE `guidance`
  ADD CONSTRAINT `guidance_nidn_foreign` FOREIGN KEY (`nidn`) REFERENCES `lecturers` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guidance_nim_foreign` FOREIGN KEY (`nim`) REFERENCES `students` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guidance_thesis_id_foreign` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lecturer_competency`
--
ALTER TABLE `lecturer_competency`
  ADD CONSTRAINT `lecturer_competency_lecturer_id_foreign` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lecturer_competency_science_field_id_foreign` FOREIGN KEY (`science_field_id`) REFERENCES `science_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_nim_foreign` FOREIGN KEY (`nim`) REFERENCES `students` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scores_thesis_id_foreign` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `study_programs`
--
ALTER TABLE `study_programs`
  ADD CONSTRAINT `study_programs_faculty_code_foreign` FOREIGN KEY (`faculty_code`) REFERENCES `faculties` (`faculty_code`);

--
-- Constraints for table `submission_details_final_requirements`
--
ALTER TABLE `submission_details_final_requirements`
  ADD CONSTRAINT `submission_details_final_requirements_id` FOREIGN KEY (`final_requirement_id`) REFERENCES `thesis_requirements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `submission_details_final_requirements_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submission_of_final_requirements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `submission_details_thesis_requirements`
--
ALTER TABLE `submission_details_thesis_requirements`
  ADD CONSTRAINT `submission_details_thesis_requirements_id` FOREIGN KEY (`thesis_requirement_id`) REFERENCES `thesis_requirements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `submission_details_thesis_requirements_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submission_of_thesis_requirements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `submission_of_assessments`
--
ALTER TABLE `submission_of_assessments`
  ADD CONSTRAINT `submission_of_assessments_first_examiner_foreign` FOREIGN KEY (`first_examiner`) REFERENCES `lecturers` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `submission_of_assessments_nim_foreign` FOREIGN KEY (`nim`) REFERENCES `students` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `submission_of_assessments_second_examiner_foreign` FOREIGN KEY (`second_examiner`) REFERENCES `lecturers` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `submission_of_assessments_thesis_id_foreign` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `submission_of_final_requirements`
--
ALTER TABLE `submission_of_final_requirements`
  ADD CONSTRAINT `submission_of_final_requirements_nim_foreign` FOREIGN KEY (`nim`) REFERENCES `students` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `submission_of_thesis_requirements`
--
ALTER TABLE `submission_of_thesis_requirements`
  ADD CONSTRAINT `submission_of_thesis_requirements_nim_foreign` FOREIGN KEY (`nim`) REFERENCES `students` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theses`
--
ALTER TABLE `theses`
  ADD CONSTRAINT `theses_first_supervisor_foreign` FOREIGN KEY (`first_supervisor`) REFERENCES `lecturers` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `theses_nim_foreign` FOREIGN KEY (`nim`) REFERENCES `students` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `theses_science_field_id_foreign` FOREIGN KEY (`science_field_id`) REFERENCES `science_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `theses_second_supervisor_foreign` FOREIGN KEY (`second_supervisor`) REFERENCES `lecturers` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `thesis_submissions`
--
ALTER TABLE `thesis_submissions`
  ADD CONSTRAINT `thesis_submissions_nim_foreign` FOREIGN KEY (`nim`) REFERENCES `students` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `thesis_submissions_science_field_id_foreign` FOREIGN KEY (`science_field_id`) REFERENCES `science_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
