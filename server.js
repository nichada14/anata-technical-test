const express = require("express");
const bodyParser = require("body-parser");

const app = express();
app.use(bodyParser.json());

app.post("/api/sales", (req, res) => {
    const { orderId, timestamp, deviceId, salesPerson, posPerson, products, total, discount } = req.body;

    if (!orderId || !timestamp || !deviceId || !salesPerson || !products || total === undefined) {
        return res.status(400).json({ error: "Missing required fields" });
    }

    // Validate products
    if (!Array.isArray(products) || products.length === 0) {
        return res.status(400).json({ error: "Products must be a non-empty array" });
    }

    // Save to database (mocked for now)
    console.log("Order received:", req.body);

    res.status(201).json({ message: "Order saved successfully" });
});

app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});
