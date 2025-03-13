-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2025 at 05:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bakery`
--

-- --------------------------------------------------------

--
-- Table structure for table `baking_batches`
--

CREATE TABLE `baking_batches` (
  `BatchID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `BatchSize` int(11) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(255) NOT NULL,
  `CustomerEmail` varchar(255) NOT NULL,
  `CustomerPassword` varchar(255) NOT NULL,
  `CustomerBirthday` date DEFAULT NULL,
  `RegistrationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `CustomerName`, `CustomerEmail`, `CustomerPassword`, `CustomerBirthday`, `RegistrationDate`) VALUES
(1, 'Liam Annik', 'liam@example.com', 'liam321', '1985-12-22', '2025-02-21 02:32:30'),
(2, 'Olivia Brown', 'olivia@example.com', 'brown456', '1993-08-15', '2025-02-21 02:32:30'),
(3, 'Noah Williams', 'noah@example.com', 'noahpass', '1997-07-01', '2025-02-21 02:32:30'),
(4, 'Ava Martinez', 'ava@example.com', 'ava1234', '1999-03-11', '2025-02-21 02:32:30'),
(5, 'Sophia Jones', 'sophia@example.com', 'sophia321', '1988-06-29', '2025-02-21 02:32:30'),
(6, 'James Taylor', 'james@example.com', 'james789', '1995-09-17', '2025-02-21 02:32:30'),
(7, 'Isabella Davis', 'isabella@example.com', 'isa567', '2000-11-30', '2025-02-21 02:32:30'),
(8, 'Lucas Wilson', 'lucas@example.com', 'lucaspass', '1991-04-20', '2025-02-21 02:32:30'),
(9, 'Mia Anderson', 'mia@example.com', 'mia999', '1994-02-25', '2025-02-21 02:32:30'),
(10, 'Ethan Parker', 'ethan@example.com', 'ethan456', '1990-05-17', '2025-02-21 02:32:30'),
(11, 'Emma Roberts', 'emma@example.com', 'emma789', '1988-09-03', '2025-02-21 02:32:30'),
(12, 'Jacob Thompson', 'jacob@example.com', 'jacob321', '1992-11-12', '2025-02-21 02:32:30'),
(13, 'Sophia Mitchell', 'sophia@example.com', 'sophia456', '1995-03-28', '2025-02-21 02:32:30'),
(14, 'Mason Garcia', 'mason@example.com', 'mason789', '1987-07-09', '2025-02-21 02:32:30'),
(15, 'Isabella Wright', 'isabella@example.com', 'isabella321', '1993-01-14', '2025-02-21 02:32:30'),
(16, 'Benjamin Lee', 'benjamin@example.com', 'benjamin456', '1989-06-25', '2025-02-21 02:32:30'),
(17, 'Amelia Clark', 'amelia@example.com', 'amelia789', '1991-04-08', '2025-02-21 02:32:30'),
(18, 'Alexander Young', 'alexander@example.com', 'alexander321', '1986-10-19', '2025-02-21 02:32:30'),
(20, 'harry potter', 'harry@example.com', 'harry123', '2025-03-13', '2025-02-28 16:10:54'),
(23, 'Zhanghao AA', 'zh@gmail.com', '12345678', '2000-01-01', '2025-03-03 04:33:59'),
(24, 'John Doe', 'john.doe@example.com', 'john123', '1990-05-15', '2025-03-03 18:25:03'),
(26, 'Alice Johnson', 'alice.johnson@example.com', 'alice789', '1995-03-10', '2025-03-03 18:25:03'),
(28, 'Charlie Davis', 'charlie.davis@example.com', 'charlie654', '1992-07-30', '2025-03-03 18:25:03'),
(30, 'feranz  salonga', 'fer@example.com', 'feranz123', '2025-03-05', '2025-03-05 13:37:08'),
(31, 'grab abab', 'grab@example.com', 'grab123456', '2025-03-05', '2025-03-05 13:48:50'),
(32, 'man woman', 'man@example.com', 'woman123', '2025-03-05', '2025-03-05 13:51:47'),
(33, 'free hansel', 'free@exmaple.com', 'free1234', '2025-03-05', '2025-03-05 13:53:41'),
(34, 'min long', 'min@example.com', 'long1234', '2025-03-05', '2025-03-05 14:02:22'),
(35, 'rey raraaaa', 'rey@example.com', 're123456', '2025-03-05', '2025-03-05 14:29:26');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `EmployeeName` varchar(255) NOT NULL,
  `EmployeePassword` varchar(255) NOT NULL,
  `EmployeeContactInfo` varchar(255) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeID`, `EmployeeName`, `EmployeePassword`, `EmployeeContactInfo`, `Salary`) VALUES
(1, 'Alice Baker', 'password123', 'alice@example.com', 35001.00),
(2, 'Bob Dough', 'securepass', 'bob@example.com', 34000.00),
(3, 'Charlie Mixer', 'choco@456', 'charlie@example.com', 36000.00),
(4, 'David Oven', 'pastry789', 'david@example.com', 37000.00),
(5, 'Eve Frosting', 'cake123', 'eve@example.com', 35500.00),
(6, 'Frank Yeast', 'bread456', 'frank@example.com', 33000.00),
(7, 'Grace Sugar', 'donut789', 'grace@example.com', 34500.00),
(8, 'Hank Butter', 'butter234', 'hank@example.com', 32000.00),
(9, 'Ivy Cupcake', 'muffin567', 'ivy@example.com', 33500.00),
(10, 'Jack Pudding', 'pudding999', 'jack@example.com', 32500.00),
(18, 'Zack humberger', '123455555', 'zack@example.com', 123123.00),
(19, 'him kawatan', 'hum123', 'hum@example.com', 30000.00),
(20, 'humba kawatan', 'hum123', 'hum@example.com', 30000.00),
(23, 'fries', 'fry123', 'fry@example.com', 40000.00);

-- --------------------------------------------------------

--
-- Table structure for table `employeemanagement`
--

CREATE TABLE `employeemanagement` (
  `EmployeeManagementID` int(11) NOT NULL,
  `ManagedEntityType` varchar(50) DEFAULT NULL,
  `ManagedEntityID` int(11) DEFAULT NULL,
  `Role` varchar(255) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employeemanagement`
--

INSERT INTO `employeemanagement` (`EmployeeManagementID`, `ManagedEntityType`, `ManagedEntityID`, `Role`, `EmployeeID`) VALUES
(1, 'Product', 1, 'Manager', 1),
(2, 'Ingredient', 2, 'Supervisor', 2),
(3, 'Order', 3, 'Cashier', 3),
(4, 'Supplier', 4, 'Procurement Officer', 4),
(5, 'Stock', 5, 'Inventory Manager', 5),
(6, 'Order', 6, 'Order Supervisor', 2),
(7, 'Product', 7, 'Quality Control', 3),
(8, 'Stock', 8, 'Warehouse Manager', 1),
(9, 'Ingredient', 9, 'Supply Chain Coordinator', 4),
(10, 'Supplier', 10, 'Logistics Officer', 5),
(11, 'Order', 19, 'Manager', 19),
(12, 'Ingredient', 23, 'Supervisor', 23);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `IngredientID` int(11) NOT NULL,
  `IngredientName` varchar(255) NOT NULL,
  `ItemStockQuantity` int(11) NOT NULL,
  `IngredientExpirationDate` date DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `QuantityPerBatch` int(11) NOT NULL DEFAULT 0,
  `UnitOfMeasurement` varchar(20) NOT NULL DEFAULT 'g'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`IngredientID`, `IngredientName`, `ItemStockQuantity`, `IngredientExpirationDate`, `EmployeeID`, `QuantityPerBatch`, `UnitOfMeasurement`) VALUES
(1, 'Flour', 100, '2025-12-31', 1, 5, 'kg'),
(2, 'Sugar', 80, '2025-10-15', 2, 2, 'kg'),
(3, 'Butter', 50, '2025-09-10', 3, 1, 'kg'),
(4, 'Eggs', 200, '2025-03-20', 4, 10, 'pcs'),
(5, 'Yeast', 90, '2025-06-25', 9, 20, 'g'),
(6, 'Cocoa Powder', 45, '2025-05-30', 10, 1, 'kg'),
(7, 'Milk', 60, '2025-04-15', 5, 2, 'L'),
(8, 'Cinnamon', 40, '2026-03-15', 8, 0, 'kg'),
(9, 'Lemon Zest', 20, '2025-08-20', 7, 50, 'g'),
(10, 'Baking Powder', 47, '7000-07-09', 6, 30, 'g'),
(11, 'Vegetables', 100, '2025-07-10', 5, 2, 'kg'),
(12, 'Vegetable Stock', 50, '2025-09-05', 6, 2, 'L'),
(13, 'Spices', 30, '2026-02-18', 7, 50, 'g'),
(14, 'Baguette', 50, '2025-06-30', 8, 10, 'pcs'),
(15, 'Macaroni', 80, '2025-12-15', 2, 2, 'kg'),
(16, 'Cheese', 60, '2025-11-20', 3, 1, 'kg'),
(17, 'Dinner Rolls', 50, '2025-06-30', 8, 12, 'pcs'),
(18, 'Mixed Vegetables', 120, '2025-07-15', 4, 3, 'kg'),
(19, 'Herbs', 40, '2026-03-01', 7, 50, 'g'),
(20, 'Pumpkin Puree', 80, '2025-10-01', 2, 2, 'kg'),
(21, 'Baking Soda', 30, '2026-04-20', 6, 20, 'g'),
(22, 'Pie Crust', 40, '2025-09-15', 5, 8, 'pcs'),
(23, 'Cream', 50, '2025-12-01', 3, 1, 'L'),
(24, 'Flour', 100, '2025-12-31', 1, 5, 'kg'),
(25, 'Sugar', 80, '2025-10-15', 2, 2, 'kg'),
(26, 'Butter', 50, '2025-09-10', 3, 1, 'kg'),
(27, 'Eggs', 200, '2025-03-20', 4, 10, 'pcs'),
(28, 'Yeast', 90, '2025-06-25', 9, 20, 'g'),
(29, 'Cocoa Powder', 45, '2025-05-30', 10, 1, 'kg'),
(30, 'Milk', 60, '2025-04-15', 5, 2, 'L'),
(31, 'Cinnamon', 40, '2026-03-15', 8, 0, 'kg'),
(32, 'Lemon Zest', 20, '2025-08-20', 7, 50, 'g'),
(33, 'Baking Powder', 40, '2026-01-05', 6, 30, 'g'),
(34, 'Vegetables', 112, '2025-03-09', 5, 2, 'kg'),
(35, 'Vegetable Stock', 50, '2025-09-05', 6, 2, 'L'),
(36, 'Spices', 30, '2026-02-18', 7, 50, 'g'),
(37, 'Baguette', 50, '2025-06-30', 8, 10, 'pcs'),
(38, 'Macaroni', 80, '2025-12-15', 2, 2, 'kg'),
(39, 'Cheese', 60, '2025-11-20', 3, 1, 'kg'),
(40, 'Dinner Rolls', 50, '2025-06-30', 8, 12, 'pcs'),
(41, 'Mixed Vegetables', 120, '2025-07-15', 4, 3, 'kg'),
(42, 'Herbs', 40, '2026-03-01', 7, 50, 'g'),
(43, 'Pumpkin Puree', 80, '2025-10-01', 2, 2, 'kg'),
(44, 'Baking Soda', 30, '2026-04-20', 6, 20, 'g'),
(45, 'Pie Crust', 40, '2025-09-15', 5, 8, 'pcs'),
(46, 'Cream', 50, '2025-12-01', 3, 1, 'L');

-- --------------------------------------------------------

--
-- Table structure for table `orderproduct`
--

CREATE TABLE `orderproduct` (
  `OrderProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderproduct`
--

INSERT INTO `orderproduct` (`OrderProductID`, `Quantity`, `OrderID`, `ProductID`) VALUES
(20, 1, 60, 2),
(29, 1, 67, 3),
(30, 3, 68, 4),
(31, 1, 69, 5),
(32, 2, 70, 1),
(35, 2, 75, 5),
(37, 1, 77, 20),
(38, 1, 77, 4),
(40, 3, 86, 2),
(41, 1, 87, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `OrderStatus` enum('Pending','Completed','Cancelled') NOT NULL,
  `TotalPrice` decimal(10,2) NOT NULL,
  `Cash` decimal(10,2) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `OrderDate`, `OrderStatus`, `TotalPrice`, `Cash`, `CustomerID`, `EmployeeID`) VALUES
(60, '2025-03-02 15:18:56', 'Pending', 3.50, 900.00, NULL, NULL),
(67, '2025-03-03 18:25:17', 'Pending', 10.00, NULL, 2, 2),
(68, '2025-03-03 18:25:17', 'Completed', 15.00, NULL, 3, 3),
(69, '2025-03-03 18:25:17', 'Cancelled', 5.00, NULL, 4, 4),
(70, '2025-03-03 18:25:17', 'Completed', 20.00, NULL, 5, 5),
(75, '2025-03-04 23:31:21', 'Completed', 24.00, 30.00, 10, NULL),
(77, '2025-03-05 05:45:47', 'Completed', 22.00, 23.00, 20, NULL),
(78, '2025-03-05 13:45:03', 'Completed', 7.00, 7.00, 30, NULL),
(79, '2025-03-05 14:05:20', 'Completed', 7.00, 10.00, 34, NULL),
(80, '2025-03-05 14:06:38', 'Cancelled', 3.50, NULL, 34, NULL),
(81, '2025-03-05 14:07:14', 'Completed', 15.50, 16.00, 34, NULL),
(82, '2025-03-05 14:32:52', 'Completed', 15.50, 16.00, 35, NULL),
(83, '2025-03-05 14:33:13', 'Completed', 5.00, 6.00, 35, NULL),
(84, '2025-03-05 14:34:07', 'Cancelled', 5.00, NULL, 35, NULL),
(86, '2025-03-05 14:54:35', 'Completed', 10.50, 12.00, 17, NULL),
(87, '2025-03-05 14:54:56', 'Completed', 3.50, 4.00, 18, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `PaymentMethod` enum('Cash','Card','Online') NOT NULL,
  `PaymentDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `OrderID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `PaymentMethod`, `PaymentDate`, `OrderID`, `CustomerID`) VALUES
(16, 'Cash', '2025-03-03 18:27:45', 67, 2),
(17, 'Online', '2025-03-03 18:27:45', 68, 3),
(18, 'Card', '2025-03-03 18:27:45', 69, 4),
(19, 'Online', '2025-03-03 18:27:45', 70, 5),
(22, 'Cash', '2025-03-04 23:31:21', 75, 10),
(24, 'Cash', '2025-03-05 05:45:47', 77, 20),
(25, 'Cash', '2025-03-05 13:45:03', 78, 30),
(26, 'Cash', '2025-03-05 14:05:20', 79, 34),
(27, 'Cash', '2025-03-05 14:07:14', 81, 34),
(28, 'Cash', '2025-03-05 14:32:52', 82, 35),
(29, 'Cash', '2025-03-05 14:33:13', 83, 35),
(31, 'Cash', '2025-03-05 14:54:35', 86, 17),
(32, 'Cash', '2025-03-05 14:54:56', 87, 18);

-- --------------------------------------------------------

--
-- Table structure for table `productingredient`
--

CREATE TABLE `productingredient` (
  `ProductIngredientsID` int(11) NOT NULL,
  `QuantityRequired` int(11) NOT NULL,
  `ProductExpirationDate` date DEFAULT NULL,
  `IngredientID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(255) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `StockQuantity` int(11) NOT NULL,
  `Status` enum('Available','Out of Stock') DEFAULT NULL,
  `DateStockout` date DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `Price`, `StockQuantity`, `Status`, `DateStockout`, `CategoryID`, `EmployeeID`) VALUES
(1, 'Chocolate Cake', 20.00, 6, 'Available', '2025-03-03', 2, 1),
(2, 'Croissant', 3.50, 20, 'Available', NULL, 1, 2),
(3, 'Baguette', 5.00, 10, 'Out of Stock', NULL, 3, 3),
(4, 'Chocolate Chip Cookies', 2.00, 27, 'Available', '2025-03-05', 2, 4),
(5, 'Apple Pie', 12.00, 8, 'Available', NULL, 1, 5),
(6, 'Blueberry Muffin', 4.00, 21, 'Available', '2025-03-05', 2, 6),
(7, 'Glazed Doughnut', 1.50, 33, 'Available', NULL, 3, 7),
(8, 'Fudge Brownies', 3.00, 18, 'Available', NULL, 2, 8),
(9, 'Strawberry Cupcake', 2.50, 10, 'Out of Stock', NULL, 3, 9),
(20, 'Chocolate Cake', 20.00, 9, 'Available', NULL, 2, 1),
(21, 'Croissant', 3.50, 20, 'Available', NULL, 1, 2),
(22, 'maroon', 5.00, 1, 'Available', '2025-03-05', 2, 3),
(23, 'Chocolate Chip Cookies', 2.00, 20, 'Available', '2025-03-05', 2, 4),
(24, 'pineapple', 20.00, 10, 'Available', NULL, 2, 5),
(25, 'happy', 23.00, 31, 'Available', NULL, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productscategory`
--

CREATE TABLE `productscategory` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(255) NOT NULL,
  `AvailableDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productscategory`
--

INSERT INTO `productscategory` (`CategoryID`, `CategoryName`, `AvailableDate`) VALUES
(1, 'Spring', '2025-02-01'),
(2, 'Summer', '2025-05-01'),
(3, 'Winter', '2025-09-01');

-- --------------------------------------------------------

--
-- Table structure for table `refund`
--

CREATE TABLE `refund` (
  `RefundID` int(11) NOT NULL,
  `RefundReason` text NOT NULL,
  `RefundAmount` decimal(10,2) NOT NULL,
  `RefundDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `OrderID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `Status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `refund`
--

INSERT INTO `refund` (`RefundID`, `RefundReason`, `RefundAmount`, `RefundDate`, `OrderID`, `EmployeeID`, `Status`) VALUES
(42, 'Customer changed mind', 5.00, '2025-03-03 18:29:07', 69, 4, 'Pending'),
(43, 'gaga order', 3.50, '2025-03-05 14:06:38', 80, NULL, 'Pending'),
(44, 'gaga', 5.00, '2025-03-05 14:34:07', 84, NULL, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `SalesID` int(11) NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `TransactionDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `TransactionStatus` enum('Success','Failed','Refunded') NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `PaymentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`SalesID`, `TotalAmount`, `TransactionDate`, `TransactionStatus`, `OrderID`, `EmployeeID`, `PaymentID`) VALUES
(11, 10.00, '2025-03-03 18:28:55', '', 67, 2, 16),
(12, 15.00, '2025-03-03 18:28:55', 'Success', 68, 3, 17),
(13, 5.00, '2025-03-03 18:28:55', 'Refunded', 69, 4, 18),
(14, 20.00, '2025-03-03 18:28:55', 'Success', 70, 5, 19),
(15, 7.00, '2025-03-05 13:45:03', 'Success', 78, NULL, 25),
(16, 7.00, '2025-03-05 14:05:20', 'Success', 79, NULL, 26),
(17, 15.50, '2025-03-05 14:07:14', 'Success', 81, NULL, 27),
(18, 15.50, '2025-03-05 14:32:52', 'Success', 82, NULL, 28),
(19, 5.00, '2025-03-05 14:33:13', 'Success', 83, NULL, 29);

-- --------------------------------------------------------

--
-- Table structure for table `stockin`
--

CREATE TABLE `stockin` (
  `StockInID` int(11) NOT NULL,
  `QuantityAdded` int(11) NOT NULL,
  `StockInDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `IngredientID` int(11) DEFAULT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockin`
--

INSERT INTO `stockin` (`StockInID`, `QuantityAdded`, `StockInDate`, `IngredientID`, `SupplierID`, `EmployeeID`) VALUES
(12, 50, '2025-03-03 06:26:15', 1, 1, 1),
(13, 100, '2025-03-03 06:26:15', 2, 2, 2),
(14, 75, '2025-03-03 06:26:15', 3, 3, 3),
(15, 200, '2025-03-03 06:26:15', 4, 1, 4),
(16, 150, '2025-03-03 06:26:15', 5, 2, 5),
(17, 50, '2025-03-03 18:30:09', 1, 1, 1),
(18, 20, '2025-03-03 18:30:09', 2, 2, 2),
(19, 10, '2025-03-03 18:30:09', 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stockin_products`
--

CREATE TABLE `stockin_products` (
  `StockInID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `QuantityAdded` int(11) NOT NULL,
  `StockInDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `EmployeeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockin_products`
--

INSERT INTO `stockin_products` (`StockInID`, `ProductID`, `QuantityAdded`, `StockInDate`, `EmployeeID`) VALUES
(1, 1, 5, '2025-03-03 12:50:08', 1),
(2, 2, 10, '2025-03-03 12:50:08', 2),
(3, 3, 7, '2025-03-03 12:50:08', 3),
(4, 4, 15, '2025-03-03 12:50:08', 4),
(5, 5, 5, '2025-03-03 12:50:08', 5),
(6, 6, 12, '2025-03-03 12:50:08', 6),
(7, 7, 20, '2025-03-03 12:50:08', 7),
(8, 8, 8, '2025-03-03 12:50:08', 8),
(9, 9, 10, '2025-03-03 12:50:08', 9),
(11, 1, 5, '2025-03-03 18:30:15', 1),
(12, 2, 10, '2025-03-03 18:30:15', 2),
(13, 3, 7, '2025-03-03 18:30:15', 3),
(14, 2, 12, '2025-03-04 19:51:55', 1),
(16, 25, 21, '2025-03-03 16:00:00', 1),
(17, 25, 8, '2025-03-04 16:00:00', 1),
(18, 25, 2, '2025-03-04 16:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stockout`
--

CREATE TABLE `stockout` (
  `StockOutID` int(11) NOT NULL,
  `ItemType` enum('Product','Ingredient') NOT NULL,
  `QuantityUsed` int(11) NOT NULL,
  `Reason` enum('Sale','Waste','Damaged','Expired') NOT NULL,
  `StockOutDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `ItemID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockout`
--

INSERT INTO `stockout` (`StockOutID`, `ItemType`, `QuantityUsed`, `Reason`, `StockOutDate`, `ItemID`, `EmployeeID`) VALUES
(1, 'Ingredient', 5, 'Sale', '2025-02-21 02:41:07', 1, 1),
(2, 'Ingredient', 10, 'Expired', '2025-02-21 02:41:07', 2, 2),
(3, 'Ingredient', 3, 'Waste', '2025-02-21 02:41:07', 3, 3),
(4, 'Ingredient', 8, 'Damaged', '2025-02-21 02:41:07', 4, 4),
(5, 'Ingredient', 12, 'Sale', '2025-02-21 02:41:07', 5, 5),
(6, 'Product', 4, 'Sale', '2025-02-21 02:41:07', 1, 6),
(7, 'Product', 6, 'Sale', '2025-02-21 02:41:07', 2, 7),
(8, 'Product', 7, 'Damaged', '2025-02-21 02:41:07', 3, 8),
(9, 'Product', 5, 'Sale', '2025-02-21 02:41:07', 4, 9),
(10, 'Product', 3, 'Waste', '2025-02-21 02:41:07', 5, 10),
(11, 'Product', 2, 'Sale', '2025-03-03 18:29:18', 1, 1),
(12, 'Product', 1, 'Damaged', '2025-03-03 18:29:18', 3, 3),
(13, 'Ingredient', 5, 'Waste', '2025-03-03 18:29:18', 1, 1),
(14, 'Product', 2, 'Sale', '2025-03-03 18:29:47', 1, 1),
(15, 'Product', 1, 'Damaged', '2025-03-03 18:29:47', 3, 3),
(16, 'Ingredient', 5, 'Waste', '2025-03-03 18:29:47', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stockout_products`
--

CREATE TABLE `stockout_products` (
  `StockOutID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `QuantityRemoved` int(11) NOT NULL,
  `StockOutDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `EmployeeID` int(11) DEFAULT NULL,
  `Reason` enum('Sold to Customer','Expired Product','Damaged','Waste','Promotional Giveaway','Employee Use','Lost Item') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockout_products`
--

INSERT INTO `stockout_products` (`StockOutID`, `ProductID`, `QuantityRemoved`, `StockOutDate`, `EmployeeID`, `Reason`) VALUES
(1, 1, 3, '2025-03-03 15:21:28', 1, 'Sold to Customer'),
(2, 2, 1, '2025-03-03 15:21:28', 2, 'Expired Product'),
(3, 3, 2, '2025-03-03 15:21:28', 3, 'Damaged'),
(4, 4, 5, '2025-03-03 15:21:28', 4, 'Waste'),
(5, 5, 2, '2025-03-03 15:21:28', 5, 'Promotional Giveaway'),
(6, 6, 1, '2025-03-03 15:21:28', 6, 'Employee Use'),
(7, 7, 3, '2025-03-03 15:21:28', 7, 'Lost Item'),
(8, 8, 4, '2025-03-03 15:21:28', 8, 'Sold to Customer'),
(9, 9, 2, '2025-03-03 15:21:28', 9, 'Expired Product'),
(10, 1, 6, '2025-03-03 15:21:28', 1, 'Damaged'),
(11, 2, 3, '2025-03-03 15:21:28', 2, 'Waste'),
(12, 3, 5, '2025-03-03 15:21:28', 3, 'Promotional Giveaway'),
(13, 4, 2, '2025-03-03 15:21:28', 4, 'Employee Use'),
(14, 5, 1, '2025-03-03 15:21:28', 5, 'Lost Item'),
(15, 3, 10, '2025-03-03 15:30:12', 1, 'Sold to Customer'),
(16, 9, 12, '2025-03-03 15:30:28', 1, 'Employee Use'),
(17, 1, 2, '2025-03-03 15:35:48', 1, 'Sold to Customer'),
(18, 1, 2, '2025-03-03 15:36:19', 1, 'Expired Product'),
(21, 1, 2, '2025-03-03 18:30:01', 1, 'Sold to Customer'),
(22, 3, 1, '2025-03-03 18:30:01', 3, 'Damaged'),
(23, 5, 1, '2025-03-03 18:30:01', 5, 'Expired Product'),
(24, 22, 1, '2025-03-04 21:42:54', 1, 'Sold to Customer'),
(25, 22, 1, '2025-03-04 21:45:20', 1, 'Waste'),
(26, 4, 2, '2025-03-04 21:47:21', 1, 'Expired Product'),
(27, 6, 2, '2025-03-05 05:47:56', 1, 'Waste'),
(28, 23, 5, '2025-03-05 14:47:25', 1, 'Expired Product'),
(29, 23, 5, '2025-03-05 14:48:59', 1, 'Sold to Customer');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(255) NOT NULL,
  `SupplierContactInfo` varchar(255) DEFAULT NULL,
  `SupplierAddress` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `SupplierName`, `SupplierContactInfo`, `SupplierAddress`) VALUES
(1, 'Flour King', 'flourking@example.com', '123 Baker St, London'),
(2, 'Dairy Delights', 'dairy@example.com', '456 Cream Ave, New York'),
(3, 'Sweet Sugars', 'sugarland@example.com', '789 Candy Ln, Paris'),
(4, 'Golden Grain', 'goldengrains@example.com', '321 Wheat Blvd, Rome'),
(5, 'Choco Heaven', 'choco@example.com', '654 Cocoa Rd, Zurich'),
(6, 'Butter Bliss', 'butterbliss@example.com', '111 Dairy Dr, Amsterdam'),
(7, 'Yeast Masters', 'yeast@example.com', '222 Rise St, Berlin'),
(8, 'Nutty Nuts', 'nuts@example.com', '333 Crunchy Ave, Sydney'),
(9, 'Fresh Eggs Co.', 'eggs@example.com', '444 Eggshell Rd, Tokyo'),
(23, 'asdwqe', 'qweasd', 'asddqweasd'),
(25, 'asdasdasd', 'asdasdasdasdasd', 'asdasdasdasd'),
(26, 'Flour King', 'flourking@example.com', '123 Baker St, London'),
(27, 'Dairy Delights', 'dairy@example.com', '456 Cream Ave, New York'),
(28, 'Sweet Sugars', 'sugarland@example.com', '789 Candy Ln, Paris');

-- --------------------------------------------------------

--
-- Table structure for table `supplieringredient`
--

CREATE TABLE `supplieringredient` (
  `SupplierIngredientID` int(11) NOT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `IngredientID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplieringredient`
--

INSERT INTO `supplieringredient` (`SupplierIngredientID`, `SupplierID`, `IngredientID`) VALUES
(10, 25, 10),
(12, 1, 45),
(13, 25, 34),
(14, 1, 1),
(15, 2, 2),
(16, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `supplierrefund`
--

CREATE TABLE `supplierrefund` (
  `SupplierRefundID` int(11) NOT NULL,
  `SupplierRefundReason` text NOT NULL,
  `SupplierRefundAmount` decimal(10,2) NOT NULL,
  `SupplierRefundDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `IngredientID` int(11) DEFAULT NULL,
  `SupplierID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplierrefund`
--

INSERT INTO `supplierrefund` (`SupplierRefundID`, `SupplierRefundReason`, `SupplierRefundAmount`, `SupplierRefundDate`, `IngredientID`, `SupplierID`) VALUES
(1, 'Defective product', 50.00, '2025-03-03 18:30:35', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baking_batches`
--
ALTER TABLE `baking_batches`
  ADD PRIMARY KEY (`BatchID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `CustomerPassword` (`CustomerPassword`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `employeemanagement`
--
ALTER TABLE `employeemanagement`
  ADD PRIMARY KEY (`EmployeeManagementID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`IngredientID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD PRIMARY KEY (`OrderProductID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `productingredient`
--
ALTER TABLE `productingredient`
  ADD PRIMARY KEY (`ProductIngredientsID`),
  ADD KEY `IngredientID` (`IngredientID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `productscategory`
--
ALTER TABLE `productscategory`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `refund`
--
ALTER TABLE `refund`
  ADD PRIMARY KEY (`RefundID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SalesID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `PaymentID` (`PaymentID`);

--
-- Indexes for table `stockin`
--
ALTER TABLE `stockin`
  ADD PRIMARY KEY (`StockInID`),
  ADD KEY `IngredientID` (`IngredientID`),
  ADD KEY `SupplierID` (`SupplierID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `stockin_products`
--
ALTER TABLE `stockin_products`
  ADD PRIMARY KEY (`StockInID`),
  ADD KEY `stockin_products_ibfk_1` (`ProductID`),
  ADD KEY `stockin_products_ibfk_2` (`EmployeeID`);

--
-- Indexes for table `stockout`
--
ALTER TABLE `stockout`
  ADD PRIMARY KEY (`StockOutID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `stockout_products`
--
ALTER TABLE `stockout_products`
  ADD PRIMARY KEY (`StockOutID`),
  ADD KEY `stockout_products_ibfk_1` (`ProductID`),
  ADD KEY `stockout_products_ibfk_2` (`EmployeeID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `supplieringredient`
--
ALTER TABLE `supplieringredient`
  ADD PRIMARY KEY (`SupplierIngredientID`),
  ADD KEY `SupplierID` (`SupplierID`),
  ADD KEY `IngredientID` (`IngredientID`);

--
-- Indexes for table `supplierrefund`
--
ALTER TABLE `supplierrefund`
  ADD PRIMARY KEY (`SupplierRefundID`),
  ADD KEY `IngredientID` (`IngredientID`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `baking_batches`
--
ALTER TABLE `baking_batches`
  MODIFY `BatchID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `employeemanagement`
--
ALTER TABLE `employeemanagement`
  MODIFY `EmployeeManagementID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `IngredientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `orderproduct`
--
ALTER TABLE `orderproduct`
  MODIFY `OrderProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `productingredient`
--
ALTER TABLE `productingredient`
  MODIFY `ProductIngredientsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `productscategory`
--
ALTER TABLE `productscategory`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `refund`
--
ALTER TABLE `refund`
  MODIFY `RefundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `SalesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `stockin`
--
ALTER TABLE `stockin`
  MODIFY `StockInID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `stockin_products`
--
ALTER TABLE `stockin_products`
  MODIFY `StockInID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `stockout`
--
ALTER TABLE `stockout`
  MODIFY `StockOutID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `stockout_products`
--
ALTER TABLE `stockout_products`
  MODIFY `StockOutID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `supplieringredient`
--
ALTER TABLE `supplieringredient`
  MODIFY `SupplierIngredientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `supplierrefund`
--
ALTER TABLE `supplierrefund`
  MODIFY `SupplierRefundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `baking_batches`
--
ALTER TABLE `baking_batches`
  ADD CONSTRAINT `baking_batches_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `employeemanagement`
--
ALTER TABLE `employeemanagement`
  ADD CONSTRAINT `employeemanagement_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE;

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `products` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productingredient`
--
ALTER TABLE `productingredient`
  ADD CONSTRAINT `productingredient_ibfk_1` FOREIGN KEY (`IngredientID`) REFERENCES `ingredients` (`IngredientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productingredient_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `productscategory` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `refund`
--
ALTER TABLE `refund`
  ADD CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE SET NULL;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stockin`
--
ALTER TABLE `stockin`
  ADD CONSTRAINT `stockin_ibfk_1` FOREIGN KEY (`IngredientID`) REFERENCES `ingredients` (`IngredientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stockin_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stockin_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stockin_products`
--
ALTER TABLE `stockin_products`
  ADD CONSTRAINT `stockin_products_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stockin_products_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stockout`
--
ALTER TABLE `stockout`
  ADD CONSTRAINT `stockout_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE SET NULL;

--
-- Constraints for table `stockout_products`
--
ALTER TABLE `stockout_products`
  ADD CONSTRAINT `stockout_products_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stockout_products_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplieringredient`
--
ALTER TABLE `supplieringredient`
  ADD CONSTRAINT `supplieringredient_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`) ON DELETE CASCADE,
  ADD CONSTRAINT `supplieringredient_ibfk_2` FOREIGN KEY (`IngredientID`) REFERENCES `ingredients` (`IngredientID`) ON DELETE CASCADE;

--
-- Constraints for table `supplierrefund`
--
ALTER TABLE `supplierrefund`
  ADD CONSTRAINT `supplierrefund_ibfk_1` FOREIGN KEY (`IngredientID`) REFERENCES `ingredients` (`IngredientID`) ON DELETE CASCADE,
  ADD CONSTRAINT `supplierrefund_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
