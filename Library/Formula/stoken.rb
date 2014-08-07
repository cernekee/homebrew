require "formula"

class Stoken < Formula
  homepage "http://stoken.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/stoken/stoken-0.8.tar.gz"
  sha1 "6c353b1ca82059cd57bc959fe30b4ef0c84d763c"

  depends_on 'gtk+3' => :optional
  if build.with? "gtk+3"
    depends_on 'gnome-icon-theme'
    depends_on 'hicolor-icon-theme'
  end
  depends_on 'pkg-config' => :build
  depends_on 'nettle'

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-debug
      --disable-silent-rules
      --prefix=#{prefix}
    ]

    system "./configure", *args
    system "make check"
    system "make install"
  end

  test do
    system "#{bin}/stoken", "show", "--random"
  end
end
