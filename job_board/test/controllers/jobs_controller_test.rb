require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def index
  end

  def new
    @job = Job.new
  end
end
