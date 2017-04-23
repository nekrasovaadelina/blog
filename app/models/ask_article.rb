class AskArticle < ActiveRecord::Base
  belongs_to :user
  has_many :ask_comments, dependent: :destroy

  validates :title, presence: true
  validates :text, presence: true


  def user_name
  	user.full_name
  end

  def author
    user.id
  end
end
