class BootstrapSh < Formula
  desc "ade's bootstrap script. aka the bootrap.sh build system. have fun."
  homepage "https://github.com/adelynnmckay/bootstrap.sh"
  license "MIT"
  sha256 "4025c251fcce9d685163ed21db28d6c6ba64267ff7ce40716cb38ad16bdd4c1b"
  url "https://github.com/adelynnmckay/bootstrap.sh/archive/refs/tags/v0.0.4.tar.gz"
  version "0.0.4"

  def install
    bin.install "bootstrap.sh" => "bootstrap.sh"
  end

  test do
    system "#{bin}/bootstrap", "--help"
  end
end
