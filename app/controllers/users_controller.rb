class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  # def update
  #   @user = User.find(params[:id])

  #   if @user.type.blank? &&

  #     if @user.update(user_params1)
  #       redirect_to users_path
  #     else
  #       render 'edit'
  #     end
  #   else
  #     if @user.update(admin_params)
  #       redirect_to users_path
  #     else render 'edit'
  #     end
  #   end

  # end

  def update
    @user = User.find(params[:id])
    if @user.type.blank?
      @user.update(user_params1) ? redirect_to(users_path) : render('edit')
    else
      @user.update(admin_params) ? redirect_to(users_path) : render('edit')
    end
  end
  

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:type)
    end

    def user_params1
      params.require(:user).permit(:name,:email,:type)
    end

    def admin_params
      params.require(:admin).permit(:name,:email,:type)
    end
end
