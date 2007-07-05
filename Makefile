VERSION=1.9.0

PYTHONVERS = python2.4

SOURCES=cupsmodule.c cupsconnection.c cupsppd.c setup.py \
	cupsppd.h

DIST=Makefile test.py

cups.so: $(SOURCES)
	python setup.py build
	mv build/lib*/$@ .

clean:
	-rm -rf build cups.so *.pyc *~

tag:
	TAG=pycups-`echo $(VERSION) | tr . _` ; \
	cvs tag -c $$TAG

dist:
	mkdir pycups-$(VERSION)
	cp -a $(SOURCES) $(DIST) pycups-$(VERSION)
	tar jcf pycups-$(VERSION).tar.bz2 pycups-$(VERSION)
	rm -rf pycups-$(VERSION)

.PHONY: clean

