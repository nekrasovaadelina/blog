class AskComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :ask_article

  validates :text, presence: true

  def user_name
    user.full_name
  end

  def author
    user.id
  end
end
