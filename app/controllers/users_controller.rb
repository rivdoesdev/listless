class UsersController < ApplicationController
  def index
    render locals: {
      users: User.all
    }
  end

  def show
    if User.exists?(params[:id])
    render locals: {
      user: User.find(params[:id])
    }
    else
      render html: { message: "User not found"}, status: 404
    end
  end

  def new
    render locals: {
      user: User.new
    }
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to root
    else
      render :new
    end
  end

  def edit
    render locals: {
      user: User.find(params[:id])
    }
  end

  def update
    if User.exists?(params[:id])
      user.update(user_params)
      redirect_to root
    else
      render :edit
    end
  end
end

private
def user_params
  params.require(:user).permit(:name, :email, :password)
end
