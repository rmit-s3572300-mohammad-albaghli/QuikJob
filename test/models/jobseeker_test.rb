require 'test_helper'

class JobseekerTest < ActiveSupport::TestCase
  # Jobseeker Validation checks go here
  #Create a default user to test for validation
  def setup
    @valid_user = Jobseeker.new(name: "Name Surname", email: "name.surname@gmail.com", password: "password", password_confirmation: "password")
    @invalid_user = Jobseeker.new(name: " ", email: " ", password: "password", password_confirmation: "password1")
    @user = Jobseeker.new(name: "Test", email: "test@example.com", password: "password", password_confirmation: "password")
  end
  
  #Test for a valid user
  test "should be valid user" do
    assert @valid_user.valid?
  end
  
  #test for invalid user
  test "should not be valid user" do
    assert_not @invalid_user.valid?
  end
  
  #Test different emails
  test "should accept valid emails" do
    valid_emails = %w[user@gmail.com user2201@yahoo.com student@rmit.edu.au another2019@hotmail.com]
    valid_emails.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?, "#{valid_email.inspect} should be valid"
    end
  end
  
end
