class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[ show edit update destroy ]
  # before_action :set_genres, only: %i[ new edit update ]
  # before_action :set_sub_genres, only: %i[ new edit update ]

  # GET /artists or /artists.json
  def index
    @artists = Artist.all
  end

  # GET /artists/1 or /artists/1.json
  def show
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists or /artists.json
  def create
    @artist = Artist.new(name: params[:artist][:name], country: params[:artist][:country])

    @artist.genres << genre
    @artist.sub_genres << sub_genre

    respond_to do |format|
      if @artist.save
        format.html { redirect_to artist_url(@artist), notice: "Artist was successfully created." }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1 or /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to artist_url(@artist), notice: "Artist was successfully updated." }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1 or /artists/1.json
  def destroy
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to artists_url, notice: "Artist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def find_artist
    artist = Artist.find_by(name: params[:search])
    if artist
      redirect_to artist_path(artist)
    else
      flash[:alert] = "Can't find artist with name #{params[:search]}"
      redirect_to artists_url
    end
  end

  private

    def genre
      Genre.find(params[:artist][:genre_id])
    end

    def sub_genre
      SubGenre.find(params[:artist][:sub_genre_id])
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :country, :genre_id, :sub_genre_id)
    end
end
