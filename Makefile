########################################
# USER VARIABLES

EXE = demo.exe
PACKNAME =
SRC =
MAINSRC = demo.opa
PCKDIR = ./packages/
PCK = jQueryUI.opx
PLUGIN =
PLUGINDIR =
OTHER_DEPENDS =

#Compiler variables
OPACOMPILER = opa
MINIMAL_VERSION = 1150
FLAG = --minimal-version $(MINIMAL_VERSION) -v
PORT = 8080

RUNOPT ?= #-d --debug-js

# Build exe
default: exe

# Generate doc ApiX
gen: exe
	./$(EXE) -g $(OPALANG)/_build/stdlib

# Run Server
run: exe
	./$(EXE) $(RUNOPT) || exit 0 ## prevent ugly make error 130 :) ##

include Makefile.common
