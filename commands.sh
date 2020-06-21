RAILS_ENV=development rails db:setup
bundle install
rails generate devise:install
rails generate devise User
rails g devise:views
yarn add bootstrap jquery popper.js
rails g controller Home index
mv ./templates/js/environment.js ./config/webpack/environment.js
mv ./templates/js/application.js ./app/javascript/packs/application.js
mv ./templates/css/application.css ./app/assets/stylesheets/application.css
rm ./app/assets/stylesheets/application.scss
rm -rf ./app/views/devise
mv ./templates/views/devise ./app/views/devise
mv ./templates/images/logo.png ./app/assets/images/logo.png
mv ./templates/routes/routes.rb ./config/routes.rb
mv ./templates/controllers/application_controller.rb ./app/controllers/application_controller.rb