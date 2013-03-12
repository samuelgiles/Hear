class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def random_background
    @album = Album.offset(rand(Album.count)).first
    @random_background = @album.get_art
  end


  def home

  	
  	
  end

  helper_method :current_user
  helper_method :random_background
end
