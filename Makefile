build:
	rm *.html >&/dev/null || true
	rm *.log >&/dev/null || true
	docker run -t \
		-v "$$(pwd):/work" \
		-v /etc/localtime:/etc/localtime \
		-u $$(id -u):$$(id -g) \
		ghcr.io/thumbsup/thumbsup \
		thumbsup \
		--sort-albums-by title \
		--sort-albums-direction desc \
		--theme cards \
		--cleanup true \
		--input /work/albums --output /work/
	@cat *.log
