FactoryBot.define do
  factory :item do
    association :user
    title { '商品名' }
    explan { '商品の説明' }
    category_id { 2 }      # 適切なカテゴリIDを設定
    condition_id { 3 }        # 適切な状態IDを設定
    shipping_cost_id { 3 } # 適切な配送料IDを設定
    region_id { 2 }        # 適切な地域IDを設定
    delivery_date_id { 3 } # 適切な発送日IDを設定
    cost { 1000 }
    #image { Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/war_shield_man.png'), 'image/png') }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
