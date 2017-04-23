class AskArticle < ActiveRecord::Base
  belongs_to :user
  has_many :ask_comments, dependent: :destroy

  validates :title, presence: true
  validates :text, presence: true
end
