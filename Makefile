.PHONY: all twice clean distclean

all:
	context fduthesis.tex

twice:
	context fduthesis.tex
	context fduthesis.tex

clean:
	rm -f *.log *.tuc *.tmp

distclean: clean
	rm -f fduthesis.pdf
