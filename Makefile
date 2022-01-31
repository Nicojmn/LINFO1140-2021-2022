LATEX_FLAGS := -pdf -lualatex -cd -silent --shell-escape %.tex

.PHONY: all main open clean clean_aux

all: open

open: main
	@xdg-open build_latex/main.pdf 2>/dev/null 1>/dev/null &

main: 
	build_latex/main.pdf

clean:
	$(shell find . -name "*.log" -delete -or -name "*.aux" -delete -or -name "*.fls" -delete -or -name "*.maf" -delete -or -name "*.mtc*" -delete -or -name "*.out" -delete -or -name "*.synctex*" -delete -or -name "*.fdb*" -delete 2>/dev/null)
	

build_latex/main.pdf: src/main.tex src/tex/*
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)
