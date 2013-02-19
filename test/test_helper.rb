require 'mongo_mapper'
require 'active_record'
require 'test/unit'
require File.expand_path('../../lib/active_model_dates.rb', __FILE__)

class MockModel
  include ::MongoMapper::Document  
  include ActiveModel::ActiveModelDates

  key :starts_at, Date, :required => true
  validates_date_of :starts_at
  active_date :starts_at  

  def save
    valid?
  end
end
