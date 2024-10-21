require "test_helper"

class UserTest < ActiveSupport::TestCase
validates :email, uniqueness:
end
