class BootstrapSh < Formula
  desc "ade's bootstrap script. aka the bootrap.sh build system. have fun."
  homepage "https://github.com/adelynnmckay/bootstrap.sh"
  license "MIT"
  sha256 "89a8d2b236d4b442fc8cc5ce124663163f131b1731d5bb5efa0dd331ac8076bd"
  url "https://github.com/adelynnmckay/bootstrap.sh/archive/refs/tags/v0.0.12.tar.gz"
  version "0.0.12"

  def install
    bin.install "bootstrap.sh" => "bootstrap.sh"
  end

  test do
    system "#{bin}/bootstrap", "--help"
  end
end
