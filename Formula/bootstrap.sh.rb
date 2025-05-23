class BootstrapSh < Formula
  desc "ade's bootstrap script. aka the bootrap.sh build system. have fun."
  homepage "https://github.com/adelynnmckay/bootstrap.sh"
  license "MIT"
  sha256 "0b41971a5c8a728da3040abbec8c318c01b305b794ce302a526918dcc324b22a"
  url "https://github.com/adelynnmckay/bootstrap.sh/archive/refs/tags/v0.0.10.tar.gz"
  version "0.0.10"

  def install
    bin.install "bootstrap.sh" => "bootstrap.sh"
  end

  test do
    system "#{bin}/bootstrap", "--help"
  end
end
