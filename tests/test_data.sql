-- Users
INSERT INTO users (username, password, permission)
VALUES
  ('testRestrictedUser', 'scrypt:32768:8:1$Tqy9glj9LGM8NU58$6f9eb2daa1c78c02514106d00c1b559f77fb95161ac3791d7c4dbce86a84f8e9a8bb49fa438dd2a22c8ff734a5867bd69b0835ff552abff1613b057e2c784750', 'restricted'),
  ('testUser', 'scrypt:32768:8:1$Tqy9glj9LGM8NU58$6f9eb2daa1c78c02514106d00c1b559f77fb95161ac3791d7c4dbce86a84f8e9a8bb49fa438dd2a22c8ff734a5867bd69b0835ff552abff1613b057e2c784750', 'view'),
  ('testAdmin', 'scrypt:32768:8:1$Tqy9glj9LGM8NU58$6f9eb2daa1c78c02514106d00c1b559f77fb95161ac3791d7c4dbce86a84f8e9a8bb49fa438dd2a22c8ff734a5867bd69b0835ff552abff1613b057e2c784750', 'edit');

-- Maths Quiz
INSERT INTO quizzes (title, description) VALUES ('Maths Quiz', 'The first quiz in the system!');
INSERT INTO questions (quiz_id, question) VALUES (1, 'What is 1 + 1?');
INSERT INTO answers (question_id, answer) VALUES (1, '1');
INSERT INTO answers (question_id, answer) VALUES (1, '2');
INSERT INTO answers (question_id, answer) VALUES (1, '3');
INSERT INTO questions (quiz_id, question) VALUES (1, 'What is 6 x 5?');
INSERT INTO answers (question_id, answer) VALUES (2, '10');
INSERT INTO answers (question_id, answer) VALUES (2, '20');
INSERT INTO answers (question_id, answer) VALUES (2, '30');
INSERT INTO answers (question_id, answer) VALUES (2, '60');
INSERT INTO questions (quiz_id, question) VALUES (1, 'What is 1 ^ 3?');
INSERT INTO answers (question_id, answer) VALUES (3, '1');
INSERT INTO answers (question_id, answer) VALUES (3, '2');
INSERT INTO answers (question_id, answer) VALUES (3, '3');

-- Geography Quiz
INSERT INTO quizzes (title, description) VALUES ('Geography Quiz', 'Testing if you know the countries - by Arron');
INSERT INTO questions (quiz_id, question) VALUES (2, "What is the capital of France?");
INSERT INTO answers (question_id, answer) VALUES (4, "Paris");
INSERT INTO answers (question_id, answer) VALUES (4, "London");
INSERT INTO answers (question_id, answer) VALUES (4, "Berlin");
INSERT INTO answers (question_id, answer) VALUES (4, "Rome");
INSERT INTO questions (quiz_id, question) VALUES (2, "What is the highest mountain?");
INSERT INTO answers (question_id, answer) VALUES (5, "Mount Everest");
INSERT INTO answers (question_id, answer) VALUES (5, "K2");
INSERT INTO answers (question_id, answer) VALUES (5, "Kangchenjunga");
INSERT INTO answers (question_id, answer) VALUES (5, "Makalu");
INSERT INTO questions (quiz_id, question) VALUES (2, "Which continent is Egypt in?");
INSERT INTO answers (question_id, answer) VALUES (6, "Africa");
INSERT INTO answers (question_id, answer) VALUES (6, "Asia");
INSERT INTO answers (question_id, answer) VALUES (6, "Europe");
INSERT INTO answers (question_id, answer) VALUES (6, "South America");
