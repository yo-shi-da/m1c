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
User.create(name: admin, email: admin@com.jp, password: '000000', password_confirmation: '000000', admin: true)

names = [
	"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"
]

# Personl(26)
names.each_with_index do |name, i|
  Personal.create(
    birth_date: 'Fri, 02 Mar 1956', 
    height: '175.5', 
    body_weight: '65.5',
    gender: '男',
    bmi: '22.5',
    waist_circumference: '80.3',
    hba_onec: '5.2',
    underlying_disease: name,
    intake_per_oneday: '102.5',
    remarks: user,
    user_id: i + 1
  )
end

# Meal


# Group

Group.create(name: 'a_group', owner_id: '1')
Group.create(name: 'b_group', owner_id: '2')
Group.create(name: 'c_group', owner_id: '3')

# Favorite
# Member
# Post



