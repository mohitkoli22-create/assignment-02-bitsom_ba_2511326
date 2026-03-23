// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
{   
  "product_id": "HEADPHONES",
  "name": "Sony WH-1000XM4 Noise Cancelling Headphones",
  "category": "Electronics",
  "price": 25000,
  "specs": {
    "voltage": "5V",
    "battery_life": "30 hours",
    "warranty_months": 24
  },
  "tags": [
    "audio",
    "wireless",
    "bluetooth"
  ]
},
{
  "product_id": "TSHIRT",
  "name": "Men's Cotton Polo T-Shirt",
  "category": "Clothing",
  "price": 899,
  "variants": [
    {
      "size": "M",
      "color": "Navy Blue",
      "stock": 45
    },
    {
      "size": "L",
      "color": "Navy Blue",
      "stock": 12
    },
    {
      "size": "L",
      "color": "Black",
      "stock": 5
    }
  ],
  "material": "100% Cotton",
  "care_instructions": "Machine wash cold"
},
{
   "product_id": "MILK",
  "name": "Organic Almond Milk 1L",
  "category": "Groceries",
  "price": 350,
  "expiry_date": "2024-11-15T00:00:00Z",
  "nutritional_info": {
    "calories_per_100ml": 15,
    "sugar_g": 0,
    "protein_g": 0.5
  },
  "is_vegan": true
}
 ]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: "2025-01-01T00:00:00Z" }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { product_id: "PROD_CLOTH_002" },
  { $set: { discount_percent: 15 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });

why:
Creating an index on the "category" field improves query performance,
especially for operations like OP2 and OP3 where we frequently filter
documents by category. As it reduces the document need to search, hence make it faster.