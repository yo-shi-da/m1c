class Personal < ApplicationRecord
  validates :intake_per_oneday, length: { maximum: 6 }
  
  belongs_to :user

  enum gender: {
    男: 0,
    女: 1
  }

end
