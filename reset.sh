# Reset the data in the database back to the original
source .venv/bin/activate
flask init-db
flask add-data-db