# Directories
SRCDIR=src
OBJDIR=obj
BINDIR=bin

# Files
PROGFILE=makeanddebug.f90
SRCFILES= mymodule.f90 mymodulea.f90

OBJFILES=$(SRCFILES:.f90=.o)
PROGOBJ=$(PROGFILE:.f90=.o)
MODFILES=$(SRCFILES:.f90=.mod)
EXE=$(PROGFILE:.f90=.exe)

# Compilers
FC=gfortran
LD=gfortran

# Fortran and linker flags and libraries
FCFLAGS= -g -Wall -J$(OBJDIR) -cpp
LDFLAGS=
LIBS=

all: $(BINDIR)/$(EXE)

$(BINDIR)/$(EXE): $(addprefix $(OBJDIR)/, $(OBJFILES)) $(OBJDIR)/$(PROGOBJ) | $(BINDIR)
	$(LD)  $^ -o $@ $(LDFLAGS) $(LIBS)

$(OBJDIR)/%.o: $(SRCDIR)/%.f90 | $(OBJDIR)
	$(FC) -c -o $@ $< $(FCFLAGS)

$(OBJDIR)/%.mod: $(SRCDIR)/%.f90 | $(OBJDIR)
	$(FC) -c -o $@ $< $(FCFLAGS)

# Make directories as necessary
$(BINDIR):
	mkdir $(BINDIR)

$(OBJDIR):
	mkdir $(OBJDIR)


clean:
	rm $(OBJDIR)/*.*
	rm $(BINDIR)/*.*

run: $(BINDIR)/$(EXE)
	$(BINDIR)/$(EXE)

.PHONY: all clean run
