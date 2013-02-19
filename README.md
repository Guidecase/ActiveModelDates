ActiveModelDates
================

Date helper toolkit for active model date field manipulation

### Usage

First add the gem to your gemfile:

    gem 'active_model_dates', :git => 'https://github.com/Guidecase/ActiveModelDates.git'

Then include the extension in your class and use the `active_date` class method to extend your model's date fields:

    class Appointment
      include ActiveModel::ActiveModelDates
      ...
      key :starts_at, Date, :required => true
      active_date :starts_at
    end

This exposes a number of methods on the given date field that make activeview (forms) interactions easier.

    appointment = Appointment.new :starts_at => Date.new('January 5, 2013')

    appointment.starts_at_day => 5
    appointment.starts_at_month => 1
    appointment.starts_at_year => 2013

    appointment.starts_at_day = 1
    appointment.starts_at => 'January 1, 2013'

When populated, the date field is set `before_validation` from the day/month/year fields.

    appointment = Appointment.new :starts_at => Date.new :day => 4, :month => 0, :year => 2013
    appointment.save
    appointment.starts_at => 'January 1, 2013'

The gem also provides a `validates_date_of` validation method that uses `Date.parse` to check the format of the given date field.

    class Appointment
      ...
      validates_date_of :starts_at
    end

### License

The ActiveModelDates Gem is published under the New BSD license.

Originally developed for Earlydoc health management apps: 

http://www.earlydoc.com
