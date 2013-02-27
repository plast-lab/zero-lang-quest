INPUT = ./input
OUTPUT = ./output
GEN = build

GCC = g++
GHC = ghc
JAVAC = javac
JVM = java
PYTHON = python
AWK = gawk
PERL = perl
PHP = php
RUBY = ruby

CPP_EXE = $(GEN)/c++/minimal
JAVA_CLASS = $(GEN)/java/Minimal.class
HASKELL_EXE = $(GEN)/haskell/minimal

LANGS = c++ java python haskell scala awk bash perl php ruby javascript fsharp
TESTS := $(LANGS:%=test-%) 
COUNTS := $(LANGS:%=count-%) 

c++_CODE = minimal.cpp
java_CODE = Minimal.java
python_CODE = minimal.py
awk_CODE = minimal.awk
haskell_CODE = minimal.hs
bash_CODE = minimal.sh
scala_CODE = minimal.scala
perl_CODE = minimal.pl
php_CODE = minimal.php
ruby_CODE = minimal.rb
fsharp_CODE = minimal.fs
javascript_CODE = minimal.js

####### Actual Commands to run the programs #######


c++_RUN = ./$(CPP_EXE)
java_RUN = $(JVM) -cp $(dir $(JAVA_CLASS)) $(basename $(notdir $(JAVA_CLASS)))
python_RUN = $(PYTHON) $(python_CODE)
awk_RUN = $(AWK) -f $(awk_CODE)
haskell_RUN = ./$(HASKELL_EXE)
bash_RUN = ./$(bash_CODE)
perl_RUN = $(PERL) $(perl_CODE)
php_RUN = $(PHP) $(php_CODE)
ruby_RUN = $(RUBY) $(ruby_CODE)
fsharp_RUN = echo "Not just yet" && cat $(OUTPUT)
javascript_RUN = echo "Not just yet" && cat $(OUTPUT)

################# Rules #################

all: $(LANGS)

c++: $(CPP_EXE)
java: $(JAVA_CLASS)
python:
awk:
bash:
haskell: $(HASKELL_EXE)

$(CPP_EXE): $(c++_CODE)
	@mkdir -p $(@D)
	$(GCC) -o $@ -O2 $<

$(JAVA_CLASS): $(java_CODE)
	@mkdir -p $(@D)
	$(JAVAC) -d $(@D) $<

$(HASKELL_EXE): $(haskell_CODE)
	@mkdir -p $(@D)
	$(GHC) -o $@ -odir $(@D) -hidir $(@D) $<

############## Testing Rule ##############


$(TESTS): test-% : %
	@echo "Testing $* version:"
	time -p $($*_RUN) 2 < $(INPUT) | diff $(OUTPUT) -

$(COUNTS): count-% : %
	@printf "%-20s" "Counting $* version: "
	@cat $($*_CODE) | sed 's/[[:space:]]//g' | wc -c

count: $(COUNTS)

.PHONY: $(LANGS) $(TESTS) $(COUNTS) clean count

clean:
	rm -rf $(GEN)/
