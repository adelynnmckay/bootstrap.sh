class BootstrapSh < Formula
  desc "ade's bootstrap script. aka the bootrap.sh build system. have fun."
  homepage "https://github.com/adelynnmckay/bootstrap.sh"
  license "MIT"
  sha256 "da0201f14d7a239536a507ff33be913361421d4e92a9b6099cb91fa54122b3cd"
  url "https://github.com/adelynnmckay/bootstrap.sh/archive/refs/tags/v0.0.8.tar.gz"
  version "0.0.8"

  def install
    bin.install "bootstrap.sh" => "bootstrap.sh"
  end

  test do
    system "#{bin}/bootstrap", "--help"
  end
end
