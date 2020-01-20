TARGET	= tiny

# LINK (*.o)
LD	= cc
LDFLAGS	= -W

# COMPILE (*.c)
CC	= cc
CCFLAGS	= -W -O2

# GENERATOR (*.lex and *.yac)
LEX	= flex
YAC	= yacc

OBJS	= y.tab.o main.o
DEFS	= defs.h
REXP	= rexp.lex
LEXC	= lex.yy.c
SYNS	= syns.yac
YACC	= y.tab.c
SRC	= src.txt
TMP	= tmp.txt
ARC	= Archive

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

$(OBJS): $(DEFS)

$(LEXC): $(REXP) $(DEFS)
	$(LEX) $(REXP)

$(YACC): $(SYNS) $(LEXC) $(DEFS)
	$(YAC) $(SYNS)

%.o: %.c
	$(CC) $(CCFLAGS) -c $< -o $@

clean:
	-rm -f $(TARGET)* $(OBJS) $(LEXC) $(YACC) $(TMP) $(ARC).zip *\~
	-rm -rf ./TinyVM/ ; rm -f TinyVM.zip 
	@rm -rf __MACOSX/

src: all
	./$(TARGET) < $(SRC) > $(TMP)
	cat $(TMP)
	@echo

zip: clean
	mkdir $(ARC)
	cp -p -r ./*.* Makefile $(ARC)/
	zip -r $(ARC).zip $(ARC)/
	rm -rf $(ARC)

vm:
	@if [ ! -e $(TMP) ] ; then make src; fi
	@if [ ! -e ./TinyVM.zip ] ; then curl -O http://www.cc.kyoto-su.ac.jp/~atsushi/misc/zips/TinyVM.zip ; fi
	@if [ ! -e ./TinyVM/ ] ; then unzip TinyVM.zip > /dev/null 2>&1 ; rm -rf __MACOSX/ > /dev/null 2>&1 ; fi
	@xattr -cr ./TinyVM/
	open ./TinyVM/TinyVM.app

test: vm
	@:
