require "mameconf/version"

module Mameconf
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    attr_accessor :mameconf_attr_names

    def mameconf_attr_names
      @mameconf_attr_names ||= []
    end
    
    def mameconf(name, options={})
      mameconf_attr_names << name
      
      default_value = options[:default]
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{name}
          @#{name} ||= #{default_value.inspect}
        end

        def #{name}=(val)
          @#{name} = val
        end

        def to_hash
          ret = {}
          self.class.mameconf_attr_names.each do |attr|
            attr_sym = attr.to_sym
            ret[attr_sym] = self.__send__(attr_sym)
          end
          ret
        end
      RUBY
    end
  end
end
