class Genre < ApplicationRecord
  has_many :events

  validates :name, presence: true, length: {in: 2..10}
end
