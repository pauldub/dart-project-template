.PHONY: shim clean

out/app.html: out/tmp.html
	mv -f out/tmp.html out/app.html

out/tmp.html: out/app.html_bootstrap.js
	sed -e 's:application/dart:text/javasrcipt:' \
		   -e 's:app.html_bootstrap.dart:app.html_bootstrap.dart.js:' out/app.html > out/tmp.html

out/app.html_bootstrap.js: out/app.dart
	dart2js out/app.html_bootstrap.dart -oout/app.html_bootstrap.dart.js

out/app.dart: src/*.dart src/*.html deps
	dart --package-root=packages/ packages/web_ui/dwc.dart --out out/ src/app.html

deps:
	pub install

clean: 
	rm -rf out/app*
	rm -rf out/comments*
	rm -rf out/index*

