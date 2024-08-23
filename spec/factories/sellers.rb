FactoryBot.define do
  factory :seller do
    order { nil }
    zip_code { "MyString" }
    region_id { 1 }
    city { "MyString" }
    address { "MyString" }
    another { "MyString" }
    phone_number { "MyString" }
  end
end
