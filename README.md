Ensure that you have Docker installed and running.

Create a directoy with the name of the rails app.
mkdir sample_app

Copy all the files of the repo to the newly created directory.

cd sample_app
./setup.rb


Development:
export APP_NAME=sample_app && export DATA_LOCATION=./tmp/data && DB_LOCATION=./tmp/db && export DEPLOYMENT_STAGE=development && export POSTGRES_PASSWORD=app && docker-compose up

Production:
export APP_NAME=sample_app && export DATA_LOCATION="data path" &&  DB_LOCATION="db path" && export DEPLOYMENT_STAGE=production && export POSTGRES_PASSWORD=password && docker-compose up

To deploy, use Capsistrano with corresponding stage:
for e.g.

cap staging deploy
cap production deploy

