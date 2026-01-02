class Dktop < Formula
  desc "Docker container manager with a btop-style terminal interface"
  homepage "https://github.com/seb07-cloud/dktop"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.3/dktop-darwin-arm64"
      sha256 "510ea0718a8678e72e64b0e3282b68f7270e460883f7501d91fb82c4e6a7edcb"
    end
    on_intel do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.3/dktop-darwin-amd64"
      sha256 "b5ef6f238dda6db0a405046c0c4c4c32b4ba6adffcf3a8b63a212a7be5371384"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.3/dktop-linux-arm64"
      sha256 "ca351cae3f37adbbb68a3b2e5fdf5dd4a165893cf57c72dba58424b02fc65004"
    end
    on_intel do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.0.3/dktop-linux-amd64"
      sha256 "aaa3c908283ff83d16a37146dba40672c25f29ab13a23e45e4fc636e229b56e3"
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
