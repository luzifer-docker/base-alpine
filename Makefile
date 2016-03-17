ALPINE_VERSION=$(shell grep "FROM alpine" Dockerfile | cut -d ':' -f 2)
S6_VERSION=$(shell grep "ENV S6VERSION" Dockerfile | cut -d ' ' -f 3)

release:
		git commit -a -m "Releasing version $(ALPINE_VERSION)-$(S6_VERSION)"
		git tag $(ALPINE_VERSION)-$(S6_VERSION)
		
