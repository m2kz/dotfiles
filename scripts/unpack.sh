#! /bin/sh
#
# unpack.sh
# Copyright (C) 2018 michal <michal@michal-robots>
#
# Distributed under terms of the MIT license.
#


#!/bin/sh
die() { >&2 echo "${@}" && exit 1; }
clean() { rm -rf "${TMPD}"; }

TMPD="$(mktemp -d)"
test -d "${TMPD}" || die "mktemp failed"
trap 'clean' EXIT

test -e "${1}" || die "Usage: ${0} [FILE]"

case "$(dd if="${1}" count=1 bs=4 2>/dev/null)" in
PK*) unzip "${1}" -d "${TMPD}" > /dev/null || die "unzip failed" ;;
Rar\!) unrar x "${1}" "${TMPD}" > /dev/null || die "unrar failed" ;;
7z*) 7z x "${1}" "${TMPD}" > /dev/null || die "7z failed" ;;
*) die "unknown archive format" ;;
esac

find "${TMPD}" -type f | sort -n | sxiv -i
