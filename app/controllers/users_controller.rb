class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    users = User.all

    render json: users
  end

  # GET /users/1
  def show
    render json: user
  end

  def login
    # byebug
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      token = encode_token({user_id: user.id})
      render json: {user: UserSerializer.new(user), token: token}
    else
      render json: {error: "Incorrect Name or Password"}
    end
  end

  # POST /users
  def create
    user = User.new(user_params)

    if user.save!
      token = encode_token({user_id: user.id})
      render json: {user:user, status: :created, location: user, token: token}
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    # byebug
    # @user.update(user_params)
    if @user.update!(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    if @user.destroy!
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def getuser
    render json: {user: UserSerializer.new(current_user)}
  end

  def newshow
    user = User.find(params[:user][:id])

    if params[:show][:type] === "movie"  
      if Movie.find_by(title: params[:show][:title])
        movie = Movie.find_by(title: params[:show][:title])
      else
        movie = Movie.create(title: params[:show][:title], genre:params[:show][:genre], plot: params[:show][:plot], poster: params[:show][:poster], length: params[:show][:length])
      end
      us = UserShow.create(favorite: false, currently_watching: false, user: user, media_id: movie.id, media_type: "Movie")
    elsif params[:show][:type] === "series" 
      if TvShow.find_by(title: params[:show][:title])
        show = TvShow.find_by(title: params[:show][:title])
      else
        show = TvShow.create(title: params[:show][:title], genre:params[:show][:genre], plot: params[:show][:plot], poster: params[:show][:poster], length: params[:show][:length])   
      end
      us = UserShow.create(favorite: false, currently_watching: false, user: user, media_id: show.id, media_type: "TvShow")
    else 
      puts "coming soon" 
    end

    if us.save!
      render json: user
    else
      render json: us.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :img_url)
    end

    def movie_params
      params.require(:movie).permit(:title, :genre, :plot, :poster, :length)
    end

    def user_show_params
      params.require(:user_show).permit(:favorite, :currently_watching, :current_episode, :user_id, :review_id, :media_id, :media_type)
    end

    def tv_show_params
      params.require(:tv_show).permit(:title, :genre, :plot, :poster, :length)
    end

    def review_params
      params.require(:review).permit(:notes)
    end
end
