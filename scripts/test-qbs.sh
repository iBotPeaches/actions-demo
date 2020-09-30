#!/usr/bin/env bash
#############################################################################
##
## Copyright (C) 2020 Ivan Komissarov <abbapoh@gmail.com>
## Contact: https://www.qt.io/licensing/
##
## This file is part of Qbs.
##
## $QT_BEGIN_LICENSE:LGPL$
## Commercial License Usage
## Licensees holding valid commercial Qt licenses may use this file in
## accordance with the commercial license agreement provided with the
## Software or, alternatively, in accordance with the terms contained in
## a written agreement between you and The Qt Company. For licensing terms
## and conditions see https://www.qt.io/terms-conditions. For further
## information use the contact form at https://www.qt.io/contact-us.
##
## GNU Lesser General Public License Usage
## Alternatively, this file may be used under the terms of the GNU Lesser
## General Public License version 3 as published by the Free Software
## Foundation and appearing in the file LICENSE.LGPL3 included in the
## packaging of this file. Please review the following information to
## ensure the GNU Lesser General Public License version 3 requirements
## will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
##
## GNU General Public License Usage
## Alternatively, this file may be used under the terms of the GNU
## General Public License version 2.0 or (at your option) the GNU General
## Public license version 3 or any later version approved by the KDE Free
## Qt Foundation. The licenses are as published by the Free Software
## included in the packaging of this file. Please review the following
## information to ensure the GNU General Public License requirements will
## be met: https://www.gnu.org/licenses/gpl-2.0.html and
## https://www.gnu.org/licenses/gpl-3.0.html.
##
## $QT_END_LICENSE$
##
#############################################################################

set -eu

#
# Qbs is built with the address sanitizer enabled.
# Suppress findings in some parts of Qbs / dependencies.
#
export LSAN_OPTIONS="suppressions=$( cd "$(dirname "$0")" ; pwd -P )/address-sanitizer-suppressions.txt:print_suppressions=0"

export PATH="$1:$PATH"

qbs-config --list profiles

CPUS=$("$(dirname "$0")"/cpu-count.sh)

export QBS_AUTOTEST_PROFILE=${QBS_AUTOTEST_PROFILE:-qt}
set -x
echo "Running Qbs tests (${CPUS} jobs in parallel)."
echo 'current dir'
pwd
echo "test dir '$1'"
ls -la
ls -la ./release
ls -la ./release/install-root
ls -la ./release/install-root/bin
find $1 -name "tst_*"
find $1 -name "tst_*" |head -3 |xargs -I{} -n1 -P${CPUS} bash -c 'export LOG=$(mktemp) ; echo "LOG=${LOG} {}"; $({});$({} >> ${LOG} 2>&1) ; export RESULT=$? ; ls -l ${LOG};cat ${LOG} ; exit ${RESULT}'
echo run test api
./release/install-root/bin/tst_api.exe
./release/install-root/bin/tst_blackbox-apple.exe
./release/install-root/bin/tst_blackbox-baremetal.exe
