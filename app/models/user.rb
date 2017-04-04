class User < ApplicationRecord
  # Delete items owned by user when user is deleted
  has_many :items, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable



  before_save {self.email.downcase if email.present?}
  before_save {self.name.capitalize if name.present?}
  before_save {self.role ||= :user}

  enum role: [:user, :admin]

  validates :name, length: {minimum: 1, maximum: 100}, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 254}
  validates :password, presence: true, length: {minimum: 6}


end
