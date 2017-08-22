class SessionsController < ApplicationController
  def login
    #Login Form
  end
  def login_attempt
    authorized_user = User.find_by(name: params[:username]).authenticate(params[:password])
    if authorized_user
      flash[:notice] = "Welcome Back!, you logged in as #{authorized_user.name}"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end
end
