class Viewer < ApplicationRecord
  has_many :movies_viewers
  has_many :movies, through: :movies_viewers

  def remove_favorite(movie)
    self.movies.delete(movie)
    movie.decrement!(:favorited)
  end

  def add_favorite(movie)
    self.movies << movie
    # if its duplicate it will thrown error and wont go to this below code
    movie.increment!(:favorited)
    self.movies
  end

  def adjust_favorite

  end
end
