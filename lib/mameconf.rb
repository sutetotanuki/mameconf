require "mameconf/version"

module Mameconf
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def mameconf(name, options={})
      default_value = options[:default]
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{name}
          @#{name} ||= #{default_value.inspect}
        end

        def #{name}=(val)
          @#{name} = val
        end
      RUBY
    end
  end
end
