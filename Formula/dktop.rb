class Dktop < Formula
  desc "Docker container manager with a btop-style terminal interface"
  homepage "https://github.com/seb07-cloud/dktop"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.0/dktop-darwin-arm64"
      sha256 "253ec412dab1070ea59215caeb28905e29d569ff2c946200d02015aa6a8ad6bb"
    end
    on_intel do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.0/dktop-darwin-amd64"
      sha256 "d38b5598e01ea66fa612bda1e360fbf2b715b2dd88477174895c3e1bd71c51d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.0/dktop-linux-arm64"
      sha256 "c09c10e61d67af9efc0b595821306dc3ce3ba4061589b79d13e2975d36dc041e"
    end
    on_intel do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.0/dktop-linux-amd64"
      sha256 "a2dd0713aab525a45be27fa7c57eb4eb12515694fcae203f975d5edc2dac2c6d"
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
