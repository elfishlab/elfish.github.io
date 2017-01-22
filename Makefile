clean:
	rm -rf css scripts index.html

deploy: clean
	git submodule foreach git pull origin master
	cp -R elfish/assets/* .
	mv elfish.html index.html
	$(eval $@_ELVERSION := $(shell git rev-list HEAD --count))
	sed -i "3i <\!-- Elfish version $($@_ELVERSION) -->" index.html
	git commit -am "deploy version $($@_ELVERSION)"
	echo "\nCommited version $($@_ELVERSION).\nUse git push to deploy.\n"
