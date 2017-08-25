class SessionsController < ApplicationController
  # def login
  #   #Login Form
  # end
  def login_attempt
    # authorized_user = User.find_by(name: params[:username]).authenticate(params[:password])
    if  User.find_by(name: params[:username]) && User.find_by(name: params[:username]).authenticate(params[:password])
      flash[:notice] = "Welcome Back!, #{User.find_by(name: params[:username]).name}"
      session[:user_id] = User.find_by(name: params[:username]).id
      redirect_to('/pieces')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      redirect_to "/"
    end
  end
#   def login_attempt
#       @user = User.find_by_email(params[:email])
#       puts @user
#       # If the user exists AND the password entered is correct.
#       if @user && @user.authenticate(params[:password])
#         # Save the user id inside the browser cookie. This is how we keep the user
#         # logged in when they navigate around our website.
#         session[:user_id] = user.id
#         redirect_to '/pieces'
#       else
#       # If user's login doesn't work, send them back to the login form.
#         redirect_to '/'
#       end
# end
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
