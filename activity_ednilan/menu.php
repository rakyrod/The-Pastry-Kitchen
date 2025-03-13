<?php
session_start();
ob_start(); // Start output buffering
require_once 'db_connect.php';
include 'includes/sidebar.php';

// Fetch categories for the form
$categories_query = "SELECT * FROM productscategory ORDER BY CategoryName";
$categories_result = $conn->query($categories_query);
$categories = [];
while ($cat = $categories_result->fetch_assoc()) {
    $categories[] = $cat;
}

// Process form submissions first, before any output
if (isset($_POST['add_product'])) {
    try {
        $conn->begin_transaction();

        // Validate and sanitize inputs
        $product_name = filter_input(INPUT_POST, 'product_name', FILTER_SANITIZE_STRING);
        $price = filter_input(INPUT_POST, 'price', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
        $category_id = filter_input(INPUT_POST, 'category_id', FILTER_SANITIZE_NUMBER_INT);

        if (empty($product_name) || empty($price) || empty($category_id)) {
            throw new Exception("All fields are required.");
        }

        // Insert product
        $product_stmt = $conn->prepare("
            INSERT INTO products (
                ProductName, 
                Price, 
                StockQuantity,
                Status,
                CategoryID,
                EmployeeID
            ) VALUES (?, ?, 0, 'Available', ?, ?)
        ");
        $employee_id = $_SESSION['user_id'] ?? 1;
        $product_stmt->bind_param("sdii", 
            $product_name, 
            $price,
            $category_id,
            $employee_id
        );
        $product_stmt->execute();
        $product_id = $conn->insert_id;

        $conn->commit();
        $_SESSION['success'] = "Product added successfully!";
        header("Location: menu.php");
        exit();

    } catch (Exception $e) {
        $conn->rollback();
        $_SESSION['error'] = "Error: " . $e->getMessage();
    }
}

// Handle edit product form submission
if (isset($_POST['edit_product'])) {
    try {
        $conn->begin_transaction();

        // Validate and sanitize inputs
        $product_id = filter_input(INPUT_POST, 'product_id', FILTER_SANITIZE_NUMBER_INT);
        $product_name = filter_input(INPUT_POST, 'product_name', FILTER_SANITIZE_STRING);
        $price = filter_input(INPUT_POST, 'price', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
        $category_id = filter_input(INPUT_POST, 'category_id', FILTER_SANITIZE_NUMBER_INT);

        if (empty($product_name) || empty($price) || empty($category_id)) {
            throw new Exception("All fields are required.");
        }

        // Update product details
        $product_stmt = $conn->prepare("
            UPDATE products 
            SET 
                ProductName = ?, 
                Price = ?, 
                CategoryID = ?
            WHERE ProductID = ?
        ");
        $product_stmt->bind_param("sdii", 
            $product_name, 
            $price,
            $category_id,
            $product_id
        );
        $product_stmt->execute();

        $conn->commit();
        $_SESSION['success'] = "Product updated successfully!";
        header("Location: menu.php");
        exit();

    } catch (Exception $e) {
        $conn->rollback();
        $_SESSION['error'] = "Error: " . $e->getMessage();
    }
}

// Rest of your existing queries
$query = "
    SELECT 
        p.ProductID,
        p.ProductName,
        p.Price,
        p.StockQuantity,
        p.Status,
        p.CategoryID
    FROM products p
    GROUP BY p.ProductID
    ORDER BY p.ProductName
";
$products = $conn->query($query);

// Fetch categories for the form
$categories_query = "SELECT * FROM productscategory ORDER BY CategoryName";
$categories = $conn->query($categories_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Management - Cookie Corner</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/menu.css" rel="stylesheet">
</head>
<body>
    <div class="menu-container">
        <!-- Display session messages -->
        <?php if (isset($_SESSION['success'])): ?>
            <div class="alert alert-success"><?php echo $_SESSION['success']; unset($_SESSION['success']); ?></div>
        <?php endif; ?>
        <?php if (isset($_SESSION['error'])): ?>
            <div class="alert alert-danger"><?php echo $_SESSION['error']; unset($_SESSION['error']); ?></div>
        <?php endif; ?>

        <!-- Enhanced Header Section -->
<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h2 class="category-title">Menu Management</h2>
        <p class="text-muted">Manage your products and ingredients</p>
    </div>
    <div>
        <button class="btn btn-primary action-buttons me-2" data-bs-toggle="modal" data-bs-target="#addProductModal">
            <i class="fas fa-plus me-2"></i> Add New Product
        </button>
        <button class="btn btn-danger action-buttons" onclick="confirmDeleteSelectedProducts()">
            <i class="fas fa-trash me-2"></i> Remove Selected Products
        </button>
    </div>
</div>

        <!-- Enhanced Filters Section -->
        <div class="filters">
            <div class="row g-3">
                <div class="col-md-4">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" class="form-control" id="searchProduct" placeholder="Search products...">
                    </div>
                </div>
                <div class="col-md-3">
                    <select class="form-select" id="categoryFilter">
                        <option value="">All Categories</option>
                        <?php while($cat = $categories->fetch_assoc()): ?>
                            <option value="<?php echo $cat['CategoryID']; ?>">
                                <?php echo htmlspecialchars($cat['CategoryName']); ?>
                            </option>
                        <?php endwhile; ?>
                    </select>
                </div>
                <div class="col-md-3">
                    <select class="form-select" id="stockFilter">
                        <option value="">All Stock Status</option>
                        <option value="Available">In Stock</option>
                        <option value="Out of Stock">Out of Stock</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Products Grid with Enhanced Cards -->
<div class="row g-4" id="productsGrid">
    <?php while($product = $products->fetch_assoc()): ?>
        <div class="col-md-4 col-lg-3 product-item" data-category="<?php echo $product['CategoryID']; ?>" data-stock="<?php echo $product['Status']; ?>">
            <div class="product-card">
                <div class="product-header d-flex justify-content-between align-items-start">
                    <h5 class="card-title mb-0"><?php echo htmlspecialchars($product['ProductName']); ?></h5>
                    <span class="stock-badge status-<?php echo str_replace(' ', '', $product['Status']); ?>">
                        <?php echo $product['Status']; ?>
                    </span>
                </div>
                <br>
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <span class="price-tag">€<?php echo number_format($product['Price'], 2); ?></span>
                    </div>

                    <div class="stock-info d-flex justify-content-between align-items-center">
                        <span class="text-muted">
                            <i class="fas fa-box me-1"></i> 
                            Stock: <?php echo $product['StockQuantity']; ?>
                        </span>
                        <div class="action-buttons">
                            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editProductModal" onclick="loadProductData(<?php echo $product['ProductID']; ?>)">
                                <i class="fas fa-edit"></i>
                            </button>
                        </div>
                    </div>
                    <!-- Add a checkbox for selecting the product -->
                    <div class="form-check mt-2">
                        <input class="form-check-input product-checkbox" type="checkbox" value="<?php echo $product['ProductID']; ?>" id="product-<?php echo $product['ProductID']; ?>">
                        <label class="form-check-label" for="product-<?php echo $product['ProductID']; ?>">
                            Select for deletion
                        </label>
                    </div>
                </div>
            </div>
        </div>
    <?php endwhile; ?>
</div>

    <!-- Add Product Modal -->
    <div class="modal fade" id="addProductModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form method="POST" id="addProductForm">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label>Product Name</label>
                                <input type="text" name="product_name" class="form-control" required>
                            </div>
                            <div class="col-md-3">
                                <label>Price</label>
                                <input type="number" step="0.01" name="price" class="form-control" required>
                            </div>
                            <div class="col-md-3">
                            <label>Category</label>
                            <select name="category_id" class="form-control" required>
                                <option value="">Select Category</option>
                                <?php foreach ($categories as $cat): ?>
                                    <option value="<?php echo $cat['CategoryID']; ?>">
                                        <?php echo htmlspecialchars($cat['CategoryName']); ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                            </div>
                        </div>

                        <button type="submit" name="add_product" class="btn btn-primary mt-3">
                            Add Product
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Product Modal -->
<div class="modal fade" id="editProductModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form method="POST" id="editProductForm">
                    <input type="hidden" name="product_id" id="editProductId">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label>Product Name</label>
                            <input type="text" name="product_name" id="editProductName" class="form-control" required>
                        </div>
                        <div class="col-md-3">
                            <label>Price</label>
                            <input type="number" step="0.01" name="price" id="editProductPrice" class="form-control" required>
                        </div>
                        <div class="col-md-3">
                            <label>Category</label>
                            <select name="category_id" id="editProductCategory" class="form-control" required>
                                <option value="">Select Category</option>
                                <?php foreach ($categories as $cat): ?>
                                    <option value="<?php echo $cat['CategoryID']; ?>">
                                        <?php echo htmlspecialchars($cat['CategoryName']); ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>

                    <button type="submit" name="edit_product" class="btn btn-primary mt-3">
                        Save Changes
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

    <script>
        // Search functionality
        document.getElementById('searchProduct').addEventListener('input', function(e) {
            const search = e.target.value.toLowerCase();
            const cards = document.querySelectorAll('.product-card');
            
            cards.forEach(card => {
                const title = card.querySelector('.card-title').textContent.toLowerCase();
                const price = card.querySelector('.price-tag').textContent.toLowerCase();
                const stock = card.querySelector('.stock-info').textContent.toLowerCase();
                const category = card.closest('.product-item').getAttribute('data-category');
                const status = card.closest('.product-item').getAttribute('data-stock');
                
                card.closest('.col-md-4').style.display = 
                    title.includes(search) || price.includes(search) || stock.includes(search) || category.includes(search) || status.includes(search) ? '' : 'none';
            });
        });

        // Combined filter functionality
        function applyFilters() {
            const selectedCategory = document.getElementById('categoryFilter').value;
            const selectedStatus = document.getElementById('stockFilter').value;
            const productItems = document.querySelectorAll('.product-item');
            
            productItems.forEach(item => {
                const category = item.getAttribute('data-category');
                const status = item.getAttribute('data-stock');
                
                const categoryMatch = selectedCategory === '' || category === selectedCategory;
                const statusMatch = selectedStatus === '' || status === selectedStatus;
                
                item.style.display = categoryMatch && statusMatch ? '' : 'none';
            });
        }

        document.getElementById('categoryFilter').addEventListener('change', applyFilters);
        document.getElementById('stockFilter').addEventListener('change', applyFilters);

        // Load Product Data for Editing
        function loadProductData(productId) {
            fetch(`get_product.php?id=${productId}`)
                .then(response => response.json())
                .then(data => {
                    // Populate basic product details
                    document.getElementById('editProductId').value = data.ProductID;
                    document.getElementById('editProductName').value = data.ProductName;
                    document.getElementById('editProductPrice').value = data.Price;
                    document.getElementById('editProductCategory').value = data.CategoryID;
                })
                .catch(error => console.error('Error loading product data:', error));
        }

        // Highlight active navigation link
        document.addEventListener('DOMContentLoaded', function() {
            const currentPage = window.location.search.split('=')[1] || 'dashboard';
            
            document.querySelectorAll('.nav-link, .dropdown-item').forEach(link => {
                const href = link.getAttribute('href');
                if (href && href.includes(currentPage)) {
                    link.classList.add('active');
                    
                    // If it's a dropdown item, also activate parent
                    const dropdownParent = link.closest('.dropdown');
                    if (dropdownParent) {
                        dropdownParent.querySelector('.nav-link').classList.add('active');
                    }
                }
            });
        });

        // Function to confirm deletion of selected products
function confirmDeleteSelectedProducts() {
    const selectedProducts = Array.from(document.querySelectorAll('.product-checkbox:checked'))
        .map(checkbox => checkbox.value);

    if (selectedProducts.length === 0) {
        alert('Please select at least one product to delete.');
        return;
    }

    if (confirm('Are you sure you want to delete the selected products? This action cannot be undone.')) {
        deleteSelectedProducts(selectedProducts);
    }
}

// Function to delete selected products
function deleteSelectedProducts(productIds) {
    fetch('delete_products.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ productIds }),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Selected products deleted successfully!');
            window.location.reload(); // Reload the page to reflect changes
        } else {
            alert('Error deleting products: ' + data.error);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred while deleting products.');
    });
}
    </script>
</body>
</html>