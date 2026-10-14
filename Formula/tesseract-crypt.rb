class TesseractCrypt < Formula
  desc "Hybrid public-key string & file encryption (sign-then-encrypt)"
  homepage "https://github.com/adyoi/tesseract-crypt"
  version "1.0.1"
  license "MIT"

  on_macos do
    url "https://github.com/adyoi/tesseract-crypt/releases/download/v#{version}/tesseract-crypt-#{version}-macOS-universal2.tar.gz"
    sha256 "0ff57efb25a1ead1b1d3d4bd54d8ea6b1f06c48376672718e43cfedb2cb411bd"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/adyoi/tesseract-crypt/releases/download/v#{version}/tesseract-crypt-#{version}-Linux-aarch64.tar.gz"
      sha256 "6d666b433dc57c6a65f42b31aff512d51caf08db2fdb23ae7cc152ce90ec3333"
    else
      url "https://github.com/adyoi/tesseract-crypt/releases/download/v#{version}/tesseract-crypt-#{version}-Linux-x86_64.tar.gz"
      sha256 "f69be7e59d0a3d2a3534d0df327f6271bc420672d23deba80ca89c3e1edc9947"
    end
  end

  def install
    bin.install "bin/tesseract-crypt"
    bin.install_symlink "tesseract-crypt" => "tscrypt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tesseract-crypt version")
  end
end
