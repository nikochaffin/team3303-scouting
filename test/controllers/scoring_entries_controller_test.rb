require 'test_helper'

class ScoringEntriesControllerTest < ActionController::TestCase
  def setup
    admin = users(:admin)
    log_in_as(admin)
  end

  # TODO: still need to write controller tests for scoring_entries

end
