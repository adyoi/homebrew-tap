class TesseractCrypt < Formula
  desc "Hybrid public-key string & file encryption (sign-then-encrypt)"
  homepage "https://github.com/adyoi/tesseract-crypt"
  version "1.0.2"
  license "MIT"

  on_macos do
    url "https://github.com/adyoi/tesseract-crypt/releases/download/v#{version}/tesseract-crypt-#{version}-macOS-universal2.tar.gz"
    sha256 "c36d2d94684391ab6220b82151833c68ce411f63baa427ce3a2477ab929d27d5"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/adyoi/tesseract-crypt/releases/download/v#{version}/tesseract-crypt-#{version}-Linux-aarch64.tar.gz"
      sha256 "ec4b165b369308a3014ae27e6a433bbddd1e959e0e30dfdeb009ce851fc525d4"
    else
      url "https://github.com/adyoi/tesseract-crypt/releases/download/v#{version}/tesseract-crypt-#{version}-Linux-x86_64.tar.gz"
      sha256 "c8ce02f2d6622406b206ee7d4ed4d331023ede6e6985d21143e86c9de4925edb"
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
