"""
    Module for testing the question page
"""

def test_question(client, auth):
    """
        GIVEN a logged-in user with 'view' permission
        WHEN the user selects a question
        THEN the user shall be shown the question page for that question
    """
    auth.login('testUser')
    response = client.get('/quiz-manager/quiz/2/question/4')

    assert response.status_code == 200
    assert b'Quiz Manager' in response.data
    assert b'testUser' in response.data
    assert b'Log Out' in response.data
    assert b'What is the capital of France?' in response.data
    assert b'Paris' in response.data
    assert b'London' in response.data


def test_invalid_question(client, auth):
    """
        GIVEN a logged-in user
        WHEN the user goes to the question page with an invalid question id
        THEN the user shall be shown the Page Not Found with a 404 error
    """
    auth.login()
    response = client.get('/quiz-manager/quiz/1/question/99')

    assert response.status_code == 404
    assert b'Page Not Found' in response.data
    assert b'Edit Quiz' not in response.data
    

def test_restricted_user_cant_access_question(client, auth):
    """
        GIVEN a logged-in user with 'restricted' permission
        WHEN the user tries to view the question page
        THEN they will not be allowed
    """

    auth.login('testRestrictedUser')
    response = client.get('/quiz-manager/quiz/1/question/1')
    
    assert response.status_code == 403
    assert b'Permission Denied' in response.data


def test_get_add_answer(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user selects the add answer button
        THEN the user shall be shown the add answer page
    """
    auth.login()
    response = client.get('/quiz-manager/quiz/1/question/1/answer/add')

    assert response.status_code == 200
    assert b'Add Answer' in response.data
    assert b'Save' in response.data


def test_get_invalid_add_answer(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user goes to the add answer page with an invalid question id
        THEN the user shall be shown the Page Not Found with a 404 error
    """
    auth.login()
    response = client.get('/quiz-manager/quiz/1/question/99/answer/add')

    assert response.status_code == 404
    assert b'Page Not Found' in response.data
    assert b'Add Answer' not in response.data


def test_post_add_answer(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user submits an add answer form
        THEN the user shall be redirected to the Question page and the answer shall be added
    """
    auth.login()
    data = {
        "answer": "Hong Kong"
    }
    response = client.post('/quiz-manager/quiz/2/question/4/answer/add', data=data)

    assert response.status_code == 302
    assert response.headers['Location'] == '/quiz-manager/quiz/2/question/4'

    response = client.get('/quiz-manager/quiz/2/question/4')

    assert b'Answer added:' in response.data
    assert b'What is the capital of France?' in response.data
    assert b'<li>Hong Kong</li>' in response.data


def test_normal_user_cant_add_answer(client, auth):
    """
        GIVEN a logged-in user with 'view' permission
        WHEN the user tries to add an answer
        THEN they will not be allowed
    """
    auth.login('testUser')
    response = client.get('/quiz-manager/quiz/1/question/1/answer/add')
    
    assert response.status_code == 403
    assert b'Permission Denied' in response.data
    
    data = { "answer": "Hong Kong" }
    response = client.post('/quiz-manager/quiz/1/question/1/answer/add', data=data)

    assert response.status_code == 403
    assert b'Permission Denied' in response.data


def test_get_edit_answer(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user selects the edit answer button
        THEN the user shall be shown the edit answer page for that answer
    """
    auth.login()
    response = client.get('/quiz-manager/quiz/2/question/4/answer/11/edit')

    assert response.status_code == 200
    assert b'Edit Answer' in response.data
    assert b'Paris' in response.data
    assert b'Save' in response.data


def test_get_invalid_edit_answer(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user goes to the edit answer page with an invalid answer id
        THEN the user shall be shown the Page Not Found with a 404 error
    """
    auth.login()
    response = client.get('/quiz-manager/quiz/1/question/1/answer/99/edit')

    assert response.status_code == 404
    assert b'Page Not Found' in response.data
    assert b'Edit Answer' not in response.data


def test_post_edit_answer(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user submits an update answer form
        THEN the user shall be redirected to the question page and the answer shall be updated
    """
    auth.login()
    data = { "answer": "Sydney" }
    response = client.post('/quiz-manager/quiz/2/question/4/answer/11/edit', data=data)

    assert response.status_code == 302
    assert response.headers['Location'] == '/quiz-manager/quiz/2/question/4'

    response = client.get('/quiz-manager/quiz/2/question/4')

    assert b'Answer updated:' in response.data
    assert b'What is the capital of France?' in response.data
    assert b'<li>Sydney</li>' in response.data
    assert b'Paris' not in response.data


def test_normal_user_cant_edit_answer(client, auth):
    """
        GIVEN a logged-in user with 'view' permission
        WHEN the user tries to edit an answer
        THEN they will not be allowed
    """
    auth.login('testUser')
    response = client.get('/quiz-manager/quiz/1/question/1/answer/1/edit')
    
    assert response.status_code == 403
    assert b'Permission Denied' in response.data
    
    data = { "answer": "Sydney" }
    response = client.post('/quiz-manager/quiz/1/question/1/answer/1/edit', data=data)

    assert response.status_code == 403
    assert b'Permission Denied' in response.data


def test_delete_answer(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user deletes an answer
        THEN the user is redirected back to all question page and the answer is deleted
    """
    auth.login()
    response = client.get('/quiz-manager/quiz/2/question/4/answer/11/delete')
    
    assert response.headers['Location'] == '/quiz-manager/quiz/2/question/4'
    
    response = client.get('/quiz-manager/quiz/2/question/4')
    
    assert b'Answer deleted:' in response.data
    assert b'What is the capital of France?' in response.data
    assert b'<li>Paris</li>' not in response.data
    assert b'<li>London</li>' in response.data


def test_normal_user_cant_delete_answer(client, auth):
    """
        GIVEN a logged-in user with 'view' permission
        WHEN the user tries to delete an answer
        THEN they will not be allowed
    """
    auth.login('testUser')
    response = client.get('/quiz-manager/quiz/1/question/1/answer/1/delete')
    
    assert response.status_code == 403
    assert b'Permission Denied' in response.data