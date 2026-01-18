# Wallpaper Script

# Get the current wallpaper
wallpaper="$1"

# Use matugen to generate material colors
matugen image $wallpaper

# Use wallust to generate terminal colors
wallust run $wallpaper

# Use imagemagick to generate different versions of the current wallpaper
width=$(hyprctl monitors -j | jq 'map(select(.focused)) | .[0].width')
scaled_width=$(echo "$width * 0.5" | bc)
height=$(hyprctl monitors -j | jq 'map(select(.focused)) | .[0].width')
scaled_height=$(echo "$width * 1" | bc)
magick $wallpaper -resize 512x512^ -gravity center -extent 512x512 ~/.cache/profile_squared.jpg
magick $wallpaper -gravity center -extent $scaled_widthx$scaled_height^ ~/.cache/profile_rectangle.jpg
magick $wallpaper ~/.cache/wallpaper.jpg

# Send notification when wallpaper is applied
notify-send -e "Waypaper" "Wallpaper changed to $wallpaper" -a Waypaper
