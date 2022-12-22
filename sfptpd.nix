{ stdenv, src }:

stdenv.mkDerivation {
  name = "sfptpd";
  inherit src;
  makeFlags = [ "PREFIX=$(out)" "DESTDIR=$(out)" ];
}
