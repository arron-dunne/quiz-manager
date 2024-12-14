# Quiz Manager

Quiz Manager is a web application designed to store, view and modify quizzes, questions and answers. It was created as the final project for my Level 4 Software Developer Apprenticeship, and covers a wide range of software developer skills, aswell as all stages of the software design lifecycle, from requirements to deployment.

The [Project Outline](/docs/project-outline.pdf) provided the business outline of the project and described some of the necessary features. Most importantly, a web application must be created that uses a database to store quiz data. The quiz data (along with question and answer data) is accessible to authorised users via a web-based UI. There are 3 levels of permissions for users;
- **restricted**: view quizzes and questions, but not answers
- **view**: view all quizzes, questions and answers
- **edit**: view, add, modify and delete data all quizzes, questions and answers

## Requirements

Requiremenets were ellicited from the project outline and captured in the [specification](/docs/specification.csv). Requirements for sound design and industry best-practises were also included. Each requirement was given a priority (how important it was to the final product and therefore help with task prioritisation) and a category (whether the requirement relates to the design, security, was a core function etc.).

## Design

User Stories were created to map a users journey through the application for the requied functionality; logging in, vieiwing data and adding new data. These User Stories identified the need for seceral UI pages which were then drafted as wireframes. This served as the basic design which was implemented in the developemnt phase. 

For more information on the design phase, see the [Design Plan](/docs/design-plan.pdf).

## Developement

The application was written in Python, using the [Flask](https://flask.palletsprojects.com/en/stable/) web-server framework to run the back-end. Although Flask is a micro-framework and not suitable for large scale applications, due to the low expected traffic of this site, and concurrent write operations to the database were assumed negligible, it was an acceptable framework to use.

For the front-end, the [Jinja](https://jinja.palletsprojects.com/en/stable/) templating engine was used, which provides the ability to pass in dynamic data from the server, make page layouts to reduce repeated HTML, and use CSS to style. 

`/app/templates/quiz_manager.py` contains the main server code, with URL routing and the database operations. It serves the user with the a HTML file from `/app/templates/`.

`/app/static/style.css` contains the CSS styling. Colours, logos, and layouts are easily changeable by editing this file.

## Testing

Both manaual and automatic testing were used to test the app and ensure it met the requirements from the specification. 

### Automatic Testing

Python's [Pytest](https://docs.pytest.org/en/stable/) module was used to write unit-tests and execute them. Pytest works well will Flask apps and was the recommended choice of testing for this framework. The [Coverage](https://coverage.readthedocs.io/en/7.6.9/) module was used to collect code coverage data from testing.

All tests are located in `tests/` directory. Run the command `coverage run -m pytest` (with all dependencies installed) to run the test suite, and then `coverage report` to view coverage statistics.

### Manual Testing

For testing the UI and more complex user interactions, manual testing was used. The User Stories created during the design were used as manual test cases. Each step of the user story was run on the application and the expected outcome was compared with the actual outcome. If the actual outcome matched the expected outcome from the user story, the test passed.

For more details on the test plan and test results, see the [Test Plan](/docs/test-plan.pdf)

## Deployment

The application can be deplyoed locally using the code in this repository. Clone the repo and then navigate the the root folder.

Execute `source setup.sh` which sets up a virtual envuronment, installs all the necessary pip modules, initialsised the database, creates a private key (which can be changed). The database is created at `instance/database.db`.

Then execute `flask run` (inside the virtual environment) to launch the application locally.

A live deployment of the app is available [HERE](https://arrond.pythonanywhere.com).

