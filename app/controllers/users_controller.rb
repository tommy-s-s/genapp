class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    #bushoを相互登録するため追加↓
    #@user.user_bushos.build
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

  def edit
    @user = User.find(params[:id])
    #bushoを相互登録するため追加↓
    #@user.user_bushos.build
  end

  def index
    @users = User.paginate(page: params[:page])
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
  
end
