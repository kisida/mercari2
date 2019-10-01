class UsersController < ApplicationController

# ユーザーマイページ（岸田）
  def index
  end
# ログアウト画面（山添）
  def logout
  end
# 中島エリア（不可侵領域）
  def credit_new
  end
# ユーザープロフィール編集ページ(山添)
  def show
    @user = User.find(params[:id])
  end

  def profile
  end

#　商品状態　出品中（山添）
  def status_selling
    @user = User.new
  end
#　商品状態　取引中（山添）
  def status_trading
  end
#　商品状態　売り切れ（山添）
  def status_sold
  end
#未使用
  def destroy
    user = user.find(params[:id])
    if user.user_id == current_user.id
      user.destroy
    end
    redirect_to action: :index
  end
# ユーザー本人確認ページ（関口）
  def regist
  end



end
