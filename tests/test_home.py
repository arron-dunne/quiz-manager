"""
    Module for testing the quizzes
"""

def test_root(client, auth):
    """
        GIVEN a logged-in user
        WHEN the user goes to the root URL
        THEN they will be redirected to the home page
    """

    auth.login()
    response = client.get('/', follow_redirects=True)
    
    assert response.status_code == 200
    assert response.request.path == '/quiz-manager/'
    assert b'All Quizzes' in response.data


def test_non_existent_page(client, auth):
    """
        GIVEN a logged-in user
        WHEN the user goes to a URL which doesn't exist
        THEN they will be shown a Not Found Error
    """
    auth.login()
    response = client.get('/not/a/real/path')

    assert response.status_code == 404
    assert b'Page Not Found' in response.data


def test_home(client, auth):
    """
        GIVEN a logged-in user and test data
        WHEN the user goes to the Home Page URL
        THEN the user shall be shown the Home Page and Quiz data
    """
    auth.login()
    response = client.get('/quiz-manager/')
    
    assert response.status_code == 200
    assert b'Log Out' in response.data
    assert b'Hello, testAdmin' in response.data
    assert b'All Quizzes' in response.data
    assert b'Maths Quiz' in response.data


def test_get_add_quiz(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user selects the add quiz button
        THEN the user shall be shown the add quiz page
    """
    auth.login()
    response = client.get('/quiz-manager/quiz/add')

    assert response.status_code == 200
    assert b'Add Quiz' in response.data
    assert b'Title' in response.data
    assert b'Description' in response.data


def test_post_add_quiz(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user submits an add quiz form
        THEN the user shall be redirected to the All Quizzes page and the quiz shall be added
    """
    auth.login()
    data = {
        "title": "Brand New Science Test", 
        "description": "Covering cutting edge science"
    }
    response = client.post('/quiz-manager/quiz/add', data=data)

    assert response.status_code == 302
    assert response.headers['Location'] == '/quiz-manager/'

    response = client.get('/quiz-manager/')

    assert b'Quiz added:' in response.data
    assert b'Brand New Science Test</a>' in response.data
    assert b'Covering cutting edge science</p>' in response.data


def test_normal_user_cant_add_quiz(client, auth):
    """
        GIVEN a logged-in user with 'view' permission
        WHEN the user tries to add a quiz
        THEN they will not be allowed
    """

    auth.login('testUser')
    response = client.get('/quiz-manager/quiz/add')
    
    assert response.status_code == 403
    assert b'Permission Denied' in response.data
    
    data = {
        "title": "Brand New Science Test", 
        "description": "Covering cutting edge science"
    }
    response = client.post('/quiz-manager/quiz/add', data=data)

    assert response.status_code == 403
    assert b'Permission Denied' in response.data


def test_get_edit_quiz(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user selects the edit quiz button
        THEN the user shall be shown the edit quiz page for that quiz
    """
    auth.login()
    response = client.get('/quiz-manager/quiz/1/edit')

    assert response.status_code == 200
    assert b'Edit Quiz' in response.data
    assert b'Maths Quiz' in response.data
    assert b'The first quiz in the system!' in response.data


def test_get_invalid_edit_quiz(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user goes to the edit page with an invalid quiz id
        THEN the user shall be shown the Page Not Found with a 404 error
    """
    auth.login()
    response = client.get('/quiz-manager/quiz/99/edit')

    assert response.status_code == 404
    assert b'Page Not Found' in response.data
    assert b'Edit Quiz' not in response.data


def test_post_edit_quiz(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user submits an update form
        THEN the user shall be redirected to the All Quizzes page and the quiz shall be updated
    """
    auth.login()
    data = {
        "title": "Updated Maths Test", 
        "description": "Updated and better than ever"
    }
    response = client.post('/quiz-manager/quiz/1/edit', data=data)

    assert response.status_code == 302
    assert response.headers['Location'] == '/quiz-manager/'

    response = client.get('/quiz-manager/')

    assert b'Quiz updated:' in response.data
    assert b'Updated Maths Test</a>' in response.data
    assert b'Updated and better than ever</p>' in response.data


def test_normal_user_cant_edit_quiz(client, auth):
    """
        GIVEN a logged-in user with 'view' permission
        WHEN the user tries to edit a quiz
        THEN they will not be allowed
    """

    auth.login('testUser')
    response = client.get('/quiz-manager/quiz/1/edit')
    
    assert response.status_code == 403
    assert b'Permission Denied' in response.data
    
    data = {
        "title": "Updated Maths Test", 
        "description": "Updated and better than ever"
    }
    response = client.post('/quiz-manager/quiz/1/edit', data=data)

    assert response.status_code == 403
    assert b'Permission Denied' in response.data


def test_delete_quiz(client, auth):
    """
        GIVEN a logged-in user with 'edit' permission
        WHEN the user deletes a quiz
        THEN the user is redirected back to all quizzes page and the quiz is deleted
    """

    auth.login()
    response = client.get('/quiz-manager/quiz/2/delete')
    
    assert response.headers['Location'] == '/quiz-manager/'
    
    response = client.get('/quiz-manager/')
    
    assert b'Quiz deleted:' in response.data
    assert b'Geography Quiz</a>' not in response.data
    assert b'Maths Quiz' in response.data


def test_normal_user_cant_delete_quiz(client, auth):
    """
        GIVEN a logged-in user with 'view' permission
        WHEN the user tries to delete a quiz
        THEN they will not be allowed
    """

    auth.login('testUser')
    response = client.get('/quiz-manager/quiz/1/delete')
    
    assert response.status_code == 403
    assert b'Permission Denied' in response.data