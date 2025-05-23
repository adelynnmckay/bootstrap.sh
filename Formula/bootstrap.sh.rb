class BootstrapSh < Formula
  desc "ade's bootstrap script. aka the bootrap.sh build system. have fun."
  homepage "https://github.com/adelynnmckay/bootstrap.sh"
  license "MIT"
  sha256 "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  url "https://github.com/adelynnmckay/bootstrap.sh/archive/refs/tags/v0.0.12.tar.gz"
  version "0.0.12"

  def install
    bin.install "bootstrap.sh" => "bootstrap.sh"
  end

  test do
    system "#{bin}/bootstrap", "--help"
  end
end
