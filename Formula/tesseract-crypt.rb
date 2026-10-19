class TesseractCrypt < Formula
  desc "Hybrid public-key string & file encryption (sign-then-encrypt)"
  homepage "https://github.com/adyoi/tesseract-crypt"
  version "1.0.4"
  license "MIT"

  on_macos do
    url "https://github.com/adyoi/tesseract-crypt/releases/download/v#{version}/tesseract-crypt-#{version}-macOS-universal2.tar.gz"
    sha256 "5bafb185e4486efae05e30de3488245a325790c61ffa0cd04a443bf51fe7bd0f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/adyoi/tesseract-crypt/releases/download/v#{version}/tesseract-crypt-#{version}-Linux-aarch64.tar.gz"
      sha256 "dad015b0fcb7d47385c70df749d454a1f67308b564aed85982ff2db01de64146"
    else
      url "https://github.com/adyoi/tesseract-crypt/releases/download/v#{version}/tesseract-crypt-#{version}-Linux-x86_64.tar.gz"
      sha256 "54145c31198bef36e78661cc86be5c72dd9db0e81743126e105f85985bb88ac6"
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
