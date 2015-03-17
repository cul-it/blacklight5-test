require "spec_helper"
require "stringio"

describe Uv do
  it "parses blank" do
    Uv.parse('', 'xhtml', 'css').should == %(<pre class="mac_classic"></pre>)
  end

  it "debugs" do
    Uv.debug('', 'css').is_a?(Textpow::DebugProcessor).should == true
  end

  describe ".syntax_for_file" do
    it "finds a syntax" do
      Uv.syntax_for_file("lib/uv.rb").map(&:first).should == ["source.ruby"]
    end
  end
end
