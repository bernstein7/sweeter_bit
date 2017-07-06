# require "sweeter_bit/version"

module SweeterBit
  module Field
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def has_options_field(field_name, with_values: [])
        @field_name = field_name
        @values = with_values

        redraw_bitmap
        redraw_class_level_accessors

        class_eval do
          define_method("enabled_#{field_name}s") do
            instance_variable_get("@#{field_name}_values") || []
          end

          define_method("#{field_name}_add") do |*array|
            instance_variable_set("@#{field_name}_values", array)
            self
          end

          define_method("recount_#{field_name}_sum") do
            (instance_variable_get("@#{field_name}_values") || []).reduce([]) do |acc, val|
              acc << val.zero? ? 

          end
        end
      end

      def redraw_bitmap
        bitmap = @values.each_with_index.reduce({}) do |acc, (i, val)|
          acc[i] = val
          acc
        end

        instance_variable_set("@#{@field_name}_bitmap", bitmap)
      end

      def redraw_class_level_accessors
        define_singleton_method("#{field_name}_bitmap") do
          instance_variable_get("@#{@field_name}_bitmap")
        end
      end
    end

    module InstanceMethods;end
  end
end
