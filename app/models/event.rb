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

  def charged_by?(user)
    charges.exists?(user_id: user.id)
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  enum is_finished: { untouched: 1, in_progress: 2, completed: 3 }

  def times
    times = {"9:00": "9:00",
             "9:30": "9:30"}
  end

  # def check_days(event)
    # day = event.start_time.wday
    # days = ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"]
#整数      0         1        2        3        4        5        6
    # return days[day]
  # end
end
