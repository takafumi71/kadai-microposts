class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    current_user.favorites.create(micropost_id: params[:micropost_id])
    flash[:success] = "お気に入りに追加しました"
    redirect_to root_url
  end

  def destroy
    post = current_user.favorites.find_by(micropost_id: params[:micropost_id])
    post.destroy
    flash[:success] = "お気に入りを解除しました"
    redirect_to post
  end
end
