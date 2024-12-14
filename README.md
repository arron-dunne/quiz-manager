# Quiz Manager

Quiz Manager is a web application designed to store, view, and modify quizzes, questions, and answers. It was created as the final project for my Level 4 Software Developer Apprenticeship and covers a wide range of software developer skills, as well as all stages of the software design lifecycle, from requirements to deployment.

The [Project Outline](/docs/project-outline.pdf) provided the business context for the project and described some of the necessary features. Most importantly, a web application needed to be created that uses a database to store quiz data. This data (along with questions and answers) is accessible to authorized users via a web-based UI. There are three levels of user permissions:
- **Restricted**: View quizzes and questions but not answers
- **View**: View all quizzes, questions, and answers
- **Edit**: View, add, modify and delete all quizzes, questions, and answers

## Requirements

Requirements were elicited from the project outline and captured in the [Specification](/docs/specification.csv). Requirements for sound design and industry best practices were also included. Each requirement was assigned a priority (indicating its importance to the final product, aiding in task prioritization) and a category (e.g., related to design, security, core functionality, etc.).

## Design

User Stories were created to map a user's journey through the application for the required functionality, such as logging in, viewing data, and adding new data. These user stories identified the need for several UI pages, which were then drafted as wireframes. This served as the basic design, later implemented during the development phase.

For more information on the design phase, see the [Design Plan](/docs/design-plan.pdf).

## Developement

The application was written in Python, using the [Flask](https://flask.palletsprojects.com/en/stable/) web-server framework for the back end. Although Flask is a micro-framework and not ideal for large-scale applications, it was a suitable choice for this project due to the expected low traffic and negligible concurrent write operations to the database.

For the front end, the [Jinja](https://jinja.palletsprojects.com/en/stable/) templating engine was used. It allowed dynamic data to be passed from the server, reusable page layouts to reduce repeated HTML, and the use of CSS for styling.

- `/app/templates/quiz_manager.py` contains the main server code, with URL routing and database operations. It serves HTML files from `/app/templates/`.

- `/app/static/style.css` contains the CSS styling. Colours, logos, and layouts can be easily changed by editing this file.

## Testing

Both manual and automated testing were used to ensure the app met the requirements specified in the design phase.

### Automatic Testing

Python's [Pytest](https://docs.pytest.org/en/stable/) module was used to write unit tests and execute them. Pytest integrates well with Flask apps and was the recommended testing framework for this project. The [Coverage](https://coverage.readthedocs.io/en/7.6.9/) module was used to collect test coverage data.

All tests are located in the `/tests/` directory. To run the test suite, use the following commands:
- `coverage run -m pytest` (ensure virtual environment is active with all dependencies installed).
- `coverage report` to view test coverage statistics.

### Manual Testing

For testing the UI and more complex user interactions, manual testing was performed. The user stories created during the design phase were used as manual test cases. Each step of a user story was executed on the application, and the expected outcomes were compared with actual results. If the actual outcome matched the expected outcome, the test was marked as passed.

For more details on the test plan results, see the [Test Plan](/docs/test-plan.pdf)

## Deployment

The application can be deployed locally using the code in this repository.
1. Clone the repository and navigate to the root folder.
2. Execute `source setup.sh` to set up a virtual environment, install the necessary pip modules, initialize the database, and create a private key (this key can be changed). The database is created at `/instance/database.db`.
3. Execute `flask run` (inside the virtual environment) to launch the application locally.

A live deployment of the app is available [HERE](https://arrond.pythonanywhere.com).

