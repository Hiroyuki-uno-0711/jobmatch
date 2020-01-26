class Favorite < ApplicationRecord
  # お気に入り（イイネ）モデル

  belongs_to :user
  belongs_to :job_information

end
