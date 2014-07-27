
parse_flags() {  
  while (( "$#" )); do
    flag=
    case $1 in
      --)
        shift
        break
        ;;
      --*=*)
        a=${1##--}
        flag=${a%%=*};
        val=${a##*=}
        ;;
      --*)
        flag=${1/--/}
        val=$2
        ;;
      # -*)
      #   echo "short: ${1/-/}"
      #   ;;
      # *)
      #   echo "pos: $1"
      #   ;;
    esac
    if [[ $flag ]]; then
      if ! eval "flag_$flag $val" 2>/dev/null; then
        echo ">> invalid flag: $flag";
        exit 1
      fi
    fi
    shift
  done
  
  # return the remaining flags to the caller
  echo -n $@
}
