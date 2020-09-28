require 'rails_helper'

RSpec.describe User, type: :model do

  it "ユーザーの作成に成功する" do
    user = User.new( name: "shogo",
                     email:"shogo@example.com")
    expect(user).to be_valid
  end

  it "空欄を投稿する" do
    user = User.new( name: "",
                     email: "")
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
    expect(user.errors[:email]).to include("can't be blank")
  end

end
