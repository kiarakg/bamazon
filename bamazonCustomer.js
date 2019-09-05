// Import mysql and inquirer packages
var mysql = require("mysql");
var inquirer = require("inquirer");

// Connect to bamazonDB database
var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "",
    database: "bamazonDB"
});

// Connect to mysql server and sql database
connection.connect(function(err) {
    if(err) throw err;
    console.log("connected as id " + connection.threadId);
    start();
});

// Create start function to start app
function start() {
    connection.query("SELECT * FROM bamazonDB.product", function(err, products) {
        if(err) throw err;
        console.log(products);
        

        // Create inquirer prompt
        // Ask user which product they would like to buy
        // Ask user how many units they would like to buy
        // Confirm order
        inquirer
            .prompt([
                {
                    type: "input",
                    message: "Which product would you like to buy? Please enter ID number",
                    name: "choice",
                    validate: function(value) {
                        if(!isNaN(value)) {
                            return true;
                        };
                        return false;
                    }
                },
                {
                    type: "input",
                    message: "How many would you like to buy?",
                    name: "amount",
                    validate : function(value) {
                        if(!isNaN(value)) {
                            return true;
                        }
                        return false;
                    }
                },
                {
                    type: "confirm",
                    message: "Would you like to place the order?",
                    name: "confirm",
                    default: true
                }
            ]).then(function(res) {
                // If user doesn't confirm, start over
                if(!res.confirm) {
                    start();
                };

                // Use array .find() method to find product user wants to purchase
                var chosenProduct = products.find(product => product.item_id === parseInt(res.choice))

                // If amount desired < stored_quantity, run an UPDATE query to update the stock_quantity value for that product
                if (chosenProduct.stock_quantity >= parseInt(res.amount)) {
                    var queryString = "UPDATE bamazonDB.product SET ? WHERE";
                    connection.query(queryString,
                        [
                            {
                                stock_quantity: (chosenProduct.stock_quantity - parseInt(res.amount))
                            },
                            {
                                product_name: chosenProduct.product_name
                            }
                        ],
                        function(err) {
                            if(err) throw err;
                            var total = chosenProduct * res.amount;
                            console.log("Your total is: $${total}")
                        }
                    );
                }
                else {
                    console.log("Insufficient Quantity!");
                    start();
                };
            });
    });
};