class UsersController < ApplicationController

  def create
    @user = User.create(params.require(:user).permit(:name, :password, :password_confirmation))
    session[:user_id] = @user.id

    if params[:user][:password] != params[:user][:password_confrimation]
      redirect_to '/users/new'
    end
  end

end
