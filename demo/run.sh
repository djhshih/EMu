#!/bin/bash

outdir=test

mkdir -p $outdir

../EMu \
	--mut 21_breast_cancers.mutations.txt \
	--opp 21_breast_cancers.opportunity.txt \
	--pre $outdir/breast_cancers
