clean:
	rm -rf css scripts index.html

deploy: clean
	git submodule foreach git pull origin master
	cp -R elfish/assets/* .
	mv elfish.html index.html
