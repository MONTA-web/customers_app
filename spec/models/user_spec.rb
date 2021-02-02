require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー管理機能' do
    before do
      @user = FactoryBot.build(:user)
    end
    context 'ユーザー登録がうまく行くとき' do
      it "全ての値が正しく入力されている時、登録することができる" do
        @user.save
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録がうまくいかない時' do
      it "nameが空だと登録することができない" do
        @user.name=""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it "emailが空だと登録することができない" do
        @user.email=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it "passwordが空だと登録することができない" do
        @user.password=""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "passwordが6桁以上でないと登録することができない" do
        @user.password="12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください")
      end

      it "passwordが存在してもpassword_confirmationが空だと登録することができない" do
        @user.password_confirmation=""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "passwordとpassword_confirmationは同じでないと登録することができない" do
        @user.password="123456"
        @user.password_confirmation="234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end

  end
end
