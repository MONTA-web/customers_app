FactoryBot.define do
  factory :customer do
    last_name { '加藤' }
    first_name         { '尚揮' }
    last_name_kana     { 'カトウ' }
    first_name_kana    { 'ナオキ' }
    postal_code        { '123-4567' }
    prefecture_id      { 5 }
    city               { '瀬戸市' }
    house_number       { '112番地' }
    building_name      { 'キングスコート桜木203' }
    phone              { '09012341234' }
    product_name       { '葉書' }
    amount_money       { '5000' }
    start_time         { '2000-10-21 16:32:00' }
    purchase_date      { '2001-03-05 13:22:00' }
    remark_column      { 'あ' * 150 }
    association :user
  end
end
