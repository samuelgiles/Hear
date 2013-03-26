class AlbumListenController < ApplicationController
  
  def listen
  	
  	if current_user

  		@responsejson = {
  			:success => "false"
  		}

  		@Listen = current_user.AlbumListens.new(:album_id => params[:id])

      Album.find(params[:id]).touch

  		if @Listen.save
  		@responsejson[:success] = "true"
  		end
  		render :json => @responsejson

  	end

  end

  def display

  end

  def unlisten

    @responsejson = {
      :success => "true"
    }

    @Unlisten = current_user.AlbumListens.where(:album_id => params[:id]).destroy_all
    Album.find(params[:id]).touch
    render :json => @responsejson
    
  end
  
end
