class CommentsController < InheritedResources::Base

  def new
    @comment = current_user.comments.new(comment_params)
  end
  

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      ;flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.imageable)
    else
      flash[:notice] = "Error creating comment: #{@comment.errors}"
      redirect_to(@comment.imageable)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(@comment.imageable)
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :imageable_id, :imageable_type, :content)
    end

end
