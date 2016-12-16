deploy:
	git submodule update
	cd elfish && $(MAKE) bootstrap deploy
	cp -R elfish/assets .
	mv assets/elfish.html index.html
