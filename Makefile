.PHONY: pdf

all: pdf with_notes notes_only notes_only_print handouts handouts_print handouts_space
# all: pdf with_notes handouts handouts_print handouts_space clean

pdf: 20240226_uh.tex
	latexmk -shell-escape  -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20240226_uh_presentation.tex

with_notes: 20240226_uh_presentation_notes.tex
	latexmk -shell-escape  -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20240226_uh_presentation_notes.tex

notes_only: 20240226_uh_notes_only.tex
	latexmk -shell-escape  -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make -bibtex- 20240226_uh_notes_only.tex

notes_only_print: notes_only 20240226_uh_notes_only_print.tex
	latexmk -shell-escape  -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make -bibtex- 20240226_uh_notes_only_print.tex

handouts: 20240226_uh_handouts.tex
	latexmk -shell-escape  -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20240226_uh_handouts.tex

handouts_print: handouts 20240226_uh_handouts_print.tex
	latexmk -shell-escape  -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20240226_uh_handouts_print.tex

handouts_space: 20240226_uh_handouts_with_space.tex
	latexmk -shell-escape  -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20240226_uh_handouts_with_space.tex

clean:
	rm -fv *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc *.dvi *.vrb *.bcf *.run.xml *.cut *.lo*
	latexmk -c
