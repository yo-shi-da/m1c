class Personal < ApplicationRecord
  belongs_to :user

  enum gender: {
    男: 0,
    女: 1
  }

end
