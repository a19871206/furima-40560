FactoryBot.define do
  factory :item do
    name { 'MyString' }
    title { '商品名' }
    explan { '商品の説明' }
    category_id { 1 } # 適切なカテゴリIDを設定
    condition { 1 } # 適切な状態IDを設定
    shipping_cost_id { 1 } # 適切な配送料IDを設定
    region_id { 1 } # 適切な地域IDを設定
    delivery_date_id { 1 } # 適切な発送日IDを設定
    price { 1000 }
    hoge { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/test_image.png'), 'image/png') }
  end
end
