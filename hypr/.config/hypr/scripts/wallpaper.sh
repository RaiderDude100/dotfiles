# Wallpaper Script

# Get the current wallpaper
wallpaper="$1"

# Get current mode (light or dark)
mode=$(cat $HOME/.config/hypr/vars/mode)

# Output the current wallpaper name to a file
echo "$wallpaper" > $HOME/.config/hypr/vars/wallpaper

# Use matugen to generate material colors and wallust to generate terminal colors
if [ "$mode" == "Dark" ] ; then
    matugen -m dark -t scheme-content --continue-on-error --source-color-index 0 image $wallpaper
    #wallust -s -C $HOME/.config/wallust/wallust-dark.toml run $wallpaper
elif [ "$mode" == "Light" ] ; then
    matugen -m light -t scheme-content --continue-on-error --source-color-index 0 image $wallpaper
    #wallust -s -C $HOME/.config/wallust/wallust-light.toml run $wallpaper
fi

# Reload Config
~/.config/hypr/scripts/reload.sh

# Use imagemagick to generate different versions of the current wallpaper
width=$(hyprctl monitors -j | jq 'map(select(.focused)) | .[0].width')
scaled_width=$(echo "$width * 0.5" | bc)
height=$(hyprctl monitors -j | jq 'map(select(.focused)) | .[0].height')
scaled_height=$(echo "$height * 1" | bc)
magick $wallpaper -resize 512x512^ -gravity center -extent 512x512 ~/.cache/profile_squared.jpg
magick $wallpaper -gravity center -extent $scaled_widthx$scaled_height^ ~/.cache/profile_rectangle.jpg
magick $wallpaper ~/.cache/wallpaper.jpg
