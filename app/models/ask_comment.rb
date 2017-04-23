class AskComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :ask_article

  validates :text, presence: true
end
