#!/usr/bin/env bash

jsonnet -J vendor/ -J . -S -m validation-helpers/ validation-helpers/docs.jsonnet
