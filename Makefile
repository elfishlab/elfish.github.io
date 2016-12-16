clean:
	rm -rf css scripts index.html

deploy: clean
	cd elfish && $(MAKE) bootstrap deploy
	cp -R elfish/assets/* .
	mv elfish.html index.html
