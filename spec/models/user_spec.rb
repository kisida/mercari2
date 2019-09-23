require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
     user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
     user.valid?
     expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "is invalid without a email" do
      user = User.new(nickname: "", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
     end
     it "is invalid without a password" do
      user = User.new(nickname: "", email: "", password: "", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
     end
  end
end