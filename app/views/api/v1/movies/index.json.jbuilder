json.success true
json.message "Data Found"
json.data @movies do |movie|
  json.id movie.id
  json.already_favorited @favorited_movie_ids.include?(movie)
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

