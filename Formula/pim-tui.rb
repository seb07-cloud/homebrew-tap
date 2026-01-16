class PimTui < Formula
  desc "Terminal UI for Azure PIM role activation"
  homepage "https://github.com/seb07-cloud/pim-tui"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/seb07-cloud/pim-tui/releases/download/v1.2.1/pim-tui-darwin-arm64"
      sha256 "ffde1f09b49185e635be7db46a5db88abceef00c23896a4fdcd740a96fd83208"
    end
    on_intel do
      url "https://github.com/seb07-cloud/pim-tui/releases/download/v1.2.1/pim-tui-darwin-amd64"
      sha256 "d886e02138d97e57dfed119d31607e0de4de80d542863f89a4477fb04d833284"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/seb07-cloud/pim-tui/releases/download/v1.2.1/pim-tui-linux-arm64"
      sha256 "55b3a7bbfd35513f09f7f93f5e22ac5fc84a5195f53bf07c30b890d2097feb32"
    end
    on_intel do
      url "https://github.com/seb07-cloud/pim-tui/releases/download/v1.2.1/pim-tui-linux-amd64"
      sha256 "c49c2b5169951398bbe743a22450d7b1329ed92bc305e50df8759a2aa26396fe"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "pim-tui-darwin-arm64" => "pim-tui"
      else
        bin.install "pim-tui-darwin-amd64" => "pim-tui"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "pim-tui-linux-arm64" => "pim-tui"
      else
        bin.install "pim-tui-linux-amd64" => "pim-tui"
      end
    end
  end

  test do
    assert_match "pim-tui", shell_output("#{bin}/pim-tui --help", 2)
  end
end
