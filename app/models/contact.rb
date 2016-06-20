class Contact
  include ActiveModel::Validations

  attr_accessor :name, :email, :message

  validates_presence_of :name, :message
  validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end
