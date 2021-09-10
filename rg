#!/bin/sh

## Override $rg_bin to use '-d' as an alias for '--max-depth'

rg_bin=/usr/bin/rg

for arg; do
	[ $d ] && arg=-d$arg
	case $arg in
		-d[1-9]) max_depth="--max-depth ${arg#*d}"; ;;
		-d) d=1 ;;
		*) args="$args $arg"
	esac
	[ $depth ] && break
done

eval $rg_bin $max_depth $args
