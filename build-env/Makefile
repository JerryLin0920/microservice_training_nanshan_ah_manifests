IMAGE := softleader/kubernetes-manifests-build-env

.PHONY: build
build:
	docker build -t $(IMAGE) .	

.PHONY: push
push:
	docker push $(IMAGE)