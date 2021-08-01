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

    for ((i = n-1; i > 0; i--)); do
        if ((n % i == 0)); then
            echo -n "$i "
        fi
    done
    echo ''
}

check_perfect()
{
    declare -ir n="$1"
    declare div
    declare -ai div_array
    declare -i div_sum=0
    declare -i i

    div="$(get_divisors "$n")"
    echo "div: $div"
    IFS=' '
    readarray -t div_array <<< "$div"

    for i in "${!div_array[@]}"; do
        div_sum+="${div_array[i]}"
        echo "${div_array[i]}"
    done

    echo "div_sum: $div_sum"

    if (( div_sum == n)); then
        echo "$n is a perfect number."
    else
        echo "$n is NOT a perfect number."
    fi
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
echo -n "divisors of $in_n: "
get_divisors "$in_n"
check_perfect "$in_n"

for ((i = 0; i < 100; i++ )); do
    true
done


### ## # eof. # ## ###
