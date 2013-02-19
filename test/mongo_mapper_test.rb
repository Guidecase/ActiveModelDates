require File.expand_path('../test_helper.rb', __FILE__)

class MongoMapperTest < Test::Unit::TestCase
  def setup
    @model = MockModel.new
  end

  def test_year
    assert_nil @model.starts_at_year

    @model.starts_at = Date.today
    assert_equal Date.today.year, @model.starts_at_year

    @model.starts_at_year = Date.today.year + 1
    assert_equal Date.today.year + 1, @model.starts_at_year
  end

  def test_month
    assert_nil @model.starts_at_month

    @model.starts_at = Date.today
    assert_equal Date.today.month, @model.starts_at_month

    @model.starts_at_month = Date.today.month + 1
    assert_equal Date.today.month + 1, @model.starts_at_month
  end  

  def test_day
    assert_nil @model.starts_at_day

    @model.starts_at = Date.today
    assert_equal Date.today.day, @model.starts_at_day

    @model.starts_at_day = Date.today.day + 1
    assert_equal Date.today.day + 1, @model.starts_at_day
  end  

  def test_date_set
    assert @model.respond_to? :date_set_starts_at

    @model.starts_at_year = Date.today.year
    @model.starts_at_month = Date.today.month
    @model.starts_at_day = Date.today.day

    assert_nil @model.starts_at
    @model.save
    assert_equal Date.today, @model.starts_at
  end

  def test_validates_date_of
    @model.starts_at = '10101010101010101010'
    @model.save
    assert_equal ['not a date'], @model.errors[:starts_at]
  end
end