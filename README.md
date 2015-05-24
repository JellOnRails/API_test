API test
=========

API testing project for BUX 

------
Short description of tools and used framework

  For implementation automation scenarious used Cucumber as a framework
  For raising assertion used RSpec expectations
  For test report was used Cucumber native solution
  And of course Ruby as a programming language

------
Requirements

1. ruby 2.0.0-p481 or higher
2. preinstalled gems 
[ You could install all neccessary gems by using next commands:
gem install bundler
*navigate to root folder of the project with 'Gemfile' file*
bundle install ]
4. internet connection =)

------
Manual

Navigate to the root project directory and run command "cucumber"
All test will be run 
You could specify which scenarios to run by using next tags:
@trade
@error
@auth_error
For using tags please use the following command "cucumber --tags [tags]"

Report you could find in 'Report' folder. It is 'Report.html' file which updates after each run.

