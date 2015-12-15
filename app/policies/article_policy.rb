class ArticlePolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def manage?
    @user.id == @article.user_id
  end
end
