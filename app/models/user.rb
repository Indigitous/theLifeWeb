class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable,
         :token_authenticatable

  has_many :friends, dependent: :destroy

  before_save :ensure_authentication_token

  validates :first_name, :last_name, presence: true
end
