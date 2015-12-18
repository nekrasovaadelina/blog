class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_user!, only: [:edit, :update, :destroy] 
  # expose_decorated(:article)
  # expose_decorated(:articles)
  expose(:article)
  expose(:articles) { |default| default.includes(:user) }

  def create
    article = Article.new(article_params)
    article.user_id = current_user.id
    if article.save
      respond_with(article)
    else
      redirect_to new_article_path, alert: article.errors.full_messages.join(", ")
    end
  end

  def update
    if article.update(article_params)
      respond_with(article)
    else
      redirect_to edit_article_path, alert: article.errors.full_messages.join(", ")
    end
  end

  def destroy
    article.destroy
    respond_with(article)
  end

  private

    def authorize_user!
      redirect_to(root_path) unless ArticlePolicy.new(current_user, article).manage?   
    end

    def article_params
      params.require(:article).permit(:title, :text, :user_id)
    end
end
