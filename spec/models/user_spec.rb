require 'rails_helper'

RSpec.describe User, type: :model do

  it "ユーザーの作成に成功する" do
    user = User.new( name: "shogo",
                     email:"shogo@example.com")
    expect(user).to be_valid
  end
end
