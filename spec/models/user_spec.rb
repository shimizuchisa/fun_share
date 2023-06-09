require 'rails_helper'

RSpec.describe User, type: :model do
  # context "要素がないと無効であること" do
    it "is valid with a first_name, last_name, email, telnum,and password" do
      user = User.new(
        first_name: "First",
        last_name: "Last",
        email: "sample@test",
        telephone_number: "000",
        password: "password"
        )

      expect(user).to be_valid
    end

    it "is invalid without a first_name" do
      user = User.new(
        last_name: "Last",
        email: "sample@test",
        telephone_number: "000",
        password: "password"
        )
      expect(user).to_not be_valid
    end
    # it "is invalid without a last_name" do
    # end
    # it "is invalid without a email" do
    # end
    # it "is invalid without a telnum" do
    # end
    # it "is invalid without a first_name" do
    # end
# 　end
end
