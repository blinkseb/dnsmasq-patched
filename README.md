# dnsmasq

A custom build of dnsmasq ignoring HTTPS (type 65) RR

## Build

You need Docker to build the deb packages:

```
bash patch_and_build.sh
```

after a while, the patched debs will be available inside the `deb` folder