class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  include Devise::JWT::RevocationStrategies::JTIMatcher
  self.jwt_revocation_strategy = self
  has_many :products
  has_many :purchases

  before_create :add_jti

  def add_jti
    self.jti = SecureRandom.uuid
  end
end
