class Genre < ApplicationRecord
  has_many :events, dependent: :destroy


  validates :name, presence: true, length: {in: 2..10}
end
