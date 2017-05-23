IMAGE = scrapy-workshop
RUN = docker run --rm -it --net=host -v `pwd`:/app/ $(IMAGE)

guard-%:
	@ if [ "${${*}}" = "" ]; then \
                echo "Variable '$*' not set"; \
                exit 1; \
        fi

image:
	docker build -t $(IMAGE) .

shell: image
	$(RUN) sh

run: image
	$(RUN) scrapy crawl mpf

test: image
	$(RUN) python compare.py

