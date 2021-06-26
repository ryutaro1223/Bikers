require 'rails_helper'

RSpec.describe Post, type: :model do
 before do
    @post = FactoryBot.build(:post)
  end

  describe "新規投稿" do
    context "投稿できる時" do
      it "フォームに情報が正しく入力されていれば登録できる" do
        expect(@post).to be_valid
      end
    end
    context "投稿できない時" do
      it "captionの入力がないと登録できない" do
        @post.caption = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Caption can't be blank")
      end
    end
    context "投稿できない時" do
      it "post_nameの入力がないと登録できない" do
        @post.post_name = nil
        @post.valid?
        # expect(@post.errors.full_messages).to include("Post_name can't be blank")
      end
    end

  end
end