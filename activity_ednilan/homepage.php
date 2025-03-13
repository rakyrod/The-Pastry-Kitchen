<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Bebas+Neue&family=Bitter:ital,wght@0,100..900;1,100..900&family=EB+Garamond:ital,wght@0,400..800;1,400..800&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Lilita+One&family=Liter&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Oswald:wght@500&family=Outfit:wght@100..900&family=Roboto+Slab:wght@300&family=Signika+Negative:wght@300..700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/homepage.css">
    <title>The Pastry Kitchen</title>
    <style>
        .notification {
            position: fixed;
            top: 90px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1001;
            padding: 15px 25px;
            border-radius: 8px;
            font-size: 16px;
            animation: slideDown 0.5s ease-out;
            width: auto;
            min-width: 300px;
            text-align: center;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        @keyframes slideDown {
            from { transform: translate(-50%, -100%); }
            to { transform: translate(-50%, 0); }
        }
    </style>
</head>
<body>

    <?php if(isset($_SESSION['message'])): ?>
        <div class="notification success" id="notification">
            <?= htmlspecialchars($_SESSION['message']) ?>
            <?php unset($_SESSION['message']); ?>
        </div>
    <?php endif; ?>

    <?php if(isset($_SESSION['error'])): ?>
        <div class="notification error">
            <?= htmlspecialchars($_SESSION['error']) ?>
            <?php unset($_SESSION['error']); ?>
        </div>
    <?php endif; ?>

    <script>
        // Auto-hide notification after 5 seconds
        document.addEventListener('DOMContentLoaded', function() {
            const notification = document.getElementById('notification');
            if (notification) {
                setTimeout(() => {
                    notification.style.opacity = '0';
                    notification.style.transition = 'opacity 0.5s ease-out';
                    setTimeout(() => notification.remove(), 500);
                }, 5000);
            }
        });
    </script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/about.css">
    <title>About us</title>
</head>
<body>

   
<nav>
    <div class="navigation-container">
        <img src="images/logo.png" alt="LOGO" class="logo-nav"> 
        
        <div class="nav-wrapper">
            <ul class="nav-links">
                <li><a href="homepage.php">Home</a></li>
                <li><a href="about.php">About us</a></li>
                <li><a href="menu.php">Menu</a></li>
                <li><a href="location.php">Store Location</a></li>
                <li><a href="account.php">Account</a></li>
            </ul>
        </div>
    </div>

</nav>
<style>
.navigation-container {
    display: flex;
    align-items: center;
    justify-content: space-between; 
    
    background-color: #1b3c3d;
}

.logo-nav {
    height: 120px;
}

.nav-wrapper {
    flex: 1;
    display: flex;
    justify-content: center;
}

.nav-links {
    display: flex;
    gap: 25px;
    list-style: none;
    padding: 0;
    margin: 0;
}

.nav-links li {
    list-style: none;
    font-size: 18px;
    font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
    font-weight: 400;
    transition: color 0.3s ease;
}

.nav-links a {
    text-decoration: none;
    color: rgb(190, 196, 106);
    font-size: 18px;
    transition: color 0.3s ease;
}

.nav-links a:hover {
    color: #fff;
}

            
        </style>
           </div>
        <!---HERO CONTAINER-->
    
        <div>
            <section class="hero-section">
                <div class="bread-container">
                    <img src="images/hero.png" alt="HERO" class="hero">

                </div>
            </section>
        </div>

            <div>
                <section class="paragraph-section">
                    <div class="paragraph-container">
                        <h1>Treat Yourself to <br>Pure <i>Organic </i>Delights</h1>
                        <p>Open Monday to Saturday from 6:00 am/ 5:00pm</p>
                        <a href="products.php">ORDER NOW</a>

                    </div>
                </section>
            </div>
                <!--INTRO-2-->
                <div>
                    <section class="image-section-2">
                        <div class="image-container-2">
                            <img src="images/p2.webp" alt="BREAD" class="bread">
                        </div>

                        <section class="section-pic2">
                                <div class="container-para">
                                    <h1>All Organic & Fresh Ingredience</h1>
                                    <p>At Pasta & Pastry Kitchen, every dish is a labor of love, crafted with the finest ingredients and a touch of home. Our freshly made pasta and artisanal pastries are designed to bring comfort and joy to every bite. Whether you’re indulging in a buttery croissant or savoring a rich, homemade pasta dish, each creation tells a story of passion and quality.  </p>

                                  

                                    </div>


                                    </div>
                                    

                                </div>
                        </section>
                    </section>
                </div>

                    <!---BEST SELLERS PRODUCTS-->

                    <div>
                        <section class="best-sellers">
                            <h1>Our Most Popular Pastries! </h1>
                            <p>Delicious pastries made just for you, tell us which one is your favorite!

                            </p>

                        </section>
                        <section class="products-section">
                            <div class="products-container">
                                <img src="images/donut.jpg" alt="donut" class="donut">
                                <img src="images/cinamon.jpg" alt="cinnamon" class="cinnamon">
                                <img src="images/lemon.jpg" alt="lemon" class="lemon">
                            </section>
                            </div>

                            <section class="name-section">
                                <div class="name-container">
                                    <!-- ang donuts -->
                                    <div class="product">
                                        <p class="product-name">Chocolate & Glazed Donuts</p>
                                       
                                        <button class="add-to-cart" onclick="window.location.href='products.php'">View in Products</button>
                                    </div>
                            
                                    <!-- ang cinnamon -->
                                    <div class="product">
                                        <p class="product-name">Cinnamon Rolls</p>
                                       
                                        <button class="add-to-cart" onclick="window.location.href='products.php'">View in Products</button>
                                    </div>
                            
                                    <!-- ang lemon -->
                                    <div class="product">
                                        <p class="product-name">Lemon Cupcakes</p>
                                       
                                        <button class="add-to-cart" onclick="window.location.href='products.php'">View in Products</button>
                                    </div>
                                </div>
                            </section>
                        </section>
                    </div>

                    <!--Second products-->

                    <section class="soup-section-images">
                        <div class="soup-container-images">
                            <img src="images/pumpkin.jpg" alt="pumpkin" class="pumpkin">
                            <img src="images/soup1.jpg" alt="alfredo" class="alfredo">
                            <img src="images/soup2.jpg" alt="soup3" class="soup-3">
                        </div>
                    </section>
                    <div>
                        
                            <!---Soup add to cart-->

                            <section class="soup-container">
                                <div class="soup-products">
                                    <p class="name-product">Pumpkin Bread</p>
                                  
                                    <button class="add-to-cart" onclick="window.location.href='products.php'">View in Products</button>
                                </div>
                            
                                <div class="soup-products">
                                    <p class="name-product">Vegetable & Bean Soup with a Baguette</p>
                                    
                                    <button class="add-to-cart" onclick="window.location.href='products.php'">View in Products</button>
                                </div>
                            
                                <div class="soup-products">
                                    <p class="name-product">Macaroni Soup with a Soft Dinner Roll</p>
                                  
                                    <button class="add-to-cart" onclick="window.location.href='products.php'">View in Products</button>
                                </div>
                            </section>
                            <section class="opening-container">
                                <img src="images/logo.png" alt="Bakery Logo" class="logo">

                                <!---Contact us na section-->
                                    <div class="contact">
                                        <h1>Contact Us</h1>
                                        <p><i class="fa-solid fa-phone"></i>09693628992</p>
                                        <p><i class="fa-solid fa-envelope"></i>thepastrykitchen@gmail.com</p>

                                    </div>
                                <div class="opening-times">
                                    <h2>Opening Times</h2>
                                    <div><span class="day">MON</span> <span class="time">11:00am - 11:00pm</span></div>
                                    <div><span class="day">TUE</span> <span class="time">11:00am - 11:00pm</span></div>
                                    <div><span class="day">WED</span> <span class="time">11:00am - 11:00pm</span></div>
                                    <div><span class="day">THU</span> <span class="time">11:00am - 11:00pm</span></div>
                                    <div><span class="day">FRI</span> <span class="time">11:00am - 11:00pm</span></div>
                                    <div><span class="day">SAT</span> <span class="time">10:00am - 11:00pm</span></div>
                                    <div><span class="day">SUN</span> <span class="time">11:00am - 8:00pm</span></div>
                                </div>
                            </section>
                            
                                </div>

                            <section class="refund-section">
                                <div class="refund-container">
                                    <h2>Not Satisfied?</h2>
                                    <p>We value your satisfaction above all else. If you're not completely happy with your order, 
                                       our hassle-free refund process is here to help.</p>
                                    <?php if(isset($_SESSION['user_id'])): ?>
                                        <button class="refund-btn" onclick="window.location.href='refund.php'">
                                            Request Your Refund
                                        </button>
                                    <?php else: ?>
                                        <p>Please <a href="login.php">Sign In</a> to request a refund for your order.</p>
                                    <?php endif; ?>
                                </div>
                            </section>
                            
                            </footer>
                            
</body>
</html>