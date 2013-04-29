module Viper
  module SnakeCase
    def method_missing(meth, *args)
      obj_c_meth = meth.split('_').inject([]){ |buffer,e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
      if respond_to?(obj_c_meth)
        send obj_c_meth, *args
      else
        raise NoMethodError.new(meth.to_s) 
      end
    end
  end
end