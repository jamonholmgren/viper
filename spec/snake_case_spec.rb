describe "viper snake case module" do
  before {
    @view = UIView.new
    @view.extend Viper::SnakeCase
  }

  it "should have 'Viper' module" do
    should.not.raise(NameError) { Viper }
  end

  it "should have 'Viper::SnakeCase' module" do
    should.not.raise(NameError) { Viper::SnakeCase }
  end

  it "should allow inclusion into any Objective-C class" do
    should.not.raise(StandardError) { @view.extend Viper::SnakeCase }
  end

  it "should allow `background_color` instead of `backgroundColor`" do
    @view.background_color.should == nil
  end

  it "should allow assigning the backgroundColor using snake case" do
    @view.background_color = UIColor.redColor
    @view.backgroundColor.should == UIColor.redColor
  end

  it "should not affect other classes" do
    r = UIColor.red_color rescue nil
    r.should == nil
  end
end
