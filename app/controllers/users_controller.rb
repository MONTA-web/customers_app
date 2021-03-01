class UsersController < ApplicationController
  before_action :authenticate_user!,only:[:edit,:update]
  def edit
  end

  def update
    if current_user.update(params_user)
      flash[:notice] = 'アカウント編集が完了しました。'
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def params_user
    params.require(:user).permit(:name,:email)
  end
end
