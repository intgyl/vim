#!/bin/sh
suffix() {
	rename 's/\.$1/\.$2/' $3/*
}
