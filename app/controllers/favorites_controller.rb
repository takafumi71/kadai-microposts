class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def index
    @favorite_posts = current_user.feed_favorite_posts.order(id: :desc).page(params[:page])
  end
  
  def create
    post = Micropost.find(params[:micropost_id])
    current_user.add_favorite(post)
    flash[:success] = "お気に入りに追加したました"
    redirect_to post
  end

  def destroy
    post = Micropost.find(params[:micropost_id])
    current_user.unfavorite(post)
    flash[:success] = "お気に入りを解除しました"
    redirect_to post
  end
end
