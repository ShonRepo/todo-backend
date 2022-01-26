require "rails_helper"

RSpec.describe User::User, type: :model do
  context "Validation tests" do
    context "Full_name validation" do
      it "full_name is present" do
        user = User::User.new(email: "test@test.ru", password: "test")

        expect(user.valid?).to eq(false)
      end
    end

    context "email validation" do
      it "email is present" do
        user = User::User.new(full_name: "test", password: "test")

        expect(user.valid?).to eq(false)
      end

      it "email is valid" do
        user = User::User.new(full_name: "test", email: "test@test", password: "test")

        expect(user.valid?).to eq(false)
      end

      it "Email must be unique" do
        User::User.create!(full_name: "test1", email: "test@test.ru", password: "test")
        user = User::User.new(full_name: "test2", email: "test@test.ru", password: "test")

        expect(user.valid?).to eq(false)
      end
    end

    context "Password validation" do
      it "password is present" do
        user = User::User.new(full_name: "test", email: "test@test.ru")

        expect(user.valid?).to eq(false)
      end
    end

    it "User must be create" do
      user = User::User.new(full_name: "test", email: "test@test.ru", password: "test")

      expect(user.save).to eq(true)
    end
  end

  context "scope tests" do

  end
end