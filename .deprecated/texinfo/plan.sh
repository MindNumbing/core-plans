pkg_name=texinfo
pkg_origin=core
pkg_version=6.6
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="\
Texinfo is the official documentation format of the GNU project. It was \
invented by Richard Stallman and Bob Chassell many years ago, loosely based on \
Brian Reid's Scribe and other formatting languages of the time. It is used by \
many non-GNU projects as well.\
"
pkg_upstream_url="http://www.gnu.org/software/texinfo/"
pkg_license=('GPL-3.0-or-later')
pkg_source="http://ftp.gnu.org/gnu/$pkg_name/${pkg_name}-${pkg_version}.tar.xz"
pkg_shasum="9bb9ca00da53f26a7e5725eee49689cd4a1e18d25d5b061ac8b2053018d93d66"
pkg_deps=(
  core/glibc
  core/ncurses
  core/perl
)
pkg_build_deps=(
  core/patch
  core/make
  core/gcc
  core/sed
)
pkg_bin_dirs=(bin)

do_check() {
  make check
}


# ----------------------------------------------------------------------------
# **NOTICE:** What follows are implementation details required for building a
# first-pass, "stage1" toolchain and environment. It is only used when running
# in a "stage1" Studio and can be safely ignored by almost everyone. Having
# said that, it performs a vital bootstrapping process and cannot be removed or
# significantly altered. Thank you!
# ----------------------------------------------------------------------------
if [[ "$STUDIO_TYPE" = "stage1" ]]; then
  pkg_build_deps=(
    core/gcc
    core/sed
    core/make
    core/patch
  )
fi
