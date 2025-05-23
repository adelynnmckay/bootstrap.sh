class BootstrapSh < Formula
  desc "ade's bootstrap script. aka the bootrap.sh build system. have fun."
  homepage "https://github.com/adelynnmckay/bootstrap.sh"
  url "https://github.com/adelynnmckay/bootstrap.sh/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "548cd9c54c64474cebf50d1121719436e131f405eff667a16634aecc7ccf170a"
  license "MIT"
  version "0.0.1"

  def install
    bin.install "bootstrap.sh" => "bootstrap.sh"
  end

  test do
    system "#{bin}/bootstrap", "--help"
  end
end
