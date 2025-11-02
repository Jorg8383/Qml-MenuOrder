function calcTotal(menuList) {
    let total = 0;

    // iterate each menu of the menu-list
    for (let j = 0; j < menuList.length; ++j)
    {
        const menu = menuList[j];

        // iterate each child (dish) of the menu
        // note that menu.items behaves like an array of child objects (DishItem), so it's not merley a number
        for (let i = 0; i < menu.items.length; ++i)
        {
            const dish = menu.items[i];

            // guard against non-visual or unexpected children
            if ("price" in dish && "quantity" in dish)
            {
                total += dish.price * dish.quantity
            }
        }
    }

    return total
}
