class LibgeditGfls < Formula
  desc "GNOME Text Editor Product Line"
  homepage "https://github.com/gedit-technology/libgedit-gfls"
  url "https://github.com/gedit-technology/libgedit-gfls/releases/download/0.1.0/libgedit-gfls-0.1.0.tar.xz"
  license "LGPL-3-or-later"
  sha256 "e6c67e41336b792f17dac28e4cf0e67a2b606aef5327b359103def2b90d787aa"

  depends_on "gobject-introspection" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "icu4c"
  depends_on "libgedit-amtk"
  depends_on "uchardet"

  def install
    system "meson", "setup", "build", "-Dgtk_doc=false", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end
end
