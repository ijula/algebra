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

    for ((i = n; i > 0; i--)); do
        echo "$i"
        if ((n % i)); then
            echo -n "i"
        fi
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

echo "$in_n: "
get_divisors "$in_n"

for ((i = 0; i < 100; i++ )); do
    true
done


### ## # eof. # ## ###
