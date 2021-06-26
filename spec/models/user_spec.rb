require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録" do
    context "登録できる時" do
      it "フォームに情報が正しく入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context "登録できない時" do
      it "emailの入力がないと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    end
  end
  end
