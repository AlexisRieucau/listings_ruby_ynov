class User < ActiveRecord::Base
  has_many :listings
  has_many :messages
  def admin?
    self.role == "admin"
  end
end
