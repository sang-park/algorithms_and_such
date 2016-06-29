require "alphabet_fun"

describe "alphabet_matcher" do
  it "handles basic cases" do
    a = alphabet_matcher("abcde")
    expect(a).to include("abcde")
    expect(a).to include("abxe")
    expect(a).to include("amde")

    b = alphabet_matcher("asdf")
    expect(b).to include("abidf")
    expect(b).to include("asdf")


    c = alphabet_matcher("abc")
    expect(c).to include("abc")
    expect(c).to include("am")
  end

  it "handles longer strings" do
    d = alphabet_matcher("qwerqwer")
    expect(d.length).to eq(144)
    expect(d).to include("qccebhqccebh")
    expect(d).to include("qwerqcyr")
    expect(d).to include("bgwebhqwer")
  end


end

#
# describe "the greet function" do
#   it "says hello to someone" do
#     expect(greet("Alice")).to eq("Hello, Alice!")
#   end
#
#   it "says hello to someone else" do
#     expect(greet("Bob")).to eq("Hello, Bob!")
#   end
# end
