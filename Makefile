
PREFIX = /usr/local

tys: tys.sh tys.awk tys.tsv
	cat tys.sh > $@
	echo 'exit 0' >> $@
	echo "#EOF" >> $@
	tar cz tys.awk tys.tsv >> $@
	chmod +x $@

test: tys.sh
	shellcheck -s sh tys.sh

clean:
	rm -f tys

install: tys
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f tys $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/tys

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/tys

.PHONY: test clean install uninstall
