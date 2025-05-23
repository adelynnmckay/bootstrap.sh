class BootstrapSh < Formula
  desc "ade's bootstrap script. aka the bootrap.sh build system. have fun."
  homepage "https://github.com/adelynnmckay/bootstrap.sh"
  license "MIT"
  sha256 "01a4bd13fb64b310b277c46b3c999a3facce412b1b7cff2b1ebc7017e0fcbe89"
  url "https://github.com/adelynnmckay/bootstrap.sh/archive/refs/tags/v0.0.13.tar.gz"
  version "0.0.13"

  def install
    bin.install "bootstrap.sh" => "bootstrap.sh"
  end

  test do
    system "#{bin}/bootstrap", "--help"
  end
end
