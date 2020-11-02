CREATE TABLE card_holder(
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(255) NOT NULL
);

CREATE TABLE credit_card(
	card VARCHAR(20) PRIMARY KEY NOT NULL,
	id_card_holder INT NOT NULL,
	FOREIGN KEY (id_card_holder) REFERENCES card_holder(id)
);

CREATE TABLE merchant_cat(
	id SERIAL PRIMARY KEY,
	category VARCHAR(255)
);

CREATE TABLE merchant(
	id SERIAL PRIMARY KEY,
	merch_name VARCHAR(255),
	id_merchant_cat INT NOT NULL,
	FOREIGN KEY (id_merchant_cat) REFERENCES merchant_cat(id)
);

CREATE TABLE transaction(
	id INT PRIMARY KEY,
	date VARCHAR(10),
	amount DECIMAL,
	card VARCHAR(20) NOT NULL,
	FOREIGN KEY (card) REFERENCES credit_card(card),
	id_merchant INT NOT NULL,
	FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);


ALTER TABLE transaction
ALTER COLUMN date TYPE TIMESTAMP USING TO_TIMESTAMP(date, 'YYYY/MM/DD HH24:MI:SS');
