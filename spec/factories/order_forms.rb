FactoryBot.define do
  factory :order_form do
    token { "tok_abcdefghijk00000000000000000" }
    zip_code { "100-0000" }
    region_id { 14 }
    city { "渋谷区" }
    address { "神南1-1" }
    another { "アジアビル" }
    phone_number { "08000000000" }
  end
end
