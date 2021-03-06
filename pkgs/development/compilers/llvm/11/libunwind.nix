{ stdenv, version, fetch, cmake, fetchpatch
, enableShared ? !stdenv.hostPlatform.isStatic
}:

stdenv.mkDerivation rec {
  pname = "libunwind";
  inherit version;

  src = fetch pname "0bwjd2xf51r2apn8p0f9shb6nc8hnqzq1n9gggjvyjmi6cf02mc4";

  nativeBuildInputs = [ cmake ];

  cmakeFlags = stdenv.lib.optional (!enableShared) "-DLIBUNWIND_ENABLE_SHARED=OFF";
}
