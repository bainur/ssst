class MoviesViewer < ApplicationRecord
  belongs_to :movie
  belongs_to :viewer
end