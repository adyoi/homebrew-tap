class TesseractCrypt < Formula
  desc "Hybrid public-key string & file encryption (sign-then-encrypt)"
  homepage "https://github.com/adyoi/tesseract-crypt"
  version "1.0.3"
  license "MIT"

  on_macos do
    url "https://github.com/adyoi/tesseract-crypt/releases/download/v#{version}/tesseract-crypt-#{version}-macOS-universal2.tar.gz"
    sha256 "58ebc3e025a845137e3173a6d9d41e0abe6c337ec71e30d3153354d800f7e86c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/adyoi/tesseract-crypt/releases/download/v#{version}/tesseract-crypt-#{version}-Linux-aarch64.tar.gz"
      sha256 "635b7157e0567689f8999f0ec3f82baad00266aca3a0479e7a7c33a0f6f53b4f"
    else
      url "https://github.com/adyoi/tesseract-crypt/releases/download/v#{version}/tesseract-crypt-#{version}-Linux-x86_64.tar.gz"
      sha256 "9d131041ef77eed9692b288f80d144c881cd657b74d9f29a36e32e7707bf49c9"
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
