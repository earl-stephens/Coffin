# README

Welcome to Coffin, an app that is designed to assist people with handling the unavoidable end of life. This project was completed by:
@ryanmillergm
@n-flint
@earl-stephens
@bplantico

The initial release was completed for a group project in Module 3 of the Back End Engineering program at Turing School of Software and Design in approximately 7 days. If you're interested in contributing to this project, please see the system setup and congiruation steps below.

## What services does the app provide?
The app has three main functions.

The first one is to provide a way for trusted contacts to be notified in the event of a primary account holder's death. A deadman switch, which acts as a countdown timer, is used for this function. If the primary account holder fails to push the deadman switch (which resets the timer), then a message is issued to that person's contacts to notify them.

The second main function of the app is to provide the primary account holder with a secure repository for sensitive documents. These documents include such things as wills, life insurance policies, birth certificates and any other documents that an executor would need to close out an estate.

The third main function of the app is to provide a way for the executor of the estate to have access to the sensitive documents once the primary account holder has passed away.

## Can the user change the length of the time for the deadman switch?
Yes. The length of time can be set to any time length the user desires. The time can be in days, months, or years.

## Does the app provide warnings when the deadman switch is close to expiring?
Yes, an alert is sent out 24 hours prior to the expiration of the timer.

# System Setup and Configuration
Coffin is built mainly with Ruby on Rails (version 5.2.3) and Ruby (version 2.6.3). It also utilizes a Sinatra microservice along with being hosted on Amazon S3 and ElasticBeanStalk. In order to set up the code base on your system, please _fork_ then clone this repository and run:
`bundle install`

to install the proper gem dependencies. Once the bundle has successfully completed, set up the PostgreSQL (version 11.1) development and test databases using:
`bundle exec rake db:{create,migrate,seed}`

## Testing
RSpec with Capybara was used to test this application. To run the test suite, use:
`bundle exec rspec`

# Continuous Integration
Coffin utilizes CircleCI to auto-deploy the master GitHub branch to the production site.
Please contact us with any questions you have.
