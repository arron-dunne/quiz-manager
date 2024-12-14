"""
    Module for testing the questions
"""

def test_quiz(client, auth):
    """
        GIVEN a logged-in user with 'restricted' and test data
        WHEN the user selects a quiz
        THEN the user shall be shown the quiz page for that quiz
    """
    auth.login('testRestrictedUser')
    response = client.get('/quiz-manager/quiz/1')
    assert response.status_code == 200
    assert b'Quiz Manager' in response.data
    assert b'testRestrictedUser' in response.data
    assert b'Log Out' in response.data
    assert b'Maths Quiz' in response.data
    assert b'What is 1 + 1?' in response.data
    assert b'What is 6 x 5?' in response.data
    assert b'What is 1 ^ 3?' in response.data
    

def test_invalid_quiz(client, auth):
    """
        GIVEN a logged-in user
        WHEN the user goes to the quiz page with an invalid quiz id
        THEN the user shall be shown the Page Not Found with a 404 error
    """
    auth.login()
    response = client.get('/quiz-manager/quiz/99')

    assert response.status_code == 404
    assert b'Page Not Found' in response.data


def test_get_add_question(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user selects the add question button
        THEN the user shall be shown the add question page
    """
    auth.login()
    response = client.get('/quiz-manager/quiz/1/question/add')

    assert response.status_code == 200
    assert b'Add Question' in response.data
    assert b'Save' in response.data


def test_post_add_question(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user submits an add question form
        THEN the user shall be redirected to the Quiz page and the question shall be added
    """
    auth.login()
    data = {
        "question": "What is the square root of -1?"
    }
    response = client.post('/quiz-manager/quiz/1/question/add', data=data)

    assert response.status_code == 302
    assert response.headers['Location'] == '/quiz-manager/quiz/1'

    response = client.get('/quiz-manager/quiz/1')

    assert b'Question added:' in response.data
    assert b'Maths Quiz' in response.data
    assert b'What is the square root of -1?</a>' in response.data


def test_normal_user_cant_add_question(client, auth):
    """
        GIVEN a logged-in user with 'view' permission
        WHEN the user tries to add a question
        THEN they will not be allowed
    """

    auth.login('testUser')
    response = client.get('/quiz-manager/quiz/1/question/add')
    
    assert response.status_code == 403
    assert b'Permission Denied' in response.data
    
    data = {
        "question": "What is the square root of -1?"
    }
    response = client.post('/quiz-manager/quiz/1/question/add', data=data)

    assert response.status_code == 403
    assert b'Permission Denied' in response.data


def test_get_edit_question(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user selects the edit question button
        THEN the user shall be shown the edit question page for that question
    """
    auth.login()
    response = client.get('/quiz-manager/quiz/1/question/1/edit')

    assert response.status_code == 200
    assert b'Edit Question' in response.data
    assert b'What is 1 + 1?' in response.data
    assert b'Save' in response.data


def test_get_invalid_edit_question(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user goes to the edit question page with an invalid question id
        THEN the user shall be shown the Page Not Found with a 404 error
    """
    auth.login()
    response = client.get('/quiz-manager/quiz/1/question/99/edit')

    assert response.status_code == 404
    assert b'Page Not Found' in response.data
    assert b'Edit Question' not in response.data


def test_post_edit_question(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user submits an update form
        THEN the user shall be redirected to the Quiz page and the question shall be updated
    """
    auth.login()
    data = {
        "question": "What is 4 + 3 + 2 + 1?"
    }
    response = client.post('/quiz-manager/quiz/1/question/1/edit', data=data)

    assert response.status_code == 302
    assert response.headers['Location'] == '/quiz-manager/quiz/1'

    response = client.get('/quiz-manager/quiz/1')

    assert b'Question updated:' in response.data
    assert b'Maths Quiz' in response.data
    assert b'What is 4 + 3 + 2 + 1?</a' in response.data
    assert b'What is 1 + 1?</a>' not in response.data


def test_normal_user_cant_edit_question(client, auth):
    """
        GIVEN a logged-in user with 'view' permission
        WHEN the user tries to edit a question
        THEN they will not be allowed
    """

    auth.login('testUser')
    response = client.get('/quiz-manager/quiz/1/question/1/edit')
    
    assert response.status_code == 403
    assert b'Permission Denied' in response.data
    
    data = {
        "question": "What is 4 + 3 + 2 + 1?"
    }
    response = client.post('/quiz-manager/quiz/1/question/1/edit', data=data)

    assert response.status_code == 403
    assert b'Permission Denied' in response.data


def test_delete_question(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user deletes a question
        THEN the user is redirected back to all quizzes page and the quiz is deleted
    """

    auth.login()
    response = client.get('/quiz-manager/quiz/1/question/2/delete')
    
    assert response.headers['Location'] == '/quiz-manager/quiz/1'
    
    response = client.get('/quiz-manager/quiz/1')
    
    assert b'Question deleted:' in response.data
    assert b'Maths Quiz' in response.data
    assert b'What is 6 x 5?</a>' not in response.data
    assert b'What is 1 + 1?' in response.data


def test_normal_user_cant_delete_question(client, auth):
    """
        GIVEN a logged-in user with 'view' permission
        WHEN the user tries to delete a question
        THEN they will not be allowed
    """

    auth.login('testUser')
    response = client.get('/quiz-manager/quiz/1/question/1/delete')
    
    assert response.status_code == 403
    assert b'Permission Denied' in response.data