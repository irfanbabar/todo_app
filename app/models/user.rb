class User < ApplicationRecord
  # before_create :set_access_toke
  # before_create :set_access_token
  # before_action :authenticate_user!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
   has_many :appointments
    # validates FILL_IN, presence: true    # Replace FILL_IN with the right code.
    # validates FILL_IN, presence: true

   # validates, presence: true

   enum role: [:customer , :admin]

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
