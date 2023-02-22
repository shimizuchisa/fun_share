class Event < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :charges, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :genre_id, presence: true
  validates :title, presence: true, length: {in: 2..10}
  validates :body, presence: true, length: {in: 2..200}
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_end_time

  # 開始時間・終了時間の前後チェック
  def start_end_time
    errors.add(:end_time, "は開始時間より遅い時間をい設定してください") unless
    self.start_time < self.end_time
  end

  def charged_by?(user)
    charges.exists?(user_id: user.id)
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  enum is_finished: { untouched: 1, in_progress: 2, completed: 3 }

end
