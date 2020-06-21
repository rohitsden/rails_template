#!/usr/bin/ruby

# Get app name from user
print "Enter the name of the rails app you want to create : "
app_name = gets.chomp

# Create docker external network
system("docker network create #{app_name}_network")

# Run docker-compose command to create new rails app with postgres
system("export APP_NAME=#{app_name} && export DATA_LOCATION=./tmp/data && export DB_LOCATION=./tmp/db && export DEPLOYMENT_STAGE=development && export POSTGRES_PASSWORD=#{app_name} && docker-compose run  --rm web rails new . --force --no-deps --database=postgresql")

# add devise to Gemfile
system("echo \"gem 'bcrypt'\" >> Gemfile")

# add devise to Gemfile
system("echo \"gem 'devise'\" >> Gemfile")

# Run docker-compose build - This will build the image with the updated Gemfile
system("export APP_NAME=#{app_name} && export DATA_LOCATION=./tmp/data && export DB_LOCATION=./tmp/db && export DEPLOYMENT_STAGE=development && export POSTGRES_PASSWORD=#{app_name} && docker-compose build")

# update seed_database.yml with the actual appname
system("sed -i '' 's/appname/#{app_name}/g' ./templates/db/seed_database.yml")

# move seed_database.yml file to ./config/database.yml
system("mv ./templates/db/seed_database.yml ./config/database.yml")

# update start_dev.sh with the actual appname
system("sed -i '' 's/appname/#{app_name}/g' start_dev.sh")
system("sed -i '' 's/appname/#{app_name}/g' stop_dev.sh")

# make start/stop_dev.sh executable
system("chmod +x start_dev.sh stop_dev.sh commands.sh")

# execute commands.sh within container
system("export APP_NAME=#{app_name} && export DATA_LOCATION=./tmp/data && export DB_LOCATION=./tmp/db && export DEPLOYMENT_STAGE=development && export POSTGRES_PASSWORD=#{app_name} && docker-compose run --rm web ./commands.sh")

# delete existing containers
system("docker rm #{app_name}")

# perform cleanup of setup files
system("rm -rf templates")

# start containers (ensure db:migrate)
system("./start_dev.sh")
