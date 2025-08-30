PREFIX        ?= /usr/local
BINDIR        := $(PREFIX)/bin
XSESSIONSDIR  := $(PREFIX)/share/xsessions

TARGET_CLIPSMWM := CLIPS1wm
DESTINATION     := $(TARGET_CLIPSMWM)
SHELL_SCRIPT    := $(TARGET_CLIPSMWM)
DESKTOP         := $(TARGET_CLIPSMWM).desktop

DATADIR         := $(PREFIX)/share/$(TARGET_CLIPSMWM)
DATAFILES       := $(wildcard *.clp)
BAT_TEMPLATE    := CLIPS1wm.bat.in
BAT_OUT         := CLIPS1wm.bat

CLIPSX11_BIN    ?= $(BINDIR)/CLIPSX11
REQUIRED_CLIPSX11_VERSION ?= 0.2.0

CLIPSX11_SHARE  := $(PREFIX)/share/CLIPSX11

.PHONY: all check-deps install install-bin install-desktop install-data uninstall clean

all:
	@:

check-deps:
	@if ! command -v $(notdir $(CLIPSX11_BIN)) >/dev/null 2>&1 && [ ! -x "$(CLIPSX11_BIN)" ]; then \
	  echo "Error: Executable CLIPSX11 not found. Make sure CLIPSX11 is available as an executable first."; exit 1; \
	fi
	@found="$$( $(CLIPSX11_BIN) --version 2>/dev/null | awk '{print $$2}' )"; \
	if [ "$$found" != "$(REQUIRED_CLIPSX11_VERSION)" ]; then \
	  echo "Error: CLIPS1wm requires CLIPSX11 $(REQUIRED_CLIPSX11_VERSION), found $$found."; \
	  exit 1; \
	fi

install: check-deps install-bin install-desktop install-data

install-bin:
	install -d "$(BINDIR)"
	sed -e 's|@CLIPSX11@|$(CLIPSX11_BIN)|g' \
	    -e 's|@DATADIR@|$(DATADIR)|g' \
	    "$(SHELL_SCRIPT)" > "$(BINDIR)/$(DESTINATION)"
	chmod 755 "$(BINDIR)/$(DESTINATION)"

install-desktop:
	install -d "$(XSESSIONSDIR)"
	install -m644 "$(DESKTOP)" "$(XSESSIONSDIR)/$(DESKTOP)"

install-data:
	install -d "$(DATADIR)"
	[ -z "$(DATAFILES)" ] || install -m644 $(DATAFILES) "$(DATADIR)"
	sed -e "s|@DATADIR@|$(DATADIR)|g" \
	    -e "s|@SYSDIR@|$(CLIPSX11_SHARE)|g" \
	    "$(BAT_TEMPLATE)" > "$(DATADIR)/$(BAT_OUT)"

uninstall:
	rm -f "$(BINDIR)/$(DESTINATION)"
	rm -f "$(XSESSIONSDIR)/$(DESKTOP)"
	rm -rf "$(DATADIR)"

clean:
	@:
