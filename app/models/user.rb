class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                             default_url: "/images/avatars/default.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :full_name, presence: true

  has_many :articles
  has_many :comments

  def to_s
    full_name
  end

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end
end
