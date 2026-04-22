```
sudo apt update
sudo apt install qemu-system
```

Alpine Linux

```
wget https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/x86_64/alpine-virt-3.21.0-x86_64.iso -O alpine.iso

qemu-img create -f qcow2 alpine_vm.qcow2 10G

qemu-system-x86_64 \
  -m 2048 \
  -smp 2 \
  -machine accel=tcg \
  -hda alpine_vm.qcow2 \
  -cdrom alpine.iso \
  -boot d \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -device virtio-net-pci,netdev=net0 \
  -nographic \
  -serial mon:stdio

setup-alpine

reboot


qemu-system-x86_64 \
  -m 2048 \
  -smp 2 \
  -machine accel=tcg \
  -hda alpine_vm.qcow2 \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -device virtio-net-pci,netdev=net0 \
  -nographic \
  -serial mon:stdio

ssh root@localhost -p 2222

```

```
apk update
apk add vim
apk add g++
```
