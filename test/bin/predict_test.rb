require "test_helper"
require "open3"

describe "when executing bin/predict" do
  it "predicts an email address when explicitly specifying the prediction type" do
    input = %w(Peter\ Wong alphasights.com)
    output, _ = Open3.capture2e("bin/predict", *input, "--prediction=email")

    assert_equal("peter.wong@alphasights.com", output.strip)
  end

  it "predicts an email address by default (no '--prediction' option)" do
    input = %w(Steve\ Wozniak apple.com)
    output, _ = Open3.capture2e("bin/predict", *input)

    assert_equal("s.w@apple.com", output.strip)
  end

  it "the vision is clouded when the result is ambiguous" do
    input = %w(Craig\ Silverstein google.com)
    output, _ = Open3.capture2e("bin/predict", *input)

    assert_match(/clouded/, output)
  end

  it "the vision is clouded when no spirit can be traced" do
    input = %w(Barack\ Obama whitehouse.gov)
    output, _ = Open3.capture2e("bin/predict", *input)

    assert_match(/clouded/, output)
  end

  it "the spirit world can't be entered without the right mindset" do
    input = %w(Barack\ Obama whitehouse.gov)
    output, _ = Open3.capture2e("bin/predict", *input, "--prediction=salary")

    assert_match(/mind set/, output)
  end


  # The following doen't work for reasons I don't see right now.
  #
  # it "the vision is clouded when the result is ambiguous" do
  #   input = %w(email Craig\ Silverstein google.com)
  #
  #   assert_raises(CrystalGaze::CloudedVisionError) do
  #     Open3.capture2e("bin/predict", *input)
  #   end
  # end
  #
  # it "the vision is clouded when no spirit can be traced" do
  #   input = %w(email Barack\ Obama whitehouse.gov)
  #
  #   assert_raises(CrystalGaze::CloudedVisionError) do
  #     Open3.capture2e("bin/predict", *input)
  #   end
  # end
  #
  # it "the spirit world can't be entered without the right mindset" do
  #   input = %w(salary Barack\ Obama)
  #
  #   assert_raises(CrystalGaze::ImpenetrableMistError) do
  #     Open3.capture2e("bin/predict", *input)
  #   end
  # end
end
