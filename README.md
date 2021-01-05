# README

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

