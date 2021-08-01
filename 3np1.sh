#!/usr/bin/env bash
# 3np1.sh.

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

# we need at least one argument.
if [[ $# -lt 1 ]]; then
    echo_err "${script_basename}: Incorrect number of arguments."
    echo_err "Usage: ${script_basename} $script_usage"
    echo_err "Try \`${script_basename} -h' for more information."
    exit "$E_NO_ARGS"
fi

declare -ri n="$1"
declare -i m="$n"
declare -i c=0

echo "n: $n"
echo ''

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
