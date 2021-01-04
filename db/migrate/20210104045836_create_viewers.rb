class CreateViewers < ActiveRecord::Migration[6.0]
  def change
    create_table :viewers do |t|
      t.string :username, limit: 20

      t.timestamps
    end

    # habtm between viewer and movies
    create_table :movies_viewers, id: false do |t|
      t.belongs_to :movie
      t.belongs_to :viewer
    end

    add_index :movies_viewers, [:movie_id, :viewer_id], unique: true
  end
end
