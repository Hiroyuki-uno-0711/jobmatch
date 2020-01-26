class Entry < ApplicationRecord
  # ユーザーIDとチャットルームIDを結びつける中間モデル

  belongs_to :user
  belongs_to :room

end
