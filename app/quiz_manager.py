import functools
from flask import g, request, session, url_for, redirect, flash, render_template, Blueprint, abort
from werkzeug.security import check_password_hash
from app.db import get_db

"""
    Module which contains all the flask functions, which contains the logic and endpoints for the front-end UI.
"""

# Create a flask blueprint for the endpoints
bp = Blueprint('quiz_manager', __name__, url_prefix='/quiz-manager')


def login_required(view):
    """
        Function that creates decorator requiring a user to be logged-in. The original view is passed in and wrapped in
        a new view function. The new function checks is a user is loaded. If a user is logged int, the original view is
        called and continues normally. If a user is not logged-in, the user will be redirected to the login page.
    """
    @functools.wraps(view)
    def wrapped_view(**kwargs):
        
        if g.user is None:
            return redirect(url_for('quiz_manager.login'))

        return view(**kwargs)

    return wrapped_view


def role_required(role):

    def route_decorator(view):
        @functools.wraps(view)
        def wrapped_view(**kwargs):

            user_role = g.user['permission']

            if role == 'edit' and user_role != 'edit':
                abort(403)

            elif role == 'view' and user_role != 'edit' and user_role != 'view':
                abort(403)

            return view(**kwargs)
        return wrapped_view
    return route_decorator

@bp.route('/')
@login_required
def home():
    """
        The Home page. This is on the root index and shows the user all the quizzes stored. The database connection is
        made and then a SQL query is exected to select all entries in the quiz table. The quizzes are then passed into
        the home.html template which is rendered using flask to the user. A user must be logged-in.
    """
    db = get_db()
    quizzes = db.execute("SELECT * FROM quizzes").fetchall()

    return render_template('home.html', quizzes=quizzes)

@bp.route('/quiz/add', methods=['GET', 'POST'])
@role_required('edit')
def add_quiz():

    if request.method == 'POST':
        title = request.form.get('title')
        description = request.form.get('description')

        db = get_db()
        db.execute("INSERT INTO quizzes (title, description) VALUES (?, ?)", (title, description))
        db.commit()

        flash(f'Quiz added: {title}')

        return redirect(url_for('quiz_manager.home'))

    return render_template('add_quiz.html')

@bp.route('/quiz/<quiz_id>/edit', methods=['GET', 'POST'])
@role_required('edit')
def edit_quiz(quiz_id):

    db = get_db()

    if request.method == 'POST':
        title = request.form.get('title')
        description = request.form.get('description')
        db.execute("UPDATE quizzes SET title = ?, description = ? WHERE quiz_id = ?", (title, description, quiz_id))
        db.commit()

        flash(f'Quiz updated: {title}')

        return redirect(url_for('quiz_manager.home'))

    quiz = db.execute("SELECT * FROM quizzes WHERE quiz_id = ?", (quiz_id,)).fetchone()

    if quiz is None:
        abort(404)
    
    return render_template('edit_quiz.html', quiz=quiz)


@bp.route('/quiz/<quiz_id>/delete')
@role_required('edit')
def delete_quiz(quiz_id):

    db = get_db()
    quiz = db.execute("SELECT title FROM quizzes WHERE quiz_id = ?", (quiz_id,)).fetchone()
    db.execute("DELETE FROM quizzes WHERE quiz_id = ?", (quiz_id,))
    db.commit()
    
    flash(f'Quiz deleted: {quiz["title"]}')

    return redirect(url_for('quiz_manager.home'))


@bp.route('/quiz/<quiz_id>')
@login_required
def quiz(quiz_id):
    """
        The Questions page. After clicking on a quiz from the Home page, the user will be redirected here with the
        quiz_id in the URL and passed into the function. This page will show users all the questions for the selected
        quiz. The database connection is made and then a SQL query is executed to select all entries in the question
        table for the given quiz_id. The questions are then passed into the questions.html template which is
        rendered using flask to the user. A user must be logged-in.
    """

    db = get_db()
    quiz = db.execute("SELECT * FROM quizzes WHERE quiz_id = ?", (quiz_id,)).fetchone()

    if quiz is None:
        abort(404)

    questions = db.execute("SELECT * FROM questions WHERE quiz_id = ?", (quiz_id,)).fetchall()

    return render_template('quiz.html', quiz=quiz, questions=questions)


@bp.route('/quiz/<quiz_id>/question/<question_id>/edit', methods=['GET', 'POST'])
@role_required('edit')
def edit_question(quiz_id, question_id):

    db = get_db()

    if request.method == 'POST':
        question = request.form['question']
        db.execute("UPDATE questions SET question = ? WHERE question_id = ?", (question, question_id))
        db.commit()

        flash(f'Question updated: {question}')

        return redirect(url_for('quiz_manager.quiz', quiz_id=quiz_id))

    question = db.execute("SELECT question FROM questions WHERE question_id = ? AND quiz_id = ?", (question_id, quiz_id)).fetchone()

    if question is None:
        abort (404)

    return render_template('edit_question.html', question=question)


@bp.route('/quiz/<quiz_id>/question/<question_id>/delete')
@role_required('edit')
def delete_question(quiz_id, question_id):

    db = get_db()
    question = db.execute("SELECT question FROM questions WHERE question_id = ?", (question_id,)).fetchone()
    db.execute("DELETE FROM questions WHERE question_id = ?", (question_id,))
    db.commit()

    flash(f'Question deleted: {question["question"]}')

    return redirect(url_for('quiz_manager.quiz', quiz_id=quiz_id))


@bp.route('/quiz/<quiz_id>/question/add', methods=['GET', 'POST'])
@role_required('edit')
def add_question(quiz_id):

    if request.method == 'POST':
        question = request.form['question']
        db = get_db()
        db.execute("INSERT INTO questions (quiz_id, question) VALUES (?, ?)", (quiz_id, question))
        db.commit()

        flash(f'Question added: {question}')

        return redirect(url_for("quiz_manager.quiz", quiz_id=quiz_id))
        
    return render_template('add_question.html')


@bp.route('quiz/<quiz_id>/question/<question_id>')
@login_required
@role_required('view')
def question(quiz_id, question_id):
    """
        The Answers page. After clicking on a question from the Questions page, the user will be redirected here with the
        question_id in the URL and passed into the function. This page will show users all the answers for the selected
        question. The database connection is made and then a SQL query is executed to select all entries in the answers
        table for the given question_id. The answers are then passed into the answers.html template which is
        rendered using flask to the user. A user must be logged-in.
    """

    db = get_db()
    question = db.execute("SELECT * FROM questions WHERE question_id = ? AND quiz_id = ?", (question_id, quiz_id)).fetchone()

    if question is None:
        abort(404)
    
    answers = db.execute("SELECT * FROM answers WHERE question_id = ?", (question_id,)).fetchall()

    return render_template('question.html', question=question, answers=answers, quiz_id=quiz_id)


@bp.route('/quiz/<quiz_id>/question/<question_id>/answer/<answer_id>/edit', methods=['GET', 'POST'])
@role_required('edit')
def edit_answer(quiz_id, question_id, answer_id):
    
    db = get_db()

    if request.method == 'POST':
        answer = request.form['answer']
        db.execute("UPDATE answers SET answer = ? WHERE answer_id = ?", (answer, answer_id))
        db.commit()

        flash(f'Answer updated: {answer}')

        return redirect(url_for('quiz_manager.question', quiz_id=quiz_id, question_id=question_id))

    answer = db.execute("SELECT * FROM answers WHERE answer_id = ?", (answer_id,)).fetchone()
    question = db.execute("SELECT * FROM questions WHERE question_id = ? AND quiz_id = ?", (question_id, quiz_id)).fetchone()

    if answer is None or question is None:
        abort(404)

    return render_template("edit_answer.html", answer=answer, question=question)


@bp.route('/quiz/<quiz_id>/question/<question_id>/answer/<answer_id>/delete')
@role_required('edit')
def delete_answer(quiz_id, question_id, answer_id):
    
    db = get_db()
    answer = db.execute("SELECT answer FROM answers WHERE answer_id = ?", (answer_id,)).fetchone()
    db.execute("DELETE FROM answers WHERE answer_id = ?", (answer_id,))
    db.commit()

    flash(f'Answer deleted: {answer["answer"]}')

    return redirect(url_for('quiz_manager.question', quiz_id=quiz_id, question_id=question_id))


@bp.route('/quiz/<quiz_id>/question/<question_id>/answer/add', methods=['GET', 'POST'])
@role_required('edit')
def add_answer(quiz_id, question_id):

    db = get_db()
    
    if request.method == 'POST':
        answer = request.form['answer']
        db.execute("INSERT INTO answers (question_id, answer) VALUES (?, ?)", (question_id, answer))
        db.commit()

        flash(f'Answer added: {answer}')

        return redirect(url_for("quiz_manager.question", quiz_id=quiz_id, question_id=question_id))
    
    question = db.execute("SELECT * FROM questions WHERE question_id = ? AND quiz_id = ?", (question_id, quiz_id)).fetchone()

    if question is None:
        abort(404)

    return render_template('add_answer.html', question=question)


@bp.route('/login', methods=('GET', 'POST'))
def login():
    """
        The Login page. Users will be directed here if they are not logged-in.
        The page consists of a form for users to login and supports GET and POST requests.
    """

    # If a user is submitting a form as a POST request, check the username and password, and if correct, log the user in
    if request.method == 'POST':
        # Get data from the submitted form
        username = request.form['username']
        password = request.form['password']
        db = get_db()
        error = None

        # Get user data from the database for the user using SQL statement
        user = db.execute("SELECT * FROM users WHERE username = ?", (username,)).fetchone()

        # If username is not in database, or password does not match the stored hashed password flash an error
        if user is None or not check_password_hash(user['password'], password):
            error = 'Incorrect username or password'

        # If there are no errors, create a user session using flask and redirect the user to the Home page
        if error is None:
            session.clear()
            session['user_id'] = user['user_id']

            return redirect(url_for('home'))

        # If there are errors, show them to the user
        flash(error)

    # If this is a GET request, show the user the login.html template, loaded using flask
    return render_template('login.html')


@bp.route('/logout')
def logout():
    """
        The Logout page. Users will be directed here if they click the logout button.
        The user sessions will be cleared and then the user will be redirected to the Login page.
    """
    session.clear()
    return redirect(url_for('quiz_manager.login'))


@bp.before_app_request
def load_logged_in_user():
    """
        This function is user to get the user session, if there is one. It gets the user_id from the flask sessions,
        and then if there is a user, gets the user data from the database and assigns it to the global flask variable, g
    """

    if 'user_id' not in session:
        g.user = None
    else:
        user_id = session['user_id']
        g.user = get_db().execute('SELECT user_id, username, permission FROM users WHERE user_id = ?', (user_id,)).fetchone()
