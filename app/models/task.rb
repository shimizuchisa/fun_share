class Task < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :charges, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  def charged_by?(user)
    charges.exists?(user_id: user.id)
  end
end
