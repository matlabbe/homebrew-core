class Rswift < Formula
  desc "Get strong typed, autocompleted resources like images, fonts and segues"
  homepage "https://github.com/mac-cain13/R.swift"
  url "https://github.com/mac-cain13/R.swift/releases/download/v5.4.0/rswift-v5.4.0-source.tar.gz"
  sha256 "5153e7d122412ced4f04b6fc92c10dad0a861900858543a77ce1bf11850d4184"
  license "MIT"
  head "https://github.com/mac-cain13/R.swift.git"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "0336661379cd6634bc68e0d863932724247416c24abd44fa5ad0eff10cbce234"
    sha256 cellar: :any_skip_relocation, big_sur:       "795ba1b73f962b695dadce31ea8c4a133e1640cb47a3d66e3f1610e120e8d6f0"
    sha256 cellar: :any_skip_relocation, catalina:      "171e1c4edafbafc0eb0435c237bfb5ede731e76b537d3282e995f5c3fb6b30ad"
    sha256 cellar: :any_skip_relocation, mojave:        "607dcfb0fb765913d682438997b09ce512c0a5e9c8ae53ae957f4b5997ccd47e"
  end

  depends_on xcode: "10.2"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/rswift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rswift --version")
    assert_match "[R.swift] Failed to write out", shell_output("#{bin}/rswift generate #{testpath} 2>1&")
  end
end
