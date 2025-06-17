all:
	# export OSFONTDIR=/usr/share/fonts/
	# mtxrun --script fonts --reload
	context fduthesis.tex
clean:
	rm 	*.log
	rm 	*.tuc
	