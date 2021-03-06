require "spec_helper"

describe Liquor::Diagnostic do
  it "is not an error" do
    diag = Liquor::Diagnostic.new("foobar")
    diag.error?.should be_false
  end

  it "decorates source" do
    source = "line 1\nthis is a diagnostic"
    diag  = Liquor::Diagnostic.new("foobar", line: 1, start: 10, end: 19)
    diag.decorate(source).should == [
      "this is a diagnostic",
      "          ^^^^^^^^^^"
    ]
    diag.as_json.should == {
      message:  'foobar',
      is_error: false,
      location: {
        line:  1,
        start: 10,
        end:   19
      }
    }
  end
end

describe Liquor::Error do
  it "is an error" do
    diag = Liquor::Error.new("foobar")
    diag.error?.should be_true
  end
end

describe Liquor::Deprecation do
  it "is not an error" do
    diag = Liquor::Deprecation.new("foobar")
    diag.error?.should be_false
  end
end
