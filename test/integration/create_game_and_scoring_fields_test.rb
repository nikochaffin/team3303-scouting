require 'test_helper'

class CreateGameAndScoringFieldsTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @other = users(:other)
    log_in_as(@admin)
  end

  # Note, when asserting redirects, assert the redirect before following it
  test "only admins can access games creation" do
    # Access games path as not logged in
    log_out
    assert_redirected_to root_path
    get games_path
    assert_redirected_to login_path
    follow_redirect!
    assert_template 'sessions/new'
    # Access games path as regular user
    log_in_as(@other, password: "")
    assert_not @other.has_password?
    get games_path
    assert_redirected_to login_path
    follow_redirect!
    assert_template 'sessions/new'
    assert_select "div.alert-danger"
    # Access games path as admin
    log_out
    log_in_as(@admin)
    get new_game_path
    assert_template 'games/new'
  end

  test "create game" do
    assert_difference 'Game.count', 1 do
      post games_path, game: { name: "Quidditch", year: 20016 }
    end
  end

  test "create game with two fields" do
    post games_path, game: { name: "Quidditch", year: 20016 }
    field = {
      name: "field_one",
      field_type: "text"
    }
    @game = Game.last
    assert_difference 'ScoringField.count', 2 do
      patch game_path(@game), game: { name: "Another Name",
                                      fields_attributes: {
                                        "0" => field, "1" => field }
                                    }
    end
  end
end
