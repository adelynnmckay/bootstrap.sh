class BootstrapSh < Formula
  desc "ade's bootstrap script. aka the bootrap.sh build system. have fun."
  homepage "https://github.com/adelynnmckay/bootstrap.sh"
  license "MIT"
  sha256 "f95e1405b0871be19000661bc72f9d044f145d74565240a71b88c014cbea57cf"
  url "https://github.com/adelynnmckay/bootstrap.sh/archive/refs/tags/v0.0.11.tar.gz"
  version "0.0.11"

  def install
    bin.install "bootstrap.sh" => "bootstrap.sh"
  end

  test do
    system "#{bin}/bootstrap", "--help"
  end
end
