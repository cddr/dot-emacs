
.PHONY: install
install:
	mkdir -p ~/.emacs.d
	cp -R * ~/.emacs.d/
	cd ~/.emacs.d ; cask install
         
