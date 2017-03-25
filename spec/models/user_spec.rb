require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) {create(:user)}

    #Shouda test for name
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:name).is_at_least(1)}

    #Shoulda tests for email
    it {is_expected.to validate_presence_of(:email)}
    it {is_expected.to validate_presence_of(:email).is_at_least(3)}
    it {is_expected.to allow_vaue("user@taskmetoo.com").for(:email)}

    #Shouda test for password
    it {is_expected.to validate_presence_of(:password)}
    it {is_expected.to have_secure_password}
    it {is_expected.to validate_length_of(:password).is_at_least(6)}
    
    describe "User attributes" do
        it "should have name and email attributes" do
            expect(user).to have_attributes(name: user.name,  email: user.email)      
        end
    end

    describe "invalid user" do
        let(:user_with_invalid_name) {build(:user, name: "")}
        let(:user_with_invalid_email) {build(:user, email: "")}
        
        it "should be an invalid user due to balnk name" do
            expect(user_with_invalid_name).to_not be_valid
        end

        it "should be an invalid user due to balnk email" do
            expect(user_with_invalid_email).to_not be_valid
        end

    end
end
