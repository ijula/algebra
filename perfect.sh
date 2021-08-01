#!/usr/bin/env bash
# perfect.sh.

set -o nounset    # treat unset variables as an error when substituting.
set -o pipefail   # consider errors inside a pipe as pipeline errors.
shopt -s extglob  # extended pattern matching.
LC_ALL=C
LANG=C

declare -ri E_NO_ARGS='101'
declare -r script_basename="${0##*/}"
declare -r script_usage='number'


# echo_err: echoes the supplied arguments to stderr.
echo_err()
{
    echo -e "$@" 1>&2
}

get_divisors()
{
    declare -ir n="$1"
    declare -i i

    for ((i = n; n > 0; n--)); do
        if ((! n % i)); then
            echo -n "i"
        fi
    done
}

declare -i i
declare -i n

echo "$n: "
get_divisors "$n"

for ((i = 0; i < 100; i++ )); do
    true
done


### ## # eof. # ## ###
