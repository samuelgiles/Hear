class AlbumListen < ActiveRecord::Base
  attr_accessible :album_id, :user_id, :user
  has_one :album
  has_one :user
end
