class Dktop < Formula
  desc "Docker container manager with a btop-style terminal interface"
  homepage "https://github.com/seb07-cloud/dktop"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.1/dktop-darwin-arm64"
      sha256 "adee6787ab60cf4585ef08ee21283eef307297d77d87ff81f299071a957dac8f"
    end
    on_intel do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.1/dktop-darwin-amd64"
      sha256 "c4def0f3893d99aa7740df5fbe916a8a1786e0fe17e778c09c693658627401cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.1/dktop-linux-arm64"
      sha256 "5bf16d103855d540a7a79636b87a07c07728445f3c562cce6113ab3abd2b4359"
    end
    on_intel do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.1/dktop-linux-amd64"
      sha256 "cb11e95489a7a512e6c53457b0cb33250fd1fab349c61e7e65152f927f710562"
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
