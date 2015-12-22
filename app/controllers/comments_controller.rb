class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: :destroy

  expose_decorated(:article)
  expose_decorated(:comment, attributes: :comment_params)

  def create
    comment.article = article # ask
    comment.user = current_user
    comment.save

    respond_with(comment, location: article_path(article))
  end

  def destroy
    comment.destroy
    respond_with(comment, location: article_path(article))
  end

  private

  def authorize_user!
    authorize(comment, :manage?)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
