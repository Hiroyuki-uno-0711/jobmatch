class Task < ApplicationRecord

  belongs_to :user

  # バリデーション
  validates :complete_date, presence: true
  validates :task_content, presence: true

end
