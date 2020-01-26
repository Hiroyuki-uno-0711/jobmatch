class Room < ApplicationRecord
  # チャットルームを作成＆保存するモデル

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

end
