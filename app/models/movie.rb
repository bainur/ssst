class Movie < ApplicationRecord
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :viewers
  has_many :movies_viewers
  has_many :viewers, through: :movies_viewers
  
  accepts_nested_attributes_for :genres
end
