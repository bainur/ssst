class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :name, limit: 64

      t.timestamps
    end

    create_table :genres_movies, id: false do |t|
      t.belongs_to :movie
      t.belongs_to :genre
    end

    add_index :genres_movies, [:movie_id, :genre_id], unique: true
  end
end
