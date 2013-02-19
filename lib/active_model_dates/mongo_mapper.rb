module ActiveModel
  module ActiveModelDates
    extend ActiveSupport::Concern
  
    module ClassMethods
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

          self.send("#{field_name}=", Date.new(year,month,day)) if day && month && year
        end                        
      end
    end
  end    
end