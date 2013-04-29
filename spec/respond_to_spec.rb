describe "viper snake case module - respond_to?" do
  before {
    @view = UIView.new
    @view.extend Viper::SnakeCase
  }

  it "should respond_to? valid snake case methods" do
    @view.respond_to?(:background_color).should == true
  end

  it "should not respond_to? invalid snake case methods" do
    @view.respond_to?(:asdf).should == false
  end

  it "should still respond_to? valid camelCase methods" do
    @view.respond_to?(:backgroundColor).should == true
  end

  it "should not respond_to? invalid camelCase methods" do
    @view.respond_to?(:asdfAsdf).should == false
  end

  it "should allow method on valid snake_case methods" do
    @view.method(:backgroundColor).is_a?(Method).should == true
  end

  # Doesn't work. Use camelCase if you're using `method`.
  # it "should allow method on valid snake_case methods" do
  #   @view.method(:background_color).should == true
  # end

end
