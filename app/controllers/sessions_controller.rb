class SessionsController < ApplicationController
  def index
  end

  def create
    @user = User.find_by_email(session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to '/organizations'
    else
      flash[:error] = "There was an error logging in"
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private
  def session_params
    params.require(:sessions).permit(:email, :password)
  end

end
