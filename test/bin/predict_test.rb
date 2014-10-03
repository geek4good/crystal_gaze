require "test_helper"
require "open3"

describe "when executing bin/predict" do
  it "predicts Peter's email address" do
    input = %w(email Peter\ Wong alphasights.com)
    output, _ = Open3.capture2e("bin/predict", *input)

    assert_equal("peter.wong@alphasights.com", output.strip)
  end

  it "predicts somebody's email address given their name and a domain" do
    input = %w(email Steve\ Wozniak apple.com)
    output, _ = Open3.capture2e("bin/predict", *input)

    assert_equal("s.w@apple.com", output.strip)
  end
end
