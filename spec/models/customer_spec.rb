require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "顧客登録機能" do
    before do
      @customer = FactoryBot.build(:customer)
    end
    context '顧客登録がうまくいくとき' do
      it "全ての値が正しく入力されていると登録することができる" do
        @customer.save
        expect(@customer).to be_valid
      end

      it "building_nameが空でも登録することができる" do
        @customer.building_name=""
        @customer.save
        expect(@customer).to be_valid
      end

      it "phoneが空でも登録することができる" do
        @customer.phone=""
        @customer.save
        expect(@customer).to be_valid
      end

      it "product_nameが空でも登録することができる" do
        @customer.product_name=""
        @customer.save
        expect(@customer).to be_valid
      end

      it "purchase_dateが空でも登録することができる" do
        @customer.purchase_date=""
        @customer.save
        expect(@customer).to be_valid
      end

      it "remark_columnが空でも登録することができる" do
        @customer.remark_column=""
        @customer.save
        expect(@customer).to be_valid
      end
    end

    context '顧客登録がうまくいかないとき' do
      it "last_nameが空だと登録できない" do
        @customer.last_name=""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("姓を入力してください", "姓を全角ひらがな、全角カタカナ、漢字で入力してください")
      end

      it "first_nameが空だと登録できない" do
        @customer.first_name=""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("名を入力してください", "名を全角ひらがな、全角カタカナ、漢字で入力してください")
      end

      it "last_name_kanaが空だと登録できない" do
        @customer.last_name_kana=""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("姓(カナ)を入力してください", "姓(カナ)を全角カタカナで入力してください")
      end

      it "first_name_kanaが空だと登録できない" do
        @customer.first_name_kana=""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("名(カナ)を入力してください", "名(カナ)を全角カタカナで入力してください")
      end

      it "postal_codeが空だと登録できない" do
        @customer.postal_code=""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("郵便番号を入力してください", "郵便番号をハイフン(-)含む7桁の半角数字を入力してください")
      end

      it "postal_codeがハイフンを含んでいないと登録できない" do
        @customer.postal_code="1230034"
        @customer.valid?
        expect(@customer.errors.full_messages).to include("郵便番号をハイフン(-)含む7桁の半角数字を入力してください")
      end
      
      it "prefectureが選択されていないと登録できない" do
        @customer.prefecture_id=0
        @customer.valid?
        expect(@customer.errors.full_messages).to include("都道府県を選択してください")
      end

      it "prefectureが空だと登録できない" do
        @customer.prefecture_id=""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("都道府県を入力してください", "都道府県を選択してください")
      end

      it "cityが空だと登録できない" do
        @customer.city=""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("市町村を入力してください")
      end

      it "house_numberが空だと登録できない" do
        @customer.house_number=""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("番地を入力してください")
      end

      it "amount_moneyが空だと登録することができる" do
        @customer.amount_money=""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("売上高を入力してください", "売上高を半角数字で入力してください")
      end

      it "amount_moneyが半角数字でないと登録できない" do
        @customer.amount_money="９０００"
        @customer.valid?
        expect(@customer.errors.full_messages).to include("売上高を半角数字で入力してください")
      end

      it "start_timeが空だと登録できない" do
        @customer.start_time=""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("訪問日を入力してください")
      end

      it "remark_columnが150以上だと登録できない" do
        @customer.remark_column= "あ" * 151
        @customer.valid?
        expect(@customer.errors.full_messages).to include("備考欄は150文字以内で入力してください")
      end

    end

  end
end
