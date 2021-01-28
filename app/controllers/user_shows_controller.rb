class UserShowsController < ApplicationController
  before_action :set_user_show, only: [:show, :update, :destroy]

  # GET /user_shows
  def index
    user_shows = UserShow.all

    render json: user_shows
  end

  # GET /user_shows/1
  def show
    render json: @user_show
  end

  # POST /user_shows
  def create
    user_show = UserShow.new(user_show_params)

    if user_show.save
      render json: user_show, status: :created, location: user_show
    else
      render json: user_show.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_shows/1
  def update
    if @user_show.update(user_show_params)
      render json: @user_show
    else
      render json: @user_show.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_shows/1
  def destroy
    user_show.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_show
      @user_show = UserShow.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_show_params
      params.require(:user_show).permit(:favorite, :currently_watching, :current_episode, :user_id, :media_id, :media_type)
    end
end
