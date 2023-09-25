class AddSongLinkToSong < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :song_link, :string
  end
end
