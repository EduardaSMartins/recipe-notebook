CREATE SCHEMA recipelove;

CREATE TABLE
  user (
    id INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(150) NOT NULL,
    birth_date DATE,
    avatar LONGTEXT,
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME
  );

CREATE TABLE
  role (
    id INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(45) NOT NULL,
    slug VARCHAR(45) NOT NULL,
    description VARCHAR(255),
    is_system BOOLEAN NOT NULL DEFAULT 1,
    active BOOLEAN NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME
  );

CREATE TABLE
  permission (
    id INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(45) NOT NULL,
    key VARCHAR(45) NOT NULL,
    description VARCHAR(255),
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME
  );

CREATE TABLE
  login (
    id INT PRIMARY KEY AUTOINCREMENT,
    id_user INT NOT NULL,
    access_token TEXT NOT NULL,
    refresh_token TEXT NOT NULL,
    access_token_expiration_date DATETIME NOT NULL,
    refresh_token_expiration_date DATETIME NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME,
    CONSTRAINT FOREIGN KEY (id_user) REFERENCES user (id)
  );

CREATE TABLE
  recover_password (
    id INT PRIMARY KEY AUTOINCREMENT,
    id_user INT NOT NULL,
    token TEXT NOT NULL,
    token_expiration_date DATETIME NOT NULL,
    is_used BOOLEAN NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME,
    CONSTRAINT FOREIGN KEY (id_user) REFERENCES user (id)
  );

CREATE TABLE
  category (
    id INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(45) NOT NULL,
    description VARCHAR(255),
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME
  );

CREATE TABLE
  utensil (
    id INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(45) NOT NULL,
    description VARCHAR(255),
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME
  );

CREATE TABLE
  ingredient (
    id INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(45) NOT NULL,
    observation VARCHAR(255),
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME
  );

CREATE TABLE
  recipe (
    id INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    income VARCHAR(45) NOT NULL,
    type ENUM ('sweet', 'salty', 'sour', 'bitter') NOT NULL,
    time VARCHAR(45) NOT NULL,
    complexity ENUM ('easy', 'normal', 'medium', 'difficult'),
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME
  );

CREATE TABLE
  favourite (
    id INT PRIMARY KEY AUTOINCREMENT,
    id_user INT NOT NULL,
    id_recipe INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME,
    CONSTRAINT FOREIGN KEY (id_user) REFERENCES user (id),
    CONSTRAINT FOREIGN KEY (id_recipe) REFERENCES recipe (id)
  );

-- Relações N-N
CREATE TABLE
  role_permission (
    id INT PRIMARY KEY AUTOINCREMENT,
    id_role INT NOT NULL,
    id_permission INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME,
    CONSTRAINT FOREIGN KEY (id_role) REFERENCES role (id),
    CONSTRAINT FOREIGN KEY (id_permission) REFERENCES permission (id)
  );

CREATE TABLE
  user_role (
    id INT PRIMARY KEY AUTOINCREMENT,
    id_user INT NOT NULL,
    id_role INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME,
    CONSTRAINT FOREIGN KEY (id_user) REFERENCES user (id),
    CONSTRAINT FOREIGN KEY (id_role) REFERENCES role (id)
  );

CREATE TABLE
  recipe_category (
    id INT PRIMARY KEY AUTOINCREMENT,
    id_recipe INT NOT NULL,
    id_category INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME,
    CONSTRAINT FOREIGN KEY (id_recipe) REFERENCES recipe (id),
    CONSTRAINT FOREIGN KEY (id_category) REFERENCES category (id)
  );

CREATE TABLE
  recipe_utensil (
    id INT PRIMARY KEY AUTOINCREMENT,
    id_recipe INT NOT NULL,
    id_utensil INT NOT NULL,
    measure VARCHAR(45) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME,
    CONSTRAINT FOREIGN KEY (id_recipe) REFERENCES recipe (id),
    CONSTRAINT FOREIGN KEY (id_utensil) REFERENCES utensil (id)
  );

CREATE TABLE
  recipe_ingredient (
    id INT PRIMARY KEY AUTOINCREMENT,
    id_recipe INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantity VARCHAR(45) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW,
    updated_at DATETIME NOT NULL DEFAULT NOW,
    deleted_at DATETIME,
    CONSTRAINT FOREIGN KEY (id_recipe) REFERENCES recipe (id),
    CONSTRAINT FOREIGN KEY (id_ingredient) REFERENCES igredient (id)
  );