prefix = /lib/security

all: src/pam_recent

src/pam_recent: pam_recent.c
        @echo "CFLAGS=$(CFLAGS)" | \
                fold -s -w 70 | \
                sed -e 's/^/# /'
        $(CC) $(CPPFLAGS) $(CFLAGS) $(LDCFLAGS) -o $@ $^

install: src/pam_recent
        install -D src/hello \
                $(DESTDIR)$(prefix)/pam_recent.so

clean:
        -rm -f pam_recent.so

distclean: clean

uninstall:
        -rm -f $(DESTDIR)$(prefix)/pam_recent.so

