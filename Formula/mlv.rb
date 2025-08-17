class Mlv < Formula
  desc "Malva CLI for trimming, watermarking, resizing and GIF conversion"
  homepage "https://github.com/Just-Love-You/malva-cli"
  url "https://github.com/Just-Love-You/malva-cli/archive/refs/tags/v0.2.1-alpha.tar.gz"
  version "0.2.1-alpha"
  sha256 "659a7d2a10da710366f8ab6e392f121609b0c22727721b1c80a1ccbffa3714b9"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w"
    system "go", "build", *std_go_args(ldflags: ldflags), "-o", bin/"mlv", "."
  end

  test do
    system "#{bin}/mlv", "--help"
  end
end