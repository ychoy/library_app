class User < ApplicationRecord
  has_many :library_users, dependent: :destroy
  has_many :libraries, through: :library_users

	has_secure_password
 #note: has_secure_password automatically adds validations for presence
  # of password, password length < 72 characters, and password_confirmati

	validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}
  validates :email,
		presence: true,
		uniqueness: true,
		length: {maximum: 250},
		format: {
    	with: /@/,
			message: "not a valid format"
		}
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: false

  def self.confirm(params)  #check if the email and password are a matching pair
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end

  def member?(library)
    libraries.user.include?(self)   #equivalent to: library.member?(self)
  end
end
