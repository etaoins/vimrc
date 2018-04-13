#!/bin/sh
cd $(git rev-parse --show-toplevel) && nice rls "$@"
