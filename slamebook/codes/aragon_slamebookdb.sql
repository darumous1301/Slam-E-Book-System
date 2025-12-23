-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2025 at 06:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aragon_slamebookdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `FavoriteID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `FColor` varchar(25) NOT NULL,
  `FFood` varchar(25) NOT NULL,
  `FMovie` varchar(50) NOT NULL,
  `FSeries` varchar(50) NOT NULL,
  `FArtist` varchar(50) NOT NULL,
  `FSong` varchar(50) NOT NULL,
  `FBook` varchar(100) NOT NULL,
  `FSubject` varchar(50) NOT NULL,
  `FHobby` varchar(100) NOT NULL,
  `FPlace` varchar(100) NOT NULL,
  `FSports` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`FavoriteID`, `UserID`, `FColor`, `FFood`, `FMovie`, `FSeries`, `FArtist`, `FSong`, `FBook`, `FSubject`, `FHobby`, `FPlace`, `FSports`) VALUES
(25, 25, 'Yellow', 'Tinumis', 'Weapons', 'Harry Potter', 'Daniel Radcliffe', 'For Good', 'The Silent Patient', 'Database Management System', 'Singing alone', 'Beach', 'Table Tennis'),
(40, 40, 'Pink', 'Chicken Wings', 'Princess Diaries', 'The Summer I Turned Pretty', 'Taylor Swift', 'You by Asal', 'none', 'none', 'sleep', 'Enchanted Kingdom', 'none'),
(41, 41, 'Blue', 'Adobo', 'Spiderman', 'Marvel', 'Chris Prat', 'Can I Be Him', 'Abakada', 'Math', 'Sports', 'Beach', 'Chess'),
(42, 42, 'Violet', 'Spaghetti', 'White Chicks', 'Insidious', 'Whitney Houston', 'Dance With Somebody', 'Chicken Soup for Teenagers', 'Chemistry', 'Valorant', 'University', 'Volleyball'),
(43, 43, 'Blue', 'Menudo', 'The Notebook', 'Hunger Games', 'Post Malone', 'I\'m Yours', 'N/A', 'Math', 'Playing Electric Guitar', 'Beach', 'BIlliards'),
(44, 44, 'Blue', 'Chicken', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(45, 45, 'Violet', 'Sisig', 'Ferdinand', 'Breaking bad', 'Chris Prat', 'Can I Be Him', 'N/A', 'Math', 'sleep', 'Kwarto', 'Chess'),
(47, 47, 'Yellow', 'Sinigang', 'Harry Potter', 'Hwarang', 'Cup of Joe', 'For Good', 'The Silent Patient', 'Programming', 'Watching Movies', 'University', 'Chess'),
(49, 49, 'Violet', 'Pizza', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Samin', 'chess'),
(50, 50, 'Blue', 'Pizza', 'Interstellar', 'Stranger Things', 'Drake', 'Gods Plan', 'Harry Potter', 'Math', 'Gaming', 'Tokyo', 'Basketball'),
(51, 51, 'Pink', 'Sushi', 'Frozen', 'Friends', 'Taylor Swift', 'Lover', 'Little Women', 'English', 'Drawing', 'Paris', 'Volleyball'),
(52, 52, 'Black', 'Burger', 'Avatar', 'Breaking Bad', 'Eminem', 'Lose Yourself', 'Percy Jackson', 'Science', 'Coding', 'Seoul', 'Football'),
(53, 53, 'Purple', 'Fries', 'Barbie', 'Gilmore Girls', 'Olivia Rodrigo', 'Traitor', 'Twilight', 'Art', 'Singing', 'London', 'Badminton'),
(54, 54, 'Green', 'Tacos', 'Fast & Furious', 'Loki', 'The Weeknd', 'Blinding Lights', 'Maze Runner', 'PE', 'Basketball', 'Dubai', 'Basketball'),
(55, 55, 'Red', 'Pasta', 'Moana', 'Greys Anatomy', 'Ariana Grande', 'POV', 'Hunger Games', 'History', 'Dancing', 'Manila', 'Volleyball'),
(56, 56, 'Yellow', 'Ramen', 'Avengers', 'One Piece', 'Justin Bieber', 'Peaches', 'Narnia', 'Physics', 'Skating', 'New York', 'Tennis'),
(57, 57, 'Lavender', 'Chicken Wings', 'Cinderella', 'The Crown', 'Billie Eilish', 'Ocean Eyes', 'Divergent', 'Biology', 'Reading', 'Sydney', 'Badminton'),
(58, 58, 'White', 'Steak', 'Transformers', 'The Witcher', 'Kendrick Lamar', 'HUMBLE', 'Da Vinci Code', 'ICT', 'Gym', 'Canada', 'Basketball'),
(59, 59, 'Beige', 'Ice Cream', 'Encanto', 'You', 'Selena Gomez', 'Calm Down', 'Fault In Our Stars', 'Literature', 'Journaling', 'Singapore', 'Volleyball'),
(60, 60, 'Gray', 'Sandwich', 'Batman', 'Naruto', 'NCT', 'Kick It', 'Inferno', 'Math', 'Gaming', 'Korea', 'Basketball'),
(61, 61, 'Teal', 'Dimsum', 'Coco', 'Modern Family', 'ENHYPEN', 'Polaroid Love', 'Dune', 'English', 'Film Making', 'Japan', 'Volleyball'),
(62, 62, 'Navy', 'Hotdog', 'Tenet', 'Money Heist', 'NF', 'Clouds', 'LOTR', 'Science', 'Coding', 'Dubai', 'Baseball'),
(63, 63, 'Coral', 'Adobo', 'Up', 'The Good Place', 'BLACKPINK', 'How You Like That', 'Wonder', 'Art', 'Singing', 'Hong Kong', 'Volleyball'),
(64, 64, 'Brown', 'Curry', 'Matrix', 'Suits', 'Linkin Park', 'Numb', '1984', 'PE', 'Gym', 'Berlin', 'Basketball'),
(65, 65, 'Gold', 'Halo-halo', 'Frozen', 'Girl Meets World', 'Doja Cat', 'Woman', 'Throne of Glass', 'Chemistry', 'Dancing', 'Rome', 'Tennis'),
(66, 66, 'Blue', 'Ribs', 'Joker', 'Arrow', 'Post Malone', 'Circles', 'The Alchemist', 'Math', 'Streaming', 'LA', 'Basketball'),
(67, 67, 'Pink', 'Donuts', 'Tangled', 'Gossip Girl', 'IU', 'Love Poem', 'Divergent', 'Art', 'Singing', 'Manila', 'Badminton'),
(68, 68, 'Black', 'BBQ', 'Inception', 'Breaking Bad', 'Imagine Dragons', 'Believer', 'The Martian', 'ICT', 'Gaming', 'Seoul', 'Basketball'),
(69, 69, 'Purple', 'Ice Cream', 'Coco', 'New Girl', 'NIKI', 'Every Summertime', 'Little Prince', 'English', 'Reading', 'Tokyo', 'Volleyball'),
(70, 70, 'Yellow', 'Ramen', 'Avengers', 'Loki', 'Travis Scott', 'Goosebumps', 'Hobbit', 'Physics', 'Skating', 'Singapore', 'Basketball'),
(71, 71, 'Red', 'Sushi', 'Barbie', 'Bridgerton', 'Rihanna', 'Diamonds', 'Hunger Games', 'History', 'Dancing', 'Paris', 'Volleyball'),
(72, 72, 'Green', 'Fries', 'Avatar', 'One Piece', 'Kendrick Lamar', 'DNA', 'Narnia', 'Biology', 'Music', 'LA', 'Badminton'),
(73, 73, 'Lavender', 'Steak', 'Interstellar', 'The Crown', 'Harry Styles', 'Matilda', 'Dune', 'Math', 'Coding', 'London', 'Tennis'),
(74, 74, 'White', 'Burger', 'Star Wars', 'Naruto', 'Drake', 'Passionfruit', 'Harry Potter', 'Science', 'Gaming', 'Dubai', 'Basketball'),
(75, 75, 'Beige', 'Pasta', 'Up', 'Friends', 'Taylor Swift', 'Cardigan', 'Little Women', 'Art', 'Journaling', 'Seoul', 'Volleyball'),
(76, 76, 'Teal', 'Pizza', 'Moana', 'Modern Family', 'The Weeknd', 'Starboy', 'Fault in Our Stars', 'English', 'Film', 'Japan', 'Basketball'),
(77, 77, 'Navy', 'Hotdog', 'Batman', 'Money Heist', 'NF', 'Time', 'Inferno', 'PE', 'Gym', 'Hong Kong', 'Basketball'),
(78, 78, 'Coral', 'Ice Cream', 'Coco', 'The Good Place', 'BLACKPINK', 'Kill This Love', 'Wonder', 'Art', 'Singing', 'Berlin', 'Volleyball'),
(79, 79, 'Brown', 'Chicken Wings', 'Joker', 'Arrow', 'Linkin Park', 'In The End', 'Throne of Glass', 'Chemistry', 'Streaming', 'Rome', 'Basketball');

-- --------------------------------------------------------

--
-- Table structure for table `personality_traits`
--

CREATE TABLE `personality_traits` (
  `UserID` int(11) NOT NULL,
  `FQuote` text DEFAULT NULL,
  `DreamJob` varchar(200) DEFAULT NULL,
  `SuperPower` varchar(150) DEFAULT NULL,
  `BiggestFear` varchar(200) DEFAULT NULL,
  `HappiestMemory` text DEFAULT NULL,
  `PetPeeves` text DEFAULT NULL,
  `WordsThatDescribesYou` varchar(150) DEFAULT NULL,
  `TraitID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personality_traits`
--

INSERT INTO `personality_traits` (`UserID`, `FQuote`, `DreamJob`, `SuperPower`, `BiggestFear`, `HappiestMemory`, `PetPeeves`, `WordsThatDescribesYou`, `TraitID`) VALUES
(25, 'Do it now or regret it later.', 'UI/UX Designer', 'Enhanced Senses', 'Lose Someone', 'Reunion with Grandparents', 'Arrogant', 'Committed', 25),
(40, 'sleep while you still can.', 'cardiologist', 'Telekenesis', 'FOMO', 'don\'t remember', 'kalbo', 'Mysterious', 40),
(41, 'Chess is the mind gymnasiuim', 'Marine', 'Super Strength', 'Spider', 'I don\'t know', 'Does not care', 'Strong', 41),
(42, 'I cannot express how important it is to believe that taking one tiny—and possibly very uncomfortable—step at a time can ultimately add up to a great distance.', 'Nurse', 'Teleporting', 'Lose Someone', 'I become valedictorian in high school.', 'Ghoster', 'Smart', 42),
(43, 'Stay hungry for knowledge', 'Police', 'Instrumental Power', 'Losing Someone', 'Bonding with friends', 'Monique', 'Funny', 43),
(44, 'N/A', 'Engineer', 'teleportation', 'Height', 'N/A', 'N/A', 'dot', 44),
(45, 'N/A', 'Marine', 'Super speed', 'Mag ka-scandal', 'N/A', 'Jabi', 'Handsome', 45),
(47, 'Do it now or regret it later.', 'UI/UX Designer', 'Enhance Senses', 'Lose Someone', 'Reunion with grandparents', 'Arrogant, Liar', 'Creative', 47),
(49, 'N/A', 'Plumber', 'Enhance Senses', 'lose someone', 'N/A', 'N/A', 'N/A', 49),
(50, 'Stay hungry, stay foolish', 'Software Engineer', 'Time Control', 'Failure', 'Graduation', 'Loud chewing', 'Ambitious', 50),
(51, 'Live Love Laugh', 'Nurse', 'Healing', 'Losing family', 'Beach trip', 'Slow walkers', 'Caring', 51),
(52, 'Never quit', 'Game Developer', 'Teleportation', 'Being forgotten', 'Winning contest', 'Messy desks', 'Driven', 52),
(53, 'Bloom where you are planted', 'Artist', 'Mind reading', 'Rejection', 'Birthday surprise', 'Interruptions', 'Creative', 53),
(54, 'Grind now shine later', 'Athlete', 'Super speed', 'Losing purpose', 'Team championship', 'Tardiness', 'Focused', 54),
(55, 'Be kind always', 'Teacher', 'Healing', 'Disappointing others', 'Family vacation', 'Negativity', 'Gentle', 55),
(56, 'Do or do not', 'Engineer', 'Flight', 'Losing dreams', 'Concert night', 'Dishonesty', 'Logical', 56),
(57, 'Choose joy', 'Writer', 'Invisibility', 'Loneliness', 'First art exhibit', 'Rude people', 'Optimistic', 57),
(58, 'Trust the process', 'CEO', 'Super strength', 'Failure', 'First paycheck', 'Noise', 'Determined', 58),
(59, 'You matter', 'Counselor', 'Healing', 'Losing loved ones', 'Travel memories', 'Interruptions', 'Empathetic', 59),
(60, 'Rise above', 'Pilot', 'Flight', 'Mediocrity', 'Basketball win', 'Traffic', 'Competitive', 60),
(61, 'Keep going', 'Filmmaker', 'Telepathy', 'Failure', 'Shooting day', 'Gossip', 'Creative', 61),
(62, 'Dream big', 'Scientist', 'Time travel', 'Regret', 'Discovery', 'Arrogance', 'Curious', 62),
(63, 'Spark joy', 'Singer', 'Voice power', 'Losing passion', 'Concert night', 'Fake friends', 'Expressive', 63),
(64, 'Endure and evolve', 'Trainer', 'Super speed', 'Losing loved ones', 'Gym milestone', 'Slow wifi', 'Strong', 64),
(65, 'Chase sunsets', 'Dancer', 'Teleportation', 'Disappointment', 'Dance recital', 'Dishonesty', 'Graceful', 65),
(66, 'No pain no gain', 'Athlete', 'Invincibility', 'Failure', 'Winning game', 'Noise', 'Competitive', 66),
(67, 'Stay gold', 'Model', 'Charm manipulation', 'Humiliation', 'Photoshoot', 'Slow replies', 'Confident', 67),
(68, 'Adapt or perish', 'Engineer', 'Super intellect', 'Being ignored', 'Hackathon win', 'Clutter', 'Smart', 68),
(69, 'Bloom wild', 'Writer', 'Reading minds', 'Loneliness', 'Family trip', 'Negativity', 'Soft', 69),
(70, 'Play hard', 'Streamer', 'Immortality', 'Losing family', 'Tournament victory', 'Fake smiles', 'Energetic', 70),
(71, 'Shine bright', 'Entrepreneur', 'Persuasion', 'Rejection', 'Paris trip', 'Bad hygiene', 'Driven', 71),
(72, 'Heart over hype', 'Doctor', 'Healing', 'Failure', 'Graduation', 'Noise', 'Analytical', 72),
(73, 'Everything is art', 'Developer', 'Teleportation', 'Mediocrity', 'Coding award', 'Bad vibes', 'Creative', 73),
(74, 'Life is a game', 'Gamer', 'Time freeze', 'Losing progress', 'LAN party', 'Lag', 'Playful', 74),
(75, 'Beyond limits', 'Journalist', 'Flight', 'Losing voice', 'Travel memories', 'Arrogance', 'Expressive', 75),
(76, 'Trust timing', 'Director', 'Telekinesis', 'Regret', 'Film premiere', 'Messy plans', 'Bold', 76),
(77, 'Keep leveling up', 'Coach', 'Super strength', 'Losing people', 'Fitness milestone', 'Excuses', 'Strong', 77),
(78, 'Be loud', 'Performer', 'Voice magic', 'Fear of rejection', 'Stage play', 'Fake hugs', 'Vibrant', 78),
(79, 'Seek sunsets', 'Artist', 'Teleportation', 'Loneliness', 'Art exhibit', 'Late replies', 'Calm', 79);

-- --------------------------------------------------------

--
-- Table structure for table `relationships`
--

CREATE TABLE `relationships` (
  `UserID` int(11) NOT NULL,
  `BestFriend` varchar(150) DEFAULT NULL,
  `RelationshipStatus` varchar(50) DEFAULT NULL,
  `CelebrityCrush` varchar(150) DEFAULT NULL,
  `IdealDate` varchar(200) DEFAULT NULL,
  `DreamWedding` varchar(200) DEFAULT NULL,
  `Crush` varchar(150) DEFAULT NULL,
  `RelationshipID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `relationships`
--

INSERT INTO `relationships` (`UserID`, `BestFriend`, `RelationshipStatus`, `CelebrityCrush`, `IdealDate`, `DreamWedding`, `Crush`, `RelationshipID`) VALUES
(25, 'Jhordan', 'Single', 'Piolo Pascual', 'Adventure', 'Church Wedding', 'Kurtbabes', 25),
(40, 'Nino', 'In a Relationship', 'Nino Mulach', 'Movie Date', 'Beach Wedding', 'Nino', 40),
(41, 'Prince', 'In a Relationship', 'Bella Padilla', 'Church', 'Church', 'yvone', 41),
(42, 'Marian', 'Single', 'Park Jimin', 'Coffee Date', 'Christian Wedding', 'N/A', 42),
(43, 'Kenneth', 'Single', 'Selena Gomez', 'Adventure', 'Church Wedding', 'N/A', 43),
(44, 'Vincent', 'In a Relationship', 'N/A', 'N/A', 'N/A', 'Rai', 44),
(45, 'Prince', 'In a Relationship', 'Selena Gomez', 'Coffee Date', 'Church Wedding', 'Ella', 45),
(47, 'Thea', 'Single', 'Piolo Pascual', 'Adventure date', 'Church Wedding', 'Kurt', 47),
(49, 'selpon', 'In a Relationship', 'Papa p', 'adventure', 'N/A', 'kurt', 49),
(50, 'Lucas', 'Single', 'Zendaya', 'Arcade & coffee', 'Beach sunset', 'Sophia', 50),
(51, 'Olivia', 'Taken', 'Timothee Chalamet', 'Picnic & painting', 'Garden wedding', 'Aiden', 51),
(52, 'Ethan', 'Single', 'Scarlett Johansson', 'Movie marathon', 'City lights', 'Chloe', 52),
(53, 'Bella', 'Complicated', 'Harry Styles', 'Thrift + cafe', 'Forest theme', 'Liam', 53),
(54, 'James', 'Single', 'Ana de Armas', 'Basketball + dinner', 'Stadium vibe', 'Ava', 54),
(55, 'Mia', 'Taken', 'Chris Evans', 'Dinner & dancing', 'Church wedding', 'Lucas', 55),
(56, 'Nathan', 'Single', 'Gal Gadot', 'Museum trip', 'Tokyo wedding', 'Ella', 56),
(57, 'Elle', 'Taken', 'Zac Efron', 'Bookstore + pizza', 'Sunset cruise', 'Ethan', 57),
(58, 'Logan', 'Single', 'Emma Watson', 'Concert night', 'Modern minimal', 'Hannah', 58),
(59, 'Zoey', 'Taken', 'Tom Holland', 'Theme park', 'Beach ceremony', 'Matthew', 59),
(60, 'Benj', 'Single', 'IU', 'Arcade', 'Rustic barn', 'Hannah', 60),
(61, 'Hannah', 'Single', 'Lee Jong Suk', 'Rainy cafe talk', 'Winter wedding', 'Benj', 61),
(62, 'Victoria', 'Taken', 'Anne Hathaway', 'Coding + coffee', 'Library theme', 'Alexander', 62),
(63, 'Sam', 'Single', 'Jennie Kim', 'Picnic', 'Garden aesthetic', 'Scarlett', 63),
(64, 'Chloe', 'Single', 'Ryan Gosling', 'Gym + protein shakes', 'Modern chic', 'Daniel', 64),
(65, 'Scarlett', 'Taken', 'Zayn Malik', 'Beach walk', 'Starry sky wedding', 'Daniel', 65),
(66, 'Eli', 'Single', 'Dove Cameron', 'Concert night', 'Indie vibe', 'Ava', 66),
(67, 'Jayden', 'Single', 'IU', 'Coffee date', 'Garden wedding', 'Victoria', 67),
(68, 'Matt', 'Single', 'Hailee Steinfeld', 'Gaming night', 'Space vibe', 'Ella', 68),
(69, 'Gracie', 'Taken', 'Chris Hemsworth', 'Piano & museum', 'Classic church', 'Lucas', 69),
(70, 'Alex', 'Single', 'Camila Cabello', 'Skating date', 'Tokyo vibe', 'Natalie', 70),
(71, 'Vicky', 'Taken', 'Shawn Mendes', 'Brunch & stroll', 'Elegance theme', 'Elijah', 71),
(72, 'Nate', 'Single', 'IU', 'Beach day', 'Minimalist wedding', 'Ella', 72),
(73, 'Nat', 'Single', 'Zendaya', 'Coding date', 'Library wedding', 'Lucas', 73),
(74, 'Jamie', 'Single', 'Madison Beer', 'LAN party date', 'Gamer wedding', 'Zoey', 74),
(75, 'Ava', 'Taken', 'Tom Holland', 'Cafe hopping', 'Forest vibe', 'Elijah', 75),
(76, 'Log', 'Single', 'Scarlett Johansson', 'Movie night', 'Indie wedding', 'Natalie', 76),
(77, 'Han', 'Single', 'Henry Cavill', 'Gym date', 'Starry wedding', 'Sam', 77),
(78, 'Sam', 'Single', 'Lisa Manoban', 'Concert night', 'Pastel wedding', 'Scarlett', 78),
(79, 'Luna', 'Taken', 'Chris Evans', 'Art museum + gelato', 'Sunset rooftop', 'Benj', 79);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Nickname` varchar(50) NOT NULL,
  `BDay` date DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `ContactNumber` varchar(50) DEFAULT NULL,
  `EmailAdd` varchar(150) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FullName`, `Nickname`, `BDay`, `Gender`, `ContactNumber`, `EmailAdd`, `CreatedAt`) VALUES
(25, 'Arissea Morgan Delgado', 'Ari', '2006-01-23', 'Female', '09296429572', 'arisseadel@gmail.com', '2025-11-26 00:58:53'),
(40, 'Dominique Javier', 'Risi', '2008-09-26', 'Female', '09296429572', 'reesearagon98@gmail.com', '2025-11-26 01:48:38'),
(41, 'Archival Chavez', 'Yuan', '2025-12-05', 'Male', '09296429572', 'archivalchavez@gmail.com', '2025-11-26 01:51:54'),
(42, 'Jhordan Ferran', 'Jhordie', '2006-06-15', 'Female', '09685748915', 'jhordie@gmail.com', '2025-11-26 07:16:48'),
(43, 'Kurt Dela Pena', 'Deriuz', '2006-09-28', 'Male', '09065247854', 'kurtdelap@gmail.com', '2025-11-28 10:15:17'),
(44, 'Irish Banaag', 'Irish', '2005-11-07', 'Female', '09207696197', 'irishbanaag@gmail.com', '2025-11-29 02:23:52'),
(45, 'Johann Q. Aragon', 'GON', '2010-12-05', 'Male', '09296429572', 'johann@gmail.com', '2025-11-29 13:16:46'),
(47, 'Alyzza Monique Quitain Aragon', 'Monic', '2006-01-23', 'Female', '09296429572', 'a.moniquequitain@gmail.com', '2025-12-06 16:09:13'),
(49, 'Johann Q. Aragon', 'gon', '2010-12-05', 'Male', '09183740063', 'balagbag@gmail.com', '2025-12-07 03:08:22'),
(50, 'Aiden Cruz', 'Ace', '2003-05-12', 'Male', '09123456701', 'aiden@example.com', '2025-12-07 03:16:49'),
(51, 'Mia Santos', 'Mimi', '2004-02-21', 'Female', '09123456702', 'mia@example.com', '2025-12-07 03:16:49'),
(52, 'Liam Reyes', 'Lee', '2002-11-10', 'Male', '09123456703', 'liam@example.com', '2025-12-07 03:16:49'),
(53, 'Sophia Tan', 'Sophie', '2004-07-03', 'Female', '09123456704', 'sophia@example.com', '2025-12-07 03:16:49'),
(54, 'Noah Garcia', 'Nono', '2003-09-09', 'Male', '09123456705', 'noah@example.com', '2025-12-07 03:16:49'),
(55, 'Isabella Torres', 'Bella', '2004-01-15', 'Female', '09123456706', 'bella@example.com', '2025-12-07 03:16:49'),
(56, 'Lucas Rivera', 'Lukey', '2003-04-17', 'Male', '09123456707', 'lucas@example.com', '2025-12-07 03:16:49'),
(57, 'Amelia Ramos', 'Amy', '2004-10-25', 'Female', '09123456708', 'amelia@example.com', '2025-12-07 03:16:49'),
(58, 'Ethan Flores', 'EJ', '2002-06-14', 'Male', '09123456709', 'ethan@example.com', '2025-12-07 03:16:49'),
(59, 'Olivia Mendoza', 'Liv', '2003-08-30', 'Female', '09123456710', 'olivia@example.com', '2025-12-07 03:16:49'),
(60, 'James Castillo', 'Jamie', '2004-03-08', 'Male', '09123456711', 'james@example.com', '2025-12-07 03:16:49'),
(61, 'Ava Navarro', 'Vee', '2003-12-01', 'Female', '09123456712', 'ava@example.com', '2025-12-07 03:16:49'),
(62, 'Benjamin Cruz', 'Benj', '2004-04-06', 'Male', '09123456713', 'benj@example.com', '2025-12-07 03:16:49'),
(63, 'Chloe Uy', 'Clo', '2003-10-12', 'Female', '09123456714', 'chloe@example.com', '2025-12-07 03:16:49'),
(64, 'Alexander Lim', 'Alex', '2004-09-24', 'Male', '09123456715', 'alex@example.com', '2025-12-07 03:16:49'),
(65, 'Scarlett Reyes', 'Letty', '2003-06-18', 'Female', '09123456716', 'scarlett@example.com', '2025-12-07 03:16:49'),
(66, 'Daniel Santos', 'Dan', '2004-02-11', 'Male', '09123456717', 'daniel@example.com', '2025-12-07 03:16:49'),
(67, 'Hannah Kim', 'Han', '2003-03-30', 'Female', '09123456718', 'hannah@example.com', '2025-12-07 03:16:49'),
(68, 'Matthew Lopez', 'Matt', '2002-08-02', 'Male', '09123456719', 'matthew@example.com', '2025-12-07 03:16:49'),
(69, 'Ella Cruz', 'Elle', '2004-11-19', 'Female', '09123456720', 'ella@example.com', '2025-12-07 03:16:49'),
(70, 'Nathan Cruz', 'Nate', '2003-01-23', 'Male', '09123456721', 'nate@example.com', '2025-12-07 03:16:49'),
(71, 'Grace Ramos', 'Gigi', '2004-07-27', 'Female', '09123456722', 'grace@example.com', '2025-12-07 03:16:49'),
(72, 'Jayden Torres', 'Jay', '2003-05-16', 'Male', '09123456723', 'jayden@example.com', '2025-12-07 03:16:49'),
(73, 'Victoria Tan', 'Vicky', '2004-12-04', 'Female', '09123456724', 'victoria@example.com', '2025-12-07 03:16:49'),
(74, 'Elijah Navarro', 'Eli', '2003-09-02', 'Male', '09123456725', 'elijah@example.com', '2025-12-07 03:16:49'),
(75, 'Zoey Garcia', 'Zee', '2004-06-30', 'Female', '09123456726', 'zoey@example.com', '2025-12-07 03:16:49'),
(76, 'Logan Rivera', 'Log', '2003-04-28', 'Male', '09123456727', 'logan@example.com', '2025-12-07 03:16:49'),
(77, 'Natalie Mendoza', 'Nat', '2003-10-22', 'Female', '09123456728', 'natalie@example.com', '2025-12-07 03:16:49'),
(78, 'Samuel Castillo', 'Sam', '2004-02-03', 'Male', '09123456729', 'samuel@example.com', '2025-12-07 03:16:49'),
(79, 'Luna Flores', 'Lu', '2003-11-14', 'Female', '09123456730', 'luna@example.com', '2025-12-07 03:16:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`FavoriteID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `personality_traits`
--
ALTER TABLE `personality_traits`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `TraitID` (`TraitID`);

--
-- Indexes for table `relationships`
--
ALTER TABLE `relationships`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `RelationshipID` (`RelationshipID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `FavoriteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `personality_traits`
--
ALTER TABLE `personality_traits`
  ADD CONSTRAINT `personality_traits_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `relationships`
--
ALTER TABLE `relationships`
  ADD CONSTRAINT `relationships_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
