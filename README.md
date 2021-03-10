![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)

# Sweater Weather

## Table of Contents

-   [Description](#description)
-   [Database Schema](#database-schema)
-   [Technologies Used](#technologies-used)
-   [Local Setup](#local-setup)
-   [Learning Goals](#learning-goals)
-   [Author](#author)
-   [Statistics](#statistics)

## Description
Sweater Weather is an app that allows users to create a road trip and allows users to see the current weather and forecasted weather for their destination. 

## Database Schema


## Technologies Used
- Ruby 2.5.3
- Rails v. 5.2.4
- Dependencies:
  - Faraday
  - Fast JSON API
- Testing tools:
  - RSpec
  - Capybara
  - SimpleCov

## Local Setup
  To use the project in your local environment, please follow the instructions below:

  3. Clone the repository:<br>
    `git clone git@github.com:Yesi-MC/sweater-weather.git `
    `cd sweater-weather`
  4. Install gem packages<br>
    `bundle install`
  5. Create the database<br>
    `rails db:{create,migrate}`
  6. Install Figaro
    `figaro install`
  7. Enter credentials in `config/application.yml` using the following syntax:<br>
    `weather_api_key: <your key>`
    `map_api_key: <your key>`
    `unsplash_api_key: <your key>`
  4. To launch a local server:<br>
    `rails s`<br>
    Once the server is running you can get or post calls in postman to `localhost:3000`<br>
    ex: `http://localhost:3000/api/v1/forecast`
  5. To run tests and view the test coverage report:<br>
    `bundle exec rspec`  
    `open coverage/index.html`

## Learning Goals


## Author
-   Yesi Meza | [github](https://github.com/Yesi-MC) \| [linkedin](https://www.linkedin.com/in/yesimeza/)



