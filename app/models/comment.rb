class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :body, presence: true, length: {in: 2..200}

end
