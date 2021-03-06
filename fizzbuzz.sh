#!/usr/bin/env bash
# fizzbuzz.sh.

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

fizzbuzz()
{
    declare -ir n="$1"
    declare -i i
    declare line

    for ((i = 1; i <= n; i++ )); do
        line=''
        if ((i % 3 == 0)); then
            line="${line}fizz"
        fi
        if ((i % 5 == 0)); then
            line="${line}buzz"
        fi
        if [[ -z $line ]]; then
            line="$i"
        fi
        echo "$line"
    done
}

# we need at least one argument.
if [[ $# -lt 1 ]]; then
    echo_err "${script_basename}: Incorrect number of arguments."
    echo_err "Usage: ${script_basename} $script_usage"
    echo_err "Try \`${script_basename} -h' for more information."
    exit "$E_NO_ARGS"
fi

declare -ri in_n="$1"
declare -i i

#echo "in_n: $in_n"
fizzbuzz "$in_n"


### ## # eof. # ## ###
