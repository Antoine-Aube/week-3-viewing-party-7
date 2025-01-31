class User <ApplicationRecord 
  validates_presence_of :email, :name
  validates_uniqueness_of :email
  validates_presence_of :password
  has_many :viewing_parties
  has_secure_password
  
  enum role: %w[default manager admin]

  # def admin?
  #   true if role == "admin"
  # end

  # def manager?
  #   true if role == "manager"
  # end
end 