require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "admin", password: "foobar",
                     password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should not be blank" do
    @user.username = "       "
    assert_not @user.valid?
  end

  test "username should be unique" do
    duplicate_user = @user.dup
    assert_not duplicate_user.valid?
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
