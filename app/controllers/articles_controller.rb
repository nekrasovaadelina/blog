class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  expose_decorated(:article)
  expose_decorated(:articles) { |default| default.includes(:user) }
  expose_decorated(:comment)
  expose_decorated(:comments, ancestor: :article) 

  def create
    article = Article.new(article_params)
    article.user = current_user
    article.save

    respond_with(article)
  end

  def update
    article.update(article_params)
      
    respond_with(article)
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
