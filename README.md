# Microservice Training for Nanshan - Kubernetes Manifests

> 南山產險微服務架構教育訓練 Kubernetes 部署檔

首先要先從 [ICP Console](https://icp.softleader.com.tw:8443/console) 取得 token 登入 `kubectl`, 並且建立自己的 namespace:

```sh
kubectl create ns MY_NAMESPACE
```

接著切換到剛建立的 *MY_NAMESPACE* 下：

```sh
kubens MY_NAMESPACE
```

修改 `kustomization.yaml` 將第一行的 namespace 的值改成剛建立的 *MY_NAMESPACE*, 開始部署環境:

```sh
# 產出部署檔
make build

# 部署所有應用
make up

# 移除指定應用, 必須指定 app
make rm app=...

# 移除所有應用
make down

# 重啟所有應用
make restart

# 輸出指定應用的 STDOUT, 必須指定 app
make log app=..
```
