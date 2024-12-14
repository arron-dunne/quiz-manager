# Setup the application locally after cloning
echo 'setting up virtual environement...'
python3.11 -m venv .venv
source .venv/bin/activate
echo 'installing dependencies...'
pip install --disable-pip-version-check -q -r requirements.txt
flask init-db
flask add-data-db
echo "SECRET_KEY='dev'" > ./instance/config.py
echo 'secret key created in instance/config.py (update as necessary)'
echo '\nstarting quiz-manager...\n'
flask run
