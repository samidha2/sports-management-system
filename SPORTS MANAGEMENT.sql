SHOW DATABASES;
CREATE DATABASE SPORTS_MANAGEMENT;
USE SPORTS_MANAGEMENT;

CREATE TABLE SPORTS (
    SPORT_ID INT PRIMARY KEY NOT NULL,
    SPORT_NAME VARCHAR(255) NOT NULL UNIQUE,
    GOVERNING_BODY VARCHAR(255) NOT NULL,   -- e.g., FIFA, ICC, BCCI
    SPORT_TYPE VARCHAR(100) NOT NULL,       -- Indoor / Outdoor / Team / Individual
    PARTICIPATION_FEE INT NOT NULL,
    PRIZE_AMOUNT INT NOT NULL
);
DESC SPORTS;
SELECT * FROM SPORTS;

CREATE TABLE TEAMS (
    TEAM_ID INT PRIMARY KEY NOT NULL UNIQUE,
    TEAM_CODE INT NOT NULL UNIQUE,          -- Instead of TEAM_TAG
    TEAM_NAME VARCHAR(255) NOT NULL UNIQUE,
    COUNTRY VARCHAR(255) NOT NULL,
    CAPTAIN_NAME VARCHAR(255) NOT NULL UNIQUE,
    EMAIL VARCHAR(255) NOT NULL UNIQUE,
    SPORT_NAME VARCHAR(255) NOT NULL
);
DESC TEAMS;
SELECT * FROM TEAMS;

CREATE TABLE PLAYERS (
    PLAYER_ID INT PRIMARY KEY NOT NULL UNIQUE,
    PLAYER_NAME VARCHAR(255) NOT NULL,
    PLAYER_AGE INT NOT NULL,
    JERSEY_NUMBER INT NOT NULL,
    TEAM_ID INT NOT NULL,
    SPORT_NAME VARCHAR(255) NOT NULL
);
DESC PLAYERS;
SELECT * FROM PLAYERS;

CREATE TABLE REGISTRATION (
    REGISTRATION_ID INT PRIMARY KEY NOT NULL UNIQUE,
    REGISTRANT_NAME VARCHAR(255) NOT NULL,
    REGISTRANT_EMAIL VARCHAR(255) NOT NULL UNIQUE,
    SPORT_NAME VARCHAR(255) NOT NULL,
    TEAM_NAME VARCHAR(255) NOT NULL UNIQUE,
    CAPTAIN_NAME VARCHAR(255) NOT NULL UNIQUE,
    AMOUNT INT NOT NULL
);
DESC REGISTRATION;
SELECT * FROM REGISTRATION;

CREATE TABLE RG_DETAILS (
    REGISTRATION_ID INT PRIMARY KEY NOT NULL UNIQUE,
    REGISTRANT_NAME VARCHAR(255) NOT NULL,
    TEAM_NAME VARCHAR(255) NOT NULL UNIQUE,
    REGISTRATION_AMOUNT INT NOT NULL,
    TAX INT NOT NULL,
    AMOUNT_PAID INT NOT NULL
);
DESC RG_DETAILS;
SELECT * FROM RG_DETAILS;

CREATE TABLE COACHES (
    COACH_ID INT PRIMARY KEY NOT NULL UNIQUE,
    COACH_NAME VARCHAR(255) NOT NULL,
    COACH_AGE INT NOT NULL,
    EXPERIENCE_YEARS INT NOT NULL,
    EMAIL VARCHAR(255) NOT NULL UNIQUE,
    PHONE_NUMBER VARCHAR(20) NOT NULL UNIQUE,
    TEAM_ID INT NOT NULL,
    SPORT_NAME VARCHAR(255) NOT NULL
);
DESC COACHES;
SELECT * FROM COACHES;

CREATE TABLE STAFF (
    STAFF_ID INT PRIMARY KEY NOT NULL UNIQUE,
    STAFF_NAME VARCHAR(255) NOT NULL,
    ROLE VARCHAR(100) NOT NULL,         -- Physiotherapist / Trainer / Doctor
    EMAIL VARCHAR(255) NOT NULL UNIQUE,
    PHONE_NUMBER VARCHAR(20) NOT NULL UNIQUE,
    TEAM_ID INT NOT NULL,
    SPORT_NAME VARCHAR(255) NOT NULL
);
DESC STAFF;
SELECT * FROM STAFF;

CREATE TABLE ADMINISTRATION (
    ADMIN_ID INT PRIMARY KEY NOT NULL UNIQUE,
    ADMIN_NAME VARCHAR(255) NOT NULL,
    ROLE VARCHAR(100) NOT NULL,        -- Manager / Coordinator / Secretary
    EMAIL VARCHAR(255) NOT NULL UNIQUE,
    PHONE_NUMBER VARCHAR(20) NOT NULL UNIQUE,
    SPORT_NAME VARCHAR(255) NOT NULL
);
DESC ADMINISTRATION;
SELECT * FROM ADMINISTRATION;

CREATE TABLE REFEREES (
    REFEREE_ID INT PRIMARY KEY NOT NULL UNIQUE,
    REFEREE_NAME VARCHAR(255) NOT NULL,
    EXPERIENCE_YEARS INT NOT NULL,
    CERTIFICATION VARCHAR(255) NOT NULL,    -- FIFA / ICC / ITF / etc
    EMAIL VARCHAR(255) NOT NULL UNIQUE,
    PHONE_NUMBER VARCHAR(20) NOT NULL UNIQUE,
    SPORT_NAME VARCHAR(255) NOT NULL
);
DESC REFEREES;
SELECT * FROM REFEREES;

INSERT INTO SPORTS(SPORT_ID, SPORT_NAME, GOVERNING_BODY, SPORT_TYPE, PARTICIPATION_FEE, PRIZE_AMOUNT)
VALUES
(101, 'Football', 'FIFA', 'Outdoor Team', 1000, 1000000),
(102, 'Cricket', 'ICC', 'Outdoor Team', 800, 2000000),
(103, 'Basketball', 'NBA', 'Indoor Team', 600, 750000),
(104, 'Tennis', 'ITF', 'Outdoor Individual', 500, 500000),
(105, 'Badminton', 'BWF', 'Indoor Individual', 400, 300000),
(106, 'Hockey', 'FIH', 'Outdoor Team', 700, 600000),
(107, 'Volleyball', 'FIVB', 'Indoor Team', 500, 450000),
(108, 'Table Tennis', 'ITTF', 'Indoor Individual', 300, 200000),
(109, 'Rugby', 'World Rugby', 'Outdoor Team', 900, 1200000),
(110, 'Athletics', 'IAAF', 'Outdoor Individual', 200, 100000);
SELECT * FROM SPORTS;

INSERT INTO TEAMS(TEAM_ID, TEAM_CODE, TEAM_NAME, COUNTRY, CAPTAIN_NAME, EMAIL, SPORT_NAME)
VALUES
--  Football Teams
(201, 101, 'India Football Club', 'India', 'Sunil Chhetri', 'india_fc@gmail.com', 'Football'),
(211, 102, 'Brazil National Football Team', 'Brazil', 'Neymar Jr', 'brazil_football@gmail.com', 'Football'),
(212, 103, 'Germany National Football Team', 'Germany', 'Manuel Neuer', 'germany_football@gmail.com', 'Football'),
(213, 104, 'Spain National Football Team', 'Spain', 'Sergio Ramos', 'spain_football@gmail.com', 'Football'),
(223, 105, 'France National Football Team', 'France', 'Kylian Mbappe', 'france_football@gmail.com', 'Football'),
(224, 106, 'Argentina National Football Team', 'Argentina', 'Lionel Messi', 'argentina_football@gmail.com', 'Football'),
(225, 107, 'England National Football Team', 'England', 'Harry Kane', 'england_football@gmail.com', 'Football'),
(226, 108, 'Portugal National Football Team', 'Portugal', 'Cristiano Ronaldo', 'portugal_football@gmail.com', 'Football'),

-- Cricket Teams
(202, 109, 'Australia Cricket Team', 'Australia', 'Pat Cummins', 'aus_cricket@gmail.com', 'Cricket'),
(214, 110, 'India Cricket Team', 'India', 'Rohit Sharma', 'india_cricket@gmail.com', 'Cricket'),
(215, 111, 'England Cricket Team', 'England', 'Jos Buttler', 'eng_cricket@gmail.com', 'Cricket'),
(216, 112, 'Pakistan Cricket Team', 'Pakistan', 'Babar Azam', 'pak_cricket@gmail.com', 'Cricket'),
(227, 113, 'New Zealand Cricket Team', 'New Zealand', 'Kane Williamson', 'nz_cricket@gmail.com', 'Cricket'),
(228, 114, 'South Africa Cricket Team', 'South Africa', 'Temba Bavuma', 'sa_cricket@gmail.com', 'Cricket'),
(229, 115, 'Sri Lanka Cricket Team', 'Sri Lanka', 'Dasun Shanaka', 'sl_cricket@gmail.com', 'Cricket'),
(230, 116, 'Bangladesh Cricket Team', 'Bangladesh', 'Shakib Al Hasan', 'bd_cricket@gmail.com', 'Cricket'),

-- Basketball Teams
(203, 117, 'USA Basketball Squad', 'USA', 'LeBron James', 'usa_basket@gmail.com', 'Basketball'),
(217, 118, 'Spain Basketball Team', 'Spain', 'Pau Gasol', 'spain_basket@gmail.com', 'Basketball'),
(218, 119, 'Argentina Basketball Team', 'Argentina', 'Luis Scola', 'arg_basket@gmail.com', 'Basketball'),
(231, 120, 'France Basketball Team', 'France', 'Tony Parker', 'france_basket@gmail.com', 'Basketball'),
(232, 121, 'Australia Basketball Team', 'Australia', 'Patty Mills', 'aus_basket@gmail.com', 'Basketball'),

-- Tennis Teams (Davis Cup Style)
(204, 122, 'Spain Tennis Team', 'Spain', 'Rafael Nadal', 'spain_tennis@gmail.com', 'Tennis'),
(219, 123, 'Switzerland Tennis Team', 'Switzerland', 'Roger Federer', 'swiss_tennis@gmail.com', 'Tennis'),
(233, 124, 'Serbia Tennis Team', 'Serbia', 'Novak Djokovic', 'serbia_tennis@gmail.com', 'Tennis'),
(234, 125, 'USA Tennis Team', 'USA', 'Serena Williams', 'usa_tennis@gmail.com', 'Tennis'),

-- Badminton Teams
(205, 126, 'China Badminton Stars', 'China', 'Chen Long', 'china_badminton@gmail.com', 'Badminton'),
(220, 127, 'Indonesia Badminton Team', 'Indonesia', 'Anthony Ginting', 'indonesia_badminton@gmail.com', 'Badminton'),
(235, 128, 'India Badminton Team', 'India', 'PV Sindhu', 'india_badminton@gmail.com', 'Badminton'),
(236, 129, 'Malaysia Badminton Team', 'Malaysia', 'Lee Zii Jia', 'malaysia_badminton@gmail.com', 'Badminton'),

-- Hockey Teams
(206, 130, 'Germany Hockey Club', 'Germany', 'Tobias Hauke', 'germany_hockey@gmail.com', 'Hockey'),
(221, 131, 'India Hockey Team', 'India', 'Manpreet Singh', 'india_hockey@gmail.com', 'Hockey'),
(237, 132, 'Netherlands Hockey Team', 'Netherlands', 'Billy Bakker', 'netherlands_hockey@gmail.com', 'Hockey'),
(238, 133, 'Australia Hockey Team', 'Australia', 'Eddie Ockenden', 'aus_hockey@gmail.com', 'Hockey'),

-- Volleyball Teams
(207, 134, 'Brazil Volleyball Team', 'Brazil', 'Bruno Rezende', 'brazil_volley@gmail.com', 'Volleyball'),
(239, 135, 'Italy Volleyball Team', 'Italy', 'Ivan Zaytsev', 'italy_volley@gmail.com', 'Volleyball'),
(240, 136, 'Russia Volleyball Team', 'Russia', 'Maxim Mikhaylov', 'russia_volley@gmail.com', 'Volleyball'),
(241, 137, 'USA Volleyball Team', 'USA', 'Matt Anderson', 'usa_volley@gmail.com', 'Volleyball'),

-- Table Tennis Teams
(208, 138, 'Japan TT Squad', 'Japan', 'Tomokazu Harimoto', 'japan_tt@gmail.com', 'Table Tennis'),
(242, 139, 'China TT Team', 'China', 'Ma Long', 'china_tt@gmail.com', 'Table Tennis'),
(243, 140, 'Germany TT Team', 'Germany', 'Timo Boll', 'germany_tt@gmail.com', 'Table Tennis'),

-- Rugby Teams
(209, 141, 'New Zealand Rugby Team', 'New Zealand', 'Sam Cane', 'nz_rugby@gmail.com', 'Rugby'),
(222, 142, 'South Africa Rugby Team', 'South Africa', 'Siya Kolisi', 'sa_rugby@gmail.com', 'Rugby'),
(244, 143, 'England Rugby Team', 'England', 'Owen Farrell', 'eng_rugby@gmail.com', 'Rugby'),
(245, 144, 'Australia Rugby Team', 'Australia', 'Michael Hooper', 'aus_rugby@gmail.com', 'Rugby'),

-- Athletics Teams (Clubs/National Squads)
(210, 145, 'Kenya Athletics Club', 'Kenya', 'Eliud Kipchoge', 'kenya_athletics@gmail.com', 'Athletics'),
(246, 146, 'Jamaica Athletics Club', 'Jamaica', 'Usain Bolt', 'jamaica_athletics@gmail.com', 'Athletics'),
(247, 147, 'USA Athletics Team', 'USA', 'Carl Lewis', 'usa_athletics@gmail.com', 'Athletics'),
(248, 148, 'Ethiopia Athletics Club', 'Ethiopia', 'Haile Gebrselassie', 'ethiopia_athletics@gmail.com', 'Athletics');


INSERT INTO PLAYERS(PLAYER_ID, PLAYER_NAME, PLAYER_AGE, JERSEY_NUMBER, TEAM_ID, SPORT_NAME)
VALUES
-- FOOTBALL
(301, 'Sunil Chhetri', 38, 11, 201, 'Football'),
(302, 'Sandesh Jhingan', 30, 4, 201, 'Football'),
(303, 'Gurpreet Singh Sandhu', 31, 1, 201, 'Football'),
(304, 'Udanta Singh', 27, 7, 201, 'Football'),

(305, 'Neymar Jr', 32, 10, 211, 'Football'),
(306, 'Casemiro', 32, 5, 211, 'Football'),
(307, 'Alisson Becker', 21, 1, 211, 'Football'),
(308, 'Vinícius Jr', 24, 11, 211, 'Football'),

(309, 'Manuel Neuer', 38, 1, 212, 'Football'),
(310, 'Thomas Müller', 35, 25, 212, 'Football'),
(311, 'Joshua Kimmich', 29, 6, 212, 'Football'),
(312, 'Kai Havertz', 25, 7, 212, 'Football'),

(313, 'Sergio Ramos', 38, 4, 213, 'Football'),
(314, 'Pedri', 22, 8, 213, 'Football'),
(315, 'Gavi', 20, 6, 213, 'Football'),
(316, 'Unai Simón', 27, 1, 213, 'Football'),

(317, 'Kylian Mbappé', 26, 10, 223, 'Football'),
(318, 'Antoine Griezmann', 34, 7, 223, 'Football'),
(319, 'Paul Pogba', 32, 6, 223, 'Football'),
(320, 'Hugo Lloris', 38, 1, 223, 'Football'),

(321, 'Lionel Messi', 37, 10, 224, 'Football'),
(322, 'Ángel Di María', 36, 11, 224, 'Football'),
(323, 'Emiliano Martínez', 32, 1, 224, 'Football'),
(324, 'Julián Álvarez', 25, 9, 224, 'Football'),

(325, 'Harry Kane', 32, 9, 225, 'Football'),
(326, 'Raheem Sterling', 30, 7, 225, 'Football'),
(327, 'Jordan Pickford', 31, 1, 225, 'Football'),
(328, 'Bukayo Saka', 23, 17, 225, 'Football'),

(329, 'Cristiano Ronaldo', 40, 7, 226, 'Football'),
(330, 'Bruno Fernandes', 31, 8, 226, 'Football'),
(331, 'João Félix', 25, 11, 226, 'Football'),
(332, 'Rúben Dias', 28, 3, 226, 'Football'),

--  CRICKET
(333, 'Rohit Sharma', 37, 45, 202, 'Cricket'),
(334, 'Virat Kohli', 36, 18, 202, 'Cricket'),
(335, 'Jasprit Bumrah', 31, 93, 202, 'Cricket'),
(336, 'Ravindra Jadeja', 36, 8, 202, 'Cricket'),

(337, 'Babar Azam', 31, 56, 214, 'Cricket'),
(338, 'Shaheen Afridi', 30, 10, 214, 'Cricket'),
(339, 'Mohammad Rizwan', 33, 16, 214, 'Cricket'),
(340, 'Shadab Khan', 32, 29, 214, 'Cricket'),

(341, 'Steve Smith', 36, 49, 215, 'Cricket'),
(342, 'Pat Cummins', 32, 30, 215, 'Cricket'),
(343, 'David Warner', 38, 31, 215, 'Cricket'),
(344, 'Mitchell Starc', 35, 56, 215, 'Cricket'),

(345, 'Joe Root', 34, 66, 216, 'Cricket'),
(346, 'Ben Stokes', 34, 55, 216, 'Cricket'),
(347, 'Jofra Archer', 31, 22, 216, 'Cricket'),
(348, 'Jos Buttler', 35, 63, 216, 'Cricket'),

(349, 'Kane Williamson', 35, 22, 227, 'Cricket'),
(350, 'Trent Boult', 36, 18, 227, 'Cricket'),
(351, 'Ross Taylor', 41, 3, 227, 'Cricket'),
(352, 'Tim Southee', 36, 38, 227, 'Cricket'),

(353, 'Shakib Al Hasan', 38, 75, 228, 'Cricket'),
(354, 'Mushfiqur Rahim', 37, 15, 228, 'Cricket'),
(355, 'Tamim Iqbal', 36, 28, 228, 'Cricket'),
(356, 'Mustafizur Rahman', 32, 90, 228, 'Cricket'),

(357, 'Temba Bavuma', 35, 11, 229, 'Cricket'),
(358, 'Quinton de Kock', 33, 12, 229, 'Cricket'),
(359, 'Kagiso Rabada', 30, 25, 229, 'Cricket'),
(360, 'Aiden Markram', 31, 4, 229, 'Cricket'),

(361, 'Dasun Shanaka', 34, 7, 230, 'Cricket'),
(362, 'Kusal Mendis', 30, 13, 230, 'Cricket'),
(363, 'Wanindu Hasaranga', 28, 49, 230, 'Cricket'),
(364, 'Angelo Mathews', 38, 69, 230, 'Cricket'),

-- BASKETBALL
(365, 'LeBron James', 40, 23, 203, 'Basketball'),
(366, 'Stephen Curry', 37, 30, 203, 'Basketball'),
(367, 'Kevin Durant', 37, 7, 203, 'Basketball'),
(368, 'Anthony Davis', 32, 3, 203, 'Basketball'),

(369, 'Rui Hachimura', 27, 8, 217, 'Basketball'),
(370, 'Yuta Watanabe', 31, 18, 217, 'Basketball'),
(371, 'Daiki Tanaka', 33, 1, 217, 'Basketball'),
(372, 'Makoto Hiejima', 34, 6, 217, 'Basketball'),

(373, 'Luka Dončić', 26, 77, 218, 'Basketball'),
(374, 'Goran Dragić', 39, 7, 218, 'Basketball'),
(375, 'Klemen Prepelič', 33, 10, 218, 'Basketball'),
(376, 'Vlatko Čančar', 29, 31, 218, 'Basketball'),

(377, 'Giannis Antetokounmpo', 30, 34, 219, 'Basketball'),
(378, 'Thanasis Antetokounmpo', 32, 43, 219, 'Basketball'),
(379, 'Nick Calathes', 36, 33, 219, 'Basketball'),
(380, 'Georgios Papagiannis', 28, 6, 219, 'Basketball'),

--  TENNIS
(381, 'Novak Djokovic', 38, 1, 204, 'Tennis'),
(382, 'Dusan Lajovic', 35, 5, 204, 'Tennis'),
(383, 'Miomir Kecmanovic', 29, 9, 204, 'Tennis'),
(384, 'Laslo Djere', 30, 8, 204, 'Tennis'),

(385, 'Rafael Nadal', 39, 1, 220, 'Tennis'),
(386, 'Carlos Alcaraz', 22, 2, 220, 'Tennis'),
(387, 'Pablo Carreno Busta', 34, 4, 220, 'Tennis'),
(388, 'Roberto Bautista Agut', 37, 6, 220, 'Tennis'),

(389, 'Roger Federer', 44, 1, 221, 'Tennis'),
(390, 'Stan Wawrinka', 40, 3, 221, 'Tennis'),
(391, 'Marc-Andrea Huesler', 29, 5, 221, 'Tennis'),
(392, 'Dominic Stricker', 23, 8, 221, 'Tennis'),

(393, 'Andy Murray', 38, 1, 222, 'Tennis'),
(394, 'Cameron Norrie', 30, 2, 222, 'Tennis'),
(395, 'Daniel Evans', 35, 3, 222, 'Tennis'),
(396, 'Jack Draper', 27, 4, 222, 'Tennis'),

-- BADMINTON
(397, 'P. V. Sindhu', 30, 1, 205, 'Badminton'),
(398, 'Kidambi Srikanth', 32, 2, 205, 'Badminton'),
(399, 'Lakshya Sen', 24, 3, 205, 'Badminton'),
(400, 'Satwiksairaj Rankireddy', 29, 4, 205, 'Badminton'),

(401, 'Kento Momota', 31, 1, 231, 'Badminton'),
(402, 'Kanta Tsuneyama', 29, 2, 231, 'Badminton'),
(403, 'Takuro Hoki', 30, 3, 231, 'Badminton'),
(404, 'Yugo Kobayashi', 28, 4, 231, 'Badminton'),

(405, 'Viktor Axelsen', 31, 1, 232, 'Badminton'),
(406, 'Anders Antonsen', 30, 2, 232, 'Badminton'),
(407, 'Rasmus Gemke', 29, 3, 232, 'Badminton'),
(408, 'Hans-Kristian Vittinghus', 39, 4, 232, 'Badminton'),

(409, 'Anthony Ginting', 28, 1, 233, 'Badminton'),
(410, 'Jonatan Christie', 27, 2, 233, 'Badminton'),
(411, 'Mohammad Ahsan', 38, 3, 233, 'Badminton'),
(412, 'Hendra Setiawan', 41, 4, 233, 'Badminton'),

-- HOCKEY
(413, 'Manpreet Singh', 33, 7, 206, 'Hockey'),
(414, 'Harmanpreet Singh', 29, 13, 206, 'Hockey'),
(415, 'PR Sreejesh', 37, 1, 206, 'Hockey'),
(416, 'Mandeep Singh', 31, 11, 206, 'Hockey'),

(417, 'Arthur Van Doren', 30, 4, 234, 'Hockey'),
(418, 'Loick Luypaert', 33, 5, 234, 'Hockey'),
(419, 'Vincent Vanasch', 38, 1, 234, 'Hockey'),
(420, 'Cedric Charlier', 32, 9, 234, 'Hockey'),

(421, 'Florian Fuchs', 34, 23, 235, 'Hockey'),
(422, 'Christopher Rühr', 31, 28, 235, 'Hockey'),
(423, 'Tobias Hauke', 37, 23, 235, 'Hockey'),
(424, 'Niklas Wellen', 30, 9, 235, 'Hockey'),

(425, 'Billy Bakker', 37, 8, 236, 'Hockey'),
(426, 'Robbert Kemperman', 34, 14, 236, 'Hockey'),
(427, 'Mink van der Weerden', 36, 2, 236, 'Hockey'),
(428, 'Jeroen Hertzberger', 39, 18, 236, 'Hockey'),

-- VOLLEYBALL
(429, 'Ivan Zaytsev', 36, 9, 207, 'Volleyball'),
(430, 'Osmany Juantorena', 39, 5, 207, 'Volleyball'),
(431, 'Simone Giannelli', 28, 6, 207, 'Volleyball'),
(432, 'Filippo Lanza', 34, 10, 207, 'Volleyball'),

(433, 'Bruno Rezende', 39, 1, 237, 'Volleyball'),
(434, 'Wallace de Souza', 38, 8, 237, 'Volleyball'),
(435, 'Lucarelli', 33, 16, 237, 'Volleyball'),
(436, 'Ricardo Lucarelli', 32, 17, 237, 'Volleyball'),

(437, 'Max Holt', 37, 12, 238, 'Volleyball'),
(438, 'Matthew Anderson', 38, 1, 238, 'Volleyball'),
(439, 'Aaron Russell', 33, 2, 238, 'Volleyball'),
(440, 'Micah Christenson', 32, 11, 238, 'Volleyball'),

(441, 'Earvin N\'Gapeth', 34, 9, 239, 'Volleyball'),
(442, 'Benjamin Toniutti', 36, 6, 239, 'Volleyball'),
(443, 'Jean Patry', 28, 12, 239, 'Volleyball'),
(444, 'Kevin Tillie', 35, 7, 239, 'Volleyball'),

--  TABLE TENNIS
(445, 'Ma Long', 36, 1, 208, 'Table Tennis'),
(446, 'Fan Zhendong', 28, 2, 208, 'Table Tennis'),
(447, 'Xu Xin', 35, 3, 208, 'Table Tennis'),
(448, 'Lin Gaoyuan', 30, 4, 208, 'Table Tennis'),

(449, 'Tomokazu Harimoto', 22, 1, 240, 'Table Tennis'),
(450, 'Jun Mizutani', 36, 2, 240, 'Table Tennis'),
(451, 'Koki Niwa', 30, 3, 240, 'Table Tennis'),
(452, 'Maharu Yoshimura', 32, 4, 240, 'Table Tennis'),

(453, 'Timo Boll', 44, 1, 241, 'Table Tennis'),
(454, 'Dimitrij Ovtcharov', 37, 2, 241, 'Table Tennis'),
(455, 'Patrick Franziska', 33, 3, 241, 'Table Tennis'),
(456, 'Benedikt Duda', 31, 4, 241, 'Table Tennis'),

(457, 'Hugo Calderano', 29, 1, 242, 'Table Tennis'),
(458, 'Gustavo Tsuboi', 39, 2, 242, 'Table Tennis'),
(459, 'Thiago Monteiro', 38, 3, 242, 'Table Tennis'),
(460, 'Eric Jouti', 28, 4, 242, 'Table Tennis'),

-- RUGBY
(461, 'Beauden Barrett', 34, 10, 209, 'Rugby'),
(462, 'Sam Whitelock', 37, 5, 209, 'Rugby'),
(463, 'Aaron Smith', 36, 9, 209, 'Rugby'),
(464, 'Ardie Savea', 32, 8, 209, 'Rugby'),

(465, 'Owen Farrell', 34, 10, 243, 'Rugby'),
(466, 'Maro Itoje', 31, 4, 243, 'Rugby'),
(467, 'George Ford', 32, 9, 243, 'Rugby'),
(468, 'Jonny May', 36, 11, 243, 'Rugby'),

(469, 'Antoine Dupont', 29, 9, 244, 'Rugby'),
(470, 'Romain Ntamack', 26, 10, 244, 'Rugby'),
(471, 'Damian Penaud', 28, 14, 244, 'Rugby'),
(472, 'Charles Ollivon', 32, 7, 244, 'Rugby'),

(473, 'Siya Kolisi', 34, 6, 245, 'Rugby'),
(474, 'Handré Pollard', 31, 10, 245, 'Rugby'),
(475, 'Cheslin Kolbe', 32, 11, 245, 'Rugby'),
(476, 'Eben Etzebeth', 34, 4, 245, 'Rugby'),

--  Athletics Players (Kenya Athletics Club - 210)
(485, 'Eliud Kipchoge', 39, 1, 210, 'Athletics'),
(486, 'David Rudisha', 35, 2, 210, 'Athletics'),
(487, 'Faith Kipyegon', 30, 3, 210, 'Athletics'),
(488, 'Brigid Kosgei', 30, 4, 210, 'Athletics'),

-- Athletics Players (Jamaica Athletics Club - 246)
(489, 'Usain Bolt', 38, 5, 246, 'Athletics'),
(490, 'Yohan Blake', 35, 6, 246, 'Athletics'),
(491, 'Shelly-Ann Fraser-Pryce', 37, 7, 246, 'Athletics'),
(492, 'Elaine Thompson-Herah', 32, 8, 246, 'Athletics'),

-- Athletics Players (USA Athletics Team - 247)
(493, 'Carl Lewis', 63, 9, 247, 'Athletics'),
(494, 'Noah Lyles', 28, 10, 247, 'Athletics'),
(495, 'Sydney McLaughlin-Levrone', 26, 11, 247, 'Athletics'),
(496, 'Fred Kerley', 30, 12, 247, 'Athletics'),
 
-- Athletics Players (Ethiopia Athletics Club - 248)
(497, 'Haile Gebrselassie', 51, 13, 248, 'Athletics'),
(498, 'Kenenisa Bekele', 42, 14, 248, 'Athletics'),
(499, 'Derartu Tulu', 52, 15, 248, 'Athletics'),
(500, 'Letesenbet Gidey', 26, 16, 248, 'Athletics');

INSERT INTO REGISTRATION 
(REGISTRATION_ID, REGISTRANT_NAME, REGISTRANT_EMAIL, SPORT_NAME, TEAM_NAME, CAPTAIN_NAME, AMOUNT)
VALUES
(1001, 'Rahul Mehta', 'rahul.mehta@example.com', 'Cricket', 'India National Team', 'Rohit Sharma', 5000),
(1002, 'Lucas Silva', 'lucas.silva@example.com', 'Football', 'Brazil National Team', 'Neymar Jr', 4500),
(1003, 'Emma Johnson', 'emma.johnson@example.com', 'Tennis', 'Serbia Tennis Squad', 'Novak Djokovic', 3000),
(1004, 'Yuki Tanaka', 'yuki.tanaka@example.com', 'Basketball', 'Japan Basketball Team', 'Rui Hachimura', 4000);

INSERT INTO RG_DETAILS 
(REGISTRATION_ID, REGISTRANT_NAME, TEAM_NAME, REGISTRATION_AMOUNT, TAX, AMOUNT_PAID)
VALUES
(1001, 'Rahul Mehta', 'India National Team', 5000, 500, 5500),
(1002, 'Lucas Silva', 'Brazil National Team', 4500, 450, 4950),
(1003, 'Emma Johnson', 'Serbia Tennis Squad', 3000, 300, 3300),
(1004, 'Yuki Tanaka', 'Japan Basketball Team', 4000, 400, 4400);


SELECT * FROM PLAYERS;
INSERT INTO PLAYERS (PLAYER_ID, PLAYER_NAME, PLAYER_AGE, JERSEY_NUMBER, TEAM_ID, SPORT_NAME)
VALUES (501, 'Katie Ledecky', 26, 5, 249, 'Swimming');
INSERT INTO TEAMS (TEAM_ID, TEAM_CODE, TEAM_NAME, COUNTRY, CAPTAIN_NAME, EMAIL, SPORT_NAME)
VALUES (249, 150, 'USA Swimming Team', 'USA', 'Michael Phelps', 'usa_swimming@gmail.com', 'Swimming');
INSERT INTO SPORTS (SPORT_ID, SPORT_NAME, GOVERNING_BODY, SPORT_TYPE, PARTICIPATION_FEE, PRIZE_AMOUNT) 
VALUES (111, 'Swimming', 'FINA', 'Indoor Individual', 300, 250000);
INSERT INTO REGISTRATION (REGISTRATION_ID, REGISTRANT_NAME, REGISTRANT_EMAIL, SPORT_NAME, TEAM_NAME, CAPTAIN_NAME, AMOUNT)
VALUES (301, 'John Doe', 'john.doe@email.com', 'Swimming', 'USA Swimming Team', 'Michael Phelps', 300);
INSERT INTO RG_DETAILS (REGISTRATION_ID, REGISTRANT_NAME, TEAM_NAME, REGISTRATION_AMOUNT, TAX, AMOUNT_PAID)
VALUES (301, 'John Doe', 'USA Swimming Team', 300, 30, 330);

INSERT INTO COACHES (COACH_ID, COACH_NAME, COACH_AGE, EXPERIENCE_YEARS, EMAIL, PHONE_NUMBER, TEAM_ID, SPORT_NAME)
VALUES
(301, 'John Smith', 45, 20, 'john.smith@example.com', '123-456-7890', 201, 'Football'),
(302, 'Maria Garcia', 38, 15, 'maria.garcia@example.com', '234-567-8901', 214, 'Cricket'),
(303, 'David Johnson', 50, 25, 'david.johnson@example.com', '345-678-9012', 203, 'Basketball'),
(304, 'Amit Patel', 42, 18, 'amit.patel@example.com', '456-789-0123', 220, 'Badminton'),
(305, 'Jessica Lee', 39, 16, 'jessica.lee@example.com', '567-890-1234', 217, 'Basketball'),
(306, 'Mohammed Ali', 48, 22, 'mohammed.ali@example.com', '678-901-2345', 221, 'Hockey'),
(307, 'Anna Kim', 36, 12, 'anna.kim@example.com', '789-012-3456', 236, 'Badminton'),
(308, 'Carlos Ruiz', 44, 20, 'carlos.ruiz@example.com', '890-123-4567', 211, 'Football'),
(309, 'Sophie Turner', 33, 10, 'sophie.turner@example.com', '901-234-5678', 218, 'Basketball'),
(310, 'Liam Brown', 47, 21, 'liam.brown@example.com', '012-345-6789', 225, 'Football');

INSERT INTO STAFF (STAFF_ID, STAFF_NAME, ROLE, EMAIL, PHONE_NUMBER, TEAM_ID, SPORT_NAME)
VALUES
(401, 'Emily Clark', 'Physiotherapist', 'emily.clark@example.com', '111-222-3333', 201, 'Football'),
(402, 'Michael Davis', 'Trainer', 'michael.davis@example.com', '222-333-4444', 214, 'Cricket'),
(403, 'Sophia Wilson', 'Doctor', 'sophia.wilson@example.com', '333-444-5555', 203, 'Basketball'),
(404, 'James Martinez', 'Physiotherapist', 'james.martinez@example.com', '444-555-6666', 220, 'Badminton'),
(405, 'Olivia Anderson', 'Trainer', 'olivia.anderson@example.com', '555-666-7777', 217, 'Basketball'),
(406, 'William Thomas', 'Doctor', 'william.thomas@example.com', '666-777-8888', 221, 'Hockey'),
(407, 'Isabella Taylor', 'Physiotherapist', 'isabella.taylor@example.com', '777-888-9999', 236, 'Badminton'),
(408, 'Benjamin Moore', 'Trainer', 'benjamin.moore@example.com', '888-999-0000', 211, 'Football'),
(409, 'Mia Jackson', 'Doctor', 'mia.jackson@example.com', '999-000-1111', 218, 'Basketball'),
(410, 'Ethan White', 'Physiotherapist', 'ethan.white@example.com', '000-111-2222', 225, 'Football');

INSERT INTO ADMINISTRATION (ADMIN_ID, ADMIN_NAME, ROLE, EMAIL, PHONE_NUMBER, SPORT_NAME)
VALUES
(501, 'Laura Green', 'Manager', 'laura.green@example.com', '101-202-3030', 'Football'),
(502, 'David Hall', 'Coordinator', 'david.hall@example.com', '102-203-3040', 'Cricket'),
(503, 'Sarah King', 'Secretary', 'sarah.king@example.com', '103-204-3050', 'Basketball'),
(504, 'James Scott', 'Manager', 'james.scott@example.com', '104-205-3060', 'Tennis'),
(505, 'Emma Baker', 'Coordinator', 'emma.baker@example.com', '105-206-3070', 'Badminton'),
(506, 'Christopher Young', 'Secretary', 'christopher.young@example.com', '106-207-3080', 'Hockey'),
(507, 'Olivia Wright', 'Manager', 'olivia.wright@example.com', '107-208-3090', 'Volleyball'),
(508, 'Matthew Lopez', 'Coordinator', 'matthew.lopez@example.com', '108-209-3100', 'Rugby'),
(509, 'Sophia Hill', 'Secretary', 'sophia.hill@example.com', '109-210-3110', 'Athletics'),
(510, 'Daniel Allen', 'Manager', 'daniel.allen@example.com', '110-211-3120', 'Football');

INSERT INTO REFEREES (REFEREE_ID, REFEREE_NAME, EXPERIENCE_YEARS, CERTIFICATION, EMAIL, PHONE_NUMBER, SPORT_NAME)
VALUES
(601, 'John Miller', 12, 'FIFA', 'john.miller@example.com', '201-301-4010', 'Football'),
(602, 'Karen Lopez', 8, 'ICC', 'karen.lopez@example.com', '202-302-4020', 'Cricket'),
(603, 'Michael Davis', 15, 'NBA', 'michael.davis@example.com', '203-303-4030', 'Basketball'),
(604, 'Linda Turner', 10, 'ITF', 'linda.turner@example.com', '204-304-4040', 'Tennis'),
(605, 'Robert Harris', 7, 'BWF', 'robert.harris@example.com', '205-305-4050', 'Badminton'),
(606, 'Patricia White', 11, 'FIH', 'patricia.white@example.com', '206-306-4060', 'Hockey'),
(607, 'David Wilson', 9, 'FIVB', 'david.wilson@example.com', '207-307-4070', 'Volleyball'),
(608, 'Susan Martinez', 13, 'World Rugby', 'susan.martinez@example.com', '208-308-4080', 'Rugby'),
(609, 'Thomas Clark', 6, 'IAAF', 'thomas.clark@example.com', '209-309-4090', 'Athletics'),
(610, 'Jessica Lewis', 14, 'ITTF', 'jessica.lewis@example.com', '210-310-4100', 'Table Tennis');

-- VIEW QUERIES 

-- Show all coaches with their team and sport
SELECT COACH_NAME, TEAM_ID, SPORT_NAME FROM COACHES;

-- List all referees who have more than 10 years of experience
SELECT REFEREE_NAME, EXPERIENCE_YEARS, SPORT_NAME
FROM REFEREES
WHERE EXPERIENCE_YEARS > 10;

-- Get all administrative officials for the sport “Football”
SELECT ADMIN_NAME, ROLE
FROM ADMINISTRATION
WHERE SPORT_NAME = 'Football';

-- List all staff members and their roles by sport
SELECT STAFF_NAME, ROLE, SPORT_NAME FROM STAFF;

-- Find all coaches with more than 10 years of experience
SELECT COACH_NAME, EXPERIENCE_YEARS
FROM COACHES
WHERE EXPERIENCE_YEARS > 10;

-- Count the number of referees by sport
SELECT SPORT_NAME, COUNT(*) AS TOTAL_REFEREES
FROM REFEREES
GROUP BY SPORT_NAME;

-- Get the average age of coaches per sport
SELECT SPORT_NAME, AVG(COACH_AGE) AS AVG_AGE
FROM COACHES
GROUP BY SPORT_NAME;

-- Count total staff members per team
SELECT TEAM_ID, COUNT(*) AS TOTAL_STAFF
FROM STAFF
GROUP BY TEAM_ID;

-- Show each coach’s name with their team’s name (JOIN with TEAMS)
SELECT C.COACH_NAME, T.TEAM_NAME, C.SPORT_NAME
FROM COACHES C
JOIN TEAMS T ON C.TEAM_ID = T.TEAM_ID;

-- List all staff with their team name and sport
SELECT S.STAFF_NAME, S.ROLE, T.TEAM_NAME, S.SPORT_NAME
FROM STAFF S
JOIN TEAMS T ON S.TEAM_ID = T.TEAM_ID;

-- List all coaches or staff who are associated with “Cricket"
SELECT COACH_NAME AS PERSON_NAME, 'Coach' AS ROLE
FROM COACHES
WHERE SPORT_NAME = 'Cricket'
UNION
SELECT STAFF_NAME AS PERSON_NAME, ROLE
FROM STAFF
WHERE SPORT_NAME = 'Cricket';

-- Find the referee with the highest experience
SELECT REFEREE_NAME, EXPERIENCE_YEARS
FROM REFEREES
ORDER BY EXPERIENCE_YEARS DESC
LIMIT 1;

-- List all people (coaches, staff, referees, admins) with their email and role
SELECT COACH_NAME AS NAME, EMAIL, 'Coach' AS ROLE FROM COACHES
UNION
SELECT STAFF_NAME, EMAIL, ROLE FROM STAFF
UNION
SELECT REFEREE_NAME, EMAIL, 'Referee' AS ROLE FROM REFEREES
UNION
SELECT ADMIN_NAME, EMAIL, ROLE FROM ADMINISTRATION;

-- List each player, their team, the sport they play, and the sport’s governing body
SELECT 
    P.PLAYER_NAME,
    T.TEAM_NAME,
    P.SPORT_NAME,
    S.GOVERNING_BODY
FROM 
    PLAYERS P
JOIN 
    TEAMS T ON P.TEAM_ID = T.TEAM_ID
JOIN 
    SPORTS S ON P.SPORT_NAME = S.SPORT_NAME;
    
-- Show full registration details – who registered which team, for what sport, and payment status
SELECT 
    R.REGISTRANT_NAME,
    R.SPORT_NAME,
    R.TEAM_NAME,
    R.AMOUNT AS REG_FEE,
    D.TAX,
    D.AMOUNT_PAID
FROM 
    REGISTRATION R
JOIN 
    RG_DETAILS D ON R.REGISTRATION_ID = D.REGISTRATION_ID;
    
-- Display admin, team, and sport details together
SELECT 
    A.ADMIN_NAME,
    T.TEAM_NAME,
    T.COUNTRY,
    S.SPORT_NAME,
    S.GOVERNING_BODY
FROM 
    ADMINISTRATION A
JOIN 
    TEAMS T ON A.SPORT_NAME = T.SPORT_NAME
JOIN 
    SPORTS S ON A.SPORT_NAME = S.SPORT_NAME
LIMIT 0, 2000;

-- List referees and players associated with the same sport
SELECT 
    R.REFEREE_NAME,
    P.PLAYER_NAME,
    P.PLAYER_AGE,
    P.SPORT_NAME
FROM 
    REFEREES R
JOIN 
    PLAYERS P ON R.SPORT_NAME = P.SPORT_NAME
LIMIT 0, 2000;

-- Display detailed coach-team-player information by sport
SELECT 
    C.COACH_NAME,
    T.TEAM_NAME,
    P.PLAYER_NAME,
    S.SPORT_NAME
FROM 
    COACHES C
JOIN 
    TEAMS T ON C.TEAM_ID = T.TEAM_ID
JOIN 
    PLAYERS P ON T.TEAM_ID = P.TEAM_ID
JOIN 
    SPORTS S ON C.SPORT_NAME = S.SPORT_NAME
WHERE 
    C.SPORT_NAME = P.SPORT_NAME;
    
#adding new queries
-- Insert new sport
INSERT INTO SPORTS (SPORT_ID, SPORT_NAME, GOVERNING_BODY, SPORT_TYPE, PARTICIPATION_FEE, PRIZE_AMOUNT)
VALUES (120, 'Rowing', 'FISA', 'Outdoor Team', 350, 180000);

-- Insert new team
INSERT INTO TEAMS (TEAM_ID, TEAM_CODE, TEAM_NAME, COUNTRY, CAPTAIN_NAME, EMAIL, SPORT_NAME)
VALUES (260, 155, 'UK Rowing Team', 'UK', 'Helen Glover', 'uk_rowing@gmail.com', 'Rowing');

-- Insert new player
INSERT INTO PLAYERS (PLAYER_ID, PLAYER_NAME, PLAYER_AGE, JERSEY_NUMBER, TEAM_ID, SPORT_NAME)
VALUES (510, 'Sophie Lee', 29, 7, 260, 'Rowing');

-- Insert new registration
INSERT INTO REGISTRATION (REGISTRATION_ID, REGISTRANT_NAME, REGISTRANT_EMAIL, SPORT_NAME, TEAM_NAME, CAPTAIN_NAME, AMOUNT)
VALUES (4001, 'Ethan Parker', 'ethan.parker@example.com', 'Rowing', 'UK Rowing Team', 'Helen Glover', 350);

-- Insert new registration details
INSERT INTO RG_DETAILS (REGISTRATION_ID, REGISTRANT_NAME, TEAM_NAME, REGISTRATION_AMOUNT, TAX, AMOUNT_PAID)
VALUES (4001, 'Ethan Parker', 'UK Rowing Team', 350, 35, 385);

-- Insert new coach
INSERT INTO COACHES (COACH_ID, COACH_NAME, COACH_AGE, EXPERIENCE_YEARS, EMAIL, PHONE_NUMBER, TEAM_ID, SPORT_NAME)
VALUES (401, 'Greg Johnson', 44, 18, 'greg.johnson@example.com', '321-654-9871', 260, 'Rowing');

-- Insert new staff
INSERT INTO STAFF (STAFF_ID, STAFF_NAME, ROLE, EMAIL, PHONE_NUMBER, TEAM_ID, SPORT_NAME)
VALUES (501, 'Anna White', 'Physiotherapist', 'anna.white@example.com', '987-654-3211', 260, 'Rowing');

-- Insert new administration
INSERT INTO ADMINISTRATION (ADMIN_ID, ADMIN_NAME, ROLE, EMAIL, PHONE_NUMBER, SPORT_NAME)
VALUES (601, 'John Richards', 'Manager', 'john.richards@example.com', '555-123-4568', 'Rowing');

-- Insert new referee
INSERT INTO REFEREES (REFEREE_ID, REFEREE_NAME, EXPERIENCE_YEARS, CERTIFICATION, EMAIL, PHONE_NUMBER, SPORT_NAME)
VALUES (701, 'Laura Green', 12, 'FISA', 'laura.green@example.com', '555-987-6545', 'Rowing');

#update queries
-- SPORTS: update PARTICIPATION_FEE for Football using SPORT_ID
UPDATE SPORTS SET PARTICIPATION_FEE = 1200 WHERE SPORT_ID = 101;

-- TEAMS: update COUNTRY for Brazil National Football Team using TEAM_ID
UPDATE TEAMS SET COUNTRY = 'Brasil' WHERE TEAM_ID = 211;

-- PLAYERS: update PLAYER_AGE for Neymar Jr using PLAYER_ID
UPDATE PLAYERS SET PLAYER_AGE = 33 WHERE PLAYER_ID = 305;

-- REGISTRATION: update AMOUNT for Rahul Mehta using REGISTRATION_ID
UPDATE REGISTRATION SET AMOUNT = 5500 WHERE REGISTRATION_ID = 1001;

-- RG_DETAILS: update TAX for Rahul Mehta's registration using REGISTRATION_ID
UPDATE RG_DETAILS SET TAX = 550 WHERE REGISTRATION_ID = 1001;

-- COACHES: update EXPERIENCE_YEARS for John Smith using COACH_ID
UPDATE COACHES SET EXPERIENCE_YEARS = 22 WHERE COACH_ID = 301;

-- STAFF: update ROLE for Emily Clark using STAFF_ID
UPDATE STAFF SET ROLE = 'Senior Physiotherapist' WHERE STAFF_ID = 401;

-- ADMINISTRATION: update PHONE_NUMBER for Laura Green using ADMIN_ID
UPDATE ADMINISTRATION SET PHONE_NUMBER = '101-202-3031' WHERE ADMIN_ID = 501;

-- REFEREES: update CERTIFICATION for John Miller using REFEREE_ID
UPDATE REFEREES SET CERTIFICATION = 'FIFA Pro' WHERE REFEREE_ID = 601;

-- Calculate Tax on Registration
SELECT calculate_tax(1000); -- Returns 100;

--  Get Total Prize for a Sport
SELECT get_prize('Football');


-- Count Players in a Team
SELECT team_player_count(201); -- Count players in India Football Club

-- Get Team Sport
SELECT get_team_sport(201); -- Returns "Football"

--  Average Age of Players in a Team
SELECT avg_player_age(201); -- Average age of India Football Club players

-- Get Coach of a Team
SELECT get_coach_name(201); -- Example: "Stephen Constantine"

--  Count Teams in a Sport
SELECT sport_team_count('Football');

-- Auto-calculate Tax & Amount Paid in RG_DETAILS
DELIMITER $$
CREATE TRIGGER trg_after_registration_insert
AFTER INSERT ON REGISTRATION
FOR EACH ROW
BEGIN
DECLARE taxAmt INT;
DECLARE totalAmt INT;
SET taxAmt = calculate_tax(NEW.AMOUNT);
SET totalAmt = NEW.AMOUNT + taxAmt;
INSERT INTO RG_DETAILS(REGISTRATION_ID, REGISTRANT_NAME, TEAM_NAME,
REGISTRATION_AMOUNT, TAX, AMOUNT_PAID)
VALUES (NEW.REGISTRATION_ID, NEW.REGISTRANT_NAME, NEW.TEAM_NAME,
NEW.AMOUNT, taxAmt, totalAmt);
END$$
DELIMITER ;

-- Prevent Duplicate Players in the Same Team
DELIMITER $$
CREATE TRIGGER trg_before_player_insert
BEFORE INSERT ON PLAYERS
FOR EACH ROW
BEGIN
IF EXISTS (
SELECT 1 FROM PLAYERS
WHERE TEAM_ID = NEW.TEAM_ID
AND PLAYER_NAME = NEW.PLAYER_NAME
) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Player already exists in this team!';
END IF;
END$$
DELIMITER ;

-- Auto-assign Default Prize if Missing
DELIMITER $$
CREATE TRIGGER trg_before_sport_insert
BEFORE INSERT ON SPORTS
FOR EACH ROW
BEGIN
IF NEW.PRIZE_AMOUNT IS NULL OR NEW.PRIZE_AMOUNT = 0 THEN
SET NEW.PRIZE_AMOUNT = 100000;
END IF;
END$$
DELIMITER ;

-- Ensure Player Age is Valid
DELIMITER $$
CREATE TRIGGER trg_check_player_age
BEFORE INSERT ON PLAYERS
FOR EACH ROW
BEGIN
IF NEW.PLAYER_AGE < 15 OR NEW.PLAYER_AGE > 50 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Invalid Player Age (must be between 15 and 50)';
END IF;
END$$
DELIMITER ;


















