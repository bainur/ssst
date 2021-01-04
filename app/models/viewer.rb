class Viewer < ApplicationRecord
  has_many :movies_viewers
  has_many :movies, through: :movies_viewers

  def remove_favorite(movie)
    self.movies.delete(movie)
    movie.decrement!(:favorited)
  end

  def add_favorite(movie)
    movie.increment!(:favorited)
    self.movies << movie
  end
end
