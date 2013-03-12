class User < ActiveRecord::Base
	has_secure_password
	attr_accessible :bio, :password, :password_confirmation, :username
	validates_presence_of :password, :on => :create
	validates_presence_of :username, :on => :create
	has_many :albums
	has_many :AlbumListens
end
