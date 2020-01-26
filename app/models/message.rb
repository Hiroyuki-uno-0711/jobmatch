class Message < ApplicationRecord
  # チャットでの会話を保存するメッセージモデル

  belongs_to :user
  belongs_to :room

  default_scope -> { order(created_at: :desc) }

end
