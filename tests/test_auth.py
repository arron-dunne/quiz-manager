import pytest
from flask import g, session

"""
    Module with tests that test the Login page
"""


def test_login_required(client, auth):
    """
        GIVEN a user not logged-in
        WHEN the user goes to the root URL
        THEN the user shall be redirected to the Login page
    """
    response = client.get('/', follow_redirects=True)
    
    assert response.status_code == 200
    assert response.request.path == '/quiz-manager/login'


@pytest.mark.parametrize(('username', 'permission'), (
    ('testRestrictedUser', 'restricted'),
    ('testUser', 'view'),
    ('testAdmin', 'edit')
))
def test_login(client, auth, username, permission):
    """
        GIVEN A registered user
        WHEN a user loads the login page URL and logs in
        THEN the user shall be shown the home page and have a session with that username
    """
    
    assert client.get('/quiz-manager/login').status_code == 200
    response = auth.login(username)
    assert response.headers["Location"] == "/quiz-manager/"

    with client:
        client.get('/quiz-manager/')
        assert session is not None
        assert g.user['username'] == username
        assert g.user['permission'] == permission


@pytest.mark.parametrize(('username', 'password'), (
    ('a', 'test'),
    ('testAdmin', 'a'),
))
def test_login_validate_input(auth, username, password):
    """
        GIVEN a user on the login page
        WHEN a user enters incorrect details
        THEN an error message shall be returned
    """
    response = auth.login(username, password)
    
    assert b'Incorrect username or password' in response.data


def test_logout(client, auth):
    """
        GIVEN a logged in user
        WHEN the user logs-out
        THEN the user session shall be ended and directed to the login page
    """
    auth.login()

    with client:
        response = auth.logout()

        assert response.headers["Location"] == "/quiz-manager/login"
        assert 'user_id' not in session
        
        client.get("/quiz-manager/login")
        
        assert g.user is None
        
