# PhD Thesis Template

This repository contains LaTeX class and template files to produce a PhD Thesis following the thesis guidelines of the University of Southampton, UK.

To install copy phdthesis.cls into your LaTeX environment, e.g.

cp phdthesis.cls ~/texmf/tex/latex/

texhash ~/texmf

Modified from the ECSDocs Class created by Steven R. Gunn http://users.ecs.soton.ac.uk/srg/softwaretools/document/templates/

Modifications from the original ECSDocs include:
- added Declaration of Authorship page
- added List of Algorithms and modified listings captions to read "Algorithm 1.1.1"
- added Nomenclature and separate List of Symbols
- moved all non-essential package loadings from class file to thesis.tex
- removed deprecated packages caption2, subfigure, lstpatch
- removed necessity to modify class file to adjust university/faculty/department/etc tags
- removed hyperlinks from university/faculty/department/etc tags
- upper case tags are created automatically



Copyright 2017 by Alexandra K. Diem

Licenced under BSD 3-Clause
