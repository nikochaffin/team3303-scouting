require 'test_helper'

class UsersLoginTestTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @other = users(:other)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { username: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with no password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { username: @other.username, password: "" }
    assert_redirected_to root_url
  end

  test "login with password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { username: @admin.username, password: "foobar" }
    assert_redirected_to root_url
    delete logout_path
    assert_redirected_to root_url
  end

  test "cannot login user with password without password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { username: @admin.username, password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
  end
end
