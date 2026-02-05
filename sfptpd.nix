{ stdenv, src, libmnl }:

stdenv.mkDerivation {
  name = "sfptpd";
  inherit src;
  buildInputs = [ libmnl ];
  makeFlags = [ "PREFIX=$(out)" "DESTDIR=$(out)" ];
}
