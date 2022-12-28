class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,  only: :destroy

  def new
    @user = User.new
    #bushoを相互登録するため追加↓
    @user.user_bushos.build
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:succsess] = "succsess create user"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
    #bushoを相互登録するため追加↓
    @user.user_bushos.build
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  private
  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :emp_no,
                                 :join_date,
                                 :committee_id,
                                 :yakushoku_id,
                                 :liveaddress,
                                 :station,
                                 :salary,
                                 :bh_date,
                                 user_bushos_attributes: [:id, :busho_id, :addbusho_date, :delbusho_date, :_destroy, :id])
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
