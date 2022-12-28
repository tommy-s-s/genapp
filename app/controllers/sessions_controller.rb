class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
#      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
#      redirect_back_or user
      redirect_to user

    else
      flash.now[:danger] = 'ユーザ名またはメールアドレスが誤っています'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    #add link_to destroy対応
    redirect_to root_url, status: :see_other 
  end

end
