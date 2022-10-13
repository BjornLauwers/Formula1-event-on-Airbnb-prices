all: analysis paper

data-preparation:
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis
	
paper: data-preparation analysis
	make -C src/paper
	
clean:
	R -e "unlink('*.pdf')"
	R -e "unlink('*.csv')"

