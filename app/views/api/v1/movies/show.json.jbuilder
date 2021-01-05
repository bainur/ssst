json.success true
json.message "Data Found"
json.data [@movie] do |movie|
  json.id movie.id
  json.already_favorited movie.check_favorite_by_user(@username)
  json.name movie.name
  json.year movie.year
  json.director movie.director
  json.main_star movie.main_star
  json.description movie.description
  json.favorited movie.favorited

  json.genres movie.genres do |genre|
    json.name genre.name
  end
end

