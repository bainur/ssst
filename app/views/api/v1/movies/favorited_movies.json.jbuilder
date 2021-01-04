json.success true
json.message @message
json.data @movies do |movie|
  json.id movie.id
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

