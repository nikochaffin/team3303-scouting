require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:admin)
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

  test "password should have a minimum length if present" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "password can be blank" do
    @user.password = @user.password_confirmation = ""
    assert @user.valid?
  end

  test "password and confirmation must match" do
    @user.password = "foo"
    @user.password_confirmation = "not foo"
    assert_not @user.valid?
  end

  test "has_password return true if the user has a password" do
    new_user = User.create(username: "someuser")
    assert_not new_user.has_password?
    new_user.password = new_user.password_confirmation = "a" * 6
    assert new_user.valid?
    new_user.save
    new_user.reload
    assert new_user.has_password?
  end

end
