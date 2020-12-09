layout="$(yabai -m query --spaces --display | jq 'map(select(."focused" == 1))[-1].type')" && \
layout=$([[ "$layout" == '"bsp"' ]] && echo stack || echo bsp ) &&  yabai -m space --layout $layout
