class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year, limit: 2
      t.string :director, limit: 60
      t.string :main_star, limit: 60
      t.text :description, limit: 400
      t.integer :favorited, default: 0

      t.timestamps
    end
  end
end
