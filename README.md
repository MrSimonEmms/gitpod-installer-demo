# Gitpod Installer Demo

Demo for installing [Gitpod](https://www.gitpod.io). Check out the [Installer](https://github.com/gitpod-io/gitpod/tree/main/installer) documentation for more information.

# Installation Steps

1. Download the required version of the Installer

```shell
./get_installer.sh main.2048
```

This will download the version `main.2048` - to find the version you want, please check [werft](https://werft.gitpod-dev.com)

2. Create the base config file

```shell
./installer init > config.yaml
```

3. Amend your config file

As a minimum, set your `domain` to the domain you're using

4. Validate the config

```shell
./installer validate config --config config.yaml
```

5. Validate the cluster

```shell
./installer validate cluster --config config.yaml --kubeconfig ~/.kube/config
```

6. Render the YAML

```shell
./installer render --config config.yaml > k8s.yaml
```

7. Install it

```shell
kubectl apply -f k8s.yaml
```

8. Go to your domain

This will take a few minutes whilst the DNS updates

# Updating Steps

> You don't need to make any updates to the `config.yaml`, however you can if you wish. This will **NOT** remove any Kubernetes objects that are not longer required

1. Get a new version of the installer

```shell
./get_installer.sh main.2049
```

2. Validate the config

```shell
./installer validate config --config config.yaml
```

3. Validate the cluster

```shell
./installer validate cluster --config config.yaml --kubeconfig ~/.kube/config
```

4. Render the YAML

```shell
./installer render --config config.yaml > k8s.yaml
```

5. Install it

```shell
kubectl apply -f k8s.yaml
```

# Uninstallation

```shell
kubectl get configmaps gitpod-app -o jsonpath='{.data.app\.yaml}' | kubectl delete -f -
```

There may be persistent volume claims remaining, depending upon your configuration