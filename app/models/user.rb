class User < ActiveRecord::Base
  has_many :listings
  def admin?
    self.role == "admin"
  end
end
