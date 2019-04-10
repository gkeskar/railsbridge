require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def setup
    @job = Job.new(title: "Example Job", description: "example job")
  end

  test "should be valid" do 
    assert @job.valid?
  end

  test "title should be present" do
    @job.title = " "
    assert_not @job.valid?
  end
  test "description should be present" do
    @job.description = " "
    assert_not @job.valid?
  end
end
