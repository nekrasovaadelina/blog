class AskCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: :destroy

  expose_decorated(:ask_article)
  expose_decorated(:ask_comment, attributes: :ask_comment_params)

  def create
    ask_comment.ask_article = ask_article
    ask_comment.user = current_user
    ask_comment.save

    render partial: "ask_comment"
  end

  def destroy
    ask_comment.destroy

    render nothing: true, status: :ok
  end

  private

  def authorize_user!
    authorize(ask_comment, :manage?)
  end

  def ask_comment_params
    params.require(:ask_comment).permit(:text)
  end
end
