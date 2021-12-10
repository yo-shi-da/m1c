class Food < ApplicationRecord
  validates :classification, presence: true
  validates :food_name, presence: true
  validates :food_amount, presence: true
  validates :sugar_amount, presence: true

  enum classification: {
    穀類: 0,
    いも・でんぷん類: 1,
    砂糖・甘味料: 2,
    豆類: 3,
    野菜類: 4,
    果実類: 5,
    魚介類: 6,
    肉類: 7,
    卵類: 8,
    乳類: 9,
    菓子類: 10,
    調味料･香辛料類: 11
  }  

end
