class Orkestar < Formula
  desc "Persistent terminal runtime for coordinating coding agents"
  homepage "https://github.com/LibreCollab/orkestar"
  url "https://github.com/LibreCollab/orkestar/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "5be1d1c91ca641604401b41e2d2b266c948cfb4fe58d90fca88c6d36af175033"
  license "MIT"
  head "https://github.com/LibreCollab/orkestar.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/orkestar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/orkestar --version")
  end
end
