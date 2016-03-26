require 'test_helper'

class ScoringFieldTest < ActiveSupport::TestCase

  def setup
    @field = ScoringField.create(name: "defenses_crossed", field_type: "text")
  end

  test "name should be present" do
    @field.name = ""
    assert_not @field.valid?
  end

  test "name should not be empty" do
    @field.name = " " * 6
    assert_not @field.valid?
  end

  test "name should be at least 3 characters long" do
    @field.name = "aa"
    assert_not @field.valid?
  end

end
