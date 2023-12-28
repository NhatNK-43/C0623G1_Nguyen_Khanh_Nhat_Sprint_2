create database fishing_tackle_shop;
use fishing_tackle_shop;

create table roles (
    id int primary key auto_increment,
    `name` varchar(50) not null unique
);

create table accounts (
    id int primary key auto_increment,
    username varchar(50) not null unique,
    `password` varchar(255),
    is_deleted bit(1) default 0
);

create table role_accounts (
	id int primary key auto_increment,
    account_id int,
    role_id int,
    foreign key (account_id) references accounts(id),
	foreign key (role_id) references roles(id)
);

create table positions(
	id int primary key,
    name varchar(50) not null
);

create table employees(
	id int primary key auto_increment,
    empolyee_code varchar(50) not null unique,
    name varchar(50) not null,
    date_of_birth date not null,
    gender bit(1) not null,
    id_card varchar(50) not null unique,
    phone_number varchar(50) not null unique,
    address varchar(50),
    position_id int,
    salary double not null,
    is_delete bit(1) default 0,
    account_id int,
    foreign key (position_id) references positions(id),
    foreign key (account_id) references accounts(id)
);

create table customer_types(
	id int primary key,
    name varchar(50)
);

create table customers(
	id int primary key auto_increment,
    customer_code varchar(50) not null unique,
    name varchar(50) not null,
    date_of_birth date not null,
    gender bit(1) not null,
    id_card varchar(50) not null,
    phone_number varchar(50) not null,
    address varchar(50),
	customer_type_id int,
	is_delete bit(1) default 0,
    account_id int,
    foreign key (customer_type_id) references customer_types(id),
    foreign key (account_id) references accounts(id)
);

CREATE TABLE product_categories (
	id INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(150) NOT NULL UNIQUE
);

create table promotions (
	id int primary key auto_increment,
    percent double not null
);

create table products(
	id int primary key auto_increment,
    product_code varchar(50) not null unique,
    name varchar(50) not null,
    `description` longtext not null,
    image longtext not null,
    qr_code longtext not null,
    is_deleted bit(1) default 0,
	product_category_id int,
    promotion_id int,
    FOREIGN KEY (product_category_id) REFERENCES product_categories(id),
    FOREIGN KEY (promotion_id) REFERENCES promotions(id)
);

create table sizes(
	id int primary key auto_increment,
    name varchar(50)
);

create table size_details(
	id int primary key auto_increment,
    size_id int,
    product_id int,
    price double not null,
    quantity int not null,
    foreign key (size_id) references sizes(id),
    foreign key (product_id) references products(id)
);

create table cart(
	id int primary key auto_increment,
    purchased_quantity int not null,
    size_detail_id int,
	customer_id int,
	foreign key (size_detail_id) references size_details(id),
	foreign key (customer_id) references customers(id)
);

create table orders(
	id int primary key auto_increment,
    order_code varchar(50) not null unique,
    purchased_date datetime not null,
    customer_id int,
    employee_id int,
    foreign key (customer_id) references customers(id),
    foreign key (employee_id) references employees(id)
);

create table order_details(
	id int primary key auto_increment,
    purchased_quantity int not null,
    order_id int,
    product_id int,
    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
);


