class Bootstrap < Formula
  desc "ade's bootstrap script. aka the bootrap.sh build system. have fun."
  homepage "https://github.com/adelynnmckay/bootstrap"
  url "https://github.com/adelynnmckay/bootstrap/archive/refs/tags/v1.0.0.tar.gz"
  sha256 ""
  license "MIT"

  def install
    bin.install "bootstrap.sh" => "bootstrap.sh"
  end

  test do
    system "#{bin}/bootstrap", "--help"
  end
end
