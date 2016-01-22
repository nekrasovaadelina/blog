class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: :destroy

  expose_decorated(:article)
  expose_decorated(:comment, attributes: :comment_params)

  def create
    comment.article = article
    comment.user = current_user
    comment.save

    render partial: "comments/comment"
  end

  def destroy
    comment.destroy

    render nothing: true, status: :ok
  end

  private

  def authorize_user!
    authorize(comment, :manage?)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
