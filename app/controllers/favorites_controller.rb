class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.build(post: @post)
    authorize @favorite

    if @favorite.save
      flash[:notice] = "Post is now a favorite!"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Post could not be made favorite."
      redirect_to [@post]
    end

  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorited(@post)
      authorize @favorite

    if @favorite.destroy
      flash[:notice] = "Post has been Un-favorited."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Post could not be Un-favorited."
      redirect_to [@post.topic, @post]
    end

  end

end
