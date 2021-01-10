.EXPORT_ALL_VARIABLES:

SHELL=/bin/bash -o pipefail

image_name=jkutner/web-tty

package:
	@pack package-buildpack -c package.toml $(image_name):latest

publish:
	@docker push $(image_name):latest
