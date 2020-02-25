class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :require_user_logged_in, only: [:index, :show]
=======
    before_action :require_user_logged_in, only: [:index, :show,:delete,:edit]

>>>>>>> abb0becc9320e6fc48d3f2ea359f022dbdbc7ff4
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
         @task = Task.find(params[:id])

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end