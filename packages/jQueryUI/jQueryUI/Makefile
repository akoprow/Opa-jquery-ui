########################################
# USER VARIABLES
MKLIB = opa-plugin-builder
PLUGNAME = jQueryUI.opp
SRC = jQueryUI.js ui/jquery.ui.widget.js ui/jquery.ui.core.js ui/jquery.ui.mouse.js ui/jquery.ui.sortable.js ui/jquery.ui.draggable.js
     #ui/jquery-ui.js

########################################
# MAKEFILE VARIABLES
ifeq ($(origin BUILDDIR), undefined)
	PWD := $(shell pwd)
	BUILDDIR := $(PWD)/_build/
	export BUILDDIR
endif

########################################
# PLUGIN BUILDING
$(PLUGNAME) : $(SRC)
	@echo "### Building plugin $(PLUGNAME)"
	@$(MKLIB) --js-validator-off -o $(@:%.opp=%) $? $(CONF) --build-dir $(BUILDDIR)

########################################
# CLEANING
clean :
	@echo "### Cleaning plugin $(PLUGNAME)"
	@rm -rf $(BUILDDIR)/$(PLUGNAME)

