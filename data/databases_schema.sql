DROP DATABASE IF EXISTS dealerships;

CREATE DATABASE IF NOT EXISTS dealerships;

USE dealerships;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #

create table `dealership` (
`dealership_id` int auto_increment primary key,
`name` varchar(50 ) not null,
`address` varchar(50),
`phone` varchar(12)
);

create table `vehicle` (
`vin` int not null auto_increment,
`year` int,
`make` varchar(50),
`model` varchar(50),
`vehicle_type` varchar(50),
`color` varchar(50),
`odometer` int,
`price` double,
`dealership_id` int,
`sold` boolean,
CONSTRAINT `pk_vehicle_vin` PRIMARY KEY (`vin`),
FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id)
);

create table `lease_contract` (
`contract_id` INT NOT NULL AUTO_INCREMENT,
`date` varchar(50),
`customer_name` varchar(50),
`customer_email` varchar(50),
`vehicle_sold` int,
CONSTRAINT `pk_lease_contract` PRIMARY KEY (`contract_id`),
CONSTRAINT `fk_lease_contract_vehicle` FOREIGN KEY (`vehicle_sold`) REFERENCES `vehicle`(`vin`)
);

create table `sales_contract`(
`contract_id` INT NOT NULL AUTO_INCREMENT,
`expected_ending_value` double,
`lease_fee`double,
`date` varchar(50),
`customer_name` varchar(50),
`customer_email` varchar(50),
`vehicle_leased` int,
`finance` boolean,
CONSTRAINT `pk_sales_contract` PRIMARY KEY (`contract_id`),
CONSTRAINT `fk_sales_contract_vehicle` FOREIGN KEY (`vehicle_sold`) REFERENCES `vehicle`(`vin`)
);