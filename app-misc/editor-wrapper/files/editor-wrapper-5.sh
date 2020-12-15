#!/bin/sh
# Copyright 2009-2020 Gentoo Authors
# Distributed under the terms of the MIT/X11 license

# Wrapper script, executes ${@VAR@} with arguments $@

if [ -z "${@VAR@}" ]; then
    # Try to get @VAR@ from system profile
    @VAR@=$(. /etc/profile >/dev/null 2>&1; echo "${@VAR@}")
fi

if [ -z "${@VAR@}" ]; then
    echo "$0: The @VAR@ variable must be set" >&2
    exit 1
elif [ "${@VAR@}" = "${0##*/}" ]; then
    # avoid infinite recursion
    echo "$0: The @VAR@ variable shall not be identical to '${0##*/}'" >&2
    exit 1
fi

exec ${@VAR@} "$@"
