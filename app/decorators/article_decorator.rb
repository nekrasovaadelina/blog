class ArticleDecorator < ApplicationDecorator
  delegate :title, :text, :persisted?, :user_id, :to_key, to: :article
  decorates_association :comments
end
