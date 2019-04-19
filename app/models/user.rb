class User < ActiveRecord::Base
  def admin?
    self.role == "admin"
  end
end
