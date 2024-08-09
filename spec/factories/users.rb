FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    birth_date            { Faker::Date.birthday(min_age: 10, max_age: 110).strftime('%Y-%m-%d') } # 西暦形式
    last_name             { '渡邊' }
    first_name            { '繼治' }
    last_name_kana        { 'ワタナベ' } # カタカナの苗字
    first_name_kana       { 'ツグハル' } # カタカナの名前}
  end
end
