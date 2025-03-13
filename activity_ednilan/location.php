<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/location.css">
    <title>Location</title>
</head>
<body>
    
<nav>
    <div class="navigation-container">
        <img src="images/logo.png" alt="LOGO" class="logo-nav"> 
        
        <div class="nav-wrapper">
            <ul class="nav-links">
                <li><a href="homepage.php">Home</a></li>
                <li><a href="about.php">About us</a></li>
                <li><a href="products.php">Menu</a></li>
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

            <section class="location-section">
                <div class="location-title">
                    <h1>Store Location</h1>
        </section>


            <section class="contact-numbers">
                <div class="informations">
                    
                    <h1>How To Contact Us?</h1>
                    <p> <i class="fa-solid fa-phone">  +1 907-512-6836</i></p>
                    <p><i class="fa-solid fa-envelope"></i>crystal@bearfootbakery.com</p>
                    <p><i class="fa-solid fa-location-crosshairs"></i>111 W Rezanof Dr Suite 1 Kodiak, AK, United States, Alaska 99615</p>
                
                        <!--GOOGLE MAPS NI-->

                    <div class="button-google">
                        <button type="button" class="google"><a href="https://www.google.com/maps/dir/7.088762,125.576728/57.813849,-152.343818/@57.8088111,-152.3452866,7657m/data=!3m1!1e3!4m4!4m3!1m1!4e1!1m0?entry=ttu&g_ep=EgoyMDI1MDIxOS4xIKXMDSoASAFQAw%3D%3D">Open Google Maps</a> </button>


                    </div>
                </div>
                

                <section class="maps">
                    <div class="map-container">
                        <img src="images/location.png" alt="google-map" class="google-map">
                    </div>
                  
                </section>

            
            </section>

            <section class="opening-container">
                <img src="images/logo.png" alt="Bakery Logo" class="logo">

                <!---Contact us na section-->
                    <div class="contact">
                        <h1>Contact Us</h1>
                        <p><i class="fa-solid fa-phone"></i>+1 907-512-6836</p>
                        <p><i class="fa-solid fa-envelope"></i>crystal@bearfootbakery.com</p>

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

            
            </footer>
            


</body>
</html>