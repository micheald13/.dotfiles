#!/bin/sh

# svn --non-interactive status --depth=immediates | (
svn --non-interactive status | (
  A=0
  C=0
  D=0
  I=0
  M=0
  R=0
  X=0
  q=0
  b=0
  t=0

  while read -r line; do
    case $line in
      A*) A=$((A + 1)) ;;
      C*) C=$((C + 1)) ;;
      D*) D=$((D + 1)) ;;
      I*) I=$((I + 1)) ;;
      M*) M=$((M + 1)) ;;
      R*) R=$((R + 1)) ;;
      X*) X=$((X + 1)) ;;
      \?*) q=$((q + 1)) ;;
      \!*) b=$((b + 1)) ;;
      \~*) t=$((t + 1)) ;;
    esac
  done

  result=""

  if [ $A -gt 0 ]; then
    result="${result}A"
    if [ $A -gt 1 ]; then
      result="${result}:${A}"
    fi
  fi

  if [ $C -gt 0 ]; then
    if [ -n "$result" ]; then
      result="${result} "
    fi
    result="${result}C"
    if [ $C -gt 1 ]; then
      result="${result}:${C}"
    fi
  fi

  if [ $D -gt 0 ]; then
    if [ -n "$result" ]; then
      result="${result} "
    fi
    result="${result}D"
    if [ $D -gt 1 ]; then
      result="${result}:${D}"
    fi
  fi

  if [ $I -gt 0 ]; then
    if [ -n "$result" ]; then
      result="${result} "
    fi
    result="${result}I"
    if [ $I -gt 1 ]; then
      result="${result}:${I}"
    fi
  fi

  if [ $M -gt 0 ]; then
    if [ -n "$result" ]; then
      result="${result} "
    fi
    result="${result}M"
    if [ $M -gt 1 ]; then
      result="${result}:${M}"
    fi
  fi

  if [ $R -gt 0 ]; then
    if [ -n "$result" ]; then
      result="${result} "
    fi
    result="${result}R"
    if [ $R -gt 1 ]; then
      result="${result}:${R}"
    fi
  fi

  if [ $X -gt 0 ]; then
    if [ -n "$result" ]; then
      result="${result} "
    fi
    result="${result}X"
    if [ $X -gt 1 ]; then
      result="${result}:${X}"
    fi
  fi

  if [ $q -gt 0 ]; then
    if [ -n "$result" ]; then
      result="${result} "
    fi
    result="${result}?"
    if [ $q -gt 1 ]; then
      result="${result}:${q}"
    fi
  fi

  if [ $b -gt 0 ]; then
    if [ -n "$result" ]; then
      result="${result} "
    fi
    result="${result}!"
    if [ $b -gt 1 ]; then
      result="${result}:${b}"
    fi
  fi

  if [ $t -gt 0 ]; then
    if [ -n "$result" ]; then
      result="${result} "
    fi
    result="${result}~"
    if [ $t -gt 1 ]; then
      result="${result}:${t}"
    fi
  fi

  echo "$result"
)

