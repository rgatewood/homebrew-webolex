# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
require "formula"

class KourouClient < Formula
  homepage "https://github.com/LexmarkWeb/kourou-client"
  url "https://github.com/LexmarkWeb/kourou-client/archive/kourou-0.12.tar.gz"
  version "0.12"
  sha1 "af18adb2916f5bcb37ff3e154a0536552d26c00e"

  depends_on "subversion"
  depends_on "homebrew/apache/httpd24"
  depends_on "homebrew/php/php55"

  def install
    if !Kernel.system("host -W 1 -4 us-auto.proxy.lexmark.com")
      onoe "Oops! You should be on the Lexmark network or VPN to install kourou."
    else
      system "make", "prefix=#{HOMEBREW_PREFIX}"
      bin.install "bin/kourou"
    end
  end

  def caveats
    "Type 'kourou' at Terminal prompt to start."
  end

  test do
    system "#{bin}/kourou test"
  end
end
