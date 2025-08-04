class Mlv < Formula
  desc "Malva CLI for trimming, watermarking, resizing and GIF conversion"
  homepage "https://github.com/Just-Love-You/malva-cli"
  url "https://github.com/Just-Love-You/malva-cli/archive/refs/tags/v0.2.0-alpha.tar.gz"
  version "0.2.0-alpha"
  sha256 "73ff771570fb742cc7e03fd36c0d13aed4f984630fcee94bd569bc03db07a8a2"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w"
    system "go", "build", *std_go_args(ldflags: ldflags), "-o", bin/"mlv", "./cmd"
  end

  test do
    system "#{bin}/mlv", "--help"
  end
end