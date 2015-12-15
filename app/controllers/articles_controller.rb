class ArticlesController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  #expose_decorated(:article)
  #expose_decorated(:articles)
  expose(:article)
  expose(:articles)

  def create
    article = Article.new(article_params)
    article.user_id = current_user.id

    if article.save
      redirect_to article, notice: 'Article was successfully created.'
    else
      redirect_to new_article_path, notice: article.errors.full_messages.join(", ")
    end
  end


  def update
    authorize article, :own?
    if article.update(article_params)
      redirect_to article, notice: 'Article was successfully updated.'
    else
      redirect_to edit_article_path, notice: article.errors.full_messages.join(", ")
    end
  end

  def destroy
    authorize article, :own?
    article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :text, :user_id)
    end

end
