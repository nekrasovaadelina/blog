class ArticleDecorator < ApplicationDecorator
  delegate :title, :text, :persisted?, :user_id, :to_key, to: :article

  def comments
  	comments = object.comments.decorate
  end
end
