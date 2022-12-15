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

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  enum is_finished: { untouched: 1, in_progress: 2, completed: 3 }
end
