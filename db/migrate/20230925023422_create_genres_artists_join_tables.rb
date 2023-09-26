class CreateGenresArtistsJoinTables < ActiveRecord::Migration[7.0]
  def change
    create_join_table :genres, :artists do |t|
      t.index :genre_id
      t.index :artist_id
    end
  end
end
