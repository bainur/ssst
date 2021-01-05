# README
## ENVIRONTMENT, Admin User
Heroku url :
https://fast-oasis-10929.herokuapp.com/

Admin user :
admin@example.com / 86WmYwjFVF>q}@7P


## Prerequisites Installations

- Install ruby version 2.7.1 and set it with your ruby environment manager
  ([more info here](https://www.ruby-lang.org/en/documentation/installation/)).

- Install Postgres and start the PostgreSQL server in the foreground
  ([more info here](https://wiki.postgresql.org/wiki/Detailed_installation_guides)).

<p>If you want a copy of this project running on your machine you have to install:</p>

## Technology used

- Ruby
- Rails
- GitHub
- PostgreSQL
- Devise ( For admin authentication )

## Usage/Getting Started

Once you have installed the required package shown on the, proceed with the following steps

Clone the Repository,

```Shell
your@pc:~$ git clone https://github.com/bainur/miniflix
```

Move into the cloned folder

```Shell
your@pc:~$ cd miniflix
```

Get the dependencies needed for the app

```Shell
your@pc:~$ bundle install
```

Set environment variables

```
export DATABASE_USERNAME="change to your database_username"
export DATABASE_PASSWORD="change to your database_password"
export DATABASE_HOST="change to your host address"

prepared for database creation, and adding seed and some dummy data to the tables
```Shell
your@pc:~$ bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed
```

### API request.
Postman File could be  found on public/miniflix_postman.json


All API REQUEST are using json. 
all the API request should have username parameters on the body
Here you can find the API Documentation

| API Endpoint                           | Functionality                                | Status | Parameters On Body , JSON FORMAT|
| -------------------------------------- | -------------------------------------------- | ------ | -----------
| POST api/v1/login                      | Login / Create a user                        | OK     | username   |
| GET api/v1/movies                      | Returns a list of movies                     | OK     | username   |
| GET api/v1/movies/:id                  | SHOW detail movie                            | Ok     | username   |
| GET api/v1/fav_movies                  | SHOW Favorite movies From a user             | Ok     | username   |
| POST /api/v1/assign_favorite           | Assign Favorite Movie                        | Ok     | username, movie_id   |
| POST /api/v1/remove_favorite           | Remove Favorite Movie                        | Ok     | username, movie_id   |

