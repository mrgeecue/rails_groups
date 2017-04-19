class UsersController < ApplicationController
  def index
  end

  def show
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/organizations'
      else
        flash[:error] = @user.errors.full_messages.to_s
        redirect_to '/'
      end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
