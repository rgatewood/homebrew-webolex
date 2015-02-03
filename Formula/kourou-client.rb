# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
require "formula"

class KourouClient < Formula
  homepage "https://github.com/LexmarkWeb/kourou-client"
  url "https://github.com/LexmarkWeb/kourou-client/archive/kourou-0.1.tar.gz"
  version "0.1"
  sha1 "cab51529b1b601bddc5c4b50c0c674d57d59863f"

  depends_on "subversion"
  depends_on "homebrew/apache/httpd24"
  depends_on "homebrew/php/php55"

  def install
    if !system("host -W 1 -4 us-auto.proxy.lexmark.com")
      onoe "Oops! You must be on Lexmark network or VPN to install kourou."
    end
    system "make"
    bin.install "bin/kourou"
  end

  def caveats
    "Type 'kourou' at Terminal prompt to start."
  end

  test do
    system "#{bin}/kourou-test"
  end
end
