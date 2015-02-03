# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class KourouClient < Formula
  homepage "https://github.com/LexmarkWeb/kourou-client"
  url "https://github.com/LexmarkWeb/kourou-client/archive/v0.02.tar.gz"
  version "0.02"
  sha1 "6044cd99d19d5020344b53e4125f693add90e26a"

  depends_on "subversion"
  depends_on "homebrew/apache/httpd24"
  depends_on "homebrew/php/php55"

  def install
    system "make"
    bin.install "kourou"
    system "kourou"
  end

  def caveats
    "Type 'kourou' at Terminal prompt to start."
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kourou-client`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
