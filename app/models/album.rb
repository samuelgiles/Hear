class Album < ActiveRecord::Base
  attr_accessible :artist, :sortorder, :title, :user_id
  belongs_to :user
  has_many :AlbumListens

    def get_art()
    	@Client = AmazonAlbumArt.new("AKIAJSCPHYFMDTH5U4TQ", "KNzcu9//7QDehoDXuqqX2K7LiZ/rUBibKc/bwOoD")
    	@AlbumArt = @Client.search(artist,title)
    	if @AlbumArt != nil
    		return @AlbumArt[:images][:large]
    	else
    		return ""
    	end
  	end

    def listened_to()

      @User = User.find(user_id)
      @ListenCheck = @User.AlbumListens.exists?({:album_id => id})

      return @ListenCheck

    end

end
