use marathahalli_rental;
CREATE TABLE IF NOT EXISTS pg_source_documents (
    source_id INT PRIMARY KEY AUTO_INCREMENT,
    file_name VARCHAR(200) NOT NULL,
    road_coverage VARCHAR(50) NOT NULL,
    page_count SMALLINT UNSIGNED NOT NULL,
    UNIQUE KEY uq_source_file (file_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS marathahalli_pg_directory (
    pg_id INT PRIMARY KEY AUTO_INCREMENT,
    road_number TINYINT UNSIGNED NOT NULL,
    pg_name VARCHAR(180) NOT NULL,
    pg_type VARCHAR(40) NOT NULL,
    location TEXT NOT NULL,
    primary_phone VARCHAR(25) NULL,
    alternate_phone VARCHAR(25) NULL,
    contact_method VARCHAR(100) NOT NULL,
    key_features TEXT NOT NULL,
    rent_details VARCHAR(255) NULL,
    security_deposit VARCHAR(255) NULL,
    rating_details VARCHAR(100) NULL,
    source_documents TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_road_pg (road_number, pg_name),
    KEY idx_pg_type (pg_type),
    KEY idx_primary_phone (primary_phone)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS pg_road_information (
    info_id INT PRIMARY KEY AUTO_INCREMENT,
    road_number TINYINT UNSIGNED NOT NULL,
    category VARCHAR(50) NOT NULL,
    title VARCHAR(180) NOT NULL,
    details TEXT NOT NULL,
    source_document VARCHAR(200) NOT NULL,
    UNIQUE KEY uq_road_info (road_number, title, source_document)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

START TRANSACTION;

INSERT INTO pg_source_documents (file_name, road_coverage, page_count) VALUES
('1st_Cross_Road_PGs_Directory (1).pdf', '1st Cross Road', 2),
('2nd_Cross_Road_PG_Directory.pdf', '2nd Cross Road', 2),
('3rd_Cross_Road_PG_Directory.pdf', '3rd Cross Road', 2),
('4th_Cross_Road_PG_Directory.pdf', '4th Cross Road', 1),
('5th_Cross_Road_PG_Directory.pdf', '5th Cross Road', 1),
('Marathahalli_All_Cross_Roads_PG_Directory.pdf', '1st to 6th Cross Roads', 4),
('7th_Cross_Road_PG_Directory.pdf', '7th Cross Road', 1),
('8th_Cross_Road_PG_Directory.pdf', '8th Cross Road', 2),
('9th_Cross_Road_PG_Directory(1).pdf', '9th Cross Road', 2),
('10th_Cross_Road_PG_Directory(1).pdf', '10th Cross Road', 1),
('11th_Cross_Road_Only_PG_Directory(1).pdf', '11th Cross Road', 1)
ON DUPLICATE KEY UPDATE
    road_coverage = VALUES(road_coverage),
    page_count = VALUES(page_count);

INSERT INTO marathahalli_pg_directory
    (road_number, pg_name, pg_type, location, primary_phone, alternate_phone,
     contact_method, key_features, rent_details, security_deposit,
     rating_details, source_documents)
VALUES
-- 1st Cross Road: 7 PGs
(1, 'Rentorio Rachel Green Ladies PG', 'Ladies',
 'Directly opposite Kalamandir, Aswath Nagar, Marathahalli',
 '+91 74117 87777', '+91 93538 07024', 'Phone',
 'Premium aesthetic rooms, high-speed Wi-Fi, power backup, strict CCTV security, laundry, and daily snacks.',
 NULL, NULL, NULL,
 '1st_Cross_Road_PGs_Directory (1).pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(1, 'Anaghaa Ladies PG', 'Ladies',
 '#5, Ramanjaneya Layout, near HP Gas Godown, Marathahalli',
 '+91 63647 99222', NULL, 'Phone',
 'Three South and North Indian meals daily, alternate-day room cleaning, high security, and an in-house gym.',
 NULL, NULL, NULL,
 '1st_Cross_Road_PGs_Directory (1).pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(1, 'SLV Grand PG (Studio Rooms)', 'Ladies / Studio',
 'PR Arcade, #91, Kaveri Layout, Marathahalli',
 NULL, NULL, 'Check locally at PR Arcade / In-Person Only',
 'Large apartment-style studio sharing configurations, three daily meals, and an integrated residents gym.',
 NULL, NULL, NULL,
 '1st_Cross_Road_PGs_Directory (1).pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(1, 'Arogya Aurora PG/Homes', 'Ladies',
 '#10, Kaveri Layout, Marathahalli',
 NULL, NULL, 'Check locally at Kaveri Layout / In-Person Only',
 'A 24/7 open kitchen for self-cooking, standard prepared meals, biometric gates, and floor-wise refrigerators and washing-machine access.',
 NULL, NULL, NULL,
 '1st_Cross_Road_PGs_Directory (1).pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(1, 'SLV Premium Gents PG', 'Gents',
 '#30, Aswath Nagar, Anand Nagar pocket, Marathahalli',
 '+91 90350 40559', '+91 74117 67422', 'Phone',
 'Premium 2-to-4-sharing rooms, rooftop gym, exceptional cleanliness, daily housekeeping, and three quality meals.',
 NULL, NULL, NULL,
 '1st_Cross_Road_PGs_Directory (1).pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(1, 'MANASA GENTS PG HOSTEL', 'Gents',
 'D/No 477, Aswath Nagar, near 2nd Main Road intersection, Marathahalli',
 '+91 70261 21247', NULL, 'Phone',
 'Budget-friendly and popular with freshers; cooperative management, reliable Wi-Fi, and daily or standard cleaning.',
 NULL, NULL, NULL,
 '1st_Cross_Road_PGs_Directory (1).pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(1, 'Manasa Living PG for Gents', 'Gents',
 'D #474, 2nd Main Road intersection, Aswath Nagar, Marathahalli',
 '+91 91495 62832', NULL, 'Phone',
 'Single, double, and triple sharing rooms, 24-hour lift, washing machines, consistent water and Wi-Fi, daily maintenance, and easy transit access.',
 NULL, NULL, NULL,
 '1st_Cross_Road_PGs_Directory (1).pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),

-- 2nd Cross Road: 5 PGs
(2, 'SLV Star Ladies PG', 'Ladies',
 '2nd Cross Road, Tulsi Theater Road stretch, Marathahalli',
 '+91 88848 34165', NULL, 'Phone',
 'High safety standards, secure access, three daily home-cooked meals, and an individual refrigerator in each single-room layout.',
 NULL, NULL, NULL,
 '2nd_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(2, 'Rayalaseema Bhairava Ladies PG', 'Ladies',
 '#16, 2nd Cross, Sri Balaji Layout pocket, Marathahalli',
 NULL, NULL, 'In-Person / On-Site Enquiry',
 'Quiet and less-congested residential setting, continuous Wi-Fi, daily housekeeping, high cleanliness, and regional South Indian food.',
 NULL, NULL, NULL,
 '2nd_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(2, 'VVGS Gents PG', 'Gents',
 '2nd Cross Road and 2nd Main Road intersection, Aswath Nagar, Marathahalli',
 NULL, NULL, 'In-Person / On-Site Enquiry',
 'Near major transit points; single, double, and triple sharing rooms, television, high-speed internet, and weekend non-vegetarian meals.',
 NULL, NULL, NULL,
 '2nd_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(2, 'GVS PG for Gents', 'Gents',
 '2nd Cross Road dead end, Aswath Nagar, Marathahalli',
 '+91 88805 82244', NULL, 'Phone',
 'Quiet dead-end lane, good ventilation, ample two-wheeler parking, and a strict no-smoking and no-drinking policy.',
 NULL, NULL, NULL,
 '2nd_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(2, 'Raja''s Gents & Colive PG', 'Gents / Co-Living',
 '#16, 2nd Cross Road, Hemanth Nagar boundary, Marathahalli',
 '+91 88618 88864', NULL, 'Phone',
 'Premium co-living for IT professionals with furnished interiors, private balconies, power backup, high-speed Wi-Fi, and an open dining area.',
 NULL, NULL, NULL,
 '2nd_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),

-- 3rd Cross Road: 5 PGs
(3, 'KVN Comfort PG for Ladies', 'Ladies',
 'No. 70, Aswath Nagar, 3rd Cross Road, Marathahalli',
 '+91 96639 09096', NULL, 'Phone',
 'Highly rated home-cooked food, with an individual refrigerator and dedicated shoe storage for each room layout.',
 NULL, NULL, NULL,
 '3rd_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(3, 'Akshara PG For Ladies', 'Ladies',
 'MSR Layout intersecting 3rd Cross Road, near Footbridge, Marathahalli',
 '+91 96207 77520', NULL, 'Phone',
 'Close to Outer Ring Road bus stops, biometric gate security, high-speed Wi-Fi, and a shared self-cooking kitchen.',
 NULL, NULL, NULL,
 '3rd_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(3, 'Sri Balaji Premium Luxury PG for Ladies', 'Ladies',
 '#5, Hemanth Nagar, 3rd Cross stretch, Marathahalli',
 NULL, NULL, 'In-Person Inquiry Only; no public contact listed',
 'Premium modern interiors, elevator or lift, security cameras, and individual televisions in sharing rooms.',
 NULL, NULL, NULL,
 '3rd_Cross_Road_PG_Directory.pdf'),
(3, 'Galaxy - PG for Gents', 'Gents',
 'No. 398, Aswath Nagar, 3rd Cross Road, Marathahalli',
 '+91 80953 39911', NULL, 'Phone',
 'Spacious room layouts, cooperative supervisor, high-speed internet, laundry, and daily maintenance.',
 NULL, NULL, NULL,
 '3rd_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(3, 'Sri Annapoorna Gents PG', 'Gents',
 'No. 30, PR Layout, 3rd Cross area, Marathahalli',
 NULL, NULL, 'In-Person Inquiry Only; no public contact listed',
 'Praised for excellent structural maintenance and an approachable owner who responds quickly to maintenance requests.',
 NULL, NULL, NULL,
 '3rd_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),

-- 4th Cross Road: 7 PGs
(4, 'Classic Living PG for Ladies', 'Ladies',
 '#74, 4th Cross Road, Aswath Nagar, Marathahalli',
 '+91 79967 22444', NULL, 'Phone',
 'Highly rated home-style food, separate tiffin service for office lunch boxes, excellent hygiene, and strong safety standards for women.',
 NULL, NULL, NULL,
 '4th_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(4, 'Sri Sapthagiri Nivasa (Purple Ladies PG)', 'Ladies',
 '#40, 4th Cross, Ramanjaneya Layout, Marathahalli',
 NULL, NULL, 'In-Person Only',
 'Comprehensive security, regular maintenance, multi-sharing options, and fully furnished spaces.',
 NULL, NULL, NULL,
 '4th_Cross_Road_PG_Directory.pdf'),
(4, 'Sri Lakshmi Janani PG for Ladies', 'Ladies',
 '4th Cross, Sreevari Street, opposite GRT Jewellers lane, Marathahalli',
 NULL, NULL, 'In-Person Only',
 'Clean and spacious rooms, a peaceful setting suitable for working professionals, and three regional meals daily.',
 NULL, NULL, NULL,
 '4th_Cross_Road_PG_Directory.pdf'),
(4, 'ICON RK Ladies PG', 'Ladies',
 '4th Cross Road, Ayyappa Layout, Marathahalli',
 '+91 79961 02000', '+91 97436 16603', 'Phone',
 'Premium 2-and-3-sharing configurations, shared kitchen with microwave and refrigerator, washing machines, and individual wardrobes.',
 NULL, NULL, NULL,
 '4th_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(4, 'Shiva Sai PG For Gents', 'Gents',
 '#481, 4th Cross Road, Srivari Street pocket, Marathahalli',
 NULL, NULL, 'In-Person Only',
 'Budget-friendly accommodation, high-speed Wi-Fi, alternate-day deep cleaning, and authentic Andhra-style food.',
 NULL, NULL, NULL,
 '4th_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(4, 'SSR Dhanvi & Aadya Homes', 'Gents',
 '#49, 4th Cross, Hemanth Nagar, Marathahalli',
 '+91 99726 54927', '+91 81974 76777', 'Phone',
 'Executive rooms with individual LED TVs, three meals, a dedicated dining hall, high-speed Wi-Fi, power backup, and lift access.',
 NULL, NULL, NULL,
 '4th_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(4, 'Kamakshi PG for Gents', 'Gents',
 '#39, 4th Cross, Ramanjaneya Layout, Marathahalli',
 NULL, NULL, 'In-Person Only',
 'Affordable accommodation for students and tech freshers seeking reliable 2-to-4-sharing options.',
 NULL, NULL, NULL,
 '4th_Cross_Road_PG_Directory.pdf'),

-- 5th Cross Road: 4 PGs
(5, 'Sri Sai Balaji Luxury Ladies PG', 'Ladies',
 '5th Cross Road, Aswath Nagar, near cross junction, Marathahalli',
 '+91 91083 89849', '+91 81232 44365', 'Phone',
 'CCTV surveillance, digital gate access, comfortable 2-and-3-sharing formats, three home-style meals daily, and individual lockers.',
 NULL, NULL, NULL,
 '5th_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(5, 'Sreemanth Ladies PG', 'Ladies',
 'Intersecting 5th Cross Road and Outer Ring Road lane, Marathahalli',
 '+91 93800 24119', NULL, 'Phone',
 'Excellent public-transit access, clean rooms, hot water, daily cleaning, and a quiet rooftop washing area.',
 NULL, NULL, NULL,
 '5th_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(5, 'Sri Sairam Gents PG', 'Gents',
 '5th Cross Road, Aswath Nagar, Marathahalli',
 '+91 97424 07255', NULL, 'Phone',
 'Spacious double-sharing options, high-speed Wi-Fi, power backup, North and South Indian food, and flexible deposit rules.',
 NULL, 'Easygoing or flexible deposit structure', NULL,
 '5th_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(5, 'SLV Luxury Gents PG', 'Gents',
 'Near 5th Cross Road and 2nd Main intersection, Marathahalli',
 '+91 99015 67455', NULL, 'Phone',
 'Premium establishment with attached washrooms, continuous security, daily or alternate-day housekeeping, and professional building management.',
 NULL, NULL, NULL,
 '5th_Cross_Road_PG_Directory.pdf; Marathahalli_All_Cross_Roads_PG_Directory.pdf'),

-- 6th Cross Road: 4 PGs
(6, 'Oxygen PG for Ladies', 'Ladies',
 '#124, 6th Cross Road, Marathahalli',
 '+91 91081 74852', NULL, 'Phone',
 'Premium women''s hostel with biometric entry, in-house gym access, and strict safety guardrails.',
 NULL, NULL, NULL,
 'Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(6, '7 Hills PG for Ladies', 'Ladies',
 '6th Cross Main stretch, Marathahalli',
 '+91 90084 76721', NULL, 'Phone',
 'Budget-friendly accommodation, regular cleaning, and well-ventilated 2-and-3-sharing configurations.',
 NULL, NULL, NULL,
 'Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(6, 'Sri Venkateswara PG for Gents', 'Gents',
 'No. 209, 6th Cross Road, Marathahalli',
 '+91 97439 97504', NULL, 'Phone',
 'Individual LED TVs, three North and South Indian meals daily, and active power-backup generators.',
 NULL, NULL, NULL,
 'Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(6, 'Akhil Boys PG', 'Gents',
 'Cross-intersection block, 6th Cross Road, Marathahalli',
 NULL, NULL, 'In-Person Only',
 'Budget plans tailored for entry-level IT professionals and recent college graduates.',
 NULL, NULL, NULL,
 'Marathahalli_All_Cross_Roads_PG_Directory.pdf'),

-- 7th Cross Road: 5 PGs
(7, 'Golden Stay PG for Ladies', 'Ladies',
 '#223, 7th Cross Road, behind Kalamandir, opposite Hanuman Temple, Marathahalli',
 '+91 81057 67777', NULL, 'Phone / Public Channels',
 'Premium stay with well-ventilated balconies, three regional meals, and strict biometric security access.',
 'Estimated starting rent: INR 8,500 - INR 15,000', 'INR 11,000 fixed', '4.9 stars',
 '7th_Cross_Road_PG_Directory.pdf'),
(7, 'SLV Ladies PG', 'Ladies',
 '#162, 7th Cross Road, backside of Kalamandir, Marathahalli',
 NULL, NULL, 'No public contact listed',
 'Long-standing accommodation focused on maintenance, attached washrooms, individual wardrobes, and high-speed Wi-Fi.',
 NULL, NULL, NULL,
 '7th_Cross_Road_PG_Directory.pdf'),
(7, '7 Hills PG For Ladies', 'Ladies',
 '#132, 7th Cross Road, near Kalamandir, Marathahalli',
 NULL, NULL, 'No public contact listed',
 'Budget-friendly accommodation with daily housekeeping and essential biometric safeguards.',
 'Description: INR 5,000 - INR 6,500; quick table: INR 5,000 - INR 8,500', '1 month rent', NULL,
 '7th_Cross_Road_PG_Directory.pdf'),
(7, 'Housr 7th Cross (Co-Living Hub)', 'Unisex / Co-Living',
 '7th Cross Road, Aswath Nagar, Marathahalli Main Road pocket',
 NULL, NULL, 'No public contact listed',
 'Professionally managed, fully serviced studio rooms, modern decor, community lounge, rooftop terrace, corporate Wi-Fi, and complete power backup.',
 'Estimated starting rent: INR 16,000 - INR 28,000', '1 to 2 months rent', NULL,
 '7th_Cross_Road_PG_Directory.pdf'),
(7, 'Cool Homes Gents PG / Boys Stay', 'Gents',
 '7th Cross Road, near Kalamandir bus-stop stretch, Marathahalli',
 NULL, NULL, 'No public contact listed',
 'Three meals with North and South Indian options, reliable washing-machine access, geysers, and an easy deposit cycle.',
 'Estimated starting rent: INR 6,500 - INR 9,500', 'INR 3,000 - INR 5,000', NULL,
 '7th_Cross_Road_PG_Directory.pdf'),

-- 8th Cross Road: 6 PGs
(8, 'Venkata Ramana PG for Ladies', 'Ladies',
 '#256, 8th Cross Road, Anand Nagar, Marathahalli',
 NULL, NULL, 'Walk-in / Local Verification',
 'Budget-friendly accommodation for women seeking an affordable and quiet living space.',
 NULL, NULL, NULL,
 '8th_Cross_Road_PG_Directory.pdf'),
(8, 'ICON LIVING Gents PG', 'Gents',
 '#260, 8th Cross Road, near Kalamandir, Anand Nagar, Marathahalli',
 '+91 94949 59193', NULL, 'Phone',
 'Highly rated for hygiene, quality furniture, and home-style meals; single, double, and triple sharing near the main-road bus stop.',
 NULL, NULL, 'Exceptionally high ratings; exact score not listed',
 '8th_Cross_Road_PG_Directory.pdf'),
(8, 'Zolo Barton - Gents Coliving PG', 'Gents / Co-Living',
 'Back Side, 8th Cross Road, Anand Nagar, Marathahalli',
 '+91 88845 18010', NULL, 'Phone',
 'Tech-enabled Zolostays co-living with housekeeping, high-speed Wi-Fi, app-based ticketing, and secure biometric systems.',
 'Approximately INR 6,043 per month to INR 12,000+, depending on sharing type', NULL, NULL,
 '8th_Cross_Road_PG_Directory.pdf'),
(8, 'Sri Vishnu PG for Gents', 'Gents',
 'Kalamandir, 8th Cross down, Aswath Nagar, Marathahalli',
 '+91 94484 50037', NULL, 'Phone',
 'Supportive live-in management, alternate-day floor cleaning, South and North Indian meals, power backup, and lift facilities.',
 NULL, NULL, NULL,
 '8th_Cross_Road_PG_Directory.pdf'),
(8, 'Panchami Comforts PG for Gents', 'Gents',
 '#257, 8th Cross Road, Anand Nagar, Marathahalli',
 NULL, NULL, 'No public contact listed',
 'Comfortable standard shared rooms.',
 'Starting at approximately INR 7,500 per month', NULL, NULL,
 '8th_Cross_Road_PG_Directory.pdf'),
(8, 'Rayalaseema PG for Gents / Sri Sai Baba Structure', 'Gents',
 '8th Cross Road Up pocket, near Mariyamma Temple Street, Marathahalli',
 '+91 99164 18809', NULL, 'Phone',
 'Well reviewed for clean surroundings and authentic regional food.',
 NULL, NULL, NULL,
 '8th_Cross_Road_PG_Directory.pdf'),

-- 9th Cross Road: 6 PGs
(9, 'SRI LAKSHMI VENKATESHWARA PG FOR LADIES', 'Ladies',
 '9th Cross Down, Anand Nagar, Aswath Nagar, Marathahalli',
 '+91 93927 15155', NULL, 'Phone',
 'Strict gate security, clean and well-maintained rooms, peaceful atmosphere, and standard South and North Indian meals.',
 NULL, NULL, NULL,
 '9th_Cross_Road_PG_Directory(1).pdf'),
(9, 'Sri Veera Bramhendra PG for Ladies', 'Ladies',
 '9th Cross Road, Anand Nagar, Aswath Nagar, Marathahalli',
 NULL, NULL, 'No public contact listed',
 'Budget-friendly rooms, daily housekeeping, Wi-Fi, and complete power backup.',
 NULL, NULL, '5/5 stars',
 '9th_Cross_Road_PG_Directory(1).pdf'),
(9, 'Manimekala PG for Gents', 'Gents',
 '269, 9th Cross Road, behind Kalamandir, Anand Nagar, Aswath Nagar, Marathahalli',
 '+91 89711 87634', NULL, 'Phone',
 'Hygienic home-style food cooked on-site by owners, with 1, 2, and 3-sharing rooms.',
 NULL, NULL, '4.9 stars',
 '9th_Cross_Road_PG_Directory(1).pdf'),
(9, 'Sri Lakshmi Venkateswara PG for Gents', 'Gents',
 '9th Cross Aswanthnagar, behind Saanvi Pharma, near Hindustan Academy, Marathahalli',
 '+91 63616 57783', NULL, 'Phone',
 'Large rooms, continuous 24/7 water supply, nightly security guard, three-meal plans, and supportive management.',
 NULL, NULL, NULL,
 '9th_Cross_Road_PG_Directory(1).pdf'),
(9, 'SSV PG For Gents (Branch 2)', 'Gents',
 '279, 9th Cross Road, behind Kalamandir, Aswath Nagar, Marathahalli',
 NULL, NULL, 'No public contact listed',
 '2-and-3-sharing non-AC rooms, private wardrobes, laundry cycles, individual TVs, and a standard low food-security-deposit configuration.',
 NULL, NULL, NULL,
 '9th_Cross_Road_PG_Directory(1).pdf'),
(9, 'Krish Thanu PG for Gents / Om Satya Sai PG', 'Gents',
 '9th Cross Road, Anand Nagar, Aswath Nagar, Marathahalli',
 NULL, NULL, 'No public contact listed',
 'Affordable accommodation for freshers and students near Hindustan Electronics Academy, with Wi-Fi, common-area TVs, and meals.',
 NULL, NULL, NULL,
 '9th_Cross_Road_PG_Directory(1).pdf'),

-- 10th Cross Road: 3 PGs
(10, 'Sri Vinayaka Luxury PG for Ladies', 'Ladies',
 '#111, 10th Cross Road, near Hindustan Academy, Aswath Nagar, Marathahalli',
 '+91 97396 75553', NULL, 'Phone',
 'Large rooms, high security for working women, daily housekeeping, premium food service, and single through 4-sharing options.',
 NULL, NULL, '5-star occupant feedback',
 '10th_Cross_Road_PG_Directory(1).pdf'),
(10, 'Sri Sai Ganesh Home Stay for Gents', 'Gents',
 '10th Cross Road, backside of Kalamandir showroom, Anand Nagar, Marathahalli',
 '+91 88847 67818', NULL, 'Phone',
 'Supportive management, clean and well-ventilated rooms, 24/7 water, high-speed Wi-Fi, and home-cooked meals.',
 NULL, NULL, '4.5 stars from 130+ reviews',
 '10th_Cross_Road_PG_Directory(1).pdf'),
(10, 'Sai Balaji Living Comfort', 'Gents',
 'Down Cross, 10th Cross Road, Anand Nagar, Marathahalli',
 NULL, NULL, 'In-Person Only',
 'Two-minute walk from the main bus stop, ventilated balcony rooms, and comprehensive food service.',
 NULL, NULL, '4.7 stars',
 '10th_Cross_Road_PG_Directory(1).pdf'),

-- 11th Cross Road: 5 PGs
(11, 'Varun PG Studio Rooms (Gents & Ladies)', 'Unisex / Studio',
 '11th Cross Road area, near Government School, Marathahalli',
 NULL, NULL, 'No public contact listed',
 'Independent studio-style spaces for male and female occupants under one management block; suitable when family members stay in the same complex.',
 'Typically INR 6,500 - INR 10,000+, depending on sharing configuration', NULL, NULL,
 '11th_Cross_Road_Only_PG_Directory(1).pdf'),
(11, 'RR Luxury Gents PG', 'Gents',
 'Plot #318/325, 11th Cross Road area, Marathahalli',
 NULL, NULL, 'No public contact listed',
 'Fully furnished setup with high-speed Wi-Fi, modern laundry access, continuous CCTV surveillance, and regular daily meal subscriptions.',
 NULL, NULL, NULL,
 '11th_Cross_Road_Only_PG_Directory(1).pdf'),
(11, 'New Sri Guru Krupa Luxury PG for Gents', 'Gents',
 'No. 305, near Hindustan Academy, 11th Cross Road area, Marathahalli',
 NULL, NULL, 'No public contact listed',
 'Executive-sized rooms, good cross-ventilation, and a quiet, clean lounge environment.',
 NULL, NULL, NULL,
 '11th_Cross_Road_Only_PG_Directory(1).pdf'),
(11, 'Varun Gents Hostel / PG (Branch 2)', 'Gents',
 'Plot #308, 11th Cross Road area, Marathahalli',
 NULL, NULL, 'No public contact listed',
 'Accommodation for working tech professionals with reliable power backup and a disciplined lifestyle standard.',
 NULL, NULL, NULL,
 '11th_Cross_Road_Only_PG_Directory(1).pdf'),
(11, 'Vengamamba PG for Ladies', 'Ladies',
 '#49, Anand Nagar block, 11th Cross Road area, Marathahalli',
 NULL, NULL, 'No public contact listed',
 'Fully furnished secure accommodation with strict gate curfews and consistent home-style food.',
 NULL, NULL, NULL,
 '11th_Cross_Road_Only_PG_Directory(1).pdf')
ON DUPLICATE KEY UPDATE
    pg_type = VALUES(pg_type),
    location = VALUES(location),
    primary_phone = VALUES(primary_phone),
    alternate_phone = VALUES(alternate_phone),
    contact_method = VALUES(contact_method),
    key_features = VALUES(key_features),
    rent_details = VALUES(rent_details),
    security_deposit = VALUES(security_deposit),
    rating_details = VALUES(rating_details),
    source_documents = VALUES(source_documents);

INSERT INTO pg_road_information
    (road_number, category, title, details, source_document)
VALUES
(1, 'Context', '1st Cross Road directory context',
 'Ladies and gents PGs near Kalamandir, Marathahalli.',
 '1st_Cross_Road_PGs_Directory (1).pdf'),
(1, 'Disclaimer', 'Verify before paying an advance',
 'Contact numbers and details were compiled from public directory listings. Verify availability, deposit-refund terms, and current pricing directly with owners before paying a booking advance.',
 '1st_Cross_Road_PGs_Directory (1).pdf'),

(2, 'Context', '2nd Cross Road directory context',
 'Aswath Nagar and Tulsi Theater Road area behind Kalamandir; filtered for 2nd Cross Road accommodation.',
 '2nd_Cross_Road_PG_Directory.pdf'),
(2, 'Verification', 'Security deposit',
 'Usually 1 to 2 months of advance rent and mostly refundable.',
 '2nd_Cross_Road_PG_Directory.pdf'),
(2, 'Verification', 'Notice period',
 'Strict 30-day prior written notice before vacating.',
 '2nd_Cross_Road_PG_Directory.pdf'),
(2, 'Verification', 'Electricity charges',
 'Confirm whether electricity is included in rent or charged per unit through a sub-meter.',
 '2nd_Cross_Road_PG_Directory.pdf'),
(2, 'Verification', 'Gate curfew',
 'Typically 10:00 PM to 10:30 PM for ladies; flexible for gents with biometric keys.',
 '2nd_Cross_Road_PG_Directory.pdf'),

(3, 'Context', '3rd Cross Road directory context',
 'Behind Kalamandir Junction, Marathahalli, Bengaluru.',
 '3rd_Cross_Road_PG_Directory.pdf'),
(3, 'Market Terms', 'Average rent',
 'INR 7,500 - INR 11,500 for 2-or-3 sharing; INR 14,000+ for a single room.',
 '3rd_Cross_Road_PG_Directory.pdf'),
(3, 'Market Terms', 'Security deposit',
 'Usually 1 month rent or a fixed token, such as INR 5,000 - INR 8,000.',
 '3rd_Cross_Road_PG_Directory.pdf'),
(3, 'Market Terms', 'Notice period',
 'Strictly 30 days mandatory notice before vacating.',
 '3rd_Cross_Road_PG_Directory.pdf'),
(3, 'Market Terms', 'Electricity',
 'Confirm whether included or charged per unit through a separate sub-meter.',
 '3rd_Cross_Road_PG_Directory.pdf'),
(3, 'Disclaimer', 'Verify during a physical visit',
 'Rates, availability, and specific amenities should be verified directly with the landlords during a physical visit.',
 '3rd_Cross_Road_PG_Directory.pdf'),

(4, 'Context', '4th Cross Road directory context',
 'Behind Kalamandir Junction in the Aswath Nagar and Ramanjaneya Layout pocket, Marathahalli, Bengaluru.',
 '4th_Cross_Road_PG_Directory.pdf'),
(4, 'Market Terms', 'Rent range',
 'Multi-sharing: INR 6,500 - INR 11,000; single room: INR 14,000+ per month.',
 '4th_Cross_Road_PG_Directory.pdf'),
(4, 'Market Terms', 'Security deposit',
 'Usually a fixed INR 4,000 or up to 1 month rent; the source notes 50% refundable.',
 '4th_Cross_Road_PG_Directory.pdf'),
(4, 'Market Terms', 'Notice period',
 'Strictly 30 days mandatory notice before vacating.',
 '4th_Cross_Road_PG_Directory.pdf'),
(4, 'Market Terms', 'Standard inclusions',
 'Three meals daily, Wi-Fi, housekeeping, and hot-water access.',
 '4th_Cross_Road_PG_Directory.pdf'),

(5, 'Context', '5th Cross Road directory context',
 'PGs operating on or directly intersecting 5th Cross Road behind the Kalamandir junction area in Marathahalli, Bengaluru.',
 '5th_Cross_Road_PG_Directory.pdf'),

(6, 'Context', '6th Cross Road directory context',
 '6th Cross Road section from the comprehensive 1st-to-6th Cross Road directory.',
 'Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(6, 'Move-In Checklist', 'Security-deposit refund terms',
 'The standard deposit is usually 1 month rent. Confirm any non-refundable maintenance deduction, typically INR 2,000 - INR 3,000, before paying.',
 'Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(6, 'Move-In Checklist', 'Notice-period rule',
 'Most properties enforce a strict 30-day notice period. Confirm whether it must match the calendar-month boundary.',
 'Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(6, 'Move-In Checklist', 'Electricity billing',
 'Confirm whether individual room sub-meter charges are extra, commonly INR 10 - INR 12 per unit, or included in fixed rent.',
 'Marathahalli_All_Cross_Roads_PG_Directory.pdf'),
(6, 'Move-In Checklist', 'Gate timings and curfews',
 'Ladies PGs commonly lock gates between 10:00 PM and 10:30 PM. Confirm biometric or night-shift access policies for late work hours.',
 'Marathahalli_All_Cross_Roads_PG_Directory.pdf'),

(7, 'Context', '7th Cross Road directory context',
 'Aswath Nagar and Anand Nagar pocket behind Kalamandir junction, Marathahalli, Bengaluru.',
 '7th_Cross_Road_PG_Directory.pdf'),
(8, 'Context', '8th Cross Road directory context',
 'Behind Kalamandir junction in the Aswath Nagar and Anand Nagar area, Marathahalli, Bengaluru.',
 '8th_Cross_Road_PG_Directory.pdf'),

(9, 'Context', '9th Cross Road directory context',
 '9th Cross Road, Aswath Nagar, behind Kalamandir, Marathahalli.',
 '9th_Cross_Road_PG_Directory(1).pdf'),
(9, 'Market Terms', 'Single occupancy reference',
 'Estimated INR 14,000 - INR 18,000 per month with 1 month advance rent.',
 '9th_Cross_Road_PG_Directory(1).pdf'),
(9, 'Market Terms', 'Double-sharing reference',
 'Estimated INR 8,500 - INR 11,000 per month with an INR 3,000 - INR 5,000 security deposit.',
 '9th_Cross_Road_PG_Directory(1).pdf'),
(9, 'Market Terms', 'Triple-or-four-sharing reference',
 'Estimated INR 6,000 - INR 7,500 per month with an INR 2,000 - INR 3,000 security deposit.',
 '9th_Cross_Road_PG_Directory(1).pdf'),
(9, 'Disclaimer', 'Verify before transferring a deposit',
 'Verify operating status, room inventory, and exact pricing directly with owners before transferring any deposit.',
 '9th_Cross_Road_PG_Directory(1).pdf'),

(10, 'Context', '10th Cross Road directory context',
 'A quieter outer residential pocket in Aswath Nagar and Anand Nagar behind Kalamandir, within walking distance of Outer Ring Road.',
 '10th_Cross_Road_PG_Directory(1).pdf'),
(11, 'Context', '11th Cross Road directory context',
 'Marathahalli Kalamandir area, Bengaluru; listings cover unisex studio, gents, and ladies accommodation.',
 '11th_Cross_Road_Only_PG_Directory(1).pdf')
ON DUPLICATE KEY UPDATE
    category = VALUES(category),
    details = VALUES(details);

COMMIT;

CREATE OR REPLACE VIEW v_marathahalli_pg_directory AS
SELECT
    pg_id,
    road_number,
    CONCAT(road_number,
           CASE road_number
               WHEN 1 THEN 'st'
               WHEN 2 THEN 'nd'
               WHEN 3 THEN 'rd'
               ELSE 'th'
           END,
           ' Cross Road') AS cross_road,
    pg_name,
    pg_type,
    location,
    primary_phone,
    alternate_phone,
    contact_method,
    key_features,
    rent_details,
    security_deposit,
    rating_details,
    source_documents
FROM marathahalli_pg_directory;

-- ================================================================
-- READY-TO-USE SELECT QUERIES
-- ================================================================

-- 1. Show all PGs in road order.
SELECT *
FROM v_marathahalli_pg_directory
ORDER BY road_number, pg_type, pg_name;

-- 2. Confirm the total number of distinct directory listings (expected: 57).
SELECT COUNT(*) AS total_pg_listings
FROM marathahalli_pg_directory;

-- 3. Count listings on every Cross Road.
SELECT road_number, COUNT(*) AS total_pgs
FROM marathahalli_pg_directory
GROUP BY road_number
ORDER BY road_number;

-- 4. Show only Ladies PGs.
SELECT *
FROM v_marathahalli_pg_directory
WHERE pg_type LIKE '%Ladies%'
ORDER BY road_number, pg_name;

-- 5. Show only Gents PGs.
SELECT *
FROM v_marathahalli_pg_directory
WHERE pg_type LIKE '%Gents%'
ORDER BY road_number, pg_name;

-- 6. Show Unisex, Studio, or Co-Living properties.
SELECT *
FROM v_marathahalli_pg_directory
WHERE pg_type LIKE '%Unisex%'
   OR pg_type LIKE '%Studio%'
   OR pg_type LIKE '%Co-Living%'
ORDER BY road_number, pg_name;

-- 7. Show PGs with a public phone number.
SELECT road_number, pg_name, pg_type, primary_phone, alternate_phone
FROM marathahalli_pg_directory
WHERE primary_phone IS NOT NULL
ORDER BY road_number, pg_name;

-- 8. Show PGs that require an in-person or walk-in enquiry.
SELECT road_number, pg_name, pg_type, location, contact_method
FROM marathahalli_pg_directory
WHERE primary_phone IS NULL
ORDER BY road_number, pg_name;

-- 9. Search one road. Change 5 to the required Cross Road number.
SELECT *
FROM v_marathahalli_pg_directory
WHERE road_number = 5
ORDER BY pg_type, pg_name;

-- 10. Search by PG name. Change 'Lakshmi' to any search text.
SELECT *
FROM v_marathahalli_pg_directory
WHERE pg_name LIKE '%Lakshmi%';

-- 11. Search by location. Change 'Hindustan Academy' as needed.
SELECT *
FROM v_marathahalli_pg_directory
WHERE location LIKE '%Hindustan Academy%';

-- 12. Find properties mentioning Wi-Fi.
SELECT road_number, pg_name, pg_type, location, key_features
FROM marathahalli_pg_directory
WHERE key_features LIKE '%Wi-Fi%'
ORDER BY road_number, pg_name;

-- 13. Find properties mentioning power backup.
SELECT road_number, pg_name, pg_type, location, key_features
FROM marathahalli_pg_directory
WHERE key_features LIKE '%power backup%'
   OR key_features LIKE '%power-backup%'
ORDER BY road_number, pg_name;

-- 14. Find PGs with recorded rent information.
SELECT road_number, pg_name, pg_type, rent_details, security_deposit
FROM marathahalli_pg_directory
WHERE rent_details IS NOT NULL
ORDER BY road_number, pg_name;

-- 15. Show all road-level rules, market terms, and disclaimers.
SELECT road_number, category, title, details, source_document
FROM pg_road_information
ORDER BY road_number, info_id;
select * from pg_source_documents;
select*from marathahalli_pg_directory;