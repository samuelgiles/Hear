class CreateAlbumListens < ActiveRecord::Migration
  def change
    create_table :album_listens do |t|
      t.integer :album_id
      t.integer :user_id

      t.timestamps
    end
  end
end
