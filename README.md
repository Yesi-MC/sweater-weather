![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
![](https://img.shields.io/badge/Ruby-2.5.3-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)

# Sweater Weather

## Table of Contents

-   [Description](#description)
-   [Database Schema](#database-schema)
-   [Technologies Used](#technologies-used)
-   [Local Setup](#local-setup)
-   [Example API Endpoints](#example-api-endpoints)
-   [Learning Goals](#learning-goals)
-   [Author](#author)
-   [Statistics](#statistics)

## Description
This Sweater Weather project is a backend application that can be called by a frontend. This app allows users to create a road trip where the user can see the current weather and forecasted weather for their destination based on given API endpoints. This uses service oriented architecture to give RESTful API endpoints to the frontend. 

## Database Schema
![sweater-weather-user](https://user-images.githubusercontent.com/69552154/110570568-54ae4180-8113-11eb-947b-128000ba0039.png)

## Technologies Used
- Ruby 2.5.3
- Rails v. 5.2.4
- Dependencies:
  - Faraday
  - Fast JSON API
- Testing tools:
  - RSpec
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
    `weather_api_key: <your key>`<br>
    `map_api_key: <your key>`<br>
    `unsplash_api_key: <your key>`<br>
  4. To launch a local server:<br>
    `rails s`<br>
    Once the server is running you can get or post calls in postman to `localhost:3000`<br>
    ex: `http://localhost:3000/api/v1/forecast`
  5. To run tests and view the test coverage report:<br>
    `bundle exec rspec`  
    `open coverage/index.html`
  
## Example API Endpoints
#### Forecast Endpoint 
`get http://localhost:3000/api/v1/forecast?location=Portland,Or`

response: 
```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-03-10T05:35:15.000+00:00",
                "sunrise": "2021-03-09T14:34:00.000+00:00",
                "sunset": "2021-03-10T02:08:32.000+00:00",
                "temperature": 42.46,
                "feels_like": 35.53,
                "humidity": 76,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "overcast clouds",
                "icon": "04n"
            },
            "daily_weather": [
                {
                    "date": "2021-03-09T20:00:00.000+00:00",
                    "sunrise": "2021-03-09T14:34:00.000+00:00",
                    "sunset": "2021-03-10T02:08:32.000+00:00",
                    "max_temp": 53.58,
                    "min_temp": 40.6,
                    "conditions": "light rain",
                    "icon": "10d"
                },
              {...} etc
            ],
            "hourly_weather": [
                {
                    "time": "2021-03-10T05:00:00.000+00:00",
                    "temperature": 42.46,
                    "conditions": "light rain",
                    "icon": "10n"
                }, 
              {...} etc 
            ]
        }
    }
}
```

#### Background Endpoint 
`get http://localhost:3000/api/v1/background?location=Portland,Or`

response: 
```
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "image": {
                "location": "Portland,Or",
                "image_url": "https://images.unsplash.com/photo-1530891671629-3a053324e4f7?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMTMzODZ8MHwxfHNlYXJjaHwxfHxQb3J0bGFuZCxPcnxlbnwwfHx8fDE2MTUzNTQ3OTE&ixlib=rb-1.2.1&q=85",
                "credit": {
                    "source": "unsplash.com",
                    "author": "umit1010",
                    "logo": "https://unsplash.com/blog/content/images/max/2560/1-vQ5EsgnJkANWb5fktHPwnw.jpeg"
                }
            }
        }
    }
}
```


####  User Registration Endpoint 
`post http://localhost:3000/api/v1/users`

body example: 
```
{
  "email": "person@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

response:
```
{
    "data": {
        "id": "3",
        "type": "users",
        "attributes": {
            "email": "person@example.com",
            "api_key": "a74eef0e6f7bafa900ed9b73"
        }
    }
}
```
#### Login Endpoint 
`post http://localhost:3000/api/v1/sessions`

body example: 
```
{
  "email": "person@example.com",
  "password": "password"
}
```

response:
```
{
    "data": {
        "id": "1",
        "type": "users",
        "attributes": {
            "email": "person@example.com",
            "api_key": "58969b40deaf1e4ba4e47df2bdca2eb69c200d3fc4cd1459ccb587"
        }
    }
}
```

#### Roadtrip Endpoint 

`post http://localhost:3000/api/v1/road_trip`

body example: 
```
{
"origin": "Denver,CO",
"destination": "Estes Park,CO",
"api_key": "58969b40deaf1e4ba4e47df2bdca2eb69c200d3fc4cd1459ccb587"
}
```

response:
```
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Estes Park,CO",
            "travel_time": "01:22:49",
            "weather_at_eta": {
                "temperature": 32.61,
                "conditions": "light snow"
            }
        }
    }
}
```



## Learning Goals
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer


## Author
-   Yesi Meza | [github](https://github.com/Yesi-MC) \| [linkedin](https://www.linkedin.com/in/yesimeza/)



