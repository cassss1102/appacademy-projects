class User < ActiveRecord::Base
  validates :email, :session_token, :password_digest, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token!
  attr_reader :password

  def generate_sesssion_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token
    self.session_token = self.generate_sesssion_token
    self.save!
    self.session_token
  end

  def ensure_session_token!
    self.session_token ||= self.generate_sesssion_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
   #validate password if user exist
   return nil unless user
   user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
