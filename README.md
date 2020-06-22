### Introduction
This ruby project has everything you need to create a dockerized Ruby on Rails 6 project with the following:

- Postgresql
- Bootstrap 4
- jQuery and popper.js
- Devise
- Default Home Controller

### Requirements

- Docker
- Ruby 2.x

### Setup

- Create a directoy with the name of the rails app you would like to create.
- Copy all the files and folders from this repository into the newly created directory.
- Execute the command: `ruby setup.rb`
- You will be prompted to enter the name of the app. Use the same name as the directory.

The setup will take care of installing setting up everything required for your rails app. Once done, the database and rails app docker containers will start up. 

Navigate to the following link to view the rails app:
http://localhost:3000/

Use the following command to start and stop the application:
```bash
./start_dev.sh
./stop_dev.sh
```