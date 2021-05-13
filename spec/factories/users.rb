FactoryBot.define do
  factory :user do
    nickname {"name"}
    email {Faker::Internet.free_email}
    password = '1a' + Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {"太郎"}
    last_name {"山田"}
    first_name_kana {"タロウ"}
    last_name_kana {"ヤマダ"}
    birth_date {"2000-02-05"}

  end
end


# 事後学習用にコメントアウトを残しておきます

# it 'passwordが空だと登録できない' do
#   user = FactoryBot.build(:user)
#   user.password = ""
#   user.valid?
#   expect(user.errors.full_messages).to include("Password can't be blank")
# end



# it 'passwordが空だと登録できない' do
#   user = User.new(
#     nickname:"test",
#     email: "test@example.com",
#     password: "",
#     password_confirmation: "test11",
#     first_name: "太郎",
#     last_name: "山田",
#     first_name_kana: "タロウ",
#     last_name_kana: "ヤマダ",
#     birth_day: "2000-08-12"
#   )
#   user.valid?
#   expect(user.errors.full_messages).to include("Password can't be blank")
# end

# it 'emailが空だと登録できない' do
#   user = User.new(
#     nickname:"test",
#     email: "",
#     password: "test11",
#     password_confirmation: "test11",
#     first_name: "太郎",
#     last_name: "山田",
#     first_name_kana: "タロウ",
#     last_name_kana: "ヤマダ",
#     birth_day: "2000-08-12"
#   )
#   user.valid?
#   expect(user.errors.full_messages).to include("Password can't be blank")
# end

# it 'nicknameが空だと登録できない' do
#   user = User.new(
#     nickname:"",
#     email: "test@example.com",
#     password: "test11",
#     password_confirmation: "test11",
#     first_name: "太郎",
#     last_name: "山田",
#     first_name_kana: "タロウ",
#     last_name_kana: "ヤマダ",
#     birth_day: "2000-08-12"
#   )
#   user.valid?
#   expect(user.errors.full_messages).to include("Password can't be blank")
# end