require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe "投稿" do
    it "投稿に成功する" do
      blog = Blog.new( title: "aaaa",
                       content:"bbbb")
      expect(blog).to be_valid
    end

    it "タイトルとコンテンツが空欄にすることを許可しない" do
      blog = Blog.new( title: "",
                       content:"")
      blog.valid?
      expect(blog.errors[:title]).to include("can't be blank")
      expect(blog.errors[:content]).to include("can't be blank")
    end

    it "タイトルが長すぎることを許可しない" do
      blog = Blog.new( title: "a" * 51,
                       content:"aaaaa")
      blog.valid?
      expect(blog.errors[:title]).to include("is too long (maximum is 50 characters)")
    end

    it "コンテンツが長すぎることを許可しない" do
      blog = Blog.new( title: "aaaaa",
                       content:"a" * 257)
      blog.valid?
      expect(blog.errors[:content]).to include("is too long (maximum is 255 characters)")
    end
  end
end