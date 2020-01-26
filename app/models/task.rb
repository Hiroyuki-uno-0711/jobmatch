class Task < ApplicationRecord
  # タスク管理モデル

  belongs_to :user

  # バリデーション
  validates :complete_date, presence: true
  validates :task_content, presence: true

  # 日付が近いタスク順に並び替え
  default_scope -> { order(complete_date: :asc) }

end
