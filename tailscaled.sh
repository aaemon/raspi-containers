docker run -d \
  --name=tailscaled \
  -v /var/lib:/var/lib \
  -v /dev/net/tun:/dev/net/tun \
  --network=host --privileged \
  --restart unless-stopped \
  tailscale/tailscale tailscaled

## you will have to enter following command after you run this script:

docker exec tailscaled tailscale u