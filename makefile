DVIPDFMX:=$(shell grep '\\def\\usewhat{dvipdfmx}' main.tex)
PDFLATEX:=$(shell grep '\\def\\usewhat{pdflatex}' main.tex)
DVIPSPDF:=$(shell grep '\\def\\usewhat{dvipspdf}' main.tex)
XELATEX:=$(shell grep '\\def\\usewhat{xelatex}' main.tex)
YAP:=$(shell grep '\\def\\usewhat{yap}' main.tex)

empty=

all:
ifneq ($(empty),$(DVIPDFMX))
	@echo Making dvipdfmx......
	rm main_dvipdfm.pdf main.dvi&
	latex main.tex
#	env BIBINPUTS=./ BSTINPUTS=./ bibtex main
	latex main.tex
	gbk2uni main.out
	latex main.tex
	dvipdfmx -p a4 main.dvi
	mv main.pdf main_dvipdfm.pdf
	@echo Done. Starting the browser......
#	acroread main_dvipdfm.pdf&
endif
ifneq ($(empty),$(PDFLATEX))
	@echo Making pdflatex......
	rm main_pdflatex.pdf&
	pdflatex main.tex
	env BIBINPUTS=./ BSTINPUTS=./ bibtex main
	pdflatex main.tex
	gbk2uni main.out
	pdflatex main.tex
	mv main.pdf main_pdflatex.pdf
	@echo Done. Starting the browser......
	acroread main_pdflatex.pdf&
endif
ifneq ($(empty),$(DVIPSPDF))
	@echo Making dvipspdf......
	rm main_dvipspdf.pdf main.dvi main.ps&
	latex main.tex
#	env BIBINPUTS=./ BSTINPUTS=./ bibtex main
	latex main.tex
	gbk2uni main.out
	latex main.tex
	dvips  -G0 -ta4 main.dvi
	ps2pdf main.ps main_dvipspdf.pdf
#	@echo Done. Starting the browser......
#	acroread main_dvipspdf.pdf&
endif
ifneq ($(empty),$(XELATEX))
	@echo Making dvipspdf......
	rm main.pdf main.dvi main.ps&
	xelatex main.tex
#	env BIBINPUTS=./ BSTINPUTS=./ bibtex main
	xelatex main.tex
#	gbk2uni main.out
	xelatex main.tex
	@echo Done. Starting the browser......
	acroread main.pdf&
endif
ifneq ($(empty),$(YAP))
	@echo Making dvi......
	rm main.dvi&
	latex main.tex
	env BIBINPUTS=./ BSTINPUTS=./ bibtex main
	latex main.tex
	gbk2uni main.out
	latex main.tex
	xdvi main.dvi&
endif

clean:
	@echo Cleaning up......
	-rm *.log *.out *.thm *.toc *.toe
	-rm body/*.aux
	@echo All done.
