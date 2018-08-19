class User < ApplicationRecord
  # before_create :generate_token
  # before_create :set_access_toke
  # before_create :set_access_token
  # before_action :authenticate_user!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
   has_many :appointments
    
    enum role: [:customer , :admin]

  #  def generate_token
  #   self.token = SecureRandom.urlsafe_base64
  #   generate_token if User.exists?(token: self.token)
  # end
  #   private

  # def set_access_token
  #   self.access_token = generate_token
  # end

  # def generate_token
  #   loop do
  #     token = SecureRandom.hex(10)
  #     break token unless User.where(access_token: token).exists?
  #   end
  # end
    # export SENDMAIL_PASSWORD=password
    # export SENDMAIL_USERNAME=KHongSanFrancisco@gmail.com
    # export MAIL_HOST=localhost:3000

end
