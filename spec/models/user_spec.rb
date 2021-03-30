require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
   context '新規登録ができる時' do
    it "全ての項目が存在すれば登録できる" do
          expect(@user).to be_valid
    end
   end

   context '新規登録ができない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'read_familyが空では登録できない' do
      @user.read_family = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Read family can't be blank"
    end
    it 'read_firstが空では登録できない' do
      @user.read_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Read first can't be blank"
    end
    it 'birthが空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth can't be blank"
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'passwordが半角英字のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end
    it 'passwordが半角数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end
    it 'passwordが全角では登録できない' do
      @user.password = 'ＡＡＡ１２３'
      @user.password_confirmation = 'ＡＡＡ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it 'emailは@を含まない場合登録できない' do
      @user.email = 'test.email'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

     it 'family_nameが全角入力でなければ登録できない' do
      @user.family_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name Full-width characters"
    end
    it 'first_nameが全角入力でなければ登録できない' do
      @user.first_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name Full-width characters"
    end
    it 'read_familyが全角カタカナでなければ登録できない' do
      @user.read_family = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include "Read family Full-width katakana characters"
    end
    it 'read_firstが全角カタカナでなければ登録できない' do
      @user.read_first = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include "Read first Full-width katakana characters"
    end
   end
  end
end