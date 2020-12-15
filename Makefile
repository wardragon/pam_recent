prefix = /lib/security

all: pam_recent

pam_recent: pam_recent.c
	@echo "CFLAGS=$(CFLAGS)" | \
		fold -s -w 70 | \
		sed -e 's/^/# /'
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDCFLAGS) -o $@.so $^

install: pam_recent
	install -D pam_recent.so \
		$(DESTDIR)$(prefix)/pam_recent.so

clean:
	-rm -f pam_recent.so

distclean: clean

uninstall:
	-rm -f $(DESTDIR)$(prefix)/pam_recent.so

