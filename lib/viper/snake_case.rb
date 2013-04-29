module Viper
  module SnakeCase
    def method_missing(meth, *args)
      obj_c_meth = objective_c_method_name(meth)
      if respond_to?(obj_c_meth)
        send obj_c_meth, *args
      else
        raise NoMethodError.new(meth.to_s) 
      end
    end

    def respond_to?(meth, *a)
      super || super(objective_c_method_name(meth), *a)
    end

    # respond_to_missing? doesn't seem to work this way.
    # Just don't use .method() with snake case method names.
    # def respond_to_missing?(meth, *a)
    #   super || super(objective_c_method_name(meth), *a)
    # end

    protected

    def objective_c_method_name(meth)
      meth.split('_').inject([]){ |buffer,e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
    end

  end
end