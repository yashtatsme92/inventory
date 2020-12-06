jQuery(function () {
    // Inventory Row Object
    const inventoryRow = $(".inventory-row");
    // Inventory Row Copy
    const inventoryRowCopy =
        '<div class="inventory-row border-bottom pt-2 row">' +
        inventoryRow.html() +
        "</div>";

    /**
     * Add Row Button Click Handler
     */

    $("#add-row").on("click", () => {
        inventoryRow.last().after(inventoryRowCopy);
    });

    /**
     * Remove Row Button Click Handler
     */

    $("body").on("click", ".remove-row", (e) => {
        if ($(".inventory-row").length > 1) {
            $(e.target).parents(".inventory-row").remove();
        } else {
            alert("Atleast one row required");
        }
    });
});
