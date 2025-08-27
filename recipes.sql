-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2024 at 07:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipes`
--

-- --------------------------------------------------------

--
-- Table structure for table `app`
--

CREATE TABLE `app` (
  `id` int(6) NOT NULL,
  `about_us` text NOT NULL,
  `app_version` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app`
--

INSERT INTO `app` (`id`, `about_us`, `app_version`) VALUES
(1, 'Kandean is a recipe sharing application, which aims to make it easier to store our favorite recipes or to share our recipes with others, with a modern design. This application will continue to be developed by Kevin Gilbert Toding as a developer.', 'v2.2.0');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` varchar(255) NOT NULL,
  `recipe_id` int(10) NOT NULL,
  `user_id` int(6) NOT NULL,
  `comment` text NOT NULL,
  `comment_date` varchar(15) NOT NULL,
  `comment_time` varchar(20) NOT NULL,
  `edited` int(1) NOT NULL DEFAULT 0,
  `likes` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `recipe_id`, `user_id`, `comment`, `comment_date`, `comment_time`, `edited`, `likes`) VALUES
('33193b2d-9494-49a6-9c9e-bc27c865fa61', 1, 20, 'Yummy 😚', '2022-09-28', '04:01:08', 0, 1),
('4c5bb7d1-8090-47df-99e5-ec0d5b5eaf60', 10, 21, 'haloowkwk', '2022-09-25', '14:25:45', 1, 4),
('79b2ef68-4d6d-4491-a21b-495905a6100f', 1, 4, 'dThank you guys', '2022-09-28', '04:08:08', 1, 0),
('f5ffc1fc-8b3f-49d2-be89-1e2037678bc2', 1, 2, 'Wow thank you 🥰😀', '2022-09-28', '03:59:12', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `comment_reply`
--

CREATE TABLE `comment_reply` (
  `reply_id` varchar(255) NOT NULL,
  `comment_id` varchar(255) NOT NULL,
  `recipe_id` int(10) NOT NULL,
  `user_id` int(6) NOT NULL,
  `comment` text NOT NULL,
  `comment_date` varchar(15) NOT NULL,
  `comment_time` varchar(20) NOT NULL,
  `likes` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_reply`
--

INSERT INTO `comment_reply` (`reply_id`, `comment_id`, `recipe_id`, `user_id`, `comment`, `comment_date`, `comment_time`, `likes`) VALUES
('268d9b22-5788-470b-a405-c7c092f4fbac', 'f5ffc1fc-8b3f-49d2-be89-1e2037678bc2', 1, 4, 'Your welcomee💜💜', '2022-09-28', '04:02:23', 0),
('39a8fee5-f8ba-4a1f-bb75-1c66ec881260', '4c5bb7d1-8090-47df-99e5-ec0d5b5eaf60', 10, 20, 'YYY', '2022-09-26', '06:05:24', 2),
('4e60f041-4887-4af3-8910-8cbc574274d2', '33193b2d-9494-49a6-9c9e-bc27c865fa61', 1, 4, 'Hahaha have a good one 🤩', '2022-09-28', '04:03:05', 0),
('a63a60fc-ea63-4091-b66d-78cc64f54065', '4c5bb7d1-8090-47df-99e5-ec0d5b5eaf60', 10, 20, 'test reply comment', '2022-09-25', '15:58:49', 2);

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(20) NOT NULL,
  `user_id` int(10) NOT NULL,
  `followers_id` int(10) NOT NULL,
  `date` varchar(80) NOT NULL,
  `time` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `user_id`, `followers_id`, `date`, `time`) VALUES
(75, 6, 4, '2022-09-11', '21:13:59'),
(78, 18, 6, '2022-09-12', '20:18:23'),
(129, 20, 4, '2022-09-27', '03:37:05'),
(130, 2, 4, '2022-09-27', '03:44:38'),
(132, 20, 20, '2022-09-27', '04:40:26'),
(140, 4, 20, '2022-09-27', '05:05:42'),
(144, 4, 2, '2022-09-27', '20:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `following`
--

CREATE TABLE `following` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `following_id` int(10) NOT NULL,
  `date` varchar(80) NOT NULL,
  `time` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `following`
--

INSERT INTO `following` (`id`, `user_id`, `following_id`, `date`, `time`) VALUES
(57, 6, 2, '2022-09-10', '05:21:21'),
(70, 4, 6, '2022-09-11', '21:13:59'),
(73, 6, 18, '2022-09-12', '20:18:23'),
(124, 4, 20, '2022-09-27', '03:37:05'),
(125, 4, 2, '2022-09-27', '03:44:38'),
(127, 20, 20, '2022-09-27', '04:40:26'),
(135, 20, 4, '2022-09-27', '05:05:42'),
(139, 2, 4, '2022-09-27', '20:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `liked`
--

CREATE TABLE `liked` (
  `like_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `recipe_id` int(6) NOT NULL,
  `code` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `liked`
--

INSERT INTO `liked` (`like_id`, `user_id`, `recipe_id`, `code`) VALUES
(374, 20, 10, 1),
(379, 20, 56, 1),
(391, 20, 59, 1),
(392, 20, 57, 1),
(393, 20, 7, 1),
(493, 20, 60, 1);

-- --------------------------------------------------------

--
-- Table structure for table `like_comment`
--

CREATE TABLE `like_comment` (
  `id` int(6) NOT NULL,
  `comment_id` varchar(255) NOT NULL,
  `user_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `like_comment`
--

INSERT INTO `like_comment` (`id`, `comment_id`, `user_id`) VALUES
(83, '4c5bb7d1-8090-47df-99e5-ec0d5b5eaf60', 2),
(92, '4c5bb7d1-8090-47df-99e5-ec0d5b5eaf60', 21),
(94, '4c5bb7d1-8090-47df-99e5-ec0d5b5eaf60', 20),
(95, '4c5bb7d1-8090-47df-99e5-ec0d5b5eaf60', 4),
(97, 'f5ffc1fc-8b3f-49d2-be89-1e2037678bc2', 2),
(98, 'f5ffc1fc-8b3f-49d2-be89-1e2037678bc2', 20),
(99, 'f5ffc1fc-8b3f-49d2-be89-1e2037678bc2', 4),
(100, '33193b2d-9494-49a6-9c9e-bc27c865fa61', 4);

-- --------------------------------------------------------

--
-- Table structure for table `like_comment_reply`
--

CREATE TABLE `like_comment_reply` (
  `id` int(6) NOT NULL,
  `reply_id` varchar(255) NOT NULL,
  `user_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `like_comment_reply`
--

INSERT INTO `like_comment_reply` (`id`, `reply_id`, `user_id`) VALUES
(133, '39a8fee5-f8ba-4a1f-bb75-1c66ec881260', 2),
(134, 'a63a60fc-ea63-4091-b66d-78cc64f54065', 2),
(135, '1c117f5d-710c-44b5-892f-2ff1240b6095', 2),
(136, '39a8fee5-f8ba-4a1f-bb75-1c66ec881260', 20),
(137, 'a63a60fc-ea63-4091-b66d-78cc64f54065', 20);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notif_id` int(50) NOT NULL,
  `user_id` int(10) NOT NULL,
  `user_id_notif` int(10) NOT NULL,
  `recipe_id` int(10) NOT NULL DEFAULT 0,
  `type` varchar(80) NOT NULL,
  `comment_id` varchar(255) NOT NULL DEFAULT '0',
  `reply_id` varchar(255) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date` varchar(80) NOT NULL,
  `time` varchar(80) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notif_id`, `user_id`, `user_id_notif`, `recipe_id`, `type`, `comment_id`, `reply_id`, `comment`, `date`, `time`, `status`) VALUES
(308, 21, 4, 10, 'comment', '4c5bb7d1-8090-47df-99e5-ec0d5b5eaf60', '0', 'haloowkwk', '2022-09-25', '14:25:45', 0),
(310, 2, 21, 10, 'like_comment', '4c5bb7d1-8090-47df-99e5-ec0d5b5eaf60', '0', 'haloo', '2022-09-25', '14:38:15', 0),
(317, 20, 4, 10, 'like', '0', '0', '', '2022-09-25', '15:43:31', 0),
(328, 20, 21, 10, 'like_comment', '4c5bb7d1-8090-47df-99e5-ec0d5b5eaf60', '0', 'haloowkwk', '2022-09-25', '18:25:27', 1),
(329, 20, 21, 10, 'comment_reply', '4c5bb7d1-8090-47df-99e5-ec0d5b5eaf60', '39a8fee5-f8ba-4a1f-bb75-1c66ec881260', 'YYY', '2022-09-26', '06:05:24', 1),
(335, 4, 0, 60, 'like', '0', '0', '', '2022-09-26', '06:41:15', 1),
(339, 4, 2, 0, 'follow', '0', '0', '', '2022-09-27', '03:44:38', 0),
(340, 4, 21, 10, 'like_comment', '4c5bb7d1-8090-47df-99e5-ec0d5b5eaf60', '0', 'haloowkwk', '2022-09-27', '04:16:52', 1),
(350, 20, 4, 0, 'follow', '0', '0', '', '2022-09-27', '05:05:42', 0),
(353, 20, 4, 10, 'like', '0', '0', '', '2022-09-27', '13:33:08', 0),
(358, 20, 2, 56, 'like', '0', '0', '', '2022-09-27', '14:24:23', 0),
(371, 20, 2, 59, 'like', '0', '0', '', '2022-09-27', '15:00:36', 0),
(473, 20, 4, 60, 'like', '0', '0', '', '2022-09-27', '19:53:05', 0),
(477, 2, 4, 0, 'follow', '0', '0', '', '2022-09-27', '20:19:30', 0),
(478, 2, 4, 1, 'comment', 'f5ffc1fc-8b3f-49d2-be89-1e2037678bc2', '0', 'Wow thank you 🥰😀', '2022-09-28', '03:59:12', 0),
(479, 20, 4, 1, 'comment', '33193b2d-9494-49a6-9c9e-bc27c865fa61', '0', 'Yummy 😚', '2022-09-28', '04:01:08', 0),
(480, 20, 2, 1, 'like_comment', 'f5ffc1fc-8b3f-49d2-be89-1e2037678bc2', '0', 'Wow thank you 🥰😀', '2022-09-28', '04:01:13', 1),
(481, 4, 2, 1, 'like_comment', 'f5ffc1fc-8b3f-49d2-be89-1e2037678bc2', '0', 'Wow thank you 🥰😀', '2022-09-28', '04:01:53', 1),
(482, 4, 2, 1, 'comment_reply', 'f5ffc1fc-8b3f-49d2-be89-1e2037678bc2', '268d9b22-5788-470b-a405-c7c092f4fbac', 'Your welcomee💜💜', '2022-09-28', '04:02:23', 1),
(483, 4, 20, 1, 'like_comment', '33193b2d-9494-49a6-9c9e-bc27c865fa61', '0', 'Yummy 😚', '2022-09-28', '04:02:36', 1),
(484, 4, 20, 1, 'comment_reply', '33193b2d-9494-49a6-9c9e-bc27c865fa61', '4e60f041-4887-4af3-8910-8cbc574274d2', 'Hahaha have a good one 🤩', '2022-09-28', '04:03:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `recipe_id` int(10) NOT NULL,
  `user_id` int(6) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(80) NOT NULL,
  `servings` varchar(80) NOT NULL,
  `duration` varchar(80) NOT NULL,
  `ingredients` text NOT NULL,
  `steps` text NOT NULL,
  `note` text NOT NULL,
  `upload_date` varchar(50) NOT NULL,
  `upload_time` varchar(50) NOT NULL,
  `image` varchar(300) NOT NULL DEFAULT 'default.png',
  `status` int(1) NOT NULL,
  `ratings` varchar(80) NOT NULL,
  `likes` int(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`recipe_id`, `user_id`, `title`, `description`, `category`, `servings`, `duration`, `ingredients`, `steps`, `note`, `upload_date`, `upload_time`, `image`, `status`, `ratings`, `likes`) VALUES
(1, 4, 'Simple Beef Rendang', 'Beef rendang is one of the most famous Indonesian culinary delights in the world. It was even named the most delicious food in the world by CNN.\r\n\r\n', 'Meat', '10 people', '3 hour 24 minutes', '• beef|1|kg\r\n• lemongrass|2|sticks\r\n• lime leaves|6|pieces\r\n• Indonesian bay leaves|4|pieces\r\n• cinnamon|200|g\r\n• palm sugar|1|tbsp\r\n• beef-flavored bouillon powder|1|tbsp\r\n• cumin powder|1|tsp\r\n• pepper|1|tsp\r\n• lemon|1|pieces\r\n• coconut milk|1000|l\r\n• cooking oil|300|g\r\n• garlic|8|g\r\n• shallots|12|g\r\n• candlenuts|4|g\r\n• coriander|1|tsp\r\n• large red chilies|500|g\r\n• red curly chilies|50|g\r\n• turmeric|400|g\r\n• ginger|600|g\r\n', '1. Wash the meat, cut it according to taste, add lemon juice, then wash it again.\r\n2. Puree the spices\r\n3. Saute the spices with lemongrass, lime leaves, bay leaves, cinnamon and galangal until cooked.\r\n4. Add the meat, stir well then add the coconut milk. Cook over low heat while stirring occasionally.\r\n5. Then add cumin, salt, stock powder, pepper, and brown sugar, let stand until the spices are absorbed and the water reduces. Correct the taste, remove and serve.', '1. The large red chilies need to be seeds removed.\r\n2. The quantity of coconut milk is about the same with the milk from 1 coconut.\r\n3. The cooking oil are used as needed.', '2022-07-22', '12.30.30', '1.png', 1, '8/10', 0),
(2, 4, 'Coriander beef satay', 'Satay is usually only coated with soy sauce or peanut sauce. Well, what if coriander is added? By using coriander, ordinary beef satay will definitely be more special because the taste is more distinctive. With the addition of Bango Sweet Soy Sauce, the aromatic combination of coriander and the sweetness of soy sauce will make this satay loved by anyone who eats it.', 'Meat', '4 People', '2 hour 54 minutes', '• beef|300|g\r\n• Bango sweet soy sauce|160|ml\r\n• coriander powder|1|tbsp\r\n• oil|2|tbsp\r\n• tamarind water|1|tbsp\r\n• satay sticks|10|pieces\r\n• coriander leaves|3|stalks, leaves picked\r\n ', '1. Using a blender, puree the satay seasoning.\r\n2. Coat the beef with the ground spices, Bango Sweet Soy Sauce, coriander powder, oil, and tamarind water. Let stand for 30 minutes.\r\n3. Skewer the meat with satay skewers.\r\nGrill over hot coals until cooked while occasionally brushing with the seasoning. Remove.\r\n4. Arrange on a serving plate. Sprinkle with coriander leaves.\r\n', 'The 300 g beef tenderloin should be cut into 3 cm cubes. ', '2022-07-22', '12.30.30', '2.png', 1, '9/10', 0),
(3, 4, 'My Ayam Solo', 'Chicken noodles from this area use more spices, especially for the soy sauce chicken. In addition to turmeric, the spices used are ginger, candlenuts, and coriander.', 'Noodle', '3-4 people', '1 hour 45 minutes', '• egg noodles/fresh noodles|500|g\r\n• chicken, boiled and cubed 3 cm|250|g\r\n• soy sauce|100|ml\r\n• sweet soy sauce|10|ml\r\n• Worcestershire sauce|15|ml\r\n• green onions, finely chopped|200|g\r\n• bok choy/caisim, cut into 5 cm pieces|100|g', '1. Prepare the chicken stock first. Boil the chicken bones and 250 grams of chicken meat that will be used for the noodles with 2000 ml of water. Add pepper and salt. Cook until the broth boils and the chicken is cooked.\r\n2. Take the boiled chicken that will be used for the noodles, then cut into cubes.\r\n3. Puree all the seasoning ingredients. Heat a little cooking oil, then saute the spices until fragrant.\r\n4. Add the boiled and diced chicken, then season again with a little granulated sugar.\r\n5. Next we will make chicken oil. Pour vegetable oil into a frying pan. Add the chicken skin and fat. Cook over low heat until the chicken skin and fat are dry. Remove from the frying pan, then add the chopped garlic. Cook until the garlic is crispy and the chicken oil is ready to use.\r\n6. Boil the egg noodles/wet noodles with the mustard greens, then drain the water.\r\n7. Prepare a bowl, then add 1 tablespoon of chicken oil. Stir with the noodles and green mustard greens. Add the boiled broth to the bowl.\r\n8. Pour the stir-fried chicken on top, then sprinkle with fried onions and sliced ​​spring onions.\r\n9. Serve the Solo chicken noodles while warm. Complete with chili sauce and tomato sauce in separate containers.', '', '2022-07-25', '11:40:20', '3.png', 1, '9.5/10', 0),
(4, 4, 'Ramen Special', 'Ramen has become one of Japan\'s main comfort foods. It became popular thanks to Chinese cuisine in Tokyo restaurants that served shina soba (Shina meaning Chinese and soba meaning buckwheat noodles). Over the years, shina soba has become one of the most popular Chinese dishes in Japan.', 'Noodle', '1-2 people', '1 hour 23 minutes', '• ramen noodles|100|g\r\n• peeled shrimp|150|g\r\n• green bok choy, chopped as desired|100|g\r\n• green peas|200|g\r\n• sliced cooked meat, boiled with chicken broth and salt|5|slices\r\n• egg, cut into two halves|1|piece\r\n• cooking oil, for sautéing the spices|100|g\r\n• water|100|g\r\n', '1. Boil the ramen noodles until cooked using chicken broth, then drain and set aside for a while.\r\n2. Heat oil, saute garlic and onions until fragrant.\r\n3. Add mustard greens, peas and ground spices to it.\r\n4. Add water and bring to a boil.\r\n5. When it boils, add the noodles and cook until it boils again.\r\n6. Add the dissolved sago flour to the ramen noodles and cook until it bubbles.\r\n7. Serve in a serving bowl and add sliced ​​meat and eggs on top.', '1. 100 grams of ramen noodles\r\n150 grams of peeled shrimp\r\n2. Green mustard leaves (as needed, cut to taste)\r\n3. Peas (as needed)\r\n4. 5 slices of meat that has been boiled with chicken broth and salt seasoning\r\n5. 1 egg (sliced ​​into two parts)\r\n6. Cooking oil (as needed, for sauteing the spices)\r\n7. Water (as needed)', '2022-07-25', '11:40:20', '4.png', 1, '7/10', 0),
(5, 2, 'Sweet Soy Sauce Grilled Chicken', 'This time, we will try how to make delicious savory grilled chicken that is simmered with ground spices, coconut milk, brown sugar, and sweet soy sauce. Stewing, derived from Javanese, is the process of cooking seasoned food ingredients over low heat and for a long time. After the chicken is simmered until tender, grill the chicken while brushing it with spices and soy sauce.', 'Meat', '1-2 people', '2 hour 4 minutes', '• rooster chicken, cut into 4 pieces|800|g\r\n• bay leaves|4|pieces\r\n• lemongrass, bruised|2|stalks\r\n• tamarind, dissolved in 3 tbsp hot water|20|g\r\n• coconut milk|500|ml\r\n• cooking oil, for sautéing|2|tbsp\r\n• shallots, peeled|10|pieces\r\n• garlic, peeled|5|cloves\r\n• coriander seeds, toasted|1|tbsp\r\n• candlenuts|5|pieces\r\n• ground black pepper|½|tsp\r\n• turmeric|3|cm\r\n• palm sugar, finely shaved|50|g\r\n• salt|1|tsp\r\n• granulated sugar|1|tsp\r\n', '1. Heat oil, saute ground spices, bay leaves, and lemongrass until fragrant.\r\n2. Add tamarind water and chicken, stir well.\r\n3. Pour in coconut milk, stir slowly so that the coconut milk does not split.\r\n4. Cook until the coconut milk is absorbed and the chicken is tender. Remove and set aside.\r\n5. Heat a frying pan, grill the chicken while brushing with ground spices and soy sauce. Grill until golden brown.\r\n6. Remove and serve.', '1. 800 g (1) rooster, cut into 4 pieces\r\n2. 4 bay leaves\r\n3. 2 stalks lemongrass, bruised\r\n4. 20 g tamarind, dissolved in 3 tablespoons hot water\r\n5. 500 ml coconut milk\r\n6. 2 tablespoons oil, for sauteing\r\n7. 10 shallots\r\n8. 5 cloves garlic\r\n9. 1 tablespoon coriander, roasted\r\n10. 5 candlenuts\r\n11. ½ teaspoon pepper powder\r\n12. 3 cm turmeric\r\n13. 50 g brown sugar, finely grated\r\n14. 1 teaspoon salt\r\n15. 1 teaspoon granulated sugar', '2022-07-25', '12.30.30', '5.png', 1, '6/10', 0),
(7, 2, 'Clear Spinach Vegetable Soup', 'Spinach is not only rich in nutrition but also delicious processed into any food menu, from clear vegetable soup to fried as chips. Here are some delicious spinach recipes that you can try at home.', 'Vegetables', '2-3 people', '35 minutes', '• spinach, tied into a bundle|50|g\r\n• sweet corn|1|pieces\r\n• garlic|2|cloves\r\n• shallots|3|cloves\r\n• ginger, thumb-sized|1|pieces', 'Clean the spinach, wash it and set aside.\r\n\r\nCut the sweet corn into 3 pieces, set aside.\r\n\r\nFinely slice the shallots and garlic, crush the key.\r\n\r\nBoil water, add the sweet corn and shallots, garlic and key.\r\n\r\nCook until half cooked.\r\n\r\nAdd the spinach, then add salt, sugar and stock powder to taste. Taste test.\r\n\r\nFresh and delicious spinach is ready to be served.', 'Salt, sugar and powdered stock to taste', '2022-07-25', '11:40:20', '7.png', 1, '4/10', 1),
(8, 2, 'Orange juice', 'Super fresh and easy to make orange juice recipe', 'Drinks', '1 peo', '15 minutes', '• orange|3|pieces\r\n• sweetened condensed milk|1|tspn', 'Put the oranges in a blender\r\n\r\nAdd water, ice cubes with sugar water, then stir\r\n\r\nThen serve in a glass and garnish with orange peel.', 'Ice cubes and Sugar water can add as your own preference.', '2022-07-25', '12.30.30', '2-Jus Jeruk-2022-08-15.png', 1, '7/10', 0),
(9, 4, 'Special Beef Meatballs', 'Special meatballs guaranteed delicious', 'Meat', '2-3 people', '1 hour 42 minutes', '• ground beef|300|g\r\n• tapioca flour|4|tbsp\r\n• all-purpose flour|3|tbsp\r\n• eggs|2|pieces\r\n• garlic|1|clove\r\n', 'Prepare the meat, tapioca flour, wheat flour, salt, mushroom broth, and pepper in a large bowl or basin.\r\n\r\nBoil water to boil the meatballs.\r\n\r\nThen blend the garlic with 1 egg.\r\n\r\nAfter that, pour the blended egg into the meatball mixture. Stir until smooth. Then, add 1 egg. Stir until smooth. Don\'t forget to check the taste.\r\n\r\nAfter the water boils and the mixture is ready, make the meatballs using a spoon. And when the meatballs are floating, remove and drain.\r\n\r\nBeef meatballs are ready to be processed into various dishes.', '3 ounces ground beef\r\n4 tablespoons cornstarch (don\'t make a mound)\r\n3 tablespoons flour (don\'t make a mound)\r\n2 eggs\r\n1 clove garlic\r\nto taste Salt\r\nto taste Mushroom broth\r\nto taste Pepper\r\nto taste Water for boiling', '2022-07-25', '11:40:20', '9.png', 0, '9/10', 0),
(10, 4, 'Jus strawberry', 'A simple, delicious and refreshing strawberry juice recipe', 'Drinks', '1 people', '15 minutes', '• strawberries|10|pieces\r\n• sweetened condensed milk, white|5|tbsp\r\n• granulated sugar|2|tbsp\r\n• water, boiled|200|ml\r\n• ice cubes|6|pieces', 'Wash the strawberries until clean, then remove the stems\r\n\r\nCut the strawberries, put them in a blender, add water, granulated sugar, condensed milk and ice cubes\r\n\r\nBlend until well mixed and smooth\r\n\r\nReady to serve', 'Use strawberries that are really ripe so that they don\'t taste sour, and add powdered milk or honey to make them even more delicious.', '2022-07-25', '12.30.30', '10.png', 1, '10/10', 1),
(56, 2, 'Taichan Satay', 'Delicious satay', 'Meat', '2', '2 hour 34 minutes', '• Chicken meat|500|g\r\n• Soy sauce|2|tspn\r\n• Chili|1|pieces', '• Grill satay on charcoal', '', '2022-08-15', '05:42:41', '2-Sate Taichan-2022-08-15.png', 1, '', 1),
(57, 2, 'Papiong', 'Typical Toraja food', 'Meat', '10', '2 hour 32 minutes', '• Pork|500|g\r\n• bamboo|100|g\r\n• salt|5|g\r\n• vegetables|500|g', '• Put the pork in to bamboo\n• burn it', 'Reduce salt', '2022-08-21', '14:44:59', '2-Papiong-2022-08-21.png', 1, '', 1),
(58, 2, 'Sate taichan', 'enakk', 'Meat', '2', '2 hour', '• meat\n• saos', '• bakar sate', 'tambahkan sayur jika perlu', '2022-08-21', '15:05:12', '2-Sate taichan-2022-08-21.png', 2, '', 0),
(59, 2, 'just orange', 'fresh', 'Drinks', '2', '32 minutes', '• orange|2|pieces\r\n• sugar|2|tspn', '• squeeze the orange', 'add sugar', '2022-08-21', '15:07:14', '2-just jeruk-2022-08-21.png', 1, '', 1),
(60, 4, 'Chicken Souo', 'Delicious chicken soup', 'Meat', '2', '3hour 2 minutes', '• chicken|1|kg\r\n• selectile vegetables|500|g\r\n• salt|20|g', '• Release the water first', 'Share it with your family!', '2022-09-16', '07:25:02', '4-Souo ayam-2022-09-16.png', 1, '', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `report_bug`
--

CREATE TABLE `report_bug` (
  `report_id` int(20) NOT NULL,
  `user_id` int(6) NOT NULL,
  `title` varchar(300) NOT NULL,
  `report` text NOT NULL,
  `image` varchar(300) NOT NULL,
  `date` varchar(12) NOT NULL,
  `time` varchar(12) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_bug`
--

INSERT INTO `report_bug` (`report_id`, `user_id`, `title`, `report`, `image`, `date`, `time`, `status`) VALUES
(4, 4, '', 'halooo test chat pertama', '4-2022-08-19-.png', '2022-08-19', '05:30:57', 0);

-- --------------------------------------------------------

--
-- Table structure for table `report_recipe`
--

CREATE TABLE `report_recipe` (
  `report_id` int(12) NOT NULL,
  `user_id` int(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `report` text NOT NULL,
  `image` varchar(300) NOT NULL,
  `recipe_id` int(6) NOT NULL,
  `date` varchar(300) NOT NULL,
  `time` varchar(300) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_recipe`
--

INSERT INTO `report_recipe` (`report_id`, `user_id`, `title`, `report`, `image`, `recipe_id`, `date`, `time`, `status`) VALUES
(2, 0, '', '10', '', 2, '2022-08-19', '21:58:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_user`
--

CREATE TABLE `report_user` (
  `report_id` int(20) NOT NULL,
  `user_id` int(6) NOT NULL,
  `user_id_report` int(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `report` text NOT NULL,
  `image` varchar(300) NOT NULL,
  `date` varchar(80) NOT NULL,
  `time` varchar(80) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_user`
--

INSERT INTO `report_user` (`report_id`, `user_id`, `user_id_report`, `title`, `report`, `image`, `date`, `time`, `status`) VALUES
(8, 2, 3, 'user menjiplak resep saya', 'test my first report', ' 2-2022-08-29-8.png', '2022-08-29', '12:59:54', 1),
(9, 4, 2, 'User menjiplak resep sayaa', 'Resep saya Cara membuat makanan papion khas toraja ditiru Dan did upload tanpa seizin saya', ' 4-2022-08-29-9.png', '2022-08-29', '13:07:03', 0),
(14, 2, 0, 'recipe ini mengandung sara', 'saya melaporkan recipe ini karena postingin ini mengandung sara', '2-2022-08-31-10.png', '2022-08-31', '05:48:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `req_verification`
--

CREATE TABLE `req_verification` (
  `id` int(20) NOT NULL,
  `user_id` int(6) NOT NULL,
  `username` varchar(80) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `region` varchar(150) NOT NULL,
  `type` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `image` varchar(250) NOT NULL,
  `date` varchar(80) NOT NULL,
  `time` varchar(80) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `req_verification`
--

INSERT INTO `req_verification` (`id`, `user_id`, `username`, `full_name`, `doc_type`, `category`, `region`, `type`, `url`, `image`, `date`, `time`, `status`) VALUES
(29, 20, 'Eve Ichwan', 'dsdsdsdsdss', 'Drivers license', 'Sports', 'Belarus', 'News article', 'sddfdfdff', '20-3088-2022-09-22.png', '2022-09-22', '14:32:13', 2),
(30, 4, 'Kevin Gilbert', 'fdsdfsfdsfsdf', 'Drivers license', 'Fashion', 'Bangladesh', 'Social media', 'kjkjkjk', '4-3758-2022-09-23.png', '2022-09-23', '19:04:59', 2);

-- --------------------------------------------------------

--
-- Table structure for table `saved`
--

CREATE TABLE `saved` (
  `save_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `recipe_id` int(10) NOT NULL,
  `code` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saved`
--

INSERT INTO `saved` (`save_id`, `user_id`, `recipe_id`, `code`) VALUES
(1, 4, 2, 1),
(140, 2, 6, 1),
(144, 2, 59, 1),
(145, 5, 7, 1),
(146, 2, 5, 1),
(147, 2, 2, 1),
(148, 6, 7, 1),
(149, 2, 9, 1),
(160, 4, 59, 1),
(163, 2, 7, 1),
(164, 4, 60, 1),
(177, 20, 60, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shopping_list`
--

CREATE TABLE `shopping_list` (
  `shopping_id` int(10) NOT NULL,
  `user_id` int(6) NOT NULL,
  `name` varchar(333) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shopping_list`
--

INSERT INTO `shopping_list` (`shopping_id`, `user_id`, `name`, `note`) VALUES
(1, 22, 'eggs', 'fragile! \r\nBuy at list 2 pack');

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `storage_id` int(10) NOT NULL,
  `user_id` int(6) NOT NULL,
  `name` varchar(333) NOT NULL,
  `quantity` int(9) NOT NULL,
  `unit` varchar(9) NOT NULL,
  `category` varchar(50) NOT NULL,
  `expirationDate` date NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storage`
--

INSERT INTO `storage` (`storage_id`, `user_id`, `name`, `quantity`, `unit`, `category`, `expirationDate`, `note`) VALUES
(1, 22, 'apple', 1, 'kg', '  Fruits  ', '2024-11-29', ''),
(4, 22, 'orange', 6, 'pieces', '  Fruits  ', '2024-11-08', ''),
(10, 22, 'potato', 2, 'kg', '  Vegetables  ', '2024-11-25', ''),
(19, 22, 'lettuce', 1, 'pieces', '  Vegetables  ', '2024-12-19', ''),
(22, 22, 'strawberry', 1, 'pieces', '  Fruits  ', '2024-12-19', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(6) NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(150) NOT NULL,
  `date` varchar(80) NOT NULL,
  `time` varchar(80) NOT NULL,
  `photo_profile` varchar(255) NOT NULL DEFAULT 'default.png',
  `biography` text NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `role` tinyint(1) NOT NULL DEFAULT 2,
  `active` smallint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `date`, `time`, `photo_profile`, `biography`, `verified`, `role`, `active`) VALUES
(2, 'Chika Zeruya', 'zeruya@gmail.com', '$2y$10$6pJk0gcDyPaPKTghhW8wN.Bw4tXQK3JEXGP1I93qTjXyv8RhaEnp6', '23-07-2022', '15:16:23', '2.png', 'I love cooking 😍', 1, 2, 1),
(4, 'Kevin Gilbert', 'gwareshop@gmail.com', '$2y$10$sVD6yM/NE5CnXMZ9wK2WueqeKF.BkBEFgFk9rVK4nrrZ2O6hWj8Ni', '23-07-2022', '15:20:03', '4.png', 'Kevin Gilbert Toding', 1, 2, 1),
(6, 'Kandean', 'superadmin@gmail.com', '$2y$10$7b65g9mv6KKLDcprJJfZiOltw2.WNquSTsKl8zj15wOpfK85QM3ky', '22-08-2022', '06:19:00', '6.png', '', 1, 1, 1),
(8, 'natalia Permata Sari', 'natalia@gmail.com', '$2y$10$vhAQRqBCdjQDRa91nSu5M.MEztFdhZHtmJBPbWg6N/qjc3Oc2JlPW', '28-08-2022', '09:27:09', '8.png', '', 0, 2, 1),
(18, 'Adelaide Gabriella', 'natalia2', '$2y$10$j/p0p.xJe3S8eyQstOc5G.GeAe7uzlmqlBQvmU10p2QIMnpLiyVgm', '23', '40', '18.png', '', 0, 2, 1),
(19, 'Fajar Nugroho', 'kevin@gmail.com', '$2y$10$G6J.YHQ6nUHwELdjCSiAcOX1iXiQaFA4nxz9uhdr.REXcrlS7/D/S', '28-08-2022', '10:36:48', '19.png', '', 0, 2, 0),
(20, 'Eve Ichwan', 'eve@gmail.com', '$2y$10$9dBbInqd8dqvBSWNtFs/M.Q/SLNMaJt7VC.iAwDd6ukKw1L54XiFq', '07-09-2022', '04:08:42', '20.png', 'Halo AK ippp', 1, 2, 1),
(21, 'Jefri Nichol', 'jefri@gmail.com', '$2y$10$1hloizVT.DuudkWLfNrYHOJ0QYQUeJQP4yMLW9qWnjFb8jBi5XX/.', '17-09-2022', '16:31:40', 'default.png', '', 0, 2, 1),
(22, 'Victoria', 'v@gmail.com', '$2y$10$8vCxZCcRIFmD7VohQXUsRueFkQ9qdyVuQoAustxcl9mftauL3ltiG', '29-11-2024', '16:59:05', 'default.png', '', 0, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app`
--
ALTER TABLE `app`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `comment_reply`
--
ALTER TABLE `comment_reply`
  ADD PRIMARY KEY (`reply_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `following`
--
ALTER TABLE `following`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liked`
--
ALTER TABLE `liked`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `like_comment`
--
ALTER TABLE `like_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `like_comment_reply`
--
ALTER TABLE `like_comment_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notif_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`recipe_id`);

--
-- Indexes for table `report_bug`
--
ALTER TABLE `report_bug`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `report_recipe`
--
ALTER TABLE `report_recipe`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `report_user`
--
ALTER TABLE `report_user`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `req_verification`
--
ALTER TABLE `req_verification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved`
--
ALTER TABLE `saved`
  ADD PRIMARY KEY (`save_id`);

--
-- Indexes for table `shopping_list`
--
ALTER TABLE `shopping_list`
  ADD PRIMARY KEY (`shopping_id`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`storage_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app`
--
ALTER TABLE `app`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `following`
--
ALTER TABLE `following`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `liked`
--
ALTER TABLE `liked`
  MODIFY `like_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=494;

--
-- AUTO_INCREMENT for table `like_comment`
--
ALTER TABLE `like_comment`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `like_comment_reply`
--
ALTER TABLE `like_comment_reply`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notif_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=485;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipe_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `report_bug`
--
ALTER TABLE `report_bug`
  MODIFY `report_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `report_recipe`
--
ALTER TABLE `report_recipe`
  MODIFY `report_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `report_user`
--
ALTER TABLE `report_user`
  MODIFY `report_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `req_verification`
--
ALTER TABLE `req_verification`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `saved`
--
ALTER TABLE `saved`
  MODIFY `save_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `storage`
--
ALTER TABLE `storage`
  MODIFY `storage_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
