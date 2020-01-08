class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :job_information

end
