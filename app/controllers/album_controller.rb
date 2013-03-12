class AlbumController < ApplicationController

  def new
    @album = Album.new
  end

  def create

    @sortorder = current_user.albums.maximum(:sortorder)
    if !@sortorder
      @sortorder = 1
    else
      @sortorder = @sortorder + 1
    end

    @album = current_user.albums.new(:artist => params[:artist], :title => params[:title], :sortorder => @sortorder)
    if @album.save
      redirect_to root_url, :notice => "Added '" + @album[:artist] + " - " + @album[:title] + "'"
    else 
      render "new"
    end
  end

  def sort

    @responsejson = {
      :success => "false"
    }

    if params[:album]

      (params[:album].reverse!).each_with_index do |calbum,index|

        Album.update(calbum, :sortorder => index+1)

      end

      @responsejson[:success] = "true"

    end

    
    render :json => @responsejson

  end

  def remove

    @responsejson = {
      :success => "true"
    }
    current_user.albums.find(params[:id]).delete
    render :json => @responsejson

  end

end
