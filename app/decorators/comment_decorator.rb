class CommentDecorator < ApplicationDecorator
  delegate :text, :user_id, :article, :persisted?, to: :comment
end
