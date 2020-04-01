class ArtistsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :find_artist, except: [:index, :new, :create]
def index
  @artists = current_user.artists.all

end
def show
    # @artist = Artist.find(params[:id])
    if @artist.user != current_user
      flash[:notice] = 'Not allowed!'
      redirect_to artists_path
      # we gite it form rails routes prifixe
    end
    @songs = @artist.songs
  end
  def new
    @artist = Artist.new
  end
  def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user
    if @artist.save
     redirect_to artists_path
    else
      render 'new'
    end
  end
  def edit
    @artist = Artist.find(params[:id])
  end
  def update
    artist = Artist.find(params[:id])
    artist.update(params.require(:artist).permit(:name, :albums, :hometown, :img))
      
    redirect_to artist
  end
  def destroy
    Artist.find(params[:id]).destroy
  
    redirect_to artists_path
  end
end

private
  def artist_params
    params.require(:artist).permit(:name, :albums, :hometown, :img)
  end
  def find_artist
    @artist = Artist.find(params[:id])
  end

