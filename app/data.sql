INSERT INTO users (username, password, permission) VALUES ('restrictedUser', 'scrypt:32768:8:1$YbPK3ImaHTARze8L$2895b04bf4a253e2b35d1e56c9daa7f993779de128f1e6b9ebb9e03b8fb1c50daa2000993c86a074259d9e85b06f2b2553fda911d5dd977f53d0e18a7c271d54', 'restricted');
INSERT INTO users (username, password, permission) VALUES ('user', 'scrypt:32768:8:1$YbPK3ImaHTARze8L$2895b04bf4a253e2b35d1e56c9daa7f993779de128f1e6b9ebb9e03b8fb1c50daa2000993c86a074259d9e85b06f2b2553fda911d5dd977f53d0e18a7c271d54', 'view');
INSERT INTO users (username, password, permission) VALUES ('admin', 'scrypt:32768:8:1$YbPK3ImaHTARze8L$2895b04bf4a253e2b35d1e56c9daa7f993779de128f1e6b9ebb9e03b8fb1c50daa2000993c86a074259d9e85b06f2b2553fda911d5dd977f53d0e18a7c271d54', 'edit');

INSERT INTO quizzes (quiz_id, title, description) VALUES (1, "Mathematics Basics", "A quiz about mathematics basics.");
INSERT INTO questions (question_id, quiz_id, question) VALUES (1, 1, "What is 2 + 2?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (1, 1, "4");
INSERT INTO answers (answer_id, question_id, answer) VALUES (2, 1, "3");
INSERT INTO answers (answer_id, question_id, answer) VALUES (3, 1, "5");
INSERT INTO answers (answer_id, question_id, answer) VALUES (4, 1, "6");
INSERT INTO questions (question_id, quiz_id, question) VALUES (2, 1, "Simplify: 3 * (2 + 4).");
INSERT INTO answers (answer_id, question_id, answer) VALUES (5, 2, "18");
INSERT INTO answers (answer_id, question_id, answer) VALUES (6, 2, "12");
INSERT INTO answers (answer_id, question_id, answer) VALUES (7, 2, "15");
INSERT INTO answers (answer_id, question_id, answer) VALUES (8, 2, "9");
INSERT INTO questions (question_id, quiz_id, question) VALUES (3, 1, "What is 15 divided by 3?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (9, 3, "5");
INSERT INTO answers (answer_id, question_id, answer) VALUES (10, 3, "3");
INSERT INTO answers (answer_id, question_id, answer) VALUES (11, 3, "4");
INSERT INTO answers (answer_id, question_id, answer) VALUES (12, 3, "6");
INSERT INTO questions (question_id, quiz_id, question) VALUES (4, 1, "What is the square root of 16?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (13, 4, "4");
INSERT INTO answers (answer_id, question_id, answer) VALUES (14, 4, "3");
INSERT INTO answers (answer_id, question_id, answer) VALUES (15, 4, "5");
INSERT INTO answers (answer_id, question_id, answer) VALUES (16, 4, "6");
INSERT INTO questions (question_id, quiz_id, question) VALUES (5, 1, "What is 7 squared?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (17, 5, "49");
INSERT INTO answers (answer_id, question_id, answer) VALUES (18, 5, "42");
INSERT INTO answers (answer_id, question_id, answer) VALUES (19, 5, "36");
INSERT INTO answers (answer_id, question_id, answer) VALUES (20, 5, "56");
INSERT INTO quizzes (quiz_id, title, description) VALUES (2, "World Geography", "A quiz about world geography.");
INSERT INTO questions (question_id, quiz_id, question) VALUES (6, 2, "What is the capital of France?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (21, 6, "Paris");
INSERT INTO answers (answer_id, question_id, answer) VALUES (22, 6, "London");
INSERT INTO answers (answer_id, question_id, answer) VALUES (23, 6, "Berlin");
INSERT INTO answers (answer_id, question_id, answer) VALUES (24, 6, "Rome");
INSERT INTO questions (question_id, quiz_id, question) VALUES (7, 2, "What is the highest mountain?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (25, 7, "Mount Everest");
INSERT INTO answers (answer_id, question_id, answer) VALUES (26, 7, "K2");
INSERT INTO answers (answer_id, question_id, answer) VALUES (27, 7, "Kangchenjunga");
INSERT INTO answers (answer_id, question_id, answer) VALUES (28, 7, "Makalu");
INSERT INTO questions (question_id, quiz_id, question) VALUES (8, 2, "Which continent is Egypt in?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (29, 8, "Africa");
INSERT INTO answers (answer_id, question_id, answer) VALUES (30, 8, "Asia");
INSERT INTO answers (answer_id, question_id, answer) VALUES (31, 8, "Europe");
INSERT INTO answers (answer_id, question_id, answer) VALUES (32, 8, "South America");
INSERT INTO questions (question_id, quiz_id, question) VALUES (9, 2, "Name the longest river in the world.");
INSERT INTO answers (answer_id, question_id, answer) VALUES (33, 9, "Nile");
INSERT INTO answers (answer_id, question_id, answer) VALUES (34, 9, "Amazon");
INSERT INTO answers (answer_id, question_id, answer) VALUES (35, 9, "Yangtze");
INSERT INTO answers (answer_id, question_id, answer) VALUES (36, 9, "Mississippi");
INSERT INTO questions (question_id, quiz_id, question) VALUES (10, 2, "Which country has the most islands?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (37, 10, "Sweden");
INSERT INTO answers (answer_id, question_id, answer) VALUES (38, 10, "Indonesia");
INSERT INTO answers (answer_id, question_id, answer) VALUES (39, 10, "Philippines");
INSERT INTO answers (answer_id, question_id, answer) VALUES (40, 10, "Norway");
INSERT INTO quizzes (quiz_id, title, description) VALUES (3, "Basic Science", "A quiz about basic science.");
INSERT INTO questions (question_id, quiz_id, question) VALUES (11, 3, "Name the force that pulls objects to the Earth.");
INSERT INTO answers (answer_id, question_id, answer) VALUES (41, 11, "Gravity");
INSERT INTO answers (answer_id, question_id, answer) VALUES (42, 11, "Magnetism");
INSERT INTO answers (answer_id, question_id, answer) VALUES (43, 11, "Friction");
INSERT INTO answers (answer_id, question_id, answer) VALUES (44, 11, "Tension");
INSERT INTO questions (question_id, quiz_id, question) VALUES (12, 3, "What is H2O commonly known as?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (45, 12, "Water");
INSERT INTO answers (answer_id, question_id, answer) VALUES (46, 12, "Oxygen");
INSERT INTO answers (answer_id, question_id, answer) VALUES (47, 12, "Hydrogen");
INSERT INTO answers (answer_id, question_id, answer) VALUES (48, 12, "Salt");
INSERT INTO questions (question_id, quiz_id, question) VALUES (13, 3, "What organ pumps blood?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (49, 13, "Heart");
INSERT INTO answers (answer_id, question_id, answer) VALUES (50, 13, "Liver");
INSERT INTO answers (answer_id, question_id, answer) VALUES (51, 13, "Kidney");
INSERT INTO answers (answer_id, question_id, answer) VALUES (52, 13, "Lungs");
INSERT INTO questions (question_id, quiz_id, question) VALUES (14, 3, "What is the process plants use to make food?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (53, 14, "Photosynthesis");
INSERT INTO answers (answer_id, question_id, answer) VALUES (54, 14, "Respiration");
INSERT INTO answers (answer_id, question_id, answer) VALUES (55, 14, "Digestion");
INSERT INTO answers (answer_id, question_id, answer) VALUES (56, 14, "Fermentation");
INSERT INTO questions (question_id, quiz_id, question) VALUES (15, 3, "What gas do humans exhale?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (57, 15, "Carbon dioxide");
INSERT INTO answers (answer_id, question_id, answer) VALUES (58, 15, "Oxygen");
INSERT INTO answers (answer_id, question_id, answer) VALUES (59, 15, "Nitrogen");
INSERT INTO answers (answer_id, question_id, answer) VALUES (60, 15, "Helium");
INSERT INTO quizzes (quiz_id, title, description) VALUES (4, "English Grammar", "A quiz about english grammar.");
INSERT INTO questions (question_id, quiz_id, question) VALUES (16, 4, "What is the past tense of 'go'?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (61, 16, "Went");
INSERT INTO answers (answer_id, question_id, answer) VALUES (62, 16, "Gone");
INSERT INTO answers (answer_id, question_id, answer) VALUES (63, 16, "Goes");
INSERT INTO answers (answer_id, question_id, answer) VALUES (64, 16, "Going");
INSERT INTO questions (question_id, quiz_id, question) VALUES (17, 4, "What is the subject of a sentence?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (65, 17, "The main focus of the sentence");
INSERT INTO answers (answer_id, question_id, answer) VALUES (66, 17, "The action performed");
INSERT INTO answers (answer_id, question_id, answer) VALUES (67, 17, "A descriptive word");
INSERT INTO answers (answer_id, question_id, answer) VALUES (68, 17, "A joining word");
INSERT INTO questions (question_id, quiz_id, question) VALUES (18, 4, "What is a noun?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (69, 18, "A word for a person, place, or thing");
INSERT INTO answers (answer_id, question_id, answer) VALUES (70, 18, "An action word");
INSERT INTO answers (answer_id, question_id, answer) VALUES (71, 18, "A describing word");
INSERT INTO answers (answer_id, question_id, answer) VALUES (72, 18, "A joining word");
INSERT INTO questions (question_id, quiz_id, question) VALUES (19, 4, "Give an example of a verb.");
INSERT INTO answers (answer_id, question_id, answer) VALUES (73, 19, "Run");
INSERT INTO answers (answer_id, question_id, answer) VALUES (74, 19, "Beautiful");
INSERT INTO answers (answer_id, question_id, answer) VALUES (75, 19, "Fast");
INSERT INTO answers (answer_id, question_id, answer) VALUES (76, 19, "Happy");
INSERT INTO questions (question_id, quiz_id, question) VALUES (20, 4, "Define an adjective.");
INSERT INTO answers (answer_id, question_id, answer) VALUES (77, 20, "A word that describes a noun");
INSERT INTO answers (answer_id, question_id, answer) VALUES (78, 20, "A word that shows action");
INSERT INTO answers (answer_id, question_id, answer) VALUES (79, 20, "A word that connects clauses");
INSERT INTO answers (answer_id, question_id, answer) VALUES (80, 20, "A word for a place");
INSERT INTO quizzes (quiz_id, title, description) VALUES (5, "History of America", "A quiz about history of america.");
INSERT INTO questions (question_id, quiz_id, question) VALUES (21, 5, "What is the Civil War?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (81, 21, "A war within the same country");
INSERT INTO answers (answer_id, question_id, answer) VALUES (82, 21, "A war between countries");
INSERT INTO answers (answer_id, question_id, answer) VALUES (83, 21, "A war for independence");
INSERT INTO answers (answer_id, question_id, answer) VALUES (84, 21, "A world war");
INSERT INTO questions (question_id, quiz_id, question) VALUES (22, 5, "Who was the first President of the United States?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (85, 22, "George Washington");
INSERT INTO answers (answer_id, question_id, answer) VALUES (86, 22, "Thomas Jefferson");
INSERT INTO answers (answer_id, question_id, answer) VALUES (87, 22, "Abraham Lincoln");
INSERT INTO answers (answer_id, question_id, answer) VALUES (88, 22, "John Adams");
INSERT INTO questions (question_id, quiz_id, question) VALUES (23, 5, "What was the Louisiana Purchase?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (89, 23, "A land purchase from France");
INSERT INTO answers (answer_id, question_id, answer) VALUES (90, 23, "A treaty with Britain");
INSERT INTO answers (answer_id, question_id, answer) VALUES (91, 23, "A war for Texas");
INSERT INTO answers (answer_id, question_id, answer) VALUES (92, 23, "A trade agreement with Spain");
INSERT INTO questions (question_id, quiz_id, question) VALUES (24, 5, "What year was the Declaration of Independence signed?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (93, 24, "1776");
INSERT INTO answers (answer_id, question_id, answer) VALUES (94, 24, "1789");
INSERT INTO answers (answer_id, question_id, answer) VALUES (95, 24, "1812");
INSERT INTO answers (answer_id, question_id, answer) VALUES (96, 24, "1492");
INSERT INTO questions (question_id, quiz_id, question) VALUES (25, 5, "Who discovered America?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (97, 25, "Christopher Columbus");
INSERT INTO answers (answer_id, question_id, answer) VALUES (98, 25, "Leif Erikson");
INSERT INTO answers (answer_id, question_id, answer) VALUES (99, 25, "Ferdinand Magellan");
INSERT INTO answers (answer_id, question_id, answer) VALUES (100, 25, "Marco Polo");
INSERT INTO quizzes (quiz_id, title, description) VALUES (6, "Introduction to Physics", "A quiz about introduction to physics.");
INSERT INTO questions (question_id, quiz_id, question) VALUES (26, 6, "What is acceleration?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (101, 26, "The rate of change of velocity");
INSERT INTO answers (answer_id, question_id, answer) VALUES (102, 26, "The total distance covered");
INSERT INTO answers (answer_id, question_id, answer) VALUES (103, 26, "The time taken for motion");
INSERT INTO answers (answer_id, question_id, answer) VALUES (104, 26, "The force applied");
INSERT INTO questions (question_id, quiz_id, question) VALUES (27, 6, "What is Newton's first law?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (105, 27, "An object in motion stays in motion");
INSERT INTO answers (answer_id, question_id, answer) VALUES (106, 27, "For every action, there is an equal reaction");
INSERT INTO answers (answer_id, question_id, answer) VALUES (107, 27, "Energy cannot be created or destroyed");
INSERT INTO answers (answer_id, question_id, answer) VALUES (108, 27, "Objects attract each other");
INSERT INTO questions (question_id, quiz_id, question) VALUES (28, 6, "What is the unit of force?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (109, 28, "Newton");
INSERT INTO answers (answer_id, question_id, answer) VALUES (110, 28, "Joule");
INSERT INTO answers (answer_id, question_id, answer) VALUES (111, 28, "Watt");
INSERT INTO answers (answer_id, question_id, answer) VALUES (112, 28, "Pascal");
INSERT INTO questions (question_id, quiz_id, question) VALUES (29, 6, "What does a thermometer measure?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (113, 29, "Temperature");
INSERT INTO answers (answer_id, question_id, answer) VALUES (114, 29, "Pressure");
INSERT INTO answers (answer_id, question_id, answer) VALUES (115, 29, "Force");
INSERT INTO answers (answer_id, question_id, answer) VALUES (116, 29, "Volume");
INSERT INTO questions (question_id, quiz_id, question) VALUES (30, 6, "Define velocity.");
INSERT INTO answers (answer_id, question_id, answer) VALUES (117, 30, "Speed in a given direction");
INSERT INTO answers (answer_id, question_id, answer) VALUES (118, 30, "The rate of work done");
INSERT INTO answers (answer_id, question_id, answer) VALUES (119, 30, "Distance traveled");
INSERT INTO answers (answer_id, question_id, answer) VALUES (120, 30, "Energy of motion");
INSERT INTO quizzes (quiz_id, title, description) VALUES (7, "World Capitals", "A quiz about world capitals.");
INSERT INTO questions (question_id, quiz_id, question) VALUES (31, 7, "What is the capital of Canada?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (121, 31, "Ottawa");
INSERT INTO answers (answer_id, question_id, answer) VALUES (122, 31, "Toronto");
INSERT INTO answers (answer_id, question_id, answer) VALUES (123, 31, "Vancouver");
INSERT INTO answers (answer_id, question_id, answer) VALUES (124, 31, "Montreal");
INSERT INTO questions (question_id, quiz_id, question) VALUES (32, 7, "What is the capital of Australia?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (125, 32, "Canberra");
INSERT INTO answers (answer_id, question_id, answer) VALUES (126, 32, "Sydney");
INSERT INTO answers (answer_id, question_id, answer) VALUES (127, 32, "Melbourne");
INSERT INTO answers (answer_id, question_id, answer) VALUES (128, 32, "Brisbane");
INSERT INTO questions (question_id, quiz_id, question) VALUES (33, 7, "What is the capital of Brazil?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (129, 33, "Brasilia");
INSERT INTO answers (answer_id, question_id, answer) VALUES (130, 33, "Rio de Janeiro");
INSERT INTO answers (answer_id, question_id, answer) VALUES (131, 33, "Sao Paulo");
INSERT INTO answers (answer_id, question_id, answer) VALUES (132, 33, "Salvador");
INSERT INTO questions (question_id, quiz_id, question) VALUES (34, 7, "What is the capital of Germany?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (133, 34, "Berlin");
INSERT INTO answers (answer_id, question_id, answer) VALUES (134, 34, "Munich");
INSERT INTO answers (answer_id, question_id, answer) VALUES (135, 34, "Frankfurt");
INSERT INTO answers (answer_id, question_id, answer) VALUES (136, 34, "Hamburg");
INSERT INTO questions (question_id, quiz_id, question) VALUES (35, 7, "What is the capital of Japan?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (137, 35, "Tokyo");
INSERT INTO answers (answer_id, question_id, answer) VALUES (138, 35, "Kyoto");
INSERT INTO answers (answer_id, question_id, answer) VALUES (139, 35, "Osaka");
INSERT INTO answers (answer_id, question_id, answer) VALUES (140, 35, "Hiroshima");
INSERT INTO quizzes (quiz_id, title, description) VALUES (8, "Algebra Fundamentals", "A quiz about algebra fundamentals.");
INSERT INTO questions (question_id, quiz_id, question) VALUES (36, 8, "What is the value of x if 2x = 10?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (141, 36, "x = 5");
INSERT INTO answers (answer_id, question_id, answer) VALUES (142, 36, "x = 10");
INSERT INTO answers (answer_id, question_id, answer) VALUES (143, 36, "x = 2");
INSERT INTO answers (answer_id, question_id, answer) VALUES (144, 36, "x = 20");
INSERT INTO questions (question_id, quiz_id, question) VALUES (37, 8, "Define a variable in mathematics.");
INSERT INTO answers (answer_id, question_id, answer) VALUES (145, 37, "A symbol that represents a value");
INSERT INTO answers (answer_id, question_id, answer) VALUES (146, 37, "A number");
INSERT INTO answers (answer_id, question_id, answer) VALUES (147, 37, "A constant");
INSERT INTO answers (answer_id, question_id, answer) VALUES (148, 37, "An equation");
INSERT INTO questions (question_id, quiz_id, question) VALUES (38, 8, "What is an equation?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (149, 38, "A mathematical statement with an equals sign");
INSERT INTO answers (answer_id, question_id, answer) VALUES (150, 38, "A number");
INSERT INTO answers (answer_id, question_id, answer) VALUES (151, 38, "A variable");
INSERT INTO answers (answer_id, question_id, answer) VALUES (152, 38, "A function");
INSERT INTO questions (question_id, quiz_id, question) VALUES (39, 8, "Solve: x + 2 = 5.");
INSERT INTO answers (answer_id, question_id, answer) VALUES (153, 39, "x = 3");
INSERT INTO answers (answer_id, question_id, answer) VALUES (154, 39, "x = 2");
INSERT INTO answers (answer_id, question_id, answer) VALUES (155, 39, "x = 5");
INSERT INTO answers (answer_id, question_id, answer) VALUES (156, 39, "x = 4");
INSERT INTO questions (question_id, quiz_id, question) VALUES (40, 8, "Simplify: 4x - 2x.");
INSERT INTO answers (answer_id, question_id, answer) VALUES (157, 40, "2x");
INSERT INTO answers (answer_id, question_id, answer) VALUES (158, 40, "4x");
INSERT INTO answers (answer_id, question_id, answer) VALUES (159, 40, "6x");
INSERT INTO answers (answer_id, question_id, answer) VALUES (160, 40, "8x");
INSERT INTO quizzes (quiz_id, title, description) VALUES (9, "Biology Essentials", "A quiz about biology essentials.");
INSERT INTO questions (question_id, quiz_id, question) VALUES (41, 9, "What organelle is known as the powerhouse of the cell?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (161, 41, "Mitochondria");
INSERT INTO answers (answer_id, question_id, answer) VALUES (162, 41, "Nucleus");
INSERT INTO answers (answer_id, question_id, answer) VALUES (163, 41, "Ribosome");
INSERT INTO answers (answer_id, question_id, answer) VALUES (164, 41, "Chloroplast");
INSERT INTO questions (question_id, quiz_id, question) VALUES (42, 9, "Name the bones in the arm.");
INSERT INTO answers (answer_id, question_id, answer) VALUES (165, 42, "Humerus, radius, ulna");
INSERT INTO answers (answer_id, question_id, answer) VALUES (166, 42, "Femur, tibia, fibula");
INSERT INTO answers (answer_id, question_id, answer) VALUES (167, 42, "Clavicle, scapula, sternum");
INSERT INTO answers (answer_id, question_id, answer) VALUES (168, 42, "Pelvis, sacrum, coccyx");
INSERT INTO questions (question_id, quiz_id, question) VALUES (43, 9, "What is the basic unit of life?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (169, 43, "The cell");
INSERT INTO answers (answer_id, question_id, answer) VALUES (170, 43, "The atom");
INSERT INTO answers (answer_id, question_id, answer) VALUES (171, 43, "The organ");
INSERT INTO answers (answer_id, question_id, answer) VALUES (172, 43, "The tissue");
INSERT INTO questions (question_id, quiz_id, question) VALUES (44, 9, "What is photosynthesis?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (173, 44, "The process plants use to make food");
INSERT INTO answers (answer_id, question_id, answer) VALUES (174, 44, "The breakdown of sugars");
INSERT INTO answers (answer_id, question_id, answer) VALUES (175, 44, "The process animals use for energy");
INSERT INTO answers (answer_id, question_id, answer) VALUES (176, 44, "The evaporation of water");
INSERT INTO questions (question_id, quiz_id, question) VALUES (45, 9, "What is the largest organ in the human body?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (177, 45, "Skin");
INSERT INTO answers (answer_id, question_id, answer) VALUES (178, 45, "Heart");
INSERT INTO answers (answer_id, question_id, answer) VALUES (179, 45, "Liver");
INSERT INTO answers (answer_id, question_id, answer) VALUES (180, 45, "Lung");
INSERT INTO quizzes (quiz_id, title, description) VALUES (10, "Chemistry Basics", "A quiz about chemistry basics.");
INSERT INTO questions (question_id, quiz_id, question) VALUES (46, 10, "What is the atomic number of hydrogen?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (181, 46, "1");
INSERT INTO answers (answer_id, question_id, answer) VALUES (182, 46, "2");
INSERT INTO answers (answer_id, question_id, answer) VALUES (183, 46, "3");
INSERT INTO answers (answer_id, question_id, answer) VALUES (184, 46, "4");
INSERT INTO questions (question_id, quiz_id, question) VALUES (47, 10, "What is a molecule?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (185, 47, "A group of atoms bonded together");
INSERT INTO answers (answer_id, question_id, answer) VALUES (186, 47, "A single atom");
INSERT INTO answers (answer_id, question_id, answer) VALUES (187, 47, "A solution");
INSERT INTO answers (answer_id, question_id, answer) VALUES (188, 47, "An element");
INSERT INTO questions (question_id, quiz_id, question) VALUES (48, 10, "Define an element.");
INSERT INTO answers (answer_id, question_id, answer) VALUES (189, 48, "A pure substance of one type of atom");
INSERT INTO answers (answer_id, question_id, answer) VALUES (190, 48, "A mixture");
INSERT INTO answers (answer_id, question_id, answer) VALUES (191, 48, "A compound");
INSERT INTO answers (answer_id, question_id, answer) VALUES (192, 48, "A molecule");
INSERT INTO questions (question_id, quiz_id, question) VALUES (49, 10, "What is the chemical symbol for gold?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (193, 49, "Au");
INSERT INTO answers (answer_id, question_id, answer) VALUES (194, 49, "Ag");
INSERT INTO answers (answer_id, question_id, answer) VALUES (195, 49, "Pb");
INSERT INTO answers (answer_id, question_id, answer) VALUES (196, 49, "Fe");
INSERT INTO questions (question_id, quiz_id, question) VALUES (50, 10, "What is the pH of pure water?");
INSERT INTO answers (answer_id, question_id, answer) VALUES (197, 50, "7");
INSERT INTO answers (answer_id, question_id, answer) VALUES (198, 50, "6");
INSERT INTO answers (answer_id, question_id, answer) VALUES (199, 50, "8");
INSERT INTO answers (answer_id, question_id, answer) VALUES (200, 50, "5");