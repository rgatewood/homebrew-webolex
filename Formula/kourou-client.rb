# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
require "formula"

class KourouClient < Formula
  homepage "https://github.com/LexmarkWeb/kourou-client"
  url "https://github.com/LexmarkWeb/kourou-client/archive/kourou-0.11.tar.gz"
  version "0.11"
  sha1 "4a5e60ff51bf6f8809519ef9f089499c3d0445d7"

  depends_on "subversion"
  depends_on "homebrew/apache/httpd24"
  depends_on "homebrew/php/php55"

  def install
    if system("host -W 1 -4 us-auto.proxy.lexmark.com")
      system "make"
      bin.install "bin/kourou"
    else
      onoe "Oops! You must be on the Lexmark network or VPN to install kourou."
    end
  end

  def caveats
    "Type 'kourou' at Terminal prompt to start."
  end

  test do
    system "#{bin}/kourou-test"
  end
end
