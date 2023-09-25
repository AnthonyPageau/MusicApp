class SubGenresController < ApplicationController
  before_action :set_sub_genre, only: %i[ show edit update destroy ]
  before_action :set_genre, only: %i[ new edit update ]

  # GET /sub_genres or /sub_genres.json
  def index
    @sub_genres = SubGenre.all
  end

  # GET /sub_genres/1 or /sub_genres/1.json
  def show
  end

  # GET /sub_genres/new
  def new
    @sub_genre = SubGenre.new
  end

  # GET /sub_genres/1/edit
  def edit
  end

  # POST /sub_genres or /sub_genres.json
  def create
    @sub_genre = SubGenre.new(sub_genre_params)

    respond_to do |format|
      if @sub_genre.save
        format.html { redirect_to sub_genre_url(@sub_genre), notice: "Sub genre was successfully created." }
        format.json { render :show, status: :created, location: @sub_genre }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sub_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_genres/1 or /sub_genres/1.json
  def update
    respond_to do |format|
      if @sub_genre.update(sub_genre_params)
        format.html { redirect_to sub_genre_url(@sub_genre), notice: "Sub genre was successfully updated." }
        format.json { render :show, status: :ok, location: @sub_genre }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sub_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_genres/1 or /sub_genres/1.json
  def destroy
    @sub_genre.destroy

    respond_to do |format|
      format.html { redirect_to sub_genres_url, notice: "Sub genre was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def find_sub_genre
    sub_genre = SubGenre.find_by(name: params[:search])
    if sub_genre
      redirect_to sub_genre_path(sub_genre)
    else
      flash[:alert] = "Can't find Sub genre with name #{params[:search]}"
      redirect_to sub_genres_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_genre
      @sub_genre = SubGenre.find(params[:id])
    end

    def set_genre
      @genre = Genre.all
    end

    # Only allow a list of trusted parameters through.
    def sub_genre_params
      params.require(:sub_genre).permit(:name, :description, :genre_id)
    end
end
