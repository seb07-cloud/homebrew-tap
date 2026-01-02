class Dktop < Formula
  desc "Docker container manager with a btop-style terminal interface"
  homepage "https://github.com/seb07-cloud/dktop"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.2/dktop-darwin-arm64"
      sha256 "bc572a43f737171f2b56c7f3391db7ab23d5b06c70908918d0734ed58c53a2bc"
    end
    on_intel do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.2/dktop-darwin-amd64"
      sha256 "cf996eee1bc646c565ae70795b65db3ac3996de9ffa09651c779b8cd5da9ae53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.2/dktop-linux-arm64"
      sha256 "f40e1e65c4ea5f619d8dd7f16b0e5eb1efaf833e16ce3844d79c2d6cf1f64371"
    end
    on_intel do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.2/dktop-linux-amd64"
      sha256 "9427a4885dc87b5008b15f5dd054031124edd4d1150d13fe46d1c0f50e47de9a"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "dktop-darwin-arm64" => "dktop"
      else
        bin.install "dktop-darwin-amd64" => "dktop"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "dktop-linux-arm64" => "dktop"
      else
        bin.install "dktop-linux-amd64" => "dktop"
      end
    end
  end

  test do
    assert_match "dktop", shell_output("#{bin}/dktop version")
  end
end
