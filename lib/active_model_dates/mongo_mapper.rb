module ActiveModel
  module ActiveModelDates
    extend  ActiveSupport::Concern

    class DateFormatValidator < ActiveModel::EachValidator
      def validate_each(record, attr_name, value)
        if value && !value.is_a?(Date)
          record.errors.add attr_name, I18n.t(:not_a_date, :default => 'not a date'), options
        end
      end
    end    
  
    module ClassMethods
      def validates_date_of(*attr_names)
        validates_with DateFormatValidator, _merge_attributes(attr_names)
      end

      def active_date(field_name)
        attr_writer "#{field_name}_year"
        define_method "#{field_name}_year" do
          instance_variable_get("@#{field_name}_year") || (self.send(field_name) && self.send(field_name).year)
        end

        attr_writer "#{field_name}_month"
        define_method "#{field_name}_month" do
          instance_variable_get("@#{field_name}_month") || (self.send(field_name) && self.send(field_name).month)
        end        

        attr_writer "#{field_name}_day"
        define_method "#{field_name}_day" do
          instance_variable_get("@#{field_name}_day") || (self.send(field_name) && self.send(field_name).day)
        end                

        before_validation "date_set_#{field_name}"
        define_method "date_set_#{field_name}" do
          day = instance_variable_get("@#{field_name}_day")
          month = instance_variable_get("@#{field_name}_month")
          year = instance_variable_get("@#{field_name}_year")

          begin
            if day && month && year
              date = Date.new(year.to_i, month.to_i, day.to_i)
              self.send("#{field_name}=", date) 
            end
          rescue
            errors.add field_name, I18n.t(:not_a_date, :default => 'not a date')
          end                        
        end
      end
    end
  end    
end