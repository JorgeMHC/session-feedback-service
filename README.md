# Session Feedback Service

## Dependencies

* Ruby 2.2

After you have both installed then you can check de version by typing
```
ruby -v
```

You can install the rest of the project dependencies defined in the Gemfile.rb by executing
```
gem install bundler
bundle install
```

## Database initialization and seed

First you need to run a rake comand to create the database and the tables
```
rake db:migrate
```
This will create a development.sqlite3 and 3 tables (users, feedbacks, sessions). to create also the tables on the test environment you need to specify the environment ```rake db:migrate RAILS_ENV=test```.

Currently there is no endpoint to create users and sessions so there is a script to create 15 users and 15 sessions also one user will create a random feedback for one of the sessions (15 feedbacks). To populate the table you can run
```
rake db:seed
```
### Database structure

The migrations will create 3 tables as shown in the diagram<br />
![alt text](db/schema.png "Description goes here")

The table feedbacks contains 2 indexes, one composite index on user_id and session_id and one unique index for created_at.

## How to run the tests

For test I am using [Respc](http://rspec.info/). All the unit tests are located in the spec folder on the root of the project matching project structure (models, controllers). You can run all tests with the following command.
```
rspec .
```

## Running the application
running the following command will sart the server and give you a feedback of the port running on. exec `Rails 4.2.8 application starting in development on http://localhost:3000`
```
rails s
```

## Api specification

There are two routes defined and you can see them with the following command `rake routes`
* url
  ```
  /sessions/:session_id/feedbacks
  ```
* method
  ```
  POST
  ```
* header params<br />
  **required:**
  ```
  Ubi-UserId=[integer]
  ```
* data params
  ```json
  {
    "rating": 4,
    "comment": "sample comment"
  }
  ``` 
* Success response
  ```json
  {
      "data": {
          "id": "17",
          "type": "feedbacks",
          "attributes": {
              "rating": 4,
              "comment": "sample comment",
              "created-at": "2017-08-19T20:56:24.738Z",
              "updated-at": "2017-08-19T20:56:24.738Z"
          },
          "relationships": {
              "user": {
                  "data": {
                      "id": "7",
                      "type": "users"
                  }
              },
              "session": {
                  "data": {
                      "id": "15",
                      "type": "sessions"
                  }
              }
          }
      }
  }
  ```
* Error response
  ```json
  {
      "errors": [
          {
              "status": "422",
              "source": null,
              "title": "validation failed",
              "detail": "Validation failed: User can just leave one feeback per session"
          }
      ]
  }
  ```
OR
  ```json
  {
      "errors": [
          {
              "status": "404",
              "source": null,
              "title": "not found",
              "detail": "Couldn't find User with 'id'=98" or "detail": "Couldn't find Session with 'id'=98"
          }
      ]
  }
  ```

* url
  ```
  /feedbacks
  ```
* method
  ```
  GET
  ```
* Url params<br />
  **Optional:**
  ```
  rating=1 or rating=1,2
  ```
* Success response
  ```json
  {
      "data": [
          {
              "id": "17",
              "type": "feedbacks",
              "attributes": {
                  "rating": 4,
                  "comment": "sample comment",
                  "created-at": "2017-08-19T20:56:24.738Z",
                  "updated-at": "2017-08-19T20:56:24.738Z"
              },
              "relationships": {
                  "user": {
                      "data": {
                          "id": "7",
                          "type": "users"
                      }
                  },
                  "session": {
                      "data": {
                          "id": "15",
                          "type": "sessions"
                      }
                  }
              }
          },
          ...
      ]
  }
  ```
