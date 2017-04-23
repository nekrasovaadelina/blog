class UserAskArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: %i(edit update destroy)

  expose(:ask_article, attributes: :ask_article_params)

  def new
  end

  def create
    ask_article.user = current_user
    ask_article.save

    respond_with(ask_article)
  end

  def edit
  end

  def update
    ask_article.save

    respond_with(ask_article)
  end

  def destroy
    ask_article.destroy

    respond_with(ask_article)
  end

  private

  def authorize_user!
    authorize(ask_article, :manage?)
  end

  def ask_article_params
    params.require(:ask_article).permit(:title, :text)
  end
end
