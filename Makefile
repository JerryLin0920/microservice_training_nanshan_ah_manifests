app :=

.PHONY: build
build:	##	# 產出部署檔
	kustomize build .

.PHONY: up
up:	##	# 部署所有應用
	kustomize build . | kubectl apply -f -

.PHONY: rm
rm:	##	# 移除指定應用, 必須指定 app
ifeq ($(strip $(app)),)
	$(error 'app' is required)
endif
	kubectl delete all,ingress,secret,configmap,pvc,pv -l app=$(app) -n training

.PHONY: down
down:	##	# 移除所有應用
	kubectl delete all,ingress,secret,configmap,pvc,pv -l env=training -n training

.PHONY: restart
restart: down up ##	# 重啟所有應用

.PHONY: log
log:	##	# 輸出指定應用的 STDOUT, 必須指定 app
ifeq ($(strip $(app)),)
	$(error 'app' is required)
endif
	kubectl logs -f -l app=$(app)
