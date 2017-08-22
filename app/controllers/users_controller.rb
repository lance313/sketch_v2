class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end

  end

  private
  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end

  # def set_tester
  #   @tester = Tester.find(params[:id])
  # end
  #
  # # Never trust parameters from the scary internet, only allow the white list through.
  # def tester_params
  #   params.require(:tester).permit(:name)
  # end

end
