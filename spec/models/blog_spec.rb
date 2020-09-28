require 'rails_helper'

RSpec.describe Blog, type: :model do
  # 姓、名、メール、パスワードがあれば有効な状態であること
  it "2と1を足すと3になること" do
    expect(2 + 1).to eq 3
  end

  it "投稿に成功する" do
    blog = Blog.new( title: "aaaa",
                     content:"bbbb")
    expect(blog).to be_valid
  end

  it "タイトルとコンテンツが空欄" do
    blog = Blog.new( title: "",
                     content:"")
    blog.valid?
    expect(blog.errors[:title]).to include("can't be blank")
    expect(blog.errors[:content]).to include("can't be blank")
  end

  it "タイトルが長すぎる" do
    blog = Blog.new( title: "a" * 51,
                     content:"aaaaa")
    blog.valid?
    expect(blog.errors[:title]).to include("is too long (maximum is 50 characters)")
  end

  it "コンテンツが長すぎる" do
    blog = Blog.new( title: "aaaaa",
                     content:"a" * 257)
    blog.valid?
    expect(blog.errors[:content]).to include("is too long (maximum is 255 characters)")
  end
end
