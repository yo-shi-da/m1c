users = { 
  a: "a@com.jp", b: "b@com.jp", c: "c@com.jp", d: "d@com.jp", e: "e@com.jp", f: "f@com.jp", g: "g@com.jp", 
  h: "h@com.jp", i: "i@com.jp", j: "j@com.jp", k: "k@com.jp", l: "l@com.jp", m: "m@com.jp", n: "n@com.jp", 
  o: "o@com.jp", p: "p@com.jp", q: "q@com.jp", r: "r@com.jp", s: "s@com.jp", t: "t@com.jp", u: "u@com.jp", 
  v: "v@com.jp", w: "w@com.jp", x: "x@com.jp", y: "y@com.jp", z: "z@com.jp",
}

# Users(26)
users.each do |key, value|
  User.create(name: key, email: value, password: '000000', password_confirmation: '000000', admin: false)
end

# Admin
User.create(name: 'admin', email: 'admin@com.jp', password: '000000', password_confirmation: '000000', admin: true)

names = [
	"f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"
	# "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"
]

# Personl(26)
names.each_with_index do |name, i|
  Personal.create(
    birth_date: 'Fri, 02 Mar 1975', 
    height: '175', 
    body_weight: '65',
    gender: '男',
    bmi: '22',
    waist_circumference: '80',
    hba_onec: '5',
    underlying_disease: name,
    intake_per_oneday: '100',
    remarks: name,
    user_id: i + 1
  )
end

# # OK
# Personal.create(birth_date: 'Fri, 02 Mar 1956', height: '175', body_weight: '65', gender: '男', bmi: '22', waist_circumference: '80', hba_onec: '5', underlying_disease: "name", intake_per_oneday: '10', remarks: "a", user_id: 5);

# Meal
  Meal.create(
  sugar_amount: '100',
  sugar_cube: '25',
  classification: '朝',
  image: File.open("#{Rails.root}/public/menu/menu5.jpg"),
  start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
  reading_checks: 'false',
  remarks: 'a',
  user_id: 1 
  )

  Meal.create(
  sugar_amount: '100',
  sugar_cube: '25',
  classification: '朝',
  image: File.open("#{Rails.root}/public/menu/menu6.jpg"),
  start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
  reading_checks: 'false',
  remarks: 'b',
  user_id: 2
  )

  Meal.create(
  sugar_amount: '100',
  sugar_cube: '25',
  classification: '朝',
  image: File.open("#{Rails.root}/public/menu/menu7.jpg"),
  start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
  reading_checks: 'false',
  remarks: 'c',
  user_id: 3
  )

  Meal.create(
  sugar_amount: '100',
  sugar_cube: '25',
  classification: '朝',
  image: File.open("#{Rails.root}/public/menu/menu8.jpg"),
  start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
  reading_checks: 'false',
  remarks: 'd',
  user_id: 4
  )

  Meal.create(
  sugar_amount: '100',
  sugar_cube: '25',
  classification: '朝',
  image: File.open("#{Rails.root}/public/menu/menu9.jpg"),
  start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
  reading_checks: 'false',
  remarks: 'e',
  user_id: 5
  )

names.each_with_index do |name, i|
  Meal.create(
  sugar_amount: '100',
  sugar_cube: '25',
  classification: '朝',
  image: File.open("#{Rails.root}/public/menu/menu#{rand(1..9)}.jpg"),
  start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
  reading_checks: 'false',
  remarks: name,
  user_id: i + 5 
  )
end

# OK
# Meal.create(sugar_amount: '10', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/public/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false',remarks: 'name', user_id: 2 )

# Group
Group.create(name: 'a_group', owner_id: '1')
Group.create(name: 'b_group', owner_id: '2')
Group.create(name: 'c_group', owner_id: '3')
Group.create(name: 'd_group', owner_id: '4')
Group.create(name: 'e_group', owner_id: '5')

# Member
Member.create(user_id: '1', group_id: '1')
Member.create(user_id: '2', group_id: '2')
Member.create(user_id: '3', group_id: '3')
Member.create(user_id: '4', group_id: '4')
Member.create(user_id: '5', group_id: '5')

# Favorite
Favorite.create(user_id: '1', meal_id: '5')
Favorite.create(user_id: '2', meal_id: '4')
Favorite.create(user_id: '3', meal_id: '3')
Favorite.create(user_id: '4', meal_id: '2')
Favorite.create(user_id: '5', meal_id: '1')

# Post
owner_comments = [
  'その調子です。', 
  'いい感じです。',
  'ちょっと多いですね。',
  '多いですね。',
  '摂り過ぎです。'
]

owner_comments.each_with_index do |owner_comment, i|
  Post.create(
    owner_comment: owner_comment,
    owner_sugar_amount: '10',
    difference: '10',
    meal_id: i + 1
  )
end

# OK
# Post.create(owner_comment: 'OK',owner_sugar_amount: '10',difference: '10',meal_id: 1);





