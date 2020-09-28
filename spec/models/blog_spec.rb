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
end
