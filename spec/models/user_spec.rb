require 'rails_helper'

RSpec.describe User, type: :model do

  it "ユーザーの作成に成功する" do
    user = User.new( name: "shogo",
                     email:"shogo@example.com")
    expect(user).to be_valid
  end

  it "名前とメールアドレスを空欄にすることを許可しない" do
    user = User.new( name: "",
                     email: "")
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "名前が長すぎることを許可しない" do
    user = User.new( name: "a" * 51,
                     email:"aaaaa")
    user.valid?
    expect(user.errors[:name]).to include("is too long (maximum is 50 characters)")
  end

  it "メールアドレスが長すぎることを許可しない" do
    user = User.new( name: "aaa",
                     email:"aaaaa" * 257)
    user.valid?
    expect(user.errors[:email]).to include("is too long (maximum is 255 characters)")
  end

  it "メールアドレスが重複していることを許可しない" do
    User.create( name: "shogo",
                 email:"shogo@example.com")
    user = User.new( name: "yamada",
                  email:"shogo@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "2人のユーザーが同じ名前を使うことを許可する" do
    User.create( name: "shogo",
                 email:"shogo@example.com")
    user = User.new( name: "shogo",
                  email:"yamada@example.com")
    user.valid?
    expect(user).to be_valid
  end

end
