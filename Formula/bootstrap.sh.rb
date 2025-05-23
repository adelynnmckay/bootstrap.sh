class BootstrapSh < Formula
  desc "ade's bootstrap script. aka the bootrap.sh build system. have fun."
  homepage ""
  url ""
  sha256 ""
  license "MIT"

  def install
    bin.install "bootstrap.sh" => "bootstrap.sh"
  end

  test do
    system "#{bin}/bootstrap", "--help"
  end
end
