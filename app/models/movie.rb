class Movie < ApplicationRecord
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :viewers
  has_many :movies_viewers
  has_many :viewers, through: :movies_viewers

  validates_presence_of :name, :year, :genres
  validates_length_of :director, maximum: 60
  validates_length_of :main_star, maximum: 60
  validates_length_of :description, maximum: 400

  accepts_nested_attributes_for :genres

  def check_favorite_by_user(username)
    MoviesViewer.where(:movie_id => id, :viewer_id => username).count > 0
  end
end
