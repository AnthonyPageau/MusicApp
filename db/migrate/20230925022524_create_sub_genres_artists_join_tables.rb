class CreateSubGenresArtistsJoinTables < ActiveRecord::Migration[7.0]
  def change
    create_join_table :sub_genres, :artists do |t|
      t.index :sub_genre_id
      t.index :artists_id
    end
  end
end
