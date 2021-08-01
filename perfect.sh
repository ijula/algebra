#!/usr/bin/env bash
# perfect.sh.

set -o nounset    # treat unset variables as an error when substituting.
set -o pipefail   # consider errors inside a pipe as pipeline errors.
shopt -s extglob  # extended pattern matching.
LC_ALL=C
LANG=C


# echo_err: echoes the supplied arguments to stderr.
echo_err()
{
    echo -e "$@" 1>&2
}


declare -i n
declare -i m
declare -i c=0

while ((m != 1)); do
    if ((m % 2)); then # odd.
        m=$((3 * m + 1))
        echo "$c: $m"
    else # even.
        m=$((m / 2))
        echo "$c: $m"
    fi
    c=$((c + 1))
done


### ## # eof. # ## ###
