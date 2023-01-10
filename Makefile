all: clean demonstrate

quine.c: quine_head.c quine_tail.c
	(cat quine_head.c; echo -n '    char p[] = "'; ((cat quine_head.c; echo '    char p[] = "|";'; cat quine_tail.c) | tr '\n"\\' '^@$$'); echo '";'; cat quine_tail.c) > quine.c

%: %.c
	gcc $< -o $@

ver_a.c: quine
	./quine > ver_a.c

ver_b.c: ver_a
	./$< > $@

ver_c.c: ver_b
	./$< > $@

full_run: ver_c
	echo -e '\nQuine successfully compiled, ran, compiled its output, ran that, etc.\n'

demonstrate: full_run
	diff quine.c ver_a.c && diff quine.c ver_b.c && diff quine.c ver_c.c && echo '\nAll output files are the same.\n'

.PHONY: clean full_run demonstrate

clean:
	rm -f ver_a.c ver_b.c ver_c.c ver_a ver_b ver_c quine.c quine
