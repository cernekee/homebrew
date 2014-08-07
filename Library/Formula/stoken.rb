require "formula"

class Stoken < Formula
  homepage "http://stoken.sourceforge.net/"
  url "https://dl.dropboxusercontent.com/u/169702767/stoken-0.8.tar.gz"
  sha1 "9be220ff9a144ed3c30dc40b0b2bbd843f996d92"

  depends_on 'gtk+3' => :optional
  depends_on 'pkg-config' => :build
  depends_on 'nettle'

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-debug
      --disable-silent-rules
      --prefix=#{prefix}
    ]
    if build.without? 'gtk+3'
      args << "--without-gtk"
    else
      args << "--with-gtk"
    end
    system "./configure", *args
    system "make check"
    system "make install"
  end

  test do
    system "#{bin}/stoken", "show", "--random"
  end
end
