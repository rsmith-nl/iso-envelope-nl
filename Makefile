# file: Makefile
# vim:fileencoding=utf-8
# Makefile for labels
#
# Author: R.F. Smith <rsmith@xs4all.nl>
# Created: 2009-12-25 14:48:54
# Last modified: 2022-01-03T23:36:23+0100
.SUFFIXES:
.SUFFIXES: .tex .pdf
.MAKEFLAGS: -j 4

# List of all the PDF files to be generated.
TEX!=ls *.tex
PDFS:=${TEX:.tex=.pdf}

# TeX command to use
TEXCMD:= xelatex -output-directory=latex.out -halt-on-error -interaction=nonstopmode

all: latex.out ${PDFS}

latex.out:
	mkdir latex.out

clean::
	rm -f latex.out/*
	rm -f *.pdf

.tex.pdf:
	${TEXCMD} $<
	mv latex.out/$@ .
