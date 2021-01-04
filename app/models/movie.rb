class Movie < ApplicationRecord
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :viewers
  accepts_nested_attributes_for :genres
end
