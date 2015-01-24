class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    #authorize @comment


    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@topic, @post]
    end

  end

  #not sure if this is needed right now, but trying to keep it DRY for later
  def comment_params
    params.require(:comment).permit(:body)
  end

end
