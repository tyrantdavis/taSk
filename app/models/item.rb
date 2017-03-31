class Item < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, length: {minimum: 1, maximum: 255}

end
