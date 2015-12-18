class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: :destroy
  # expose_decorated(:article)
  # expose_decorated(:comment)
  # expose_decorated(:comments) {article.comments}
  expose(:article)
  expose(:comment)
  expose(:comments) { article.comments }

  def create
    comment = article.comments.create(comment_params)
    comment.user_id = current_user.id 

    if comment.save
      respond_with(comment, location: article_path(article))
    else
      redirect_to article_path(article), alert: comment.errors.full_messages.join(", ")
    end
  end

  def destroy
    comment.destroy
    respond_with(comment, location: article_path(article))
  end

  private

    def authorize_user!
      redirect_to(root_path) unless CommentPolicy.new(current_user, comment).manage?   
    end
    
    def comment_params
      params.require(:comment).permit(:text, :user_id, :article_id)
    end
end
