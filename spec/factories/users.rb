FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_date            {Faker::Date.birthday(min_age: 10, max_age: 110).strftime("%Y-%m-%d") } # 西暦形式
    last_name             {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    last_name_kana        {Faker::Name.last_name_kana.tr("A-Za-z", "ア-ン") } # カタカナの苗字
    first_name_kana       {Faker::Name.first_name_kana.tr("A-Za-z", "ア-ン") } # カタカナの名前}
  end
end
