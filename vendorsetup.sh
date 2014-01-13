for combo in $(curl -s https://raw.github.com/TeamBAKED/products/kk-4.4/products | sed -e 's/#.*$//' | grep kk-4.4 | awk {'print $1'})
do
    add_lunch_combo $combo
done
