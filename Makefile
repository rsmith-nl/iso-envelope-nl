# file: Makefile
# vim:fileencoding=utf-8
# Makefile for labels
#
# Author: R.F. Smith <rsmith@xs4all.nl>
# Created: 2009-12-25 14:48:54
# Last modified: 2021-10-21T20:05:44+0200
.SUFFIXES:
.SUFFIXES: .tex .pdf
.MAKEFLAGS: -j 4

# List of all the PDF files to be generated.
PDFS:=${:!ls *.tex!:S/tex$/pdf/}

# TeX command to use
TEXCMD:= xelatex -output-directory=latex.out -halt-on-error -interaction=nonstopmode

all: ${PDFS}

clean::
	rm -f latex.out/*
	rm -f *.pdf

.tex.pdf:
	${TEXCMD} $<
	mv latex.out/$@ .
