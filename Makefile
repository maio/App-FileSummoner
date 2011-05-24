test:
	@PERL5LIB=${PERL5LIB}:lib prove -r .

release:
	@dzil release

clean:
	@dzil clean

guard:
	@PERL5LIB=lib guard

ctags:
	@ctags -R --languages=perl lib

