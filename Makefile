clean:
	rm -rf css scripts index.html

deploy: clean
	git submodule foreach git pull origin master
	cp -R elfish/assets/* .
	mv elfish.html index.html
	export ELVERSION=`git rev-list HEAD --count`
	sed -i "3i <\!-- Elfish version ${ELVERSION} -->" index.html
	git commit -am "deploy version ${ELVERSION}"
	echo "\nCommited version ${ELVERSION}.\nUse git push to deploy.\n"
