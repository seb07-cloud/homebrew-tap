class Dktop < Formula
  desc "Docker container manager with a btop-style terminal interface"
  homepage "https://github.com/seb07-cloud/dktop"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.1.0/dktop-darwin-arm64"
      sha256 "9ff192544411c11b684af174fd6a57fd1f2afbe73e83a4f9f2252efe1f8ea493"
    end
    on_intel do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.1.0/dktop-darwin-amd64"
      sha256 "322870554372fdfae47b203421a2af1f1c965113191d31cd0ca50f5ab727a3c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.1.0/dktop-linux-arm64"
      sha256 "2ecdca67e78fe15931b4bfa112dedce40e00bf185233199f8abd9a9147039306"
    end
    on_intel do
      url "https://github.com/seb07-cloud/dktop/releases/download/v1.1.0/dktop-linux-amd64"
      sha256 "e89b90ed4d3d267cae8105426edb0d6dbc70963333357c7181f573a96f129410"
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
