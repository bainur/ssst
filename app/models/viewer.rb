class Viewer < ApplicationRecord
  has_many :movies_viewers
  has_many :movies, through: :movies_viewers
  validates_length_of :username, maximum: 20
  validates_presence_of :username
  validates_format_of :username, with: /^[a-zA-Z0-9_]+$/, multiline: true

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

  def adjust_favorite_number
    # when deleted from admin, adjust number favorited for each movie
    self.movies.each do |mv|
      mv.decrement!(:favorited)
    end
    self.movies.clear
  end
end
