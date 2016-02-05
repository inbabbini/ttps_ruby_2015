== README

# E-Vader (TTPS Ruby)

## Instructions to download the application

* Clone (or download) repository, just the /Trabajo/evader is needed
* Go to /Trabajo/evader and run ´ $ bundle install ´ to resolve and download dependencies

## Run the application

* Migrate and seed the database using ´ $ bundle exec rake db:setup RAILS_ENV=development ´
* Run the application using ´ $ bundle exec rails s ´, this runs on localhost:3000

## Run the tests
* Setup the database using ´ $ bundle exec rake db:setup RAILS_ENV=test ´
* To test Client model, run ´ $ bundle exec ruby -Itest test/models/client_test.rb ´
* To test Bill model, run ´ $ bundle exec ruby -Itest test/models/bill_test.rb ´

Note: Running ´$ bundle exec rake db:setup´ without specifying the RAILS_ENV setups both development and test databases
