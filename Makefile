INPUT = ./input
OUTPUT = ./output
GEN = build

GCC = g++
GHC = ghc
JAVAC = javac
JVM = java
PYTHON = python
AWK = gawk

CPP_EXE = $(GEN)/c++/minimal
JAVA_CLASS = $(GEN)/java/Minimal.class
HASKELL_EXE = $(GEN)/haskell/minimal

LANGS = c++ java python haskell scala awk bash
TESTS := $(LANGS:%=test-%) 

####### Actual Commands to run the programs #######


c++_RUN = ./$(CPP_EXE)
java_RUN = $(JVM) -cp $(dir $(JAVA_CLASS)) $(basename $(notdir $(JAVA_CLASS)))
python_RUN = $(PYTHON) minimal.py
awk_RUN = $(AWK) -f minimal.awk
haskell_RUN = ./$(HASKELL_EXE)
bash_RUN = ./minimal.sh

################# Rules #################


c++: $(CPP_EXE)
java: $(JAVA_CLASS)
python:
awk:
bash:
haskell: $(HASKELL_EXE)

$(CPP_EXE): minimal.cpp
	@mkdir -p $(@D)
	$(GCC) -o $@ -O2 $<

$(JAVA_CLASS): Minimal.java
	@mkdir -p $(@D)
	$(JAVAC) -d $(@D) $<

$(HASKELL_EXE): minimal.hs
	@mkdir -p $(@D)
	$(GHC) -o $@ -odir $(@D) -hidir $(@D) $<

############## Testing Rule ##############


$(TESTS): test-% : %
	@echo "Testing $* version."
	time -p $($*_RUN) 2 < $(INPUT) | diff $(OUTPUT) -

.PHONY: $(LANGS) $(TESTS) clean

clean:
	rm -rf $(GEN)/
