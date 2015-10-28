class User < ActiveRecord::Base
  before_save :default_role
  has_many :reviews, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :likes
  has_many :product_likes, through: :likes, source: :likeable, source_type: 'Product'
  has_many :review_likes, through: :likes, source: :likeable, source_type: 'Review'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: {case_sensitive: false}, presence: true
  validates :name, presence: true
  validates :lastname, presence: true

  validate :validate_username

  enum role: [:admin, :cliente, :guest] 

  def default_role 
    self.role ||= 1
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def to_s
    "#{self.name} #{self.lastname}"
  end
end
