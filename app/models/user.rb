class User < ActiveRecord::Base
  before_save :default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: { case_sensitive: false }, presence: true #ver si funciona
  validate :validate_username
  validates :name, presence: true
  validates :lastname, presence: true

  enum role: [:admin, :cliente, :guest] 

  def default_role 
    self.role ||= 2
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

end
