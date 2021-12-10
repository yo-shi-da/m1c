users = { 
  "チンギス・ハーン(a)": "a@com.jp", 
  "中大兄皇子(b)": "b@com.jp", 
  "大塩平八郎(c)": "c@com.jp", 
  "近松門左衛門(d)": "d@com.jp", 
  "小野妹子(e)": "e@com.jp", 
  "卑弥呼(f)": "f@com.jp", 
  "釈迦(g)": "g@com.jp", 
  "後醍醐天皇(h)": "h@com.jp", 
  "イエス・キリスト(i)": "i@com.jp", 
  "ペリー(j)": "j@com.jp", 
  "源頼朝(k)": "k@com.jp", 
  "レイチェルカーソン(l)": "l@com.jp", 
  "マザーテレサ(m)": "m@com.jp", 
  "ニーチェ(n)": "n@com.jp", 
  "サビエル(o)": "o@com.jp", 
  "与謝蕪村(p)": "p@com.jp", 
  "ドストエフスキー(q)": "q@com.jp", 
  "足利尊氏(r)": "r@com.jp", 
  "リンカーン(s)": "s@com.jp", 
  "(t)": "t@com.jp", 
  "伊藤博文(u)": "u@com.jp", 
  "プラトン(v)": "v@com.jp", 
  "ウィトゲンシュタイン(w)": "w@com.jp", 
  "ソクラテス(x)": "x@com.jp", 
  "坂上田村麻呂(y)": "y@com.jp", 
  "ケインズ(z)": "z@com.jp"
}

# Users(26)
users.each do |key, value|
  User.create(name: key, email: value, password: '000000', password_confirmation: '000000', admin: false)
end

# Admin
User.create(name: 'admin', email: 'admin@com.jp', password: '000000', password_confirmation: '000000', admin: true)

names = %w(
  ザビエル(a) 
  中大兄皇子(b) 
  大塩平八郎(c) 
  近松門左衛門(d) 
  小野妹子(e) 
  卑弥呼(f) 
  釈迦(g) 
  後醍醐天皇(h) 
  イエス・キリスト(i) 
  ペリー(j) 
  カント(k) 
  レイチェルカーソン(l) 
  マザーテレサ(m) 
  ニーチェ(n) 
  ケネディ(o) 
  ピタゴラス(p) 
  ドストエフスキー(q) 
  ルソー(r) 
  リンカーン(s) 
  トルストイ(t) 
  ヘーゲル(u) 
  プラトン(v) 
  ウィトゲンシュタイン(w) 
  ソクラテス(x) 
  ガリレオ・ガリレイ(y) 
  ケインズ(z)
)
# "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"

# Personl(26)
# binding.pry
# birth_dates = ['Fri, 01 Mar 1975', 'Mon, 02 Mar 1976']
names.each_with_index do |name, i|
  genders = %w(男 女)
  birth_dates = [
    '01 Mar 1975', 
    '02 Mar 1976', 
    '03 Mar 1977',
    '04 Mar 1978',
    '05 Mar 1979',
    '06 Mar 1980',
    '07 Mar 1981',
    '08 Mar 1982',
    '09 Mar 1983',
    '10 Mar 1984',
    '11 Mar 1985',
    '12 Mar 1986',
    '13 Mar 1987',
    '14 Mar 1988',
    '15 Mar 1989',
    '16 Mar 1990'
  ]
  Personal.create(
    birth_date: birth_dates.sample, 
    height: rand(160..190), 
    body_weight: rand(50..99),
    gender: genders.sample,
    bmi: rand(18..30),
    waist_circumference: rand(65..99),
    hba_onec: rand(5..7),
    underlying_disease: name,
    intake_per_oneday: rand(100..400),
    examination_ticket_number: rand(100000..999999),
    image: File.open("#{Rails.root}/public/great_man#{i}.jpg"),
    remarks: name,
    user_id: i + 1
  )
end

# # OK
# Personal.create(birth_date: 'Fri, 02 Mar 1956', height: rand(100..150), body_weight: '65', gender: '男', bmi: '22', waist_circumference: '80', hba_onec: '5', underlying_disease: "test", intake_per_oneday: '10', remarks: "test", user_id: 5);

# Meal
# start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
names.each_with_index do |name, i|
  classifications = %w(朝 昼 夜 間食)
  Meal.create(
  sugar_amount: rand(100..400),
  sugar_cube: rand(10..100),
  classification: classifications.sample,
  image: File.open("#{Rails.root}/public/menu#{rand(1..9)}.jpg"),
  # image: File.open("#{Rails.root}/public/menu/image/1/menu#{rand(1..9)}.jpg"),
  start_time: Date.today,
  reading_checks: 'false',
  remarks: name,
  user_id: i + 1 
  )
end

  # Meal.create(
  # sugar_amount: '100',
  # sugar_cube: '25',
  # classification: '朝',
  # image: File.open("#{Rails.root}/public/menu/image/1/menu1.jpg"),
  # start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
  # reading_checks: 'false',
  # remarks: "a",
  # user_id: 1
  # )

  # Meal.create(
  # sugar_amount: '100',
  # sugar_cube: '25',
  # classification: '朝',
  # image: File.open("#{Rails.root}/public/menu/image/1/menu2.jpg"),
  # start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
  # reading_checks: 'false',
  # remarks: "b",
  # user_id: 2
  # )

  # Meal.create(
  # sugar_amount: '100',
  # sugar_cube: '25',
  # classification: '朝',
  # image: File.open("#{Rails.root}/public/menu/image/1/menu3.jpg"),
  # start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
  # reading_checks: 'false',
  # remarks: "c",
  # user_id: 3
  # )

  # Meal.create(
  # sugar_amount: '100',
  # sugar_cube: '25',
  # classification: '朝',
  # image: File.open("#{Rails.root}/public/menu/image/1/menu4.jpg"),
  # start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
  # reading_checks: 'false',
  # remarks: "d",
  # user_id: 4
  # )

  # Meal.create(
  # sugar_amount: '100',
  # sugar_cube: '25',
  # classification: '朝',
  # image: File.open("#{Rails.root}/public/menu/image/1/menu5.jpg"),
  # start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
  # reading_checks: 'false',
  # remarks: "e",
  # user_id: 5
  # )

  # Meal.create(
  # sugar_amount: '100',
  # sugar_cube: '25',
  # classification: '朝',
  # image: File.open("#{Rails.root}/public/menu/image/1/menu6.jpg"),
  # start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
  # reading_checks: 'false',
  # remarks: "f",
  # user_id: 6
  # )

  # Meal.create(
  # sugar_amount: '100',
  # sugar_cube: '25',
  # classification: '朝',
  # image: File.open("#{Rails.root}/public/menu/image/1/menu7.jpg"),
  # start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00',
  # reading_checks: 'false',
  # remarks: "g",
  # user_id: 7
  # )

# OK
# Meal.create(sugar_amount: '10', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/public/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false',remarks: 'name', user_id: 2 )

# Group
Group.create(name: '県立A病院', owner_id: '1')
Group.create(name: '県立B病院', owner_id: '2')
Group.create(name: '県立C病院', owner_id: '3')
Group.create(name: '県立D病院', owner_id: '4')
Group.create(name: '県立E病院', owner_id: '5')

# Member
Member.create(user_id: '1', group_id: '1')
Member.create(user_id: '2', group_id: '2')
Member.create(user_id: '3', group_id: '3')
Member.create(user_id: '4', group_id: '4')
Member.create(user_id: '5', group_id: '5')
Member.create(user_id: '6', group_id: '1')
Member.create(user_id: '7', group_id: '1')
Member.create(user_id: '8', group_id: '2')
Member.create(user_id: '9', group_id: '2')
Member.create(user_id: '10', group_id: '3')
Member.create(user_id: '11', group_id: '3')
Member.create(user_id: '12', group_id: '4')
Member.create(user_id: '13', group_id: '4')
Member.create(user_id: '14', group_id: '5')
Member.create(user_id: '15', group_id: '5')

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
    owner_sugar_amount: rand(300..500),
    difference: rand(100..300),
    meal_id: i + 1
  )
end

# OK
# Post.create(owner_comment: 'OK',owner_sugar_amount: '10',difference: '10',meal_id: 1);

# food

classifications_all = [
'穀類',
'穀類',
'穀類',
'穀類',
'穀類',
'穀類',
'穀類',
'穀類',
'穀類',
'穀類',
'穀類',
'いも・でんぷん類',
'いも・でんぷん類',
'いも・でんぷん類',
'いも・でんぷん類',
'いも・でんぷん類',
'いも・でんぷん類',
'いも・でんぷん類',
'いも・でんぷん類',
'いも・でんぷん類',
'いも・でんぷん類',
'砂糖・甘味料',
'砂糖・甘味料',
'砂糖・甘味料',
'砂糖・甘味料',
'豆類',
'豆類',
'豆類',
'豆類',
'豆類',
'豆類',
'豆類',
'豆類',
'豆類',
'豆類',
'豆類',
'豆類',
'豆類',
'豆類',
'豆類',
'豆類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'野菜類',
'果実類',
'果実類',
'果実類',
'果実類',
'果実類',
'果実類',
'果実類',
'果実類',
'果実類',
'果実類',
'果実類',
'魚介類',
'魚介類',
'魚介類',
'魚介類',
'魚介類',
'魚介類',
'魚介類',
'魚介類',
'魚介類',
'魚介類',
'魚介類',
'魚介類',
'肉類',
'肉類',
'肉類',
'肉類',
'肉類',
'肉類',
'肉類',
'肉類',
'肉類',
'肉類',
'肉類',
'肉類',
'肉類',
'肉類',
'肉類',
'肉類',
'乳類',
'乳類',
'乳類',
'乳類',
'乳類',
'乳類',
'乳類',
'乳類',
'乳類',
'乳類',
'乳類',
'乳類',
'乳類',
'乳類',
'菓子類',
'菓子類',
'菓子類',
'菓子類',
'菓子類',
'菓子類',
'菓子類',
'菓子類',
'菓子類',
'菓子類',
'菓子類',
'菓子類',
'調味料･香辛料類',
'調味料･香辛料類',
'調味料･香辛料類',
'調味料･香辛料類',
'調味料･香辛料類',
'調味料･香辛料類',
'調味料･香辛料類',
'調味料･香辛料類',
'調味料･香辛料類',
'調味料･香辛料類',
'調味料･香辛料類',
'調味料･香辛料類',
'調味料･香辛料類',
'調味料･香辛料類'
]

food_names_all = [
'小麦粉',
'6枚切り食パン',
'ロールパン',
'うどん（ゆで麺）',
'そば（ゆで麺）',
'そうめん（乾麺）',
'ラーメン（生麺）',
'スパゲッティ（乾麺）',
'白米',
'もち',
'焼きふ',
'板こんにゃく',
'さつまいも',
'さといも',
'じゃがいも',
'長いも',
'片栗粉',
'コーンスターチ',
'くずきり（乾燥）',
'ごま豆腐',
'緑豆はるさめ（乾燥）',
'砂糖',
'水あめ',
'はちみつ',
'メープルシロップ',
'ゆであずき（無糖）',
'ゆであずき（加糖）',
'いんげんまめ（ゆで）',
'大豆（乾燥）',
'大豆（水煮）',
'黒豆（乾燥）',
'おから',
'きな粉',
'木綿豆腐',
'絹ごし豆腐',
'生揚げ（厚揚げ）',
'がんもどき',
'凍り豆腐（高野豆腐・乾燥）',
'納豆',
'豆乳',
'ゆば（生）',
'アスパラガス',
'えだまめ（ゆで）',
'かぶ',
'かぼちゃ',
'キャベツ',
'きゅうり',
'水菜',
'ごぼう',
'小松菜',
'大根',
'玉ねぎ',
'トマト',
'ニンジン',
'青ピーマン',
'ブロッコリー',
'もやし（緑豆）',
'れんこん',
'いちご',
'温州みかん',
'柿',
'キウイフルーツ',
'さくらんぼ（国産）',
'すいか',
'日本なし',
'バナナ',
'ぶどう',
'桃',
'りんご',
'一般的に食べられる生魚',
'ツナ（水煮缶）',
'うなぎ（かば焼き）',
'いくら',
'たらこ',
'あさり',
'えび・あまえび',
'ずわいがに',
'するめ',
'かに風味かまぼこ',
'焼き竹輪',
'さつま揚げ',
'和牛（肝臓を除く）全般',
'牛肝臓（レバー）',
'豚（肝臓を除く）全般',
'豚肝臓（レバー）',
'ロースハム',
'ベーコン',
'ウインナー',
'鶏（肝臓を除く）全般',
'鶏肝臓',
'ラムロース',
'合鴨',
'うずら卵・全卵',
'うずら卵・水煮',
'鶏卵・全卵',
'鶏卵・卵黄',
'鶏卵・卵白',
'普通牛乳',
'加工乳・低脂肪タイプ',
'粉乳類・全粉乳',
'練乳類・加藤練乳',
'生クリーム・乳脂肪',
'生クリーム・植物性脂肪',
'ヨーグルト・全脂無糖',
'ヨーグルト・ドリンクタイプ',
'ナチュラルチーズ・カマンベール',
'ナチュラルチーズ・クリーム',
'ナチュラルチーズ・パルメザン',
'プロセスチーズ',
'アイスクリーム',
'ソフトクリーム',
'カステラ',
'みたらし団子',
'どら焼き',
'ようかん',
'せんべい・甘辛',
'シュークリーム',
'ショートケーキ',
'アップルパイ',
'プリン',
'コーヒーゼリー',
'ポテトチップス',
'ミルクチョコレート',
'ウスターソース',
'オイスターソース',
'こいくちしょうゆ',
'うすくちしょうゆ',
'食塩',
'穀物酢',
'固形ブイヨン',
'トマトケチャップ',
'マヨネーズ',
'麦みそ',
'カレールウ',
'こしょう（粉）',
'焼き肉のたれ',
'和風ドレッシング'
]

food_amounts_all = [
'100',
'60（1枚）',
'30（1個）',
'250（1玉）',
'200（1玉）',
'100（2束1食分）',
'120（1玉）',
'80（1食分）',
'150（茶碗小1杯）',
'50（小1個）',
'5',
'125（2分の1枚）',
'100（中2分の1本）',
'100（中2個）',
'100（小1個）',
'100',
'9（大さじ1）',
'6（大さじ1）',
'20（約1食分）',
'70（約1食分）',
'20（約1食分）',
'9（大さじ1）',
'21（大さじ1）',
'21（大さじ1）',
'21（大さじ1）',
'100',
'100',
'100',
'100',
'100',
'100',
'100',
'100',
'150（2分の1丁）',
'150（2分の1丁）',
'150（1食分）',
'80（1個）',
'20（1枚）',
'40（1パック）',
'200（コップ約1杯）',
'30',
'15（1本）',
'15（10さや）',
'45（小1個）',
'120（8分の1個）',
'45（葉1枚）',
'100（1本）',
'200（1束）',
'50（4分の1本）',
'45（1茎）',
'170（5分の1本）',
'180（中1個）',
'200（1個）',
'130（1本）',
'35（1個）',
'150（1個）',
'100（2分の1袋）',
'120（1節）',
'75（中5個）',
'80（1個）',
'180（1個）',
'85（1個）',
'35（5粒）',
'150（1口カット5個）',
'250（1個）',
'100（1本）',
'75（5粒）',
'170（1個）',
'250（1個）',
'100（1切れ程度）',
'70（1缶）',
'100（1串）',
'17（大さじ1）',
'50（1腹）',
'40（10個）',
'40（10尾）',
'15（足2本）',
'いか210（1ぱい）',
'15（1本）',
'30（1本）',
'80（1枚）',
'100',
'100',
'100',
'100',
'20（1枚）',
'20（1枚）',
'15（1本）',
'100',
'100',
'100',
'100',
'9（1個）',
'9（1個）',
'50（1個）',
'15（1個）',
'35（1個）',
'200（コップ約1杯）',
'200（コップ約1杯）',
'6（大さじ1）',
'20（大さじ1）',
'100（2分の1カップ）',
'100（2分の1カップ）',
'80（小カップ1個）',
'100',
'20',
'20',
'6（大さじ1）',
'20',
'90（小カップ1個）',
'100（1個分）',
'50（1切）',
'60（1串）',
'100（1個）',
'50（1切）',
'10（1枚）',
'60（1個）',
'100（1個）',
'100（1片）',
'100（1個）',
'100（1個）',
'60（1袋）',
'40（約1食分）',
'18（大さじ１）',
'18（大さじ１）',
'18（大さじ１）',
'18（大さじ１）',
'6（小さじ1）',
'15（大さじ1）',
'5（約1個）',
'15（大さじ1）',
'12（大さじ1）',
'18（大さじ１）',
'20（1食分）',
'6（小さじ1）',
'18（大さじ1）',
'18（大さじ1）'
]

sugar_amounts_all = [
'73.3',
'26.6',
'14',
'52',
'48',
'70.2',
'64.3',
'57',
'55.2',
'25.2',
'2.7',
'0.1',
'30.3',
'10.8',
'16.3',
'12.9',
'7.3',
'5.2',
'17.3',
'5.7',
'16.7',
'8.9',
'17.9',
'16.7',
'13.9',
'12.4',
'45.8',
'11.5',
'11.6',
'0.9',
'14.8',
'2.3',
'10.4',
'1.8',
'2.6',
'0.3',
'0.2',
'0.3',
'2.2',
'5.8',
'1',
'0.3',
'0.6',
'1.4',
'20.5',
'1.5',
'1.9',
'3.6',
'4.9',
'0.2',
'4.6',
'13',
'7.4',
'8.5',
'1',
'1.2',
'1.3',
'16.2',
'5.3',
'8.8',
'25.7',
'9.4',
'4.9',
'13.8',
'26',
'21.4',
'11.4',
'15.1',
'35.3',
'0～0.5',
'0.1',
'3.1',
'0',
'0.2',
'0.2',
'0',
'0',
'0.2',
'1.4',
'4.1',
'11.1',
'0～0.6',
'3.7',
'0～0.3',
'2.5',
'0.3',
'0.1',
'0.5',
'0～0.2',
'0.6',
'0.2',
'0.1',
'0',
'0.1',
'0.2',
'0',
'0.1',
'9.6',
'11',
'2.4',
'11.2',
'3.1',
'2.9',
'3.9',
'12.2',
'0.2',
'0.5',
'0.1',
'0.3',
'20.2',
'20.1',
'31.3',
'26.9',
'55.6',
'33.5',
'8.6',
'15.2',
'43',
'31.4',
'14.7',
'10.4',
'30.3',
'20.8',
'4.7',
'3.3',
'1.8',
'1.4',
'0',
'0.4',
'2.1',
'3.8',
'0.5',
'4.3',
'8.2',
'4.1',
'5.9',
'0.8'
]

# OK
# Food.create(classification: '穀類', food_name: '肉じゃが', food_amount: '100', sugar_amount: '40');

# classifications_all = ['穀類', '穀類']
# food_names_all = ['小麦粉', '6枚切り食パン']
# food_amounts_all = ['100g', '60g（1枚）']
# sugar_amounts_all = ['73.3', '26.6']

classifications_all.zip(food_names_all, food_amounts_all, sugar_amounts_all) do |classification_all, food_name_all, food_amount_all, sugar_amount_all|
  # binding.pry
  Food.create(
    classification: classification_all,
    food_name: food_name_all,
    food_amount: food_amount_all, 
    sugar_amount: sugar_amount_all
  )
end