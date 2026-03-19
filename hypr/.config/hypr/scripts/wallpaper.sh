# Wallpaper Script

# Get the current wallpaper
wallpaper="$1"

# Output the current wallpaper name to a file
echo "$wallpaper" > $HOME/.config/hypr/vars/wallpaper

# Use matugen to generate material colors
matugen -m dark -t scheme-content --continue-on-error --source-color-index 0 image $wallpaper

# Use wallust to generate terminal colors
wallust run $wallpaper

# Use imagemagick to generate different versions of the current wallpaper
width=$(hyprctl monitors -j | jq 'map(select(.focused)) | .[0].width')
scaled_width=$(echo "$width * 0.5" | bc)
height=$(hyprctl monitors -j | jq 'map(select(.focused)) | .[0].height')
scaled_height=$(echo "$height * 0.5" | bc)
magick $wallpaper -resize 512x512^ -gravity center -extent 512x512 ~/.cache/profile_squared.jpg
magick $wallpaper -gravity center -extent $scaled_widthx$scaled_height^ ~/.cache/profile_rectangle.jpg
magick $wallpaper ~/.cache/wallpaper.jpg

# Send notification when wallpaper is applied
notify-send -e "Waypaper" "Wallpaper changed to $wallpaper" -a Waypaper
