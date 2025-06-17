all:
	# export OSFONTDIR=/usr/share/fonts/
	# mtxrun --script fonts --reload
	context fduthesis.lmtx
clean:
	rm 	*.log
	rm 	*.tuc
	