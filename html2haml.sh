for i in ./public/template/*.html; do
	html2haml $i > $i.haml --trace;
done