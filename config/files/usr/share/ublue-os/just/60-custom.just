import "/usr/share/ublue-os/just/100-bling.just"

# Include some of your custom scripts here!
boxkit:
  echo 'Creating lucasvsr/boxkit...'
  distrobox-create --nvidia --image ghcr.io/lucasvsr/boxkit -n boxkit -Y