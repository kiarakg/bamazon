# Bamazon

## Description
An Amazon-like storefront which utilizes MySQL and node.js. The app takes in orders from customers and deplete stock from the stores inventory.

## Customer View
* The app first displays all items available for sale in the Bamazon inventory This includes the Item ID, Product Name, Department Name, Price, and Stock Quantity.
![] ()

* The app will then prompt the user with two messages:
  * The first will ask which product you would like to purchase.
  * The second will ask how many units you would like to buy.

* Once the customer has placed the order, the application will check if the store has sufficient product items to meet the customer's request.
  * If not, the app will log the phrase *Not a valid selection!*, and prevent the order from going through.
