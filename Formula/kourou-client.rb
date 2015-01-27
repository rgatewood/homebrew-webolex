# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class KourouClient < Formula
  homepage "https://github.com/LexmarkWeb/kourou-client"
  url "https://github.com/LexmarkWeb/kourou-client/archive/v0.01.tar.gz"
  version "0.01"
  sha1 "0e54561ca12e83c171ebc7c6f72ca879e3b4a07c"

  depends_on "subversion"
  depends_on "homebrew/apache/httpd24"
  depends_on "homebrew/php/php55"

  def install

    system "awk -f edit-conf.awk /usr/local/etc/apache2/2.4/httpd.conf > temp.conf"
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