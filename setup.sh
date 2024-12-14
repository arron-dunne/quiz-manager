# Setup the application locally after cloning
echo 'setting up virtual environement...'
python3.11 -m venv .venv
source .venv/bin/activate
echo 'installing dependencies...'
pip install -q -r requirements.txt
flask init-db
flask add-data-db
echo "SECRET_KEY='dev'" > instance/config.py
echo 'secret key created in instance/config.py (update as necessary)'
echo 'ready to start quiz-manager'
echo "run 'source .venv/bin/activate' to start virtual environment"
echo "then run 'flask run' to start application\n"
