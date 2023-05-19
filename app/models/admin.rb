class Admin < ApplicationRecord
  # Devise modules for authentication, including jwt_authenticatable for JWT token authentication.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  include Devise::JWT::RevocationStrategies::JTIMatcher
  self.jwt_revocation_strategy = self
  has_many :products
  has_many :purchases

  # Before creating an admin record, a JWT Identifier (jti) is added.
  before_create :add_jti

  # This method generates a new UUID as the JWT Identifier (jti) for the admin.
  def add_jti
    self.jti = SecureRandom.uuid
  end
end
