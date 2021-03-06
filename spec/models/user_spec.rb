require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全項目埋めていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwoedとpassword_confirmationが６文字以上で半角英数混合であれば登録できる' do
        @user.password = "aaa000"
        @user.password_confirmation = "aaa000"
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに＠がないと登録できない' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordconfirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英数混合でないと登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'Emailが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが５文字以内は登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'ファーストネームは全角かな／カナ漢字でないと登録できない' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'ラストネームは全角かな／カナ漢字でないと登録できない' do
        @user.last_name = 'toro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'ファーストネームのフリガナはカタカナでないと登録できない' do
        @user.first_furigana = '太朗'
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana is invalid")
      end
      it 'ラストネームのフリガナはカタカナでないと登録できない' do
        @user.last_furigana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana is invalid")
      end
    end

  end
end
