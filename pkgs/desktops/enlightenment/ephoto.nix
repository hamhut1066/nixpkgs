{ stdenv, fetchurl, pkgconfig, efl, pcre, mesa_noglu, makeWrapper }:

stdenv.mkDerivation rec {
  name = "ephoto-${version}";
  version = "1.5";
  
  src = fetchurl {
    url = "http://www.smhouston.us/stuff/${name}.tar.gz";
    sha256 = "09kraa5zz45728h2dw1ssh23b87j01bkfzf977m48y1r507sy3vb";
  };

  nativeBuildInputs = [
    (pkgconfig.override { vanilla = true; })
    mesa_noglu.dev # otherwise pkg-config does not find gbm
    makeWrapper
  ];

  buildInputs = [
    efl
    pcre
  ];

  meta = {
    description = "Image viewer and editor written using the Enlightenment Foundation Libraries";
    homepage = http://smhouston.us/ephoto/;
    license = stdenv.lib.licenses.bsd2;
    platforms = stdenv.lib.platforms.linux;
    maintainers = [ stdenv.lib.maintainers.romildo ];
  };
}
