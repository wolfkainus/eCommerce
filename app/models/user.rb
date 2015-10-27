class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: { case_sensitive: false }, presence: true #ver si funciona
  validate :validate_username
  validates :name, presence: true
  validates :lastname, presence: true

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

end
