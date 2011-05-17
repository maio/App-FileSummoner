clean:
	@dzil clean

guard:
	@PERL5LIB=lib guard

ctags:
	@ctags -R --languages=perl lib

