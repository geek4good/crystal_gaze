require "test_helper"
require "open3"

describe "when executing bin/predict" do
  # given some sample data
  samples = {
    "John Ferguson" => "john.ferguson@alphasights.com",
    "Damon Aw" => "damon.aw@alphasights.com",
    "Linda Li" => "linda.li@alphasights.com",
    "Larry Page" => "larry.p@google.com",
    "Sergey Brin" => "s.brin@google.com",
    "Steve Jobs" => "s.j@apple.com"
  }

  it "predicts somebody's email address given their name and a domain" do
    input = %w(email Steve\ Wozniak apple.com)
    output, _ = Open3.capture2e("bin/predict", *input)

    assert_equal("s.w@apple.com", output)
  end
end
