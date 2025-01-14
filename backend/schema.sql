USE eighteentech; /* Define the database*/
/*Create schema for users*/
CREATE TABLE users (
    	 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	 username VARCHAR(50) NOT NULL UNIQUE,
         emailaddress VARCHAR(50) NOT NULL,
	     first_name VARCHAR(50) NOT NULL,
	     last_name VARCHAR(50) NOT NULL,
    	 password VARCHAR(255) NOT NULL,
		 is_admin BOOLEAN NOT NULL,
    	 created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

/*Create schema for themes*/
CREATE TABLE theme (
    id INT NOT NULL PRIMARY KEY,
    THEMENAME VARCHAR(255) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

/*Insert 2 admin accounts*/
INSERT INTO users (username,emailaddress, first_name, last_name, password, is_admin) VALUES ("rames11a", "rameshnitin99@gmail.com", "Nitin", "Ramesh", "$2y$10$U8EIkwFRA49lcYQ4dHQ4BujLGfA4gtrXOlwpiUno1liO8l2lvbRxe", 1); /*Password: Admin01@ */
INSERT INTO users (username,emailaddress, first_name, last_name, password, is_admin) VALUES ("corro", "corro@uwindsor.ca", "Charles", "Corro", "$2y$10$U8EIkwFRA49lcYQ4dHQ4BujLGfA4gtrXOlwpiUno1liO8l2lvbRxe", 1); /*Password: Admin01@ */

/*Insert 6 dummy accounts*/
INSERT INTO users ( username, emailaddress, first_name, last_name, password, is_admin) VALUES ( 'adamsmith01', 'adamsmith@gmail.com', 'Adam', 'Smith', '$2y$10$WOJHWt5HD0SwnDJS4EupgOfeUAtcfYZoan8eZsTUtX8gPcB58je2W', 0), ('johndoe', 'johndoe@hotmail.ca', 'John', 'Doe', '$2y$10$Zy0MjIp9MLZoOZgwdoXKDO9KlRvZbKAplb.fNpnPTfjf4ikrC4O7K', 0), ( 'janey_2001', 'janedoe123@yahoo.com', 'Jane', 'Doe', '$2y$10$19hAphj/W8wiQG23TkUhs.HJz8w2a4qJeebnTniVeSaD1WD85//ru', 0);
INSERT INTO users ( username, emailaddress, first_name, last_name, password, is_admin) VALUES ( 'kmadhavan', 'keerthana@gmail.com', 'Keerthana', 'Madhavan', '$2y$10$WOJHWt5HD0SwnDJS4EupgOfeUAtcfYZoan8eZsTUtX8gPcB58je2W', 0), ('bsohail', 'sohail@hotmail.ca', 'Bilal', 'Sohail', '$2y$10$Zy0MjIp9MLZoOZgwdoXKDO9KlRvZbKAplb.fNpnPTfjf4ikrC4O7K', 0), ( 'vanminh', 'vminh@yahoo.com', 'Van Minh', 'Ngai', '$2y$10$19hAphj/W8wiQG23TkUhs.HJz8w2a4qJeebnTniVeSaD1WD85//ru', 0);
/*Insert an default Theme*/
INSERT INTO theme(id,THEMENAME) VALUES(1,'default');

/*Create schema for product*/
CREATE TABLE products (
        p_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        p_category VARCHAR(5) NOT NULL,
        p_name VARCHAR(100) NOT NULL UNIQUE,
        p_image VARCHAR(200) NOT NULL UNIQUE,
        p_description LONGTEXT NOT NULL,
		p_overallReview INT DEFAULT 0 NOT NULL,
        p_specs LONGTEXT NOT NULL,
        p_amazon VARCHAR(200) ,
        p_newegg VARCHAR(200) ,
        p_bestbuy VARCHAR(200) ,
        p_created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE carousel (
    c_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    c_image VARCHAR(255) NOT NULL,
    c_created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

/*Create table schema for comments/reviews */
CREATE TABLE reviews(
	r_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	p_id INT NOT NULL,
	id INT NOT NULL,
	username VARCHAR(50) NOT NULL,
	post_time DATETIME DEFAULT CURRENT_TIMESTAMP,
	rating INT NOT NULL,
	comment TEXT(500),
	FOREIGN KEY(p_id) REFERENCES products(p_id) ON DELETE CASCADE,
	FOREIGN KEY(id) REFERENCES users(id) ON DELETE CASCADE,
	FOREIGN KEY(username) REFERENCES users(username) ON DELETE CASCADE
);




/*populate products table*/
INSERT INTO products(p_overallReview, p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES (5, "101", "UMIDIGI A9 Pro", "https://images-na.ssl-images-amazon.com/images/I/71Du8QCeYcL._AC_SL1500_.jpg", "[Sony 32MP Quad Camera] A9 Pro smartphone with Sony 32MP main camera, 16MP ultra-wide angle, 5MP depth camera and 5MP macro camera. The Sony 32MP camera has incredible light-sensing ability and comes with a 1/2"" large size sensor, supporting Quad Bayer, pixel size up to 1.6μm. Your pictures will come out bright even in low light. With a dramatic 120 ° field of view from a 16MP ultra-wide-angle camera, you can shoot clearer and wider landscapes.
[Helio P60 Octa-Core Processor&4GB + 64GB] A9 Pro unlocked smartphone is equipped with a high-performance Helio P60 octa-core processor with a maximum clock speed of 2.0GHz, for the seamless gaming experience you never have before in this price range. With up to 6GB + 128GB supported, the advanced LPDDR4X standard and UFS 2.1 flash storage greatly improve overall performance and reduce power consumption. Now web browsing and gaming can be smooth like never before.
[6.3"" FHD+ full screen android cell phone] UMIDIGI A9 Pro have a cinematic viewing experience with a 19.5:9 aspect ratio 6.3'''' FHD+ Full Screen display. Coupled with in-cell and LTPS technology, it’s a flagship-level display that is of distinct clarity and vivid colour. And we have designed a range of finishes to match your personality and style. The 2.5D glass back with a metal frame makes the phone looks more premium.
[4150mAh High-capacity Battery] UMIDIGI A9 Pro unlocked phone is powered by a 4150mAh high-capacity battery. It provides excellent power efficiency. you can easily go through 2 days of daily use. Charging port is replaced with new type-C plug, you could have more choice in adapters.
[Global LTE band and one year warranty] UMIDIGI A9 Pro supports various global bands. No matter where you live or travel, you can use A9 Pro to connect to your mobile network from anywhere in the world. Enjoy faster data transmission, lower power consumption and more reliable connection. We offer 100% 1 year post-sales warranty and service. If you have any initial defects or any other problems, please feel free to email us.", "
Brand	‎UMIDIGI
Manufacturer	‎UMIDIGI
Model Name	‎A9 Pro
Part Number	‎A9PRO
Memory storage capacity	‎64 GB
Flash Memory Installed Size	‎64 GB
Digital Storage Capacity	‎64 GB
OS	‎Android 10.0
Processor Speed	‎2 GHz
Standing screen display size	‎6.3 Inches
Optical Sensor Resolution	‎5.0, 32.0 MP
Batteries included	‎No
batteries required	‎No
Cellular Technology	‎4G
Form Factor	‎Smartphone
Manufacturer	‎UMIDIGI
Manufacturer reference	‎A9PRO
Parcel Dimensions	‎18.3 x 9.9 x 4.9 cm; 205 Grams
ASIN	‎B08RDNNRTD", "https://www.amazon.ca/UMIDIGI-Unlocked-4150mAh-Capacity-Smartphone/dp/B08RDNNRTD/ref=sr_1_7?crid=Q70QDUCZ68WM&dchild=1&keywords=cell+phone&qid=1624463067&sprefix=cell%2Caps%2C176&sr=8-7", "https://www.newegg.ca/umidigi-a9-pro-6-3-black/p/23B-009Z-00051", "");
INSERT INTO products(p_overallReview, p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES (8, "101", "Samsung Galaxy A10S A107M", "https://images-na.ssl-images-amazon.com/images/I/61OhSCY69kL._AC_SL1000_.jpg", "The Galaxy A10s comes as an upgrade of the Samsung Galaxy A10. The new phone sports an Infinity-V Display and comes with dual rear camera setup. It has also provided features such as depth detection and the ability to add artistic effect to images directly through the Galaxy A10s. Immerse yourself and get a vivid viewing experience with the Galaxy A10''s next-gen Infinity-V Display. HD+ resolution never looked so good. You''ll be able to capture stunning photographs that stand out with its 13MP+2MP Dual Rear + 8MP Front Camera. Even in low light, you''ll be ready to shoot and produce incredible results. An immense advantage for multi-taskers, the Galaxy A10s can run multiple apps without missing a beat thanks to its Octa-core 2.0 GHz Cortex-A53 (chipset: Mediatek MT6762 Helio P22 (12 nm)). Other notable features include an accelerometer, proximity sensor, and virtual light sensing. Does NOT have NFC. With high usage of its stunning camera and multi-tasking ability, it''s a good thing it has a durable 4000 mAh battery that will keep you going throughout your day.", "Brand	‎Samsung
Manufacturer	‎Samsung
Model	‎A107M
Part Number	‎SM-A107MBLACK
Memory storage capacity	‎32 GB
Flash Memory Installed Size	‎32 GB
Digital Storage Capacity	‎32 GB
OS	‎Android 9.0
Processor Speed	‎2 GHz
Display Technology	‎LCD
Standing screen display size	‎6.2 Inches
Display Type	‎LCD
Optical Sensor Resolution	‎13 MP
Batteries included	‎Yes
batteries required	‎No
Battery cell composition	‎Lithium
Battery Power Rating	‎4000 Milliamp Hours
Cellular Technology	‎4G, 3G, 2G
Device interface - primary	‎Touchscreen
Manufacturer	‎Samsung
Item model number	‎A107M
ASIN	‎B07XQJ33PL", "https://www.amazon.ca/Samsung-6-2inch-Infinity-V-Display-Camera/dp/B07XQJ33PL/ref=sr_1_11?crid=Q70QDUCZ68WM&dchild=1&keywords=cell+phone&qid=1624463336&sprefix=cell%2Caps%2C176&sr=8-11", "https://www.newegg.ca/p/23B-0049-003U3?Description=Samsung%20Galaxy%20A10S%20A107M&cm_re=Samsung_Galaxy%20A10S%20A107M-_-9SIAZBTENZ2560-_-Product", "https://www.bestbuy.ca/en-ca/product/samsung-galaxy-a10s-a107m-ds-32gb-2gb-32gb-64gb-sd-bundle-factory-unlocked-black/15445015");
INSERT INTO products(p_overallReview, p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES (6, "101", "Huawei P40 Lite", "https://images-na.ssl-images-amazon.com/images/I/51EIonlrnbL._AC_SL1008_.jpg", "6.4 inches, LTPS IPS LCD, 101.4 cm2 (~83.5% screen-to-body ratio), 1080 x 2310 pixels (~398 ppi density)
Network Compatibility: DUAL-SIM (Nano-SIM), SIM CARD 1 AND SIM CARD 2 [ 2G : GSM 850 / 900 / 1800 / 1900 and/or 3G : WCDMA 800(B6) / 800(B19) / 850(B5) / 900(B8) / 1700|2100(B4) / 1900(B2) / 2100(B1) and/or 4G : LTE 700(B12) / 700(B17) / 700(B28) / 800(B18) / 800(B19) / 800(B20) / 850(B5) / 850(B26) / 900(B8) / 1500(B32) / 1700|2100(B4) / 1800(B3) / 1900(B2) / 2100(B1) / 2600(B7) / Band 6 / Band 9 and/or : TD-LTE 1900(B39) / 2100(B34) / 2300(B40) / 2500(B41) / 2600(B38)
128GB 6GB RAM, NM (Nano Memory), up to 256GB (uses shared SIM slot)
Android 10, EMUI 10, no Google Play Services, Kirin 810 (7 nm), Octa-core (2x2.27 GHz Cortex-A76 & 6x1.88 GHz Cortex-A55) | GPU: Mali-G52 MP6
Quad: 48 MP, f/1.8, 26mm (wide), 1/2.0"", 0.8µm, PDAF, 8 MP, f/2.4, (ultrawide), 2 MP, f/2.4, (macro), 2 MP, f/2.4, (depth) | Front Camera: 16 MP, f/2.0, (wide), 1/3.06"", 1.0µm, Video rec. 1080p@30fps", "
OS	‎Android 10.0
RAM	‎6 GB
Product Dimensions	‎15.92 x 7.63 x 0.87 cm; 300 Grams
Batteries	‎1 Lithium Polymer batteries required. (included)
Item model number	‎6901443375769
Wireless communication technologies	‎Cellular
Display technology	‎LCD
Other display features	‎CE
Device interface - primary	‎Touchscreen
Other camera features	‎Front
Form Factor	‎Smartphone
Colour	‎Black
Item Weight	‎300 g", "https://www.amazon.ca/Huawei-Dual-SIM-Factory-Unlocked-Smartphone/dp/B084YWQF5R/ref=sr_1_13?crid=24WG2VTQWGWVJ&dchild=1&keywords=cell%2Bphone&qid=1624463971&sprefix=cell%2Caps%2C184&sr=8-13&th=1", "https://www.newegg.ca/huawei-6-4-gsm-hspa-lte-black/p/23B-001M-00775?Description=Huawei%20P40%20Lite&cm_re=Huawei_P40%20Lite-_-23B-001M-00775-_-Product", "https://www.bestbuy.ca/en-ca/product/huawei-p40-lite-6-4-128-6gb-ram-factory-unlocked-smartphone-brand-new-midnight-black/15374525");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("101", "LG Phoenix 5", "https://images-na.ssl-images-amazon.com/images/I/61u37aGJjqL._AC_SL1500_.jpg", "It''s a smartphone that accomplishes more than the essentials. One with power. The LG Phoenix 5 has you covered. Capture all your favorite moments with 13 MP + wide 5 MP dual cameras, along with 5.7-inch HD+ display. The long-lasting 3000 mAh (non-removable) battery provides reliable power on the go, along with storage up to 16GB of onboard memory and optional microSD support up to 32GB to keep all your favorite memories.", "Brand	‎LG
Manufacturer	‎LG
Model	‎LM-K300AM
Model Name	‎Phoenix 5
Model Year	‎2020
Part Number	‎LM-K300AM
Memory storage capacity	‎16 GB
Flash Memory Installed Size	‎16 GB
Digital Storage Capacity	‎16 GB
OS	‎Android 10.0
Processor Brand	‎MediaTek
Number Of Items	‎1
Standing screen display size	‎5.7 Inches
Display Type	‎LCD
Optical Sensor Resolution	‎13 MP
Batteries included	‎Yes
batteries required	‎No
Battery cell composition	‎Lithium
Battery Power Rating	‎3000 Milliamp Hours
Cellular Technology	‎LTE
Form Factor	‎Bar
Contains Liquid Contents	‎No
Manufacturer	‎LG
Item model number	‎LM-K300AM
Product Dimensions	‎14.8 x 7.1 x 0.86 cm; 145 Grams
ASIN	‎B08PDZKK7X", "https://www.amazon.ca/LG-LM-K300AM-Unlocked-Smartphone-Packaging/dp/B08PDZKK7X/ref=sr_1_16?crid=24WG2VTQWGWVJ&dchild=1&keywords=cell+phone&qid=1624463971&sprefix=cell%2Caps%2C184&sr=8-16", "https://www.newegg.ca/lg-phoenix-5-5-7-silver/p/23B-000F-00290?Description=LG%20Phoenix%205&cm_re=LG_Phoenix%205-_-9SIARXREJ08410-_-Product", "https://www.bestbuy.ca/en-ca/product/lg-phoenix-5-16gb-5-7-factory-unlocked-smartphone-brand-new-silver/15447456");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("101", "Samsung Galaxy A51", "https://images-na.ssl-images-amazon.com/images/I/61HFJwSDQ4L._AC_SL1000_.jpg", "Samsung''s Galaxy A51 SM-A515F specifications and features: this is a 6.5"" (164mm) device with a FHD 2400 x 1080 screen resolution. The phone is powered by the Exynos 9611 soc with a Quad-Core Cortex-A73 2.3GHz & Quad-Core Cortex-A53 1.7GHz configuration. Memory is 4GB with the device offering 128GB internal storage and up to 512GB of external memory. The Galaxy A51 features Accelerometer, Optical Fingerprint Sensor, Gyro Sensor, Geomagnetic Sensor and Hall Sensor. Notable features include Samsung Pay (MST), Bixby, Samsung Pay (NFC). The device measures 158.5 x 73.6 x 7.9mm and weighs 172g.", "Brand	‎Samsung
Manufacturer	‎Samsung
Model	‎SM-A515F/DS
Part Number	‎SM-A515F/DS
RAM	‎4 GB
Memory storage capacity	‎128 GB
Flash Memory Installed Size	‎128
Digital Storage Capacity	‎128 GB
OS	‎Android 10.0
Processor Speed	‎2.3, 1.7 GHz
Scanner Resolution	‎1080 x 2400
Standing screen display size	‎6.5 Inches
Optical Sensor Resolution	‎5.0, 12.0 MP
Batteries included	‎Yes
batteries required	‎Yes
Battery cell composition	‎Lithium
Battery Power Rating	‎4000 Milliamp Hours
Cellular Technology	‎2G
Connector Type	‎NFC
Device interface - primary	‎Touchscreen
Manufacturer	‎Samsung
Item model number	‎SM-A515F/DS
Product Dimensions	‎17.78 x 7.62 x 6.35 cm; 172 Grams
ASIN	‎B082YF7WY5", "https://www.amazon.ca/Samsung-Galaxy-SM-A515F-Factory-Unlocked/dp/B082YF7WY5/ref=sr_1_30?crid=24WG2VTQWGWVJ&dchild=1&keywords=cell%2Bphone&qid=1624463971&sprefix=cell%2Caps%2C184&sr=8-30&th=1", "https://www.newegg.ca/samsung-galaxy-a51-6-5-4g-lte-prism-crush-black/p/N82E16875169911?Description=Samsung%20Galaxy%20A51&cm_re=Samsung_Galaxy%20A51-_-75-169-911-_-Product", "https://www.bestbuy.ca/en-ca/product/samsung-galaxy-a51-64gb-smartphone-crush-black-unlocked-new/15338048");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("101", "Huawei MATE 20 Pro", "https://multimedia.bbycastatic.ca/multimedia/products/1500x1500/133/13387/13387891.jpg", "Brand New Huawei MATE 20 Pro 128GB ROM & 6 GB RAM. Featuring Display : Size:6.39 inches - Colour:Black - Colour gamut: DCI-P3 - Type:OLED - Resolution:2K+ 3120 x 1440, 538 PPI
Chipset : HUAWEI Kirin 980 2 x Cortex-A76 2.6 GHz + 2 x Cortex-A76 1.92 GHz + 4 x Cortex-A55 1.8 GHz
Operating System: Android 9
Memory : 6 GB RAM + 128 GB ROM - NM card: support up to 256 GB
Network : LYA-L0C:FDD LTE: B1 / 2 / 3 / 4 / 5 / 6 / 7 / 8 / 9 / 12 / 17 / 18 / 19 / 20 / 26 / 28 / 66-TDD LTE: B34 / B38 / 39 / 40 / 41-WCDMA: B1 / 2 / 4 / 5 / 6 / 8 / 19-GSM: B2 / 3 / 5 / 8
GPS : GPS (L1 + L5 dual band) / AGPS / Glonass / BeiDou / Galileo (E1 + E5a dual band) / QZSS (L1 + L5 dual band)
Connectivity : 802.11 a/b/g/n/ac (wave2), 2.4 GHz and 5 GHz - Bluetooth 5.0, BLE, SBC, AAC, aptX, aptX HD, LDAC and HWA Audio - Type-C, USB 3.1 GEN1 - Type-C earjack -
PC Data Synchronisation
Sensors : Gravity Sensor- Ambient Light Sensor - Proximity Sensor - Gyroscope - Compass - In-Screen Fingerprint Sensor, Hall sensor, laser sensor, Barometer, Infrared sensor, colour temperature sensor
Camera : Leica Triple camera: 40 MP (Wide Angle Lens, f/1.8 aperture) + 20 MP (Ultra Wide Angle Lens, f/2.2 aperture) + 8 MP (Telephoto, f/2.4 aperture), supports autofocus (laser focus, phase focus, contrast focus), supports AIS (Huawei AI Image Stabilization). Front Camera: Support 3D Depth Sensing Camera. 24 MP, f/2.0 aperture
Audio : Audio File Format: mp3, mp4, 3gp, ogg, amr, aac, flac, wav, midi
Video : Video File Format: 3gp, mp4 - EMUI - EMUI 9.0
Battery : 4200 mAh (typical value) - Wire Charging: MAX 40 W HUAWEI SuperCharge -Wireless charging: 15 W HUAWEI Wireless Quick Charge
NFC : Read Write mode / Peer to Peer mode / Card Emulation mode (payment by *SIM card, or HCE) is supported.
SIM card only supports SIM 1 slot.
SPLASH, WATER, AND DUST RESISTANT
In the box : Handset x 1 - Type-C Earphones x 1- Charger x 1 - Type-C Cable x 1 - Eject tool x 1 - Quick Start Guide x 1 - Protective case x 1 (not for WEU and NEU) - Warranty card x 1 - Type-C to 3.5 mm headphone jack adapter x 1", "Base feature:          Wireless Carrier:
Unlocked
Product Condition:
New
Bluetooth:
5.0, BLE, SBC, AAC, aptX, aptX HD, LDAC and HWA Audio
Dual SIM Card:
No
Storage:
128 GB
Memory - Expansion:
NM card: support up to 256 GB
CPU:
HUAWEI Kirin 980 - x Cortex-A76 2.6 GHz + 2 x Cortex-A76 1.92 GHz + 4 x Cortex-A55 1.8 GHz
RAM Size:
6GB
Phone Operating System:
Android 9
SIM Card:
Nano SIM
Battery - Standby:
10 hours and 23 minutes
Battery - Talk Time:
29 hours
Battery Type:
4200 mAh (typical value) - Wire Charging: MAX 40 W HUAWEI SuperCharge - Wireless charging: 15 W HUAWEI Wireless Quick Charge", "", "https://www.newegg.ca/green-huawei-6-4-gsm-hspa-lte/p/23B-001M-004T8?Description=Huawei%20MATE%2020%20Pro&cm_re=Huawei_MATE%2020%20Pro-_-23B-001M-004T8-_-Product", "https://www.bestbuy.ca/en-ca/product/huawei-mate-20-pro-128gb-unlocked-smartphone-black/13387891");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("101", "Samsung Galaxy Note 5", "https://multimedia.bbycastatic.ca/multimedia/products/1500x1500/132/13221/13221234.jpg", "Operating System: Android 5.1.1 Lollipop, TouchWiz

Display: 5.7-inch QHD (2560x1440, 518 ppi) Super AMOLED

Processor: Exynos 7420 octa-core (2.1GHz quad + 1.5GHz quad)

Storage: 32GB

RAM: 4GB

Rear Camera: 16MP, f/1.9, OIS, phase detection auto focus 4K video, slow motion video

Front Camera: 5MP, f/1.9

Network: LTE cat.9

Connectivity: 802.11ac Wifi, 2.4/5GHz, Bluetooth v4.2 LE ANT+, NFC, Location (GPS, Glonass, Beidou), Sensors, Accelerometer, Proximity, RGB Light, Geo-magnetic, Gyro, Fingerprint, Barometer, Hall, HRM

Charging: Micro USB 2.0, Adaptive Fast Charging, Qi wireless, Powermat wireless, fast wireless charging

Battery: 3000 mAh (Non-removable)

Dimensions: 153.2 x 76.1 x 7.6mm", "Base Features
Wireless Carrier:
Unlocked
Bluetooth:
4.2, A2DP, EDR, LE
Dual SIM Card:
No
Storage:
32 GB
RAM Size:
4
Phone Operating System:
Android
SIM Card:
Nano SIM
Battery - Talk Time:
Up to 22 hours
Battery Type:
Non-removable Li-Po 3000 mAh battery
                       Connectivity
Wi-Fi:
802.11AC; ac; 802.11ac; Wi-Fi 5
NFC:
Yes
Mobile Pay:
Yes
Wireless Charging:
Yes
Cable Connection Type:
Micro USB
                                  Camera
Front-Facing Camera Resolution:
5 MP, f/1.9, 22mm (wide), 1/4.1"", 1.34µm
Rear Camera Resolution:
16 MP, f/1.9, 28mm (wide), 1/2.6"", 1.12µm, OIS, AF
Front Video Capture: Resolution
1440p@30fps
Rear Video Capture: Resolution
2160p@30fps, 1080p@60fps, dual-video rec.
Camera Flash:
Yes", "https://www.amazon.ca/Samsung-Galaxy-SM-N920W8-Black-Unlocked/dp/B0149FJOCG/ref=sr_1_5?dchild=1&keywords=Samsung+Galaxy+Note+5&qid=1624568132&sr=8-5", "", "https://www.bestbuy.ca/en-ca/product/samsung-galaxy-note-5-32gb-smartphone-black-sapphire-unlocked-certified-pre-owned-9-10/13221234");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("101", "Apple iPhone 6S Plus", "https://multimedia.bbycastatic.ca/multimedia/products/1500x1500/135/13537/13537893.jpg", "All Marketplace Refurbished Sellers have been carefully selected to meet the standard of Best Buy-qualified partners.

.

The moment you use iPhone 6s Plus, you know you’ve never felt anything like it. With just a single press, 3D Touch lets you do more than ever. Live Photos brings your memories to life in a powerfully vivid way. And that’s just the beginning. Take a deeper look at iPhone 6s, and you’ll find innovation on every level.

.

• 5.5-inch Retina HD display with 1920 x 1080-pixel resolution at 401ppi is constructed with the strongest cover glass used in any smartphone

• 3D Touch senses how deeply you press the display, opening up new possibilities for how you interact with your content and letting you do all kinds of essential things more quickly and simply

• A9 chip with 64-bit architecture delivers 70% faster CPU and 90% faster GPU for all your favourite graphics-intensive games and apps

• 7.3mm thin design made with 7000 series aluminum, the strongest alloy Apple has ever used in an iPhone

• Integrated M9 motion coprocessor connects to the accelerometer, compass, gyroscope and barometer for a wide range of ﬁtness tracking capabilities

• 12MP iSight camera with 2.2 aperture, state-of-the-art sensors, new image signal processor, advanced pixel technology, autofocus with Focus Pixels, True Tone flash, Panorama (up to 63MP), and optimal image stabilization

• Live Photo feature lets you bring still photos to life at the touch of a button

• Record breathtaking 4K video with 3840 x 2160 resolution at 30 fps and create YouTube-ready 4K films using iMovie in just a few taps

• Optical image stabilization for video

• 5MP FaceTime camera with 2.2 aperture, 720p HD video recording, Retina Flash, face detection, burst mode, and exposure control

• Keep in touch with family and friends with FaceTime video and audio over WiFi or cellular to any FaceTime-enabled device

• Faster connectivity using 802.11a/b/g/n/ac WiFi with MIMO and support for up to 23 LTE bands

• Use Siri to voice and send messages, set reminders and more

• Second generation Touch ID fingerprint sensor is faster and more accurate

• Built-in rechargeable lithium-ion battery with up to 24 hours of talk time and 16 days standby

.

.

What''s an ""unlocked phone?""

Purchasing an unlocked handset gives you more handset options to choose from and more flexibility as to where you use it. Because an unlocked handset isn''t tied to a particular service provider, it can be used with any service provider in the world that operates on a SIM card-based GSM network. Simply place an activated SIM card in the handset and you''ll enjoy the same or similar service. Some premium features may not be available. SIM card sold separately. Speak with your current service provider for more details.", "Base Features
Wireless Carrier:
Unlocked
Bluetooth:
Bluetooth 4.2
Dual SIM Card:
No
Storage:
32 GB
CPU:
Apple A9
RAM Size:
2 GB
Phone Operating System:
IOS
SIM Card:
Nano SIM
Battery - Standby:
Up To 16 Days
Battery - Talk Time:
Up to 24 Hours on 3G
Battery Type:
Non-removable Li-Ion battery
                             Connectivity
Supported Network/Bands:
4G LTE; UMTS/HSPA+; DC-HSDPA
Wi-Fi:
802.11AC; ac; 802.11ac; Wi-Fi 5
NFC:
Yes
Mobile Pay:
Yes
Wireless Charging:
No
Cable Connection Type:
Lightning
Headphone Jack:
Yes
                                Camera
Front-Facing Camera: Resolution
720p HD
Rear Camera Resolution:
12 MP
Front Video Capture Resolution:
720p HD
Rear Video Capture Resolution:
4K video recording at 30 fps; 1080p HD video recording at 30 fps or 60 fps
Camera Flash:
Yes
Other Camera Features:
Autofocus; Digital zoom up to 3x; Slo-mo video support for 1080p at 120 fps and 720p at 240 fps; Time-lapse video with stabilization", "https://www.amazon.ca/Apple-iPhone-Plus-Unlocked-32GB/dp/B0743HW32H/ref=sr_1_4?dchild=1&keywords=Koodo+Apple+iPhone+XR&qid=1624568501&sr=8-4", "", "https://www.bestbuy.ca/en-ca/product/apple-iphone-6s-plus-32gb-smartphone-space-gray-unlocked-refurbished-like-new/13537893");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("101", "Apple iPhone 8 ", "https://multimedia.bbycastatic.ca/multimedia/products/1500x1500/135/13527/13527671.jpg", "All Marketplace Refurbished Sellers have been carefully selected to meet the standard of Best Buy-qualified partners.

.

A new generation of iPhone, the iPhone 8 is designed with the most durable glass ever in a smartphone and a stronger aerospace-grade aluminum band. Charges wirelessly. Resists water and dust. 4.7-inch Retina HD display with True Tone. 12MP camera with new sensor and advanced image signal processor. Powered by A11 Bionic. Supports augmented reality experiences in games and apps.

• 4.7-inch Retina HD display with True Tone

• All-glass and aluminum design, water- and dust resistant

• 12MP camera with OIS and 4K video up to 60fps

• 7MP FaceTime HD camera with Retina Flash for stunning selfies

• Touch ID for secure authentication and Apple Pay

• A11 Bionic, the most powerful and smartest chip in a smartphone

• Wireless charging -- works with Qi chargers (sold separately)

.

.

What''s an ""unlocked phone?""

Purchasing an unlocked handset gives you more handset options to choose from and more flexibility as to where you use it. Because an unlocked handset isn''t tied to a particular service provider, it can be used with any service provider in the world that operates on a SIM card-based GSM network. Simply place an activated SIM card in the handset and you''ll enjoy the same or similar service. Some premium features may not be available. SIM card sold separately. Speak with your current service provider for more details.", "Base Features
Wireless Carrier:
Unlocked
Bluetooth:
Bluetooth 5.0
Dual SIM Card:
No
Storage:
64 GB
CPU:
Apple A11 Bionic
RAM Size:
2 GB
Phone Operating System:
IOS
SIM Card:
Nano SIM
Battery - Talk Time:
Up to 14 Hours
Battery Type:
Non-removable Li-Ion battery
                          Connectivity
Supported Network/Bands:
FDD-LTE (Bands 1, 2, 3, 4, 5, 7, 8, 12, 13, 17, 18, 19, 20, 25, 26, 28, 29, 30, 66)
Wi-Fi:
802.11AC; ac; 802.11ac; Wi-Fi 5
NFC:
Yes
Mobile Pay:
Yes
Wireless Charging:
Yes
Cable Connection Type:
Lightning
Headphone Jack:
No
Other Connectivity:
2G,3G,4G,4G+,Bluetooth,GPS,Lightning,NFC,USB,Wi-Fi
                                       Camera
Front-Facing Camera Resolution:
7 MP
Rear Camera Resolution:
12MP Wide-Angle & Telephoto Cameras
Front Video Capture Resolution:
1080p HD
Rear Video Capture Resolution:
4K Video Recording at 24 fps; 30 fps or 60 fps
Camera Flash:
Yes
Other Camera Features:
Optical Image Stabilization, Quad-LED True Tone Flash", "https://www.amazon.ca/Apple-iPhone-64GB-Unlocked-Refurbished/dp/B078P5BK5G/ref=sr_1_5?dchild=1&keywords=Koodo+Apple+iPhone+XR&qid=1624568679&sr=8-5", "", "https://www.bestbuy.ca/en-ca/product/apple-iphone-8-64gb-smartphone-gold-unlocked-certified-refurbished/13527671");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("101", "Samsung Galaxy J2", "https://images-na.ssl-images-amazon.com/images/I/81xGUG4BxaL._AC_SL1500_.jpg", "With a 5"" display, 8MP main camera with an LED flash, 5MP selfie camera, a memory card slot, and a removable battery, the Samsung Galaxy J2 is an entry-level phone that''s perfect for you. It also gives you an Easy Mode option with a simplified interface.", "Base Features
Wireless Carrier:
Unlocked
Product Condition:
New
RAM Size:
2 GB
Warranty
Seller''s Warranty - Parts:
90 Days
Seller''s Warranty - Labour:
90 Days", "https://www.amazon.ca/Samsung-Galaxy-Shine-Unlocked-Phone/dp/B08NRNSHLD/ref=sr_1_10?dchild=1&keywords=Koodo+Apple+iPhone+XR&qid=1624569195&sr=8-10", "", "https://www.bestbuy.ca/en-ca/product/samsung-galaxy-j2-16-gb-black-5-unlocked-phone-4g-lte/14680406");
INSERT INTO products(p_overallReview, p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES (9, "102", "Sony MDRZX110 Over-Ear Headphones", "https://images-na.ssl-images-amazon.com/images/I/51eJUpMRnzL._AC_SL1000_.jpg", "Maximizing your personal audio experience has never been easier than with SONY ZX-Series Monitor headphones. Built with comfort and performance in mind, there''s no need to compromise.", "Batteries ‏ : ‎ 1 Lithium ion batteries required.
Is Discontinued By Manufacturer ‏ : ‎ No
Product Dimensions ‏ : ‎ 14.91 x 4.6 x 19.99 cm; 135 Grams
Date First Available ‏ : ‎ March 25 2014
Manufacturer ‏ : ‎ Sony Electronics Inc.
Place of Business ‏ : ‎ SAN DIEGO, CA, 92127 US
ASIN ‏ : ‎ B00NJ2M33I
Item model number ‏ : ‎ MDRZX110/BLK", "https://www.amazon.ca/Sony-MDRZX110-Over-Ear-Headphones-Black/dp/B00NJ2M33I/ref=sr_1_5?dchild=1&keywords=headphones&qid=1624464389&sr=8-5", "https://www.newegg.ca/p/0X6-085D-00348?Description=Sony%20MDRZX110&cm_re=Sony_MDRZX110-_-0X6-085D-00348-_-Product", "https://www.bestbuy.ca/en-ca/product/sony-mdrzx110-over-ear-headphones-black-axgear/15371864");
INSERT INTO products(p_overallReview, p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES (7, "102", "Bose QuietComfort 35 Wireless Headphones II", "https://images-na.ssl-images-amazon.com/images/I/81%2BjNVOUsJL._AC_SL1500_.jpg", "What happens when you clear away the noisy distractions of the world? Concentration goes to the next level. You get deeper into your music, your work or whatever you want to focus on. That’s the power of Bose QuietComfort 35 wireless headphones II, the most powerful Bose noise cancelling headphones yet. Put them on and get closer to what you’re most passionate about. They’re Alexa-enabled, so you can enjoy entertainment, get information and manage your day—all without looking at your phone. Adjust your level of noise cancellation between three settings using the Action button or the Bose Connect app. Volume-optimised EQ gives you balanced audio performance at any volume, and a noise-rejecting dual-microphone system provides clearer calls, even in noisy environments. And with easy Bluetooth pairing, 20 hours of battery life and a durable, comfortable fit, you can keep the music or the quiet going all day long. Available in Black, Silver or new, limited-edition Triple Midnight. Included: QuietComfort 35 II, carrying case, charging cable, audio cable for enjoying music without battery power. Audio cable:1.2 m", "Brand	‎BOSE
Manufacturer	‎BOSE
Place of Business	‎STOW, MA, 01775 US
Model	‎789564-0010
Model Name	‎Quietcomfort 35 II
Model Year	‎2017
Part Number	‎789564-0010
Hardware interface	‎3.5mm Audio
Special features	‎Wireless, Microphone, Noise-Canceling
Number Of Items	‎1
Standing screen display size	‎3 Inches
Color Screen	‎No
Microphone Form Factor	‎Dual Microphone
Headphones Form Factor	‎Over Ear
Voltage	‎220 Volts
Batteries included	‎Yes
batteries required	‎Yes
Battery cell composition	‎Lithium Ion
Cable Feature	‎Without Cable
Connector Type	‎Bluetooth, Wired, NFC
Contains Liquid Contents	‎No
Includes Rechargable Battery	‎Yes
Remote control included?	‎No
Supports Bluetooth Technology	‎Yes
Manufacturer	‎BOSE
Item model number	‎789564-0010
Product Dimensions	‎8.13 x 17.02 x 18.03 cm; 235.87 Grams
ASIN	‎B0756CYWWD", "https://www.amazon.ca/QuietComfort-Wireless-Headphones-Cancelling-Control/dp/B0756CYWWD/ref=sxin_11?asc_contentid=amzn1.osa.6cc9943b-610a-4b4d-8175-0b7a22e19b11.A2EUQ1WTGCTBG2.en_CA&asc_contenttype=article&ascsubtag=amzn1.osa.6cc9943b-610a-4b4d-8175-0b7a22e19b11.A2EUQ1WTGCTBG2.en_CA&creativeASIN=B0756CYWWD&cv_ct_cx=headphones&cv_ct_id=amzn1.osa.6cc9943b-610a-4b4d-8175-0b7a22e19b11.A2EUQ1WTGCTBG2.en_CA&cv_ct_pg=search&cv_ct_we=asin&cv_ct_wn=osp-single-source-earns-comm&dchild=1&keywords=headphones&linkCode=oas&pd_rd_i=B0756CYWWD&pd_rd_r=eb364dd6-9075-41f0-939a-64298aab5992&pd_rd_w=hwCac&pd_rd_wg=9Os7o&pf_rd_p=fd4969f1-ce1a-42e7-85d6-f4cb7192108a&pf_rd_r=RRPWDR8K5QMK80DNGBSF&qid=1624464576&sr=1-1-64f3a41a-73ca-403a-923c-8152c45485fe&tag=bestcontca-20", "https://www.newegg.ca/black-bose-789564-0010-wireless/p/N82E16826627080?Description=Bose%20QuietComfort%2035&cm_re=Bose_QuietComfort%2035-_-26-627-080-_-Product", "https://www.newegg.ca/black-bose-789564-0010-wireless/p/N82E16826627080?Description=Bose%20QuietComfort%2035&cm_re=Bose_QuietComfort%2035-_-26-627-080-_-Product");
INSERT INTO products(p_overallReview, p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES (5, "102", "Sanyun SW208 3"" Active Bluetooth Bookshelf Speakers", "https://images-na.ssl-images-amazon.com/images/I/81PdWvZcOBL._AC_SL1500_.jpg", "【SMALL HIFI BOOKSHELF SPEAKERS】SW-208 is a small bookshelf speaker with HiFi sound quality. It adopts standard bookshelf speaker system design, i.e. direct/reflective speaker system. Can be placed at will, can easily create a rich stereo sense and strong sound pressure.
【30Wx2 CARBON FIBER SEPAKER UNIT】The speaker unit is designed with carbon fiber material and multi-layer voice coil technology, which is proprietary by Sanyun Company. It has excellent sound performance, warm and thick medium frequency, deep and powerful low frequency, clear and bright high frequency sound characteristics. And the speaker unit has a super durability and stability, can work steadily in any environment.
【APTX CODEC, 24 bit DAC AND BLUETOOTH 5.0】When connecting with USB cable, aptX Codec and the built-in 24 bit DAC can obtain the digital audio signal directly, which can provide 3D surround sound and higher fidelity sound quality, especially suitable for games. Bluetooth 5.0 connection, stable transmission.
【TREBLE AND BASS ADJUSTMENT】To achieve true HiFi sound quality, set the total volume, treble and bass adjustment knobs on the side of main speaker. Please adjust the most suitable sound according to your preferences, or adjust the best sound effect according to different sound types.
【QUIET STANDBY and ENERGY SAVING】Built in noise elimination system. Built-in chip, intelligent filter input audio, automatic filter to remove noise, keep the speakers absolutely quiet while standby. The design standard conforms to EU ER2 standard, saving energy. A good speaker, not only can provide good sound performance, when not in use, can quietly let you forget its existence.", "Brand	‎Sanyun
Manufacturer	‎Sanyun
Model	‎Sanyun-SW208
Part Number	‎Sanyun-SW208
Speakers maximum output power	‎50 Watts
Output Wattage	‎50 Watts
Wattage	‎60 watts
Power source type	‎Corded Electric
Batteries included	‎No
batteries required	‎No
Assembled Diameter	‎3 inches
Connector Type	‎Bluetooth, Usb
Includes Rechargable Battery	‎No
Manufacturer	‎Sanyun
Item model number	‎Sanyun-SW208
Product Dimensions	‎19 x 11.89 x 13.59 cm; 2.37 Kilograms
ASIN	‎B08777GG4P", "https://www.amazon.ca/Sanyun-Active-Bluetooth-Bookshelf-Speakers/dp/B08777GG4P/ref=sr_1_9?dchild=1&keywords=speakers&qid=1624464692&sr=8-9", "", "");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("102", "JBL PartyBox 310 Portable Bluetooth Party Speaker", "https://images-na.ssl-images-amazon.com/images/I/71P-IPIUsOL._AC_SL1500_.jpg", "Take your karaoke parties to the next level with the JBL PartyBox 310. This mobile entertainment machine is designed to perform anywhere and everywhere your music takes you. Built-in mic and guitar inputs, perfect for live performances, while a dynamic light show, cool vocal effects and 240 watts of JBL Pro Sound make you look and sound like a rock star. With Bluetooth connectivity and up to 18 hours of battery life, the entertainment options are endless. Bring life to the party with the JBL PartyBox 310.", "Brand	‎JBL
Manufacturer	‎JBL
Place of Business	‎BAIE D''URFE, QC, H9X 4B7 CA
Model	‎JBLPARTYBOX310AM
Model Name	‎Partybox 310
Part Number	‎JBLPARTYBOX310AM
Mounting Hardware	‎1 x Partybox 310, 1 x AC Power cord, 1 x Quick Start Guide, 1 x Warranty card, 1 x Safety sheet
Number Of Items	‎1
Speakers Nominal Output Power	‎240 Watts
Speakers maximum output power	‎240 Watts
Speaker amplification type	‎Active
Speaker Connectivity	‎Bluetooth
Output Wattage	‎240 Watts
Voltage	‎12 Volts
Wattage	‎240 watts
Power source type	‎Battery Powered
Battery Average Life	‎18 Hours
Batteries included	‎Yes
batteries required	‎Yes
Battery cell composition	‎Lithium Ion
Signal To Noise Ratio	‎80 dB
Speaker Output Channel Quantity	‎1
Total Usb Ports	‎1
Connector Type	‎Bluetooth
Device interface - primary	‎Buttons
Contains Liquid Contents	‎No
Includes Rechargable Battery	‎Yes
Remote control included?	‎No
Manufacturer	‎JBL
Item model number	‎JBLPARTYBOX310AM
Product Dimensions	‎36.83 x 32.51 x 68.58 cm; 19.05 Kilograms
ASIN	‎B08HBG3M7M", "https://www.amazon.ca/JBL-PartyBox-Portable-Bluetooth-Dazzling/dp/B08HBG3M7M/ref=sr_1_15?dchild=1&keywords=speakers&qid=1624464692&sr=8-15", "", "https://www.bestbuy.ca/en-ca/product/jbl-partybox-310-splashproof-bluetooth-wireless-speaker-black/15002133");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("102", "Anker SoundCore Mini", "https://images-na.ssl-images-amazon.com/images/I/61WZ-ZuU3oL._AC_SL1200_.jpg", "Compact And Powerful: Super-portable Bluetooth speaker delivers powerful sound and robust bass through an advanced 5W driver and passive subwoofer.Unstoppable Music: Micro SD support and AUX capability provide endless audio options.Extensive Connectivity: Utilizes Bluetooth 4.0 technology for seamless device linking and a 66ft connection range.Extended Playtime: Anker battery technology supplies 15 hours of continuous playtime on a single charge more than double that of comparable speaker", "Brand	‎Anker
Manufacturer	‎Anker
Place of Business	‎MANHATTAN BEACH, CA, 90266 US
Model	‎AK-A3101111
Model Name	‎SoundCore mini
Part Number	‎AK-A3101111
Mounting Hardware	‎Speaker
Number Of Items	‎1
Web Browser Included	‎No
Color Screen	‎No
Speakers Nominal Output Power	‎5 Watts
Speakers maximum output power	‎5 Watts
Speaker amplification type	‎Passive
Speaker Connectivity	‎Bluetooth; USB; Auxilliary (3.5mm)
Voltage	‎5 Volts
Wattage	‎5 watts
Power source type	‎Battery Powered
Battery Average Life	‎15 Hours
Batteries included	‎Yes
batteries required	‎Yes
Battery cell composition	‎Lithium Ion
Connector Type	‎Bluetooth, Auxiliary, USB
Mounting type	‎Speaker
Contains Liquid Contents	‎No
Has Audio Recording	‎No
Includes Rechargable Battery	‎Yes
Includes Ac Adapter	‎No
Remote control included?	‎No
Manufacturer	‎Anker
Item model number	‎AK-A3101111
Product Dimensions	‎6.86 x 6.86 x 6.86 cm; 200 Grams
ASIN	‎B01HTH3C8S", "https://www.amazon.ca/Anker-SoundCore-Super-Portable-Noise-Cancelling-Microphone/dp/B01HTH3C8S/ref=sr_1_32?dchild=1&keywords=speakers&qid=1624464692&sr=8-32", "https://www.newegg.ca/p/0X6-085D-005G5?Description=Anker%20SoundCore%20Mini\&cm_re=Anker_SoundCore%20Mini\-_-0X6-085D-005G5-_-Product", "https://www.bestbuy.ca/en-ca/product/anker-soundcore-mini-super-portable-bluetooth-speaker-with-15-hour-playtime-66-foot-bluetooth-range-enhanced-bass-black-axgear/15429197");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("102", "Sony WH-1000XM4 Over-Ear Noise Cancelling Bluetooth Headphones", "https://c1.neweggimages.com/ProductImageCompressAll1280/0G6-001C-00614-S19.jpg", "Adaptive noise cancellation with Dual Noise Sensor and powerful Edge-AI technology combine to bring you an intelligent, premium audio experience. The built-in Google Assistant and Amazon Alexa let you control your music hands-free with voice controls.", "Sound isolating: yes Echo Reduction: Yes                           Wireless: Yes                       Bluetooth: Yes                                  Built-in Mic: Yes                        Android Control: Yes
Voice Assistant Built-In: Amazon Alexa and Google Assistant
Works with Google Assistant:
Yes
Works with Amazon Alexa: Yes
Folding: Yes
Step Tracking: No
Sleep Aid: No
Sleep Tracking: No
Driver Unit Size: 40 mm
Frequency Response
4 Hz- 40000 Hz
Colour: Black
Colour Family: Black
Weight: 250 g", "https://www.amazon.ca/Sony-WH-1000XM4-Canceling-Headphones-WH1000XM4/dp/B0863TXGM3", "https://www.newegg.ca/sony-wh1000xm4b-bluetooth-headset-black/p/0G6-001C-00614", "https://www.bestbuy.ca/en-ca/product/sony-wh-1000xm4-over-ear-noise-cancelling-bluetooth-headphones-black/14777258");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("102", "Bose SoundSport In-Ear Wireless Headphones", "https://multimedia.bbycastatic.ca/multimedia/products/500x500/104/10424/10424243.jpg", "The word ""wireless"" will soon be music to your ears with the Bose SoundSport wireless headphones. With no wires in the way, you''re free to focus on pushing that extra rep or running that extra mile. Featuring 6 hours of battery life and StayHear+ tips, these headphones provide all the support you need to power through your workout.", "Sports & Fitness Ear Clip: Yes
Sound Isolating: No
Noise Cancelling: No
Echo Reduction: No
Wireless: Yes
Bluetooth:
Bluetooth 4.2; A2DP; HFP; AVRCP; BLE
RF Wireless: No
NFC Ready: Yes
Wireless Talk Time: 6 h
Charge Time: 2 h
Effective Wireless Range: 10 m
Designed for Sports: Yes
Designed for Kids: No
DJ Style: No
Professional Grade: No
Water/Sweat Resistant: Yes
Inline Volume Control: Yes
iPod/iPhone Control: Yes
Built-in Mic: Yes
Android Control: Yes
Fitness Tracking: Yes
Heart Rate Monitor: No
Folding: No
Step Tracking: No
Cord Length: 0.55 m
Ear Cushion Material: Silicone
Driver Unit Size: Not Applicable
Power Source:Rechargeable Battery
Frequency Response: Not Applicable
Impedance: Not Applicable
Sensitivity: Not Applicable
Colour: Black
Colour Family: Black
Weight: 23 g", "https://www.amazon.ca/Bose-SoundSport-Wireless-Headphones-Black/dp/B01L7PSJFO/ref=sr_1_2?dchild=1&keywords=Bose+SoundSport+In-Ear+Wireless+Headphones&qid=1624481478&s=electronics&sr=1-2", "", "https://www.bestbuy.ca/en-ca/product/bose-bose-soundsport-in-ear-wireless-headphones-black-soundsport-wrls-blk/10424243");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("102", "Skullcandy Dime In-Ear Sound Isolating Truly Wireless Headphones", "https://images-na.ssl-images-amazon.com/images/I/71k%2BG-1GxDL._AC_SL1500_.jpg", "Small but mighty, these Skullcandy Dime in-ear headphones are perfect for taking along on the go. They utilise Truly Wireless technology so you''re never tethered to a device while powerful drivers deliver rich, clear sound. Each ear bud is equipped with a microphone and can be used independently for the ultimate in convenience.", "Sports & Fitness Ear Clip: No
Sound Isolating: Yes
Noise Cancelling: No
Echo Reduction: No
Truly Wireless: Yes
Wireless: Yes
Bluetooth: Yes
Bluetooth: Yes
RF Wireless: No
NFC Ready: No
Charge Time: 2.5 h
Effective Wireless Range: 20 m
Designed For Gaming: No
Designed for Sports: No
Designed for Kids: No
DJ Style: No
Professional Grade: Yes
Water/Sweat Resistant: Yes
Inline Volume Control: Yes
Volume-Limiting: No
iPod/iPhone Control: Yes
Built-in Mic: Yes
Android Control: Yes
Works with Google Assistant: No
Works with Amazon Alexa: Yes
Fitness Tracking: No
Heart Rate Monitor: No
Folding: No
Step Tracking: No
Sleep Aid: No
Sleep Tracking: No
Mental Wellness: No
Plug Material: Nickel plating on USB jack; Gold plate on Aux cable plug pin
Plug Shape: Straight
Driver Unit Size: 6 mm
Power Source: Lithium Polymer
Frequency Response: 20 Hz - 20 KHz
Impedance: 16Ω±15%
Sensitivity: 83dB±3dB
Colour: Black
Colour Family: Black
Weight: 400 g", "https://www.amazon.ca/Skullcandy-Wireless-Earbuds-Black-S2SSW-M003/dp/B07R1Q1Z75/ref=sr_1_3?dchild=1&keywords=Skullcandy+Dime+In-Ear+Sound+Isolating+Truly+Wireless+Headphones&qid=1624481844&s=electronics&sr=1-3", "https://www.newegg.ca/p/0X6-08Y7-00N96?Description=Skullcandy%20Dime%20In-Ear&cm_re=Skullcandy_Dime%20In-Ear-_-9SIAV93F0A2802-_-Product", "https://www.bestbuy.ca/en-ca/product/skullcandy-dime-in-ear-sound-isolating-truly-wireless-headphones-black/15348436");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("102", "Jabra Elite Active 65t In-Ear Truly Wireless Headphones", "https://images-na.ssl-images-amazon.com/images/I/81K-QPk%2Bf1L._AC_SL1500_.jpg", "With the Jabra Elite Active 65t In-Ear Passive Noise Cancelling Truly Wireless Bluetooth Headphones, you don''t have to be tied down to your mobile device. These earbuds are specially engineered to provide optimum clarity for phone calls and boast an adjustable equalizer so you can customize your music any way you want it.", "Sports & Fitness Ear Clip: No
Sound Isolating: Yes
Noise Cancelling Type: Passive Noise Cancelling
Noise Cancelling: No
Echo Reduction: No
Truly Wireless: Yes
Wireless: Yes
Bluetooth: Yes
RF Wireless: No
NFC Ready: No
Wireless Talk Time: 15 h
Wireless Standby Time: 1 h
Charge Time: 2 h
Effective Wireless Range: 10 m
Designed For Gaming: No
Designed for Sports: Yes
Designed for Kids: No
DJ Style: No
Professional Grade: Yes
Water/Sweat Resistant: Yes
Inline Volume Control: Yes
iPod/iPhone Control: Yes
Built-in Mic: Yes
Android Control: Yes
Works with Google Assistant: Yes
Fitness Tracking: Yes
Heart Rate Monitor: No
Folding: No
Step Tracking: Yes
Ear Cushion Material: Silicone
Driver Unit Size: 5.1 mm
Power Source: Battery
Frequency Response: 20Hz - 20kHz
Impedance: 16 Ohm
Sensitivity: 103 dBSPL
Colour: Titanium; Black
Colour Family: Black
Weight: 79.3 g", "https://www.amazon.ca/Jabra-100-99010000-20-Wireless-Bluetooth-Smartphones/dp/B07DS8TSKT/ref=sr_1_1?dchild=1&keywords=Jabra+Elite+Active+65t+In-Ear+Truly+Wireless+Headphones&qid=1624482223&s=electronics&sr=1-1", "", "https://www.bestbuy.ca/en-ca/product/jabra-elite-active-65t-in-ear-truly-wireless-headphones-black-only-at-best-buy/12603667");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("102", "Sony WH-RF400 Over-Ear Sound Isolating RF Headphones", "https://multimedia.bbycastatic.ca/multimedia/products/1500x1500/130/13029/13029605.jpg", "Whether you''re listening to music or watching your favourite movies, these Sony home theatre headphones will immerse you in the entertainment. They feature an over-ear design for comfort and RF connectivity for wireless convenience. With an enhanced range, a noise reduction system, and a transmitter dock that connects to your TV, you can listen almost anywhere.", "Sports & Fitness Ear Clip: No
Sound Isolating: Yes
Noise Cancelling: No
Echo Reduction: Yes
Truly Wireless: No
Wireless: Yes
Bluetooth: No
RF Wireless: Yes
NFC Ready: No
Wireless Talk Time: 20 Hours
Charge Time: 7 Hours
Effective Wireless Range: 45.72 m
Power Source: 2 x AAA Batteries
Frequency Response: 10 Hz - 22 KHz
Impedance: 32 Ohm
Sensitivity: 100 dBm
Colour: Black
Weight: 1000 g", "", "https://www.newegg.ca/p/1VH-000R-000P9?Description=Sony%20WH-RF400&cm_re=Sony_WH-RF400-_-9SIAKUCD3H5704-_-Product", "https://www.bestbuy.ca/en-ca/product/sony-wh-rf400-over-ear-sound-isolating-rf-headphones-black/13029605");
INSERT INTO products(p_overallReview, p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES (4, "103", "Canon PowerShot SX540", "https://images-na.ssl-images-amazon.com/images/I/81l6xdQOHyL._AC_SL1500_.jpg", "Make the most of those special events with the Canon 20.3 Megapixel Powershot SX540 HS Digital Camera. It features 20.3 megapixels, 1080p Full HD video, and 50x optical zoom for the highest quality images and videos. Plus, the story highlights feature helps you recap your favorite days and events.", "Batteries ‏ : ‎ 1 Lithium ion batteries required. (included)
Is Discontinued By Manufacturer ‏ : ‎ No
Product Dimensions ‏ : ‎ 4.7 x 11.94 x 8.13 cm; 442.25 Grams
Date First Available ‏ : ‎ Jan. 5 2016
Manufacturer ‏ : ‎ Canon Canada (Direct)
Place of Business ‏ : ‎ BRAMPTON, ON, L6Y 5Z7 CA
ASIN ‏ : ‎ B019UDIAI6
Item model number ‏ : ‎ 1067C001", "https://www.amazon.ca/Canon-PowerShot-SX540-Optical-Built/dp/B019UDIAI6/ref=sr_1_16?dchild=1&keywords=cameras&qid=1624465037&sr=8-16", "https://www.newegg.ca/canon-powershot-sx540-hs-slr-style/p/N82E16830120835?Description=Canon%20PowerShot%20SX540&cm_re=Canon_PowerShot%20SX540-_-30-120-835-_-Product", "https://www.bestbuy.ca/en-ca/product/canon-canon-powershot-sx540-hs-wifi-20-3mp-50x-optical-zoom-digital-camera-black-1067c001/10406701");
INSERT INTO products(p_overallReview, p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES (8, "103", "Canon PowerShot SX420", "https://images-na.ssl-images-amazon.com/images/I/61xQRROBrRL._AC_SL1200_.jpg", "The Canon Powershot SX420 IS Digital Camera packs a super zoom in a small package. With 20.0 megapixels a 3 in. LCD screen and 720p HD video this camera sacrificing nothing in quality. Plus the smart auto selects and scene modes provide freedom and creativity.SUPPORTED OPERATING SYSTEM:Windows 10 / 8.1 / 8 / 7 SP1 Mac OS X 10.9 / 10.10 / 10.11 For Wi-Fi connection to a PC: Windows 10 / 8.1 / 8 / 7 SP1 Mac OS X 10.9 / 10.10 For Image Transfer Utility: Windows 10 / 8.1 / 8 / 7 SP1 Mac OS X 10.9 / 10.10 / 10.11 PC & Macintosh
Shooting Capacity: Approx. 195 shots Approx. 260 shots in ECO Mode. Video Recording Time: Approx. 50 min.", "Batteries ‏ : ‎ 1 C batteries required. (included)
Is Discontinued By Manufacturer ‏ : ‎ No
Product Dimensions ‏ : ‎ 8.64 x 10.41 x 6.86 cm; 326.02 Grams
Date First Available ‏ : ‎ Jan. 8 2016
Manufacturer ‏ : ‎ Canon Canada (Direct)
Place of Business ‏ : ‎ BRAMPTON, ON, L6Y 5Z7 CA
ASIN ‏ : ‎ B019UDI5PO
Item model number ‏ : ‎ 1068C001", "https://www.amazon.ca/Canon-PowerShot-SX420-Optical-Built/dp/B019UDI5PO/ref=bmx_m727cf0o_1/132-7245197-5750229?pd_rd_w=vxuYc&pf_rd_p=c8dace55-4212-4299-be96-0cdf9dabee5e&pf_rd_r=95TJAFE4D2960HCRXGAM&pd_rd_r=cbea9756-609c-4b93-bcf4-b842a6de63a3&pd_rd_wg=j9VpW&pd_rd_i=B019UDI5PO&psc=1", "https://www.newegg.ca/p/0UP-000F-01634?Description=Canon%20PowerShot%20SX420&cm_re=Canon_PowerShot%20SX420-_-9SIAKXCEEP6488-_-Product", "https://www.bestbuy.ca/en-ca/product/canon-canon-powershot-sx420-is-wifi-20-0mp-42x-optical-zoom-digital-camera-black-1068c001/10406705");
INSERT INTO products(p_overallReview, p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES (5, "103", "Canon PowerShot SX730 HS", "https://images-na.ssl-images-amazon.com/images/I/71t9FCz-4yL._AC_SL1500_.jpg", "A versatile and compact point-and-shoot, the black PowerShot SX730 HS from Canon combines a wide-reaching zoom with apt multimedia recording capabilities. Employing a 20.3MP 1/ 2.3"" High-Sensitivity CMOS sensor and DIGIC 6 image processor, smooth image quality is afforded along with enhanced low-light sensitivity and minimal noise when working with sensitivities up to ISO 3200. The sensor and processor also enable shooting continuously at a rate of 5.9 fps as well as recording Full HD 1080p/60 video. Benefitting the imaging capabilities is a 40x zoom lens, which covers a 24-960mm equivalent focal length range, to suit photographing in a wide variety of situations.

Intelligent IS complements this reach by minimizing the appearance of camera shake for sharper handheld shooting. Sleek and pocketable, the SX730 HS is also characterized by its 3.0"" 922k-dot tilting LCD monitor, which is perfect for shooting from low angles or taking well-composed selfies, and built-in Wi-Fi with NFC and Bluetooth connectivity allow you to wirelessly share imagery and remotely control the camera from a paired smartphone or tablet.", "Batteries ‏ : ‎ 1 A batteries required. (included)
Is Discontinued By Manufacturer ‏ : ‎ No
Product Dimensions ‏ : ‎ 4.06 x 10.92 x 6.35 cm; 300.5 Grams
Date First Available ‏ : ‎ April 6 2017
Manufacturer ‏ : ‎ Canon
Place of Business ‏ : ‎ BRAMPTON, ON, L6Y 5Z7 CA
ASIN ‏ : ‎ B06Y125DWZ
Item model number ‏ : ‎ 1791C001", "https://www.amazon.ca/Canon-PowerShot-SX730-HS-Black/dp/B06Y125DWZ/ref=pd_di_sccai_9/132-7245197-5750229?pd_rd_w=fCij7&pf_rd_p=e92f388e-b766-4f7f-aac1-ee1d0056e8fb&pf_rd_r=1J5NEF5323JKMEZE5438&pd_rd_r=245e5353-6c76-4d1a-a6e0-afa33d268003&pd_rd_wg=X4C5T&pd_rd_i=B06Y125DWZ&psc=1", "https://www.newegg.ca/p/0ZS-000J-005H1?Description=Canon%20PowerShot%20SX730%20HS&cm_re=Canon_PowerShot%20SX730%20HS-_-9SIAG6B71K0652-_-Product", "https://www.bestbuy.ca/en-ca/product/canon-powershot-sx730-hs-wi-fi-20-3mp-40x-optical-zoom-digital-camera-32gb-sd-card-only-at-best-buy/14935381");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("103", "Canon PowerShot ELPH 180", "https://images-na.ssl-images-amazon.com/images/I/81TaKKV8wdL._AC_SL1500_.jpg", "For those wanting a simple way to capture moments with family friends and more the slim stylish PowerShot ELPH 180 camera has easy-to-use features to help create photos that are as stunning as you want. The 8x Optical Zoom lets you get close to the action while the 20.0 Megapixel* CCD sensor with DIGIC 4+ Image Processor help produce vibrant clear images to share or print. Take more than just still images with the ability to record movies at 720p HD. For added convenience Smart AUTO figures out suitable settings for what you''re photographing so you don''t have to worry about finding a picture mode yourself. To help reduce the effects of camera shake Digital IS helps keep blur to a minimum. On top of that the Auto Zoom feature can automatically close in on your subject and keep it in focus for easy shooting.", "Batteries ‏ : ‎ 1 Lithium Polymer batteries required. (included)
Is Discontinued By Manufacturer ‏ : ‎ No
Product Dimensions ‏ : ‎ 9.52 x 2.21 x 5.43 cm; 124.74 Grams
Date First Available ‏ : ‎ Jan. 8 2016
Manufacturer ‏ : ‎ Canon Canada (Direct)
Place of Business ‏ : ‎ BRAMPTON, ON, L6Y 5Z7 CA
ASIN ‏ : ‎ B019UDHT6U
Item model number ‏ : ‎ 1096C001", "https://www.amazon.ca/Canon-PowerShot-ELPH-Sensor-Optical/dp/B019UDHT6U/ref=pd_di_sccai_3/132-7245197-5750229?pd_rd_w=Ulm5b&pf_rd_p=e92f388e-b766-4f7f-aac1-ee1d0056e8fb&pf_rd_r=35YJXJZXDHKN3SYEQHFM&pd_rd_r=3791b137-c1d2-44bc-ab26-a8630bb42072&pd_rd_wg=Y0ImG&pd_rd_i=B019UDHT6U&psc=1", "https://www.newegg.ca/p/0UP-000F-01616?Description=Canon%20PowerShot%20ELPH%20180&cm_re=Canon_PowerShot%20ELPH%20180-_-9SIAFY7EEN8774-_-Product", "https://www.bestbuy.ca/en-ca/product/canon-canon-powershot-elph-180-20-0mp-8x-optical-zoom-digital-camera-red-1096c001/10406707");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("103", "Canon PowerShot G7 X Mark II ", "https://images-na.ssl-images-amazon.com/images/I/416b8xNfDJL._AC_.jpg", "Illuminate Your Passion. Stay inspired with the Power Shot G7 X Mark II camera, which combines exhilarating speed and performance with a smart, compact design. It can be ideal for travel, events and anywhere on the go, or as a secondary camera, and features a high-performance 1.0-inch 20.1 Megapixel CMOS sensor as well as a bright f/1.8-2.8 lens to help capture impressive images whenever your creativity sparks, even in low light conditions. The new DIGIC 7 Image Processor immediately pays dividends with improved auto focus tracking, enhanced IS and superb image clarity even when shooting with a high ISO. For increased flexibility, the Power Shot G7 X Mark II offers high-speed continuous shooting up to 8 fps in RAW, JPEG and RAW plus JPEG modes, and is equipped with Full HD capability, built-in Wi-Fi and NFC and in-camera RAW conversion, giving you everything you need to capture inspiring images and video and share them with ease. Supported operating system - Windows 10 / 8.1 / 8 / 7 SP1 ¹ Mac OS X 10.9 / 10.10 / 10.11 For Wi-Fi connection to a PC: Windows 10 / 8.1 / 8 / 7 SP1 Mac OS X 10.9 / 10.10 For Image Transfer Utility: Windows 10 / 8.1 / 8 / 7 SP1 Mac OS X 10.9 / 10.10 / 10.11.", "Batteries ‏ : ‎ 1 Lithium Metal batteries required. (included)
Is Discontinued By Manufacturer ‏ : ‎ No
Product Dimensions ‏ : ‎ 4.19 x 6.1 x 10.54 cm; 453.59 Grams
Date First Available ‏ : ‎ May 19 2016
Manufacturer ‏ : ‎ Canon Cameras
Place of Business ‏ : ‎ BRAMPTON, ON, L6Y 5Z7 CA
ASIN ‏ : ‎ B01BV14OXA
Item model number ‏ : ‎ 1066C001", "https://www.amazon.ca/Canon-PowerShot-Mark-Digital-Camera/dp/B01BV14OXA/ref=pd_di_sccai_8/132-7245197-5750229?pd_rd_w=WJvaQ&pf_rd_p=e92f388e-b766-4f7f-aac1-ee1d0056e8fb&pf_rd_r=ERT9D242KGKV3XH6QN40&pd_rd_r=7ae25090-0b92-49d8-8829-78addf4a456e&pd_rd_wg=t9tKt&pd_rd_i=B01BV14OXA&psc=1", "https://www.newegg.ca/canon-powershot-g7-x-mark-ii-compact/p/N82E16830120850?Description=Canon%20PowerShot%20G7%20X%20Mark%20II&cm_re=Canon_PowerShot%20G7%20X%20Mark%20II-_-30-120-850-_-Product", "https://www.bestbuy.ca/en-ca/product/canon-powershot-g7-x-mark-ii-wi-fi-20-1mp-4-2x-optical-zoom-digital-camera-black-1066c001/10414355");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("103", "GoPro HERO9", "https://images-na.ssl-images-amazon.com/images/I/71f8wMHfklL._AC_SL1500_.jpg", "Capture smooth images and video footage

    5K video resolution (5120 x 2880) records in stunning detail, even when you''re zoomed in
    23.6MP CMOS image sensor captures images and footage in true-to-life clarity and colours
    LiveBurst records everything that happens 1.5 seconds before and after your shot so you can pick your favourite frame
    Intuitive rear touch screen and front display allows you to frame shots, snap a selfie, or playback footage to bring greater control to what you shoot

Shoot your journey wherever it takes you

    Rugged waterproof design allows you to shoot up to 33 feet underwater without a housing
    Built-in mounting means you can flip out the folding fingers and attach your camera to any mount
    Live-stream in 1080p via the GoPro app and save the footage to your SD card (supports cards up to 256GB, sold separately)
    Mount the camera to your computer to use it as a 1080p webcam

Steady shooting features

    HyperSmooth 3.0 technology helps stabilise your shots to deliver smooth footage
    Horizon (up to 45% tilt) and linear levelling ensure your footage is straight and stable
    Digital lenses let you switch between modes to capture the best footage

Transfer and share

    USB 3.0 port and included USB-C cable allows easy transfer of footage and photos to your compatible devices
    GoPro app lets you remotely operate your camera and edit and share photos from your smartphone
    Front display and rear touchscreen with touch zoom makes for easy framing and intuitive controls

Storage and battery life

    1720mAh battery powers your camera for hours, even in cold weather
    GoPro subscription (sold separately) backs up all your shoots to the cloud, so you can access it from anywhere
    High Efficiency Video Coding (HEVC) shrinks the files without losing image quality, so you don''t have to constantly change your memory card or transfer photos

Capture the best moments for the duration

    Nighttime lapse allows you capture 4K, 2.7 4:3, 1440p, or 1080p in-camera processed footage in the night
    Schedule lapse gives you the freedom to the start time of shoot in advance
    Duration lapse lets you choose how long you want to record the footage
    Timer makes it easy to capture your gang or take selfies

Enhance your footage

    Data overlays allow you to add location, speed, altitude, maps, and more
    TimeWarp 3.0 condenses time to capture time-lapse footage
    Speed Ramp allows you to select Real Speed with audio or Half Speed, so you can capture footage the way you want
    HindSight captures 30 seconds before you press the shutter button, so you don''t miss a precious moment
    SuperPhoto with 20MP automatically picks the ideal image processing so you can get the best shot possible

Other important features

    Portrait mode lets you shoot videos and footage for social media platforms such as Instagram and Snapchat
    RAW photo for time lapse or burst mode provides maximum flexibility
    8x Slo-Mo is made possible with an ultra-high frame rate and HyperSmooth 3.0 stabilization
    Face, Smile, Blink + Scene Detection features detect smiles, faces, and more, which can be used to identify or pick pictures using the GoPro app

Flexible mods system

    Max lens mod provides horizon-locked, shake-free videos
    Light mod lets you illuminate the subject to capture all the details
    Media mod allows you to add accessories like a mic for interviews, vlogging, and more

Freedom and control

    Voice control lets you go hands-free using 14 voice commands in an array of languages and dialects including English (US, UK, Australia, and India), Chinese (Mandarin), French, German, Italian, Japanese, Korean, Portuguese (Brazil), Russian, Spanish (Europe and North America), and Swedish
    Preloaded with presets and lets you create custom presets, so you can capture the perfect moment or footage every time
    Supports up to 45 compatible mounts and accessories to boost your shooting experience", "Image Sensor
Sensor Type:
CMOS
Effective Megapixels:
23.6 MP
Max Video Resolution:
5120 x 2880 (5K)
                          Lens/Optics
Electronic (software) Image Stabilization:
Yes
                                   LCD & Viewfinder
LCD Resolution:
Rear: 368 x 552; Front: 240 x 240
Touchscreen:
Yes
                                  Video
Video Format:
H.264 codec, .mp4 file; H.265 codec, .mp4 file
Time Lapse Video:
Yes
Nightvision:
Yes
                              Support
Max Capacity:
256 GB
                       Connections
USB:
Included
Wi-Fi:
Included
Bluetooth:
Included
                         Hardware
Battery Type:
Lithium-ion", "https://www.amazon.ca/GoPro-HERO9-Black-Waterproof-Stabilization/dp/B08DK5ZH44/ref=sr_1_5?dchild=1&keywords=GoPro+HERO9&qid=1624569374&sr=8-5", "", "https://www.bestbuy.ca/en-ca/product/gopro-hero9-black-waterproof-5k-sports-helmet-camera/14927801");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("103", "GoPro HERO7", "https://images-na.ssl-images-amazon.com/images/I/71Xbu0FUDAL._AC_SL1500_.jpg", "Amazing adventures, even more amazing footage

    Capture 4K30 video and WDR photos so you can relive your most awe-inspiring moments
    10MP CMOS sensor delivers sharp, vibrant photos even in challenging shots that mix bright light and shadows

Savour and share the moment

    Burst mode captures 15 photos in one second
    Shoot time lapse videos to turn longer events into short, shareable moments
    Photos and videos move right to the GoPro app for easy sharing

Smart features

    Intuitively designed touch screen and simple, streamlined capture modes, make it easy to get great shots with a simple swipe and tap
    Voice control lets you capture your adventures with commands like ""GoPro, take a photo"" and ""GoPro, start recording"" so you never miss a moment

Designed for the great outdoors

    GPS lets you track how fast, high and far you went
    Rugged and waterproof design can go places your phone can''t", "Image Sensor
Sensor Type:
CMOS
Total Pixels:
10 MP
                               Video
Slow Shutter Mode:
Yes
                              Physical Features
Width:
6.2 cm
Height:
3.2 cm
Weight:
120 g", "https://www.amazon.ca/GoPro-HERO7-Silver-Waterproof-Digital/dp/B07GDGZCCJ/ref=sr_1_6?dchild=1&keywords=GoPro+HERO7&qid=1624569556&sr=8-6", "", "https://www.bestbuy.ca/en-ca/product/gopro-hero7-waterproof-4k-sports-helmet-camera-silver/12910139");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("103", "Canon EOS M50", "https://images-na.ssl-images-amazon.com/images/I/61HRnUdvv6L._AC_SL1000_.jpg", "Inspiring new perspectives

    24.1MP (APS-C) CMOS Sensor and DIGIC 8 Image Processor combine to ensure everything you shoot is sharp, clear, and vibrant
    ISO range of 100 to 25600 lets you confidently shoot in low light with minimal noise and grain at high ISOs

Formidable 4K

    Records up to 24p 4K UHD, which can give your videos a beautifully cinematic look
    Enjoy the smooth slow-motion effect using high-speed 120p in HD

Dual Pixel CMOS Autofocus system

    Wide autofocus area helps you create the photo or video you want by letting you focus on nearly any part of the image
    Advanced subject tracking to help ensure the crucial parts of the shot are sharply in focus
    Eye Detection AF for brilliant headshots

Convenience comes standard

    High-resolution, high-contrast built-in electronic viewfinder features Touch and Drag AF to make focusing with the EVF a breeze
    Vari-angle LCD touchscreen LCD lets you see the image you’re about to take, select focus with just a tap, and more
    Creative Assist makes it easy to quickly find and adjust the right camera settings to make sure your pictures come out just as you imagine
    Canon EOS Webcam Utility turns your camera into a capable webcam, works with popular streaming apps, and allows you to record internally while streaming

Share on social media in a snap

    Built-in Wi-Fi, NFC, and Bluetooth technology makes it easy to share your photos and videos as soon as you take them with
    Automatically transfer your photos and videos to your computer or mobile device for easy backup and posting to social media", "Wi-Fi:
Yes
NFC:
Yes
Bluetooth:
Yes
Jpeg:
Yes
Raw:
Yes
Raw+Jpeg:
Yes
Guided Shooting Mode:
Yes
Languages Supported:
English; German; French; Dutch; Danish; Portuguese; Finnish; Italian; Norwegian; Swedish; Spanish; Greek; Russian; Polish; Czech; Hungarian; Romanian; Ukranian; Turkish; Arabic; Thai; Simplified Chinese; Traditional Chinese; Korean; Malay; Vietnamese; Idonesian; Hindi; Japanese
Compatible Operating Systems:
Mac/PC                                                               Image Sensor
NFC Enabled:
Yes
Sensor Type:
CMOS
Image Sensor Format:
APS-C
Sensor Crop Factor:
1.6x
Effective Megapixels:
24.1 MP
Bluetooth:
Included
Total Pixels:
25.8 MP
Colour Space:
sRGB; Adobe RGB
Dust Reduction:
Yes
Processor:
DIGIC 8", "https://www.amazon.ca/Canon-Mirrorless-Camera-15-45mm-Black/dp/B079Y45KTJ/ref=sr_1_1?dchild=1&keywords=Canon+EOS+M50&qid=1624569680&sr=8-1", "https://www.newegg.ca/p/1A9-0002-000V9?Description=Canon%20EOS%20M50&cm_re=Canon_EOS%20M50-_-9SIAMTTB308988-_-Product", "https://www.bestbuy.ca/en-ca/product/canon-eos-m50-mirrorless-camera-with-15-45mm-lens-kit/12383479");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("103", "Canon EOS Rebel T7", "https://images-na.ssl-images-amazon.com/images/I/713ShDiciHL._AC_SL1500_.jpg", "Retain fleeting moments in clear detail

    Effective 24.1MP CMOS sensor (APS-C format) helps you realize your potential for great photographs
    DIGIC 4+ processor provides faster image processing and improved performance
    ISO sensitivity from 100 to 6400 (expandable to 12800) gives you the freedom to shoot at high noon on a bright sunny day and capture the cityscape on a moonlit night
    Full HD 1080p video recording allows you to preserve once-in-a-lifetime moments you can relive over and over

Capture life through a lens

    EF-S 18-55mm f/3.5-5.6 IS II lens is optimized for use with the T7''s APS-C sensor, so you can start capturing your photographic masterpieces right out of the box
    The lens''s 18-55mm focal range allows you to shoot at some of the most frequently used focal lengths -- 18mm for groups shots, 35mm for landscapes, and 50mm for street photography or portraits -- all in one lens

Convenience comes standard

    On-board feature guide to help you maximize the camera''s capabilities
    Eye-level single lens reflex (with fixed pentamirror) viewfinder for easy viewing of potential shots
    Large LCD screen with resolution of approximately 920,000 dots allows you to clearly see the photo immediately after capturing it
    Built-in flash in the pentamirror (auto pop-up, retractable) allows you to take great quality photos even in low light situations
    SD, SDHC, SDXC memory card compatibility to take as many photos as you want
    Canon EOS Webcam Utility turns your camera into a capable webcam, works with popular streaming apps, and allows you to record internally while streaming

Instant sharing

    Built-in Wi-Fi and NFC technology enable almost instantaneous sharing of photos", "Included Lens
Lens Frame Colour:
Black
Lens Range:
18-55mm
Stabilized:
Yes
Model Number:
2042B002
Filter Size:
58mm
35mm Equivalent
18-55mm
Lens Weight:
200g
                                      Body Features
Stabilized Body:
No
Body Colour:
Black
Intelligent Shoe:
No
Cable Release:
No
Weather Sealed:
No
                                   Power
Battery Type:
1 x Lithium Ion
Included Battery Model:
LP-E10
Power Saving Modes:
Auto Power Off
                                Physical Features
Width:
10.13 cm
Height:
7.76 cm
Depth:
12.9 cm
Weight:
475 g
Camera Model:
Canon T7
Camera Kit:
Camera Body with Lens
Lens Mount:
EF / EF-S", "https://www.amazon.ca/Canon-T7-18-55mm-II-Digital/dp/B07C2Z21X5/ref=sr_1_2?dchild=1&keywords=Canon+EOS+Rebel+T7&qid=1624569855&sr=8-2", "", "https://www.bestbuy.ca/en-ca/product/canon-eos-rebel-t7-dslr-camera-with-18-55mm-is-lens-kit/12383477");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("103", "Fujifilm Instax Mini 11", "https://images-na.ssl-images-amazon.com/images/I/7104Ejxu-TL._AC_SL1500_.jpg", "    Instant film camera is fun to use and lets you create memories in a snap (Fujifilm INSTAX Mini Instant colour 5.3cm x 8.4cm film sold separately)
    One-touch selfie mode includes a built-in close up lens that works at a range of 35cm - 50cm and a mirror so you can see ahead of time what your snapshots will turn out like
    Custom shutter buttons let you add fun shutter accessories to personalize your camera
    Electronic shutter works from 1/2 to 1/400 of second so everything is captured as it should be
    Auto-exposure means you don''t have to fiddle around to adjust the exposure manually
    Built-in lens cover protects the lens when not in use and opens automatically the camera turns on so you can start shooting right away
    Minimal, easily portable design lets you take this camera anywhere", "Power
Battery Type & Quantity:
2 x AA                                             Lens
Film Required:
Yes
                                        Flash
Built-in Flash:
Yes
Auto Flash Mode:
Yes
                                       Aperture & Exposure
Shutter Speed Range:
1/2 - 1/400 s
ISO Sensitivity:
Auto/Lv 5.0 - 14.5 (ISO 800)", "https://www.amazon.ca/Fujifilm-16654803-Instax-Instant-Camera/dp/B085286JCJ/ref=sr_1_5?dchild=1&keywords=Fujifilm+Instax+Mini+11&qid=1624570011&sr=8-5", "", "https://www.bestbuy.ca/en-ca/product/fujifilm-instax-mini-11-instant-camera-blush-pink/14438364");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("104", "Sony X950H 55-inch", "https://images-na.ssl-images-amazon.com/images/I/61AZHTzK-dL._AC_SL1080_.jpg", "Explore a new level of contrast with the Picture Processor X1 Ultimate. With advanced Full Array LED technology, you''ll see crystal-clear 4K HDR images in everything you watch. Bright and dark scenes feel more natural, and colours are even more true to life with the Triluminos display.", "Brand	‎Sony
Manufacturer	‎Sony
Place of Business	‎SAN DIEGO, CA, 92127 US
Model	‎XBR55X950H
Model Name	‎XBR55X950H
Model Year	‎2020
Part Number	‎XBR55X950H
OS	‎Android
Hardware interface	‎Bluetooth, USB, Ethernet, HDMI, 802.11 ac/b/g/n
Scanner Resolution	‎4K
Mounting Hardware	‎Table top stand, AC power cord, voice remote control, batteries, quick setup guide, operating instructions
Number Of Items	‎1
Display Technology	‎LED
Standing screen display size	‎54.6 Inches
Display Type	‎LED
Image Aspect Ratio	‎16:9
Resolution	‎3840 x 2160 Pixels
Max Resolution	‎3840 Pixels
Batteries included	‎Yes
batteries required	‎Yes
Battery cell composition	‎Alkaline
Refresh rate	‎120 Hz
Total Usb Ports	‎3
Connector Type	‎Wireless, Bluetooth, USB, Ethernet, HDMI
Mounting type	‎Table Mount, Wall Mount
Contains Liquid Contents	‎No
Includes Rechargable Battery	‎No
Remote control included?	‎Yes
Manufacturer	‎Sony
Item model number	‎XBR55X950H
Product Dimensions	‎123.19 x 31.12 x 78.11 cm; 18.1 Kilograms
ASIN	‎B0846NH8ST", "https://www.amazon.ca/Sony-55-inch-Android-Vision-XBR55X950H/dp/B0846NH8ST/ref=sxin_9?asc_contentid=amzn1.osa.526731d6-cca6-456e-bcb1-1a98bfc0f4a6.A2EUQ1WTGCTBG2.en_CA&asc_contenttype=article&ascsubtag=amzn1.osa.526731d6-cca6-456e-bcb1-1a98bfc0f4a6.A2EUQ1WTGCTBG2.en_CA&creativeASIN=B0846NH8ST&cv_ct_cx=tv&cv_ct_id=amzn1.osa.526731d6-cca6-456e-bcb1-1a98bfc0f4a6.A2EUQ1WTGCTBG2.en_CA&cv_ct_pg=search&cv_ct_we=asin&cv_ct_wn=osp-single-source-earns-comm&dchild=1&keywords=tv&linkCode=oas&pd_rd_i=B0846NH8ST&pd_rd_r=39254f86-8557-49da-a3c9-5b37d875a8b5&pd_rd_w=M5HQg&pd_rd_wg=2zGrZ&pf_rd_p=fd4969f1-ce1a-42e7-85d6-f4cb7192108a&pf_rd_r=526B4BTC34QPV39PKTPT&qid=1624465504&s=electronics&sr=1-1-64f3a41a-73ca-403a-923c-8152c45485fe&tag=rfdosp05-20", "", "https://www.bestbuy.ca/en-ca/product/sony-55-4k-uhd-hdr-led-android-smart-tv-xbr55x950h/14470547");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("104", "Samsung 65"" Q80T", "https://images-na.ssl-images-amazon.com/images/I/61-HUCA9CvL._AC_SL1500_.jpg", "Experience every detail with precision picture and dynamic sound. With Direct Full Array 12X and Quantum HDR 12X, rich blacks and crisp, bright whites offer the ultimate contrast and depth for an amazingly realistic picture. With 4K resolution, you will enjoy one of our most adaptive picture experiences yet, as Samsung’s powerful quantum processor optimizes to any viewing condition and improves the quality of all your content. Powerful 4K AI upscaling ensures you always get the full impact of 4K, no matter the quality or source of your content. Plus, Object Tracking Sound creates an immersive, 3D sound that follows the motion on the screen so you really feel like you are a part of every scene.", "Brand	‎Samsung
Manufacturer	‎Samsung
Place of Business	‎Mississauga, ON L5M 9Z9, CA
Model	‎QN65Q80TAFXZC
Model Name	‎QN65Q80TAFXZC
Model Year	‎2020
Part Number	‎QN65Q80TAFXZC
Hardware interface	‎Bluetooth, USB, Ethernet, HDMI
Scanner Resolution	‎4K
Mounting Hardware	‎Batteries for Remote Control, Remote Control, Manual, Cables
Number Of Items	‎1
Remote Control Description	‎Standard Smart w/BT
Display Technology	‎QLED
Standing screen display size	‎65 Inches
Display Type	‎QLED
Image Aspect Ratio	‎16:9
Resolution	‎3,840 x 2,160 Pixels
Power source type	‎Corded Electric
Batteries included	‎Yes
batteries required	‎No
Battery cell composition	‎Alkaline
Refresh rate	‎240 Hz
Total Usb Ports	‎2
Connector Type	‎Bluetooth, USB x 2, HDMI x 4 (eARC included), Ethernet (LAN), Digital Audio Out x 1 (Optical), RF In x 1 (Cable input), WiFi (802.11ac)
Mounting type	‎Table Mount, Wall Mount
Contains Liquid Contents	‎No
Includes Rechargable Battery	‎No
Remote control included?	‎Yes
Manufacturer	‎Samsung
Item model number	‎QN65Q80TAFXZC
Product Dimensions	‎28.91 x 144.65 x 90.57 cm; 27.8 Kilograms
ASIN	‎B084ZVZXKL", "https://www.amazon.ca/Samsung-Ultra-QN65Q80TAFXZC-Canada-Version/dp/B084ZVZXKL/ref=pd_vtp_3/132-7245197-5750229?pd_rd_w=M7Pwi&pf_rd_p=42ad2502-0d93-40f9-bcf4-49a0657bb461&pf_rd_r=DP1MB6GMY633N3FTJK2M&pd_rd_r=abc7e2ef-6045-4830-b0d0-9a0af10a4f4b&pd_rd_wg=KMtR0&pd_rd_i=B084ZVZXKL&psc=1", "", "https://www.bestbuy.ca/en-ca/product/samsung-65-class-q8-series-4k-ultra-hd-smart-hdr-qled-tv-qn65q8dt-qn65q80t-refurbished/15054856");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("104", "Logitech Z906", "https://images-na.ssl-images-amazon.com/images/I/81eR41G4ydL._AC_SL1500_.jpg", "Make any night opening night and deliver thunderous audio that can shake your house and your whole neighbourhood. Logitech Surround Sound Speakers 5.1 System delivers 500 watts (RMS) of thunderous audio, plus THX Certification and onboard 5.1 digital decoding for immersive surround sound.", "RAM	‎4 GB
Average Battery Life (in hours)	‎8 Hours
Brand	‎Logitech
Item model number	‎980-000467
Product Dimensions	‎38.61 x 43.18 x 43.94 cm; 8.89 Kilograms
Item Dimensions L x W x H	‎38.6 x 43.2 x 43.9 centimeters
Color	‎Black
Number of Processors	‎1
Memory Type	‎72-Pin EDO SIMM Memory
Power Source	‎Battery Powered
Voltage	‎20 Volts
Batteries	‎1 Lithium Metal batteries required.", "https://www.amazon.ca/Logitech-Surround-Speaker-System-980-000467/dp/B004M18O60/ref=sr_1_9?dchild=1&keywords=home+theatre&qid=1624465845&s=electronics&sr=1-9", "https://www.newegg.ca/black-logitech-z906-others/p/N82E16836121050?Description=Logitech%20Z906&cm_re=Logitech_Z906-_-36-121-050-_-Product", "https://www.bestbuy.ca/en-ca/product/logitech-logitech-z906-5-1-computer-speakers-system-980-000467/10179850");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("104", "BenQ HT2050A 1080P Home Theater Projector", "https://images-na.ssl-images-amazon.com/images/I/61HACIc68fL._AC_SL1000_.jpg", "Superb Big-Screen Audiovisual Experience BenQ HT2050A projector brings big-screen Full HD visuals to your living room, with >96% Rec. 709 accuracy for authentic cinematic color and short throw for 100"" pictures from just 2. 5m away without setup hassle. Offering Cinema Master Audio+ 2 for immersive AV experiences, HT2050A''s ultra-low input lag and special Game Mode enable epic gaming.", "Brand Name	‎BenQ
Product Dimensions	‎38.1 x 27.94 x 12.7 cm; 3.63 Kilograms
Item model number	‎HT2050A
Is Discontinued By Manufacturer	‎No
Item display height	‎14 inches
Manufacturer	‎BenQ
Place of Business	‎COSTA MESA, CA, 92626 US
ASIN	‎B077TG22H3", "https://www.amazon.ca/BenQ-HT2050A-Theater-Projector-Keystone/dp/B077TG22H3/ref=sr_1_13?dchild=1&keywords=home+theatre&qid=1624465937&s=electronics&sr=1-13", "https://www.newegg.ca/benq-ht2050a-dlp/p/1B4-00BC-00004?Description=BenQ%20HT2050A&cm_re=BenQ_HT2050A-_-1B4-00BC-00004-_-Product", "https://www.bestbuy.ca/en-ca/product/benq-1080p-home-theatre-projector-ht2050a/12393811");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("104", "AMAHA RX-V4A 5.2-Channel AV Receiver", "https://images-na.ssl-images-amazon.com/images/I/71DDqrs%2B7QL._AC_SL1500_.jpg", "Enter the world of home theater with the V4A. This AV receiver will completely transform how you listen and watch at home. Plus, plenty of features means plenty of choices on how to enjoy your entertainment.", "
Brand	‎Yamaha
Manufacturer	‎YAMAHA
Model	‎RX-V4ABL
Part Number	‎RX-V4ABL
Mounting Hardware	‎Remote Controller
Number Of Items	‎1
Audio Details	‎Speakers
Speaker surround sound channel configuration	‎5.1 Channel
Batteries included	‎No
batteries required	‎No
Connector Type	‎AirPlay, Wi-Fi, HDMI
Manufacturer	‎YAMAHA
Item model number	‎RX-V4ABL
Product Dimensions	‎50.8 x 45.72 x 27.94 cm; 8.85 Kilograms
ASIN	‎B08CKGYLNS", "https://www.amazon.ca/YAMAHA-RX-V4A-5-2-Channel-Receiver-MusicCast/dp/B08CKGYLNS/ref=sr_1_2?dchild=1&keywords=Yamaha+RX-V4A&qid=1624467265&s=electronics&sr=1-2", "", "https://www.bestbuy.ca/en-ca/product/yamaha-rx-v4a-5-2-channel-av-receiver-with-musiccast/15088082");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("104", "Toshiba 32"" 720p HD LED Smart TV", "https://images-na.ssl-images-amazon.com/images/I/818FrdfTcGL._AC_SL1500_.jpg", "Perfect for small rooms, guest bedrooms, and dorms, this Toshiba 32"" HD LED smart TV is sure to keep you entertained. Backed by Amazon''s Fire TV operating system, this television with HD picture quality offers easy access to global content of your choice. It has dual 10W speakers with DTS TruSurround to deliver immersive audio for movies and streaming.", "Video
Screen Size:
31.5 in
Resolution:
720p HD
TV Display Technology:
LED
High Dynamic Range (HDR):
No
Motion Enhancement Technology:
Not Applicable
Panel Shape:
Flat
                                        Audio
Audio Enhancement:
No
Speaker Configuration:
Bottom
Speaker Output Power:
10W x 2
                         Inputs/Outputs
HDMI Inputs:
3-Side
MHL Inputs:
No
Component Video Inputs:
No
Coaxial Cable Inputs:
No
Optical Digital Audio Outputs:
1 - Side
Stereo Audio Outputs:
No
Headphone Jack:
1 - Side
USB Media Port:
1 - Side
Internet Connectivity:
Wi-Fi and Wired
Bluetooth:
Yes (For Mobile Device Identification Only)
DLNA Certified:
No
Other Inputs/Outputs:
No
TV Operating System:
Fire TV
Preloaded Apps:
No
Motion Control:
No
Voice Control:
Yes
Voice Assistant Built-In:
Amazon Alexa
Works with Google Assistant:
No
Works with Amazon Alexa:
Yes
Works with Apple HomeKit:
No
Typical Consumption:
63.84 W
Energy Saving Mode:
Yes
ENERGY STAR Qualified:
No", "https://www.amazon.ca/Toshiba-32-inch-720p-Smart-LED/dp/B089QBDR97/ref=sr_1_9?dchild=1&keywords=Toshiba+32%22+720p+HD+LED+Smart+TV&qid=1624594625&sr=8-9", "", "https://www.bestbuy.ca/en-ca/product/toshiba-32-720p-hd-led-smart-tv-32lf221c21-fire-tv-edition-only-at-best-buy/14422161");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("104", "Toshiba 55"" 4K UHD HDR LED Smart TV", "https://multimedia.bbycastatic.ca/multimedia/products/500x500/144/14422/14422159.jpg", "Enjoy stunningly crisp visuals in 4K Ultra HD on this Toshiba smart TV. It boasts a 55"" screen with a 60Hz refresh rate for smooth motion, while VA display technology offers wide viewing angles and a great contrast ratio, and DTX VX technology gives you immersive multi-dimensional audio. Powered by Fire OS, you''ll get access to a world of apps, games, streaming services, and more", "Video
Screen Size:
54.6 in
Resolution:
4K Ultra HD
TV Display Technology:
LED
High Dynamic Range (HDR):
Yes
Panel Shape:
Flat

Audio
Audio Enhancement:
No
Speaker Configuration:
Bottom
Speaker Output Power:
10W + 10W

Inputs/Outputs
HDMI Inputs:
3-Side
MHL Inputs:
No
Component Video Inputs:
No
Coaxial Cable Inputs:
1-Back
Optical Digital Audio Outputs:
1 - Side
Stereo Audio Outputs:
No
Headphone Jack:
1 - Side
USB Media Port:
1 - Side
Internet Connectivity:
Wi-Fi and Wired
Bluetooth:
Yes (for mobile device identify only)
DLNA Certified:
No
Other Inputs/Outputs:
No
TV Operating System:
Fire TV
Preloaded Apps:
No
Motion Control:
No
Voice Control:
Yes
Voice Assistant Built-In:
Amazon Alexa
Works with Google Assistant:
No
Works with Amazon Alexa:
Yes
Works with Apple HomeKit:
No
Typical Consumption:
144.84 W
Energy Saving Mode:
Yes
ENERGY STAR Qualified:
No", "https://www.amazon.ca/All-New-Toshiba-55LF621U21-55-inch-4K-Ultra-HD/dp/B089N9NXPW/ref=sr_1_1?dchild=1&keywords=Toshiba+55%22+4K+UHD+HDR+LED+Smart+TV&qid=1624594884&sr=8-1", "", "https://www.bestbuy.ca/en-ca/product/toshiba-55-4k-uhd-hdr-led-smart-tv-55lf621c21-fire-tv-edition-only-at-best-buy/14422159");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("104", "TCL 3-Series 32"" 1080p HD LED Roku Smart TV", "https://multimedia.bbycastatic.ca/multimedia/products/500x500/132/13285/13285894.jpg", "Experience all your favourite content with the exceptional picture and efficient functionality of the TCL 3-Series 32"" Roku Smart TV. It features a brilliant 1080p Full HD LED screen for vibrant colours and exceptional contrast, immersing you in lifelike imagery. Spend less time looking and more time watching with the simple, intuitive interface", "Video
Screen Size:
31.5 in
Resolution:
1080p HD
TV Display Technology:
LED
High Dynamic Range (HDR):
No
Motion Enhancement Technology:
120Hz Clear Motion
Video Modes:
Movie; Normal; Vivid; Low Power; Sports
Panel Shape:
Flat

Audio
Audio Enhancement:
Dolby Digital +
Speaker Configuration:
Bottom
Speaker Output Power:
5W + 5W

Inputs/Outputs
HDMI Inputs:
3-Side
MHL Inputs:
No
Component Video Inputs:
No
Coaxial Cable Inputs:
1-Back
Optical Digital Audio Outputs:
1 - Side
Stereo Audio Outputs:
0
Headphone Jack:
1 - Side
USB Media Port:
1 - Side
Internet Connectivity:
Wi-Fi
Bluetooth:
Yes
DLNA Certified:
No
Other Inputs/Outputs:
No
TV Operating System:
Roku TV
Preloaded Apps:
No
Motion Control:
No
Voice Control:
No
Works with Google Assistant:
No
Works with Apple HomeKit:
No
Typical Consumption:
144.84 W
Energy Saving Mode:
Yes
ENERGY STAR Qualified:
No", "https://www.amazon.ca/TCL-Class-LED-Smart-Roku/dp/B07KD9SGH2/ref=sr_1_1?dchild=1&keywords=TCL%2B3-Series%2B32&qid=1624595107&sr=8-1&th=1", "https://www.newegg.ca/p/12K-01R1-00014?Description=TCL%203-Series%2032&cm_re=TCL_3-Series%2032-_-9SIAV1ZF1F8486-_-Product", "https://www.bestbuy.ca/en-ca/product/tcl-3-series-32-1080p-hd-led-roku-smart-tv-32s327-ca/13285894");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("104", "Samsung 55"" 4K UHD HDR LED Tizen Smart TV", "https://images-na.ssl-images-amazon.com/images/I/91uCG0qRvAL._AC_SL1500_.jpg", "Enjoy long hours of entertainment on this Samsung 55"" 4K UHD LED smart TV that provides realistic pictures in everything from sports to movies. Its HDR and PurColor technology enhance the display with natural colours, while the Crystal Processor 4K turns up the clarity. Its Wi-Fi connectivity helps in streaming your favourite online content.", "Video
Screen Size:
55 in
Resolution:
4K Ultra HD
TV Display Technology:
LED
High Dynamic Range (HDR):
Yes
HDR10:
Yes
IMAX Enhanced:
No
Motion Enhancement Technology:
MR120
Colour Enhancement:
PurColor
Panel Shape:
Flat

Audio
Audio Enhancement:
Adaptive Sound
Speaker Configuration:
2CH
Speaker Output Power:
20W

Inputs/Outputs
HDMI Inputs:
2
Coaxial Cable Inputs:
Yes
Optical Digital Audio Outputs:
1
USB Media Port:
1
Internet Connectivity:
Wi-Fi and Wired
Bluetooth:
Yes (4.2)
Works with Apple AirPlay:
AirPlay 2
DLNA Certified:
Yes
TV Operating System:
Tizen OS
Preloaded Apps:
Apple TV, Netflix, Prime, Cineplex, Crave, UFC, DAZN, TVA Sports
Motion Control:
No
Voice Control:
No
Works with Google Assistant:
Yes
Works with Amazon Alexa:
Yes
Works with Apple HomeKit:
No
Typical Consumption:
60 W
Energy Saving Mode:
Yes
ENERGY STAR Qualified:
Yes
Other Features:
Auto Low Latency Mode (ALLM); Game Enhancer", "https://www.amazon.ca/Samsung-TU7000-UN55TU7000FXZC-Canada-Version/dp/B084ZSZM27/ref=sr_1_2?dchild=1&keywords=Samsung+55%22+4K&qid=1624595362&sr=8-2", "", "https://www.bestbuy.ca/en-ca/product/samsung-55-4k-uhd-hdr-led-tizen-smart-tv-un55tu7000fxzc-titan-grey/14469353");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("104", "LG 49"" 4K UHD HDR LCD webOS Smart TV", "https://multimedia.bbycastatic.ca/multimedia/products/1500x1500/147/14760/14760721.jpg", "Enhance your home entertainment experience with this 49"" LG UN70 Series smart TV. Backed by 4K Ultra HD resolution and a quad-core processor, this television optimises every scene in the best possible detail and delivers incredible visuals with true-to-life colours on the screen. Its webOS platform provides instant access to a world of content.", "Video
Screen Size:
49 in
Resolution:
4K Ultra HD
TV Display Technology:
LCD
High Dynamic Range (HDR):
Yes
Motion Enhancement Technology:
4K Active HDR, HDR10 Pro, HLG, HDR Effect HDR Dynamic Tone Mapping, 4K Upscaler, Double step noise reduction, Sharpness enhancer)
Colour Enhancement:
Advanced Colour Enhancer, True Colour Accuracy
Video Modes:
Vivid, Standard, Eco, Cinema, Sports, Game, HDR Effect, FILMMAKER MODE, (ISF)Expert(Bright Room), (ISF)Expert(Dark Room)
Panel Shape:
Flat

Audio
Audio Enhancement:
AI Sound, Ultra Surround, Clear Voice III
Speaker Configuration:
Bottom
Speaker Output Power:
20 W

Inputs/Outputs
HDMI Inputs:
3
Component Video Inputs:
1 -Rear (Component in/AV in common)
Coaxial Cable Inputs:
1 - Rear
Optical Digital Audio Outputs:
1 - Rear
USB Media Port:
1 - Rear, 1 - Side
Internet Connectivity:
Wi-Fi and Wired
Bluetooth:
No
Works with Apple AirPlay:
No
Other Inputs/Outputs:
LAN
TV Operating System:
webOS
Preloaded Apps:
Youtube; Twitter; Facebook; LG Content Store; Netflix; Amazon Prime Video; Disney +; Apple TV; Sports alert; etc.
Works with Google Assistant:
Yes
Works with Amazon Alexa:
Yes
Works with Apple HomeKit:
Yes
Typical Consumption:
56.4 W
ENERGY STAR Qualified:
No
Other Features:
Supports FreeSync and G-SYNC Adaptive Sync Technology; Auto Low Latency Mode (ALLM)", "https://www.amazon.ca/LG-49UN7000-UHD-Smart-LED/dp/B08DYJPWTF/ref=sr_1_1?dchild=1&keywords=LG+49&qid=1624595525&sr=8-1", "", "https://www.bestbuy.ca/en-ca/product/lg-49-4k-uhd-hdr-lcd-webos-smart-tv-49un7000-2020/14760721");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("105", "UMIDIGI Smart Watch", "https://images-na.ssl-images-amazon.com/images/I/61TO9r5l5zL._AC_SL1000_.jpg", "Smart Watch for Men WomenUwatch3 GPS smartwatch is equipped with a 1.3"" high-definition full-touch display screen, with built-in GPS (no need to connect to phone), activity tracker, heart rate monitor, 14 sport modes, sleep monitor, women menstrual cycle calculation, Call, SMS and APP messages, music control, weather report, sedentary reminder, alarm clock, stopwatch, timer, find phone, call rejection, brightness adjustment and other functions to meet your daily needs.Accurate Fitness Tracker", "Parcel Dimensions	‎16.6 x 7.2 x 3.7 cm; 160 Grams
Item model number	‎Uwatch3 GPS
Connectivity technologies	‎GPS
Other display features	‎Wireless
Colour	‎Onyx Black
Item Weight	‎160 g", "https://www.amazon.ca/UMIDIGI-Activity-Waterproof-Smartwatch-Compatible/dp/B08H25T84C/ref=sr_1_4?crid=2T7Q9I4CZRBB2&dchild=1&keywords=wearable+technology&qid=1624467344&s=electronics&sprefix=wearable+techno%2Celectronics%2C150&sr=1-4", "https://www.newegg.ca/p/00H-06SC-00040?Description=UMIDIGI%20Smart%20Watch&cm_re=UMIDIGI_Smart%20Watch-_-9SIAN7DDSS4830-_-Product", "https://www.bestbuy.ca/en-ca/product/umidigi-smart-watch-built-in-gps-fitness-tracker-heart-rate-monitor-activity-tracker-with-1-3quot-touch-screen-5atm-waterproof-axgear/15339823");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("105", "Garmin vívosmart 4, Activity and Fitness Tracker", "https://images-na.ssl-images-amazon.com/images/I/512Yb5Q-O-L._AC_SL1000_.jpg", "Accent your style while enhancing your fitness with our vívosmart 4 activity tracker. This slim, swim-friendly wearable comes loaded with fitness and wellness features to help you make the most of a healthier, more active lifestyle. A wrist-based pulse ox sensor lets you estimate blood oxygen saturation while you’re sleeping - or you can spot-check your oxygen levels anytime during the day. (This is not a medical device and is not intended for use in the diagnosis or monitoring of any medical condition) the device also monitors heart rate at the wrist and includes such helpful tools as all-day stress tracking, a relaxation breathing timer and VO2 Max readings. Plus, body battery energy monitoring helps you know when you’re primed to be active or when you may need to rest. Safe for the pool or shower, vívosmart 4 keeps you going strong with up to 7 days of battery life - while smart notifications with vibration alerts help you stay connected on the go (When connected to a compatible smartphone).", "
Product Dimensions	‎19.05 x 0.51 x 1.27 cm; 18.14 Grams
Batteries	‎1 A batteries required. (included)
Item model number	‎010-01995-12
Connectivity technologies	‎Bluetooth
Display technology	‎LCD
Other display features	‎Wireless
Device interface - primary	‎Touchscreen
Form Factor	‎Watch
Colour	‎Rose Gold With Gray Band
Included Components	‎Activity Tracker
Item Weight	‎18.1 g", "https://www.amazon.ca/Garmin-v%C3%ADvosmart-Activity-Fitness-Tracker/dp/B07GMCBQD1/ref=sr_1_43?crid=2T7Q9I4CZRBB2&dchild=1&keywords=wearable+technology&qid=1624467483&s=electronics&sprefix=wearable+techno%2Celectronics%2C150&sr=1-43", "", "");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("105", "HUAWEI Watch FIT Smartwatch", "https://images-na.ssl-images-amazon.com/images/I/6117sdeNKLS._AC_SL1500_.jpg", "10 Days Battery Life Quick Charge TechnologyFeaturing the dual chipset architecture and power-saving algorithms, this watch can last for 10 days. And with the quick charge technology, the watch can support you a whole day with only 5-minute charge.96 Workout ModesHUAWEI WATCH FIT provides precise and real-time workout metrics for 11 professional sport modes including running, swimming and cycling. The 85 custom workout modes allow you to unleash your potential, whether you''re into yoga or hig", "
Brand	‎HUAWEI
Manufacturer	‎HUAWEI
Model	‎55025869
Part Number	‎55025869
Memory storage capacity	‎4 GB
Standing screen display size	‎1.64 Millimeters
Color Screen	‎Yes
Battery Average Life	‎10 days
Batteries included	‎Yes
batteries required	‎No
Battery cell composition	‎Lithium Ion
Wireless Standard	‎Bluetooth, 2.4 GHz Radio Frequency
Connector Type	‎GPS
Device interface - primary	‎Touchscreen, Microphone, Buttons
Includes Rechargable Battery	‎Yes
Remote control included?	‎No
Manufacturer	‎HUAWEI
Item model number	‎55025869
Product Dimensions	‎4.6 x 3 x 1.07 cm; 21 Grams
ASIN	‎B08G58CGT9", "https://www.amazon.ca/HUAWEI-Smartwatch-Saturation-Detection-Monitoring/dp/B08G58CGT9/ref=sr_1_32?crid=2T7Q9I4CZRBB2&dchild=1&keywords=wearable+technology&qid=1624467483&s=electronics&sprefix=wearable+techno%2Celectronics%2C150&sr=1-32", "https://www.newegg.ca/p/N82E16886611062?Description=HUAWEI%20Watch%20FIT%20Smartwatch&cm_re=HUAWEI_Watch%20FIT%20Smartwatch-_-86-611-062-_-Product", "https://www.bestbuy.ca/en-ca/product/huawei-watch-fit-smartwatch-1-64rdquo-vivid-amoled-display-10-days-battery-life-built-in-gps-axgear/15339787");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("105", "Huawei Honor Band 5", "https://images-na.ssl-images-amazon.com/images/I/51qqTT87GoL._AC_SL1024_.jpg", "Honor Band 5i Fitness TrackerFitness Tracker BandHonor Band 5i Fitness Tracker, Activity Trackers Health Exercise Watch with Heart Rate and Sleep Monitor, Smart Band Calorie Counter, Step Counter, Pedometer Walking for Men Women and Kids.", "Name: Huawei Honor
Band 5 Screen Size: 0.95 ’’ AMOLED color display
Screen Pixel: 240 × 120
Weight: About 22.7 g (Including Wristband) Dimensions of the
Fitness Tracker: 43mm × 17.2 mm × 11.5 mm
Compatible with: Android 4.4 /iOS 9.0 or Later
Battery Capacity: Typical
Value 100mAh Button: Full Screen Touch + Home
Button Wireless Connectivity: Bluetooth band 2.4GH z; Bluetooth 4.2 protocol
Charging Interface: 2 PIN charging interface
Charging Method: Connect to the charging base through the buckle
Sensors: 6-axis inertial sensor; Separate PPG heart rate meter; Infrared light wearing detection sensor
Waterproof Rating: Supports 5ATM waterproof
Control Mode: Full Screen Touch + Home
Button Screen: AMOLED
Color Display Installation: 1. To download and install the “Huawei Health” app, you can scan the QR code on the left, or search for “Huawei Health” app in the Google Play Store or Apple App Store. 2. From the device list in the “Huawei Health” app, select the Band and follow the instructions on the screen to complete the pairing.", "https://www.amazon.ca/Bracelet-Monitor-Activity-Tracker-Waterproof/dp/B07VZSSN4K/ref=pd_di_sccai_6/132-7245197-5750229?pd_rd_w=XCAmZ&pf_rd_p=e92f388e-b766-4f7f-aac1-ee1d0056e8fb&pf_rd_r=56B6XPB63DEAXADFWECN&pd_rd_r=ae2d27c7-8059-4099-969b-57bad56d5cdc&pd_rd_wg=8wyA4&pd_rd_i=B07W5HW2RP&th=1", "https://www.newegg.ca/p/2T2-00JW-00021?Description=Huawei%20Honor%20Band%205&cm_re=Huawei_Honor%20Band%205-_-9SIAEMM9U04380-_-Product", "https://www.bestbuy.ca/en-ca/product/fitness-tracker-band-5i-0-96-inch-smart-bluetooth-bracelet-spo2-blood-oxygen-detection-24-hour-heart-rate-monitoring-huawei-trusleep-3-5-all-in-one-activity-tracker-5atm-waterproof/14925511");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("105", "Samsung Galaxy Watch Active", "https://images-na.ssl-images-amazon.com/images/I/71THVSy2p-L._AC_SL1500_.jpg", "Your fitness and style go hand-in-hand with the Samsung Galaxy Watch Active. This elegantly and intelligently designed smartwatch offers real-time goal tracking for calories, distance, and over 40 exercises. It responds to your voice commands and syncs with your phone and Samsung SmartThings devices, so you can set alarms, answer texts, stream music, and more.
", "Brand	‎Samsung
Manufacturer	‎Samsung
Place of Business	‎Mississauga, ON L5M 9Z9, CA
Model	‎SMR500NZSAXAC
Model Name	‎Galaxy Active
Part Number	‎SMR500NZSAXAC
Compatible Devices	‎Android, Gear, Galaxy, iPhone, Ipod, galaxy, iphone, Lg
Mounting Hardware	‎Wearables
Number Of Items	‎1
Display Technology	‎AMOLED
Battery Average Life	‎96 Hours
Batteries included	‎Yes
batteries required	‎No
Battery cell composition	‎Lithium Ion
Form Factor	‎Watch
Department	‎Men;women;sport
Manufacturer	‎Samsung
Item model number	‎SMR500NZSAXAC
Product Dimensions	‎2.54 x 2.54 x 2.54 cm; 49.9 Grams
ASIN	‎B07NPZHTL1", "https://www.amazon.ca/Samsung-Galaxy-Watch-Active-Silver/dp/B07NPZHTL1/ref=sr_1_4?crid=2U580W9RBNBCM&dchild=1&keywords=wearable+technology&qid=1624467894&sprefix=wearable+technolog%2Csporting%2C163&sr=8-4", "", "https://www.bestbuy.ca/en-ca/product/samsung-galaxy-watch-active-40mm-smartwatch-with-heart-rate-monitor-silver/13399167");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("105", "Fitbit Charge 4", "https://multimedia.bbycastatic.ca/multimedia/products/1500x1500/144/14498/14498686.jpg", "The Fitbit Charge 4 Fitness Tracker with 24/7 heart rate tracking helps optimise your day-to-day activities, fitness routines, and lead a healthy lifestyle. Equipped with built-in GPS, Sp02 monitoring, Bluetooth technology, and a host of advanced tracking features, it provides real-time stats that offer clever insights about your body.", "Band Colour:
Black
Band Material:
Silicone
Case Colour:
Black
GPS:
Yes
GPS Details:
Built-In GPS
Heart Rate Monitor:
Yes
ECG:
No
Licensed by Health Canada:
No

Connectivity
NFC Enabled:
Yes

Compatibility
Watch Operating System:
Fitbit OS
Smartphone Compatibility:
iPhone; Android
Mac iOS Compatibility:
iOS 12.2+
Android Compatibility:
Android 7.0+
Voice Commands:
No

Display
Touchscreen:
Yes
Display Technology:
OLED
Illuminated Display:
Yes
Ambient Light Sensor:
Yes
Display Resolution:
100 x 160
Display Colour:
Monochrome

Power
Power Type:
Battery Powered
Battery Type:
Lithium-polymer
Battery Life (Typical):
Up to 7 Days; Up to 5 Hours with GPS
Charging Method:
USB
Charging Time:
2 Hours", "https://www.amazon.ca/Fitbit-Charge-fitness-Activity-Tracker/dp/B085M5SXVS/ref=sr_1_5?dchild=1&keywords=Fitbit+Charge+4&qid=1624595671&sr=8-5", "", "https://www.bestbuy.ca/en-ca/product/fitbit-charge-4-fitness-activity-tracker-with-gps-24-7-heart-rate-sleep-black/14498686");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("105", "Fitbit Versa 2", "https://multimedia.bbycastatic.ca/multimedia/products/1500x1500/138/13864/13864604.jpg", "Reach your physical fitness goals in style with the Fitbit Versa 2 smartwatch. It automatically tracks your calories burned, steps taken, heart rate, sleeping patterns, and more. It helps keep you in the loop by wirelessly syncing with your smartphone for at-a-glance notifications from texts, emails, social media, and your calendar.", "Connectivity
3G:
No
4G LTE:
No
NFC Enabled:
Yes

Compatibility
Voice Assistant Built-In:
Amazon Alexa
Works with Amazon Alexa:
Yes
Voice Commands:
Yes

Display
Touchscreen:
Yes
Display Technology:
Amoled
Illuminated Display:
Yes
Display Resolution:
300 x 300

Display Colour:
Full Colour

Power
Power Type:
Battery Powered
Battery Type:
Lithium-Polymer
Battery Life (Typical):
6 Days
Charging Method:
USB
Charging Time:
1 h

Features
Water Resistance:
Yes
Dust Proof:
Yes

Health Tracking Features
Heart Rate:
Yes
Sleep Tracking:
Yes
Body Temperature:
No", "https://www.amazon.ca/Fitbit-Health-Fitness-Smartwatch-Tracking-Black/dp/B07W82DN5B/ref=sr_1_1?dchild=1&keywords=Fitbit+Versa+2&qid=1624595812&sr=8-1", "", "https://www.bestbuy.ca/en-ca/product/fitbit-versa-2-40mm-smartwatch-with-amazon-alexa-heart-rate-tracking-black/13864604");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("105", "Apple Watch Series 6 (GPS) 44mm", "https://images-na.ssl-images-amazon.com/images/I/71IocB4x93L._AC_SL1500_.jpg", "The future of health is on your wrist. Measure your blood oxygen level with a revolutionary new sensor and app. Take an ECG anytime, anywhere. See your fitness metrics at a glance with the enhanced Always-On Retina display. With the Apple Watch Series 6 on your wrist, a healthier, more active, more connected life is within reach.", "Connectivity
NFC Enabled:
Yes

Compatibility
Watch Operating System:
watchOS
Smartphone Compatibility:
iPhone 6S or later
Other Compatibility:
None
Voice Assistant Built-In:
Siri
Works with Apple HomeKit:
Yes
Voice Commands:
Yes

Display
Touchscreen:
Yes
Display Technology:
Retina LTPO OLED
Illuminated Display:
Yes

Power
Battery Type:
Lithium-ion

Health Tracking Features
Biometrics Tracked:
Blood Oxygen Levels
Heart Rate:
Yes
Fall Detection:
Yes
Personal Safety Alert:
Yes

Activity Monitoring Features
Other Tracking & Monitoring:
Noise Monitoring
Compass:
Yes

Sensors
Accelerometer:
Yes

Other Features
Built-in Mic:
Yes

Physical Features
Adjustable Band:
Yes
Removable Band:
Yes", "https://www.amazon.ca/Apple-Watch-GPS-44mm-Space-Aluminum/dp/B08J96N211/ref=sr_1_5?dchild=1&keywords=Apple+Watch+Series+6&qid=1624596073&sr=8-5", "", "https://www.bestbuy.ca/en-ca/product/apple-watch-series-6-gps-44mm-space-grey-aluminum-case-with-black-sport-band/14961882");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("105", "Apple Watch SE", "https://m.media-amazon.com/images/I/71NVDjayU9L._AC_SL1500_.jpg", "An expansive Retina display so you can see more at a glance. Advanced sensors to track all the ways you move. Powerful features to keep you healthy and safe. The Apple Watch SE is a lot of watch for a lot less than you expected.", "Case Diameter (mm):
40 mm
Watch Series:
SE (GPS)
Band Size:
Medium
Band Material:
Fluoroelastomer
Case Material:
Aluminum
GPS:
Yes
GPS Details:
Built-in
Heart Rate Monitor:
Yes
ECG:
No

Connectivity
NFC Enabled:
Yes

Compatibility
Watch Operating System:
watchOS
Smartphone Compatibility:
iPhone 6S or later
Other Compatibility:
None
Voice Assistant Built-In:
Siri
Works with Apple HomeKit:
Yes
Voice Commands:
Yes

Display
Touchscreen:
Yes
Display Technology:
Retina LTPO OLED
Illuminated Display:
Yes

Power
Battery Type:
Lithium-ion", "https://www.amazon.ca/New-Apple-Watch-GPS-44mm/dp/B08J97Y7PJ/ref=sr_1_1?dchild=1&keywords=Apple%2BWatch%2BSE&qid=1624596334&sr=8-1&th=1", "https://www.newegg.ca/p/2RC-0CJB-005X1?Description=Apple%20Watch%20SE&cm_re=Apple_Watch%20SE-_-9SIAV2VEZX6923-_-Product", "https://www.bestbuy.ca/en-ca/product/apple-watch-se-gps-40mm-space-grey-aluminum-case-with-black-sport-band/14961891");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("105", "Garmin vivoactive 3 Smartwatch", "https://images-na.ssl-images-amazon.com/images/I/617nz0iX03L._AC_SL1446_.jpg", "Stay connected, on trend, and on top of your fitness goals with this Garmin vivoactive 3 smartwatch. Rugged and waterproof, this sporty smartwatch offers fitness tracking, sleep tracking, and heart-rate monitoring, as well as smartphone notifications, built-in GPS, and customizable apps and widgets.", "Case Diameter (mm):
43 mm
Display Size (Wearables):
30.4 mm
Band Colour:
Gunmetal
Band Size:
Large
Band Material:
Plastic
Case Colour:
Gunmetal Grey
Case Material:
Steel
GPS:
Yes
Heart Rate Monitor:
Yes
                       Connectivity
3G:
Yes
NFC Enabled:
Yes
                     Compatibility
Watch Operating System:
Garmin OS
Mac iOS Compatibility:
Yes
Android Compatibility:
Yes
Other Compatibility:
None
Voice Commands:
No
                               Display
Touchscreen:
Yes
Display Technology:
LCD
Illuminated Display:
Yes
Ambient Light Sensor:
No
Display Resolution:
240 x 240
Display Colour:
Full Colour", "https://www.amazon.ca/Garmin-Vivoactive-Smartwatch-Gunmetal-010-01769-10/dp/B0751HV9QT/ref=sr_1_5?dchild=1&keywords=Garmin+vivoactive+3+GPS&qid=1624596503&sr=8-5", "https://www.newegg.ca/p/2S7-0007-000M3?Description=Garmin%20vivoactive%203%20GPS&cm_re=Garmin_vivoactive%203%20GPS-_-2S7-0007-000M3-_-Product", "https://www.bestbuy.ca/en-ca/product/garmin-vivoactive-3-gps-smartwatch-with-heart-rate-monitor-large-gunmetal-grey/11524339");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("106", "Echo Dot (4th Gen)", "https://images-na.ssl-images-amazon.com/images/I/71fnXKyRa4L._AC_SL1000_.jpg", "Round out any room with the Amazon Echo Dot (4th Gen). This smart speaker delivers clear, crisp vocals and balanced bass, while its sleek, compact design fits perfectly into small spaces. With built-in Amazon Alexa, use your voice commands to ask Alexa to play music, answer questions, give you the news and weather, and much more.", "Voice Control
Yes
Voice Assistant Built-In
Amazon Alexa
Apps
Alexa
Manual Control
Yes
Gesture/Motion Control
No
Compatibility
Works with Google Assistant
No
Works with Amazon Alexa
Yes
Works with Apple HomeKit
No
Features
Touchscreen
No
Ambient Light Sensor
No
Clock
No
Operating environment
Indoor
Colour
Charcoal
Connectivity
Wi-Fi
Yes
Connectivity
Dual-band Wi-Fi supports 802.11 a/b/g/n/ac (2.4 and 5 GHz) networks. Does not support connecting to ad-hoc (or peer-to-peer) Wi-Fi networks.
Camera Features
Auto Follow
No
Audio Features
Speaker
Yes
Audio Output
3.5mm Audio Jack stereo output
Dolby Atmos
No
Power
USB
No", "https://www.amazon.ca/echo-dot-4th-gen/dp/B07XJ8C8F5/ref=sxin_9_ac_d_pm?ac_md=2-0-VW5kZXIgJDEwMA%3D%3D-ac_d_pm&cv_ct_cx=smart%2Bhome&dchild=1&keywords=smart%2Bhome&pd_rd_i=B07XJ8C8F5&pd_rd_r=3192c63f-3545-4061-bc2d-78b988626166&pd_rd_w=p3XLW&pd_rd_wg=KbR1I&pf_rd_p=91306e33-c4f0-4840-841a-2c1cc90dc993&pf_rd_r=2YXPWHG8T8GV33HYP5W8&qid=1624468003&sr=1-1-9b8a9368-31c9-458d-b359-d6edf7d5a732&th=1", "", "https://www.bestbuy.ca/en-ca/product/amazon-echo-dot-4th-gen-smart-speaker-with-alexa-charcoal/14966503");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("106", "Echo Dot (3rd gen)", "https://images-na.ssl-images-amazon.com/images/I/6182S7MYC2L._AC_SL1000_.jpg", "Add simple yet powerful voice-assistance to any room in an instant with the Amazon Echo Dot. It features a redesigned look and richer, louder sound that’s great for streaming audio and music. It’s also a big help around the house. Ask it to play music, read the news, set alarms, dim the lights, increase the temperature, or lock the front door.", "Type
Smart Speaker
Colour
Charcoal
Voice Control
Yes
Voice Assistant Built-In
Amazon Alexa
Compatibility
Works with Google Assistant
No
Works with Amazon Alexa
Yes
Works with Apple HomeKit
No
Features
Touchscreen
No
Operating environment
Indoor
Colour
Charcoal
Connectivity
Wi-Fi
Yes
Bluetooth
v2.1+EDR, v3.0+HS and v4.2+HS compliant
Connectivity
Zigbee; Bluetooth; Wi-Fi
Wireless Technology
Dual Band 802.11 a/b/g/n/ac
Audio Features
Speaker
Yes
Audio Output
3.5mm line-out
Power
Operating Voltage
12V DC Adapter
Dimension
Width
9.9 cm
Height
4.3 cm
Depth
9.9 cm
Weight
300 g", "https://www.amazon.ca/Echo-Dot-3rd-gen-Charcoal/dp/B07PDHT5XP/ref=sr_1_19?dchild=1&keywords=smart+home&qid=1624468140&sr=8-19", "https://www.newegg.ca/p/0YH-03MR-00V86?Description=Echo%20Dot%20(3rd%20gen)&cm_re=Echo_Dot%20(3rd%20gen)-_-9SIAKGNEJ02605-_-Product", "https://www.bestbuy.ca/en-ca/product/amazon-echo-dot-3rd-gen-smart-speaker-with-alexa-charcoal/13023977");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("106", "TP-Link Tapo Smart Home Security WiFi Camera", "https://images-na.ssl-images-amazon.com/images/I/71P2KISLXgL._AC_SL1500_.jpg", "High Definition Video - Records every image in crystal-clear 1080p definition; Advanced Night Vision - Provides a visual distance of up to 30 ft
Motion Detection and Notifications - Notifies you when the camera detects movement
Sound and Light Alarm - Trigger light and sound effects to frighten away unwanted visitors
Two-Way Audio - Enables communication through a built-in microphone and speaker
Safe Storage - Locally stores up to 128 GB on a microSD card, equal to 384 hours (16 days) of footage (based on laboratory conditions); Easy Setup and Management - Manage everything with Tapo app", "Brand	‎TP-Link
Manufacturer	‎TP-Link Canada
Place of Business	‎Richmond Hill, ON L4B 1J5, CA
Model	‎Tapo C100
Model Name	‎Tapo C100
Model Year	‎2019
Part Number	‎Tapo C100
Scanner Resolution	‎1080p
Mounting Hardware	‎Tapo C100
Number Of Items	‎1
Video capture resolution	‎1080p
Voltage	‎9 Volts
batteries required	‎No
Material Type	‎Plastic
Contains Liquid Contents	‎No
Has Self Timer	‎No
Manufacturer	‎TP-Link Canada
Item model number	‎Tapo C100
Product Dimensions	‎9.91 x 6.86 x 5.33 cm; 230 Grams
ASIN	‎B0866S3D82", "https://www.amazon.ca/TP-Link-Tapo-Security-Records-C100/dp/B0866S3D82/ref=sr_1_35?dchild=1&keywords=smart+home&qid=1624468140&sr=8-35", "https://www.newegg.ca/p/09Z-01WA-00012?Description=TP-Link%20Tapo%20Smart%20Home%20Security%20WiFi%20Camera&cm_re=TP-Link_Tapo%20Smart%20Home%20Security%20WiFi%20Camera-_-09Z-01WA-00012-_-Product", "https://www.bestbuy.ca/en-ca/product/tp-link-security-camera-tapo-smart-home-security-wifi-camera-records-in-1080p-full-hd-up-to-30-ft-night-vision-up-to-128-gb-microsd-card-slot-works-w-alexa-and-google-tapo-c100/15341993");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("106", "LEVOIT Smart WiFi Air Purifiers ", "https://images-na.ssl-images-amazon.com/images/I/61b32sDzfML._AC_SL1500_.jpg", "Voice Command to Control: Levoit Smart Wifi Air Purifier works with Alexa and Google Home Assistant. Just give a simple voice command to control your air purifier with Vesync app via Alexa or Google Home Assistant. Levoit Smart Wifi Air Purifier works with stable 2.4GHz networkSmart Remote Control: No need to use smart plug. Use your smartphone to directly control air purifier anytime anywhere, always breathe fresh air when arrive at home. Vesync App comes with advanced features including dire", "Enjoy full control of Levoit’s LV-PUR131S Smart True HEPA Air Purifier whether you’re at home or away. All you have to do is download the free VeSync app to turn your phone into a convenient remote control for your air purifier.", "https://www.amazon.ca/Purifier-Cleaner-Allergies-Eliminator-LV-PUR131S/dp/B07NR9KL8J/ref=sr_1_7?dchild=1&keywords=smart%2Bhome&qid=1624468386&sr=8-7&th=1", "", "https://www.bestbuy.ca/en-ca/product/levoit-smart-wi-fi-air-purifier-for-home-true-hepa-filter-smoke-eater-and-odor-eliminator-cleaner-for-allergies-and-pets-mold-axgear/15456903");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("106", "Brilliant Smart Home Control (3-Switch Panel)", "https://images-na.ssl-images-amazon.com/images/I/71mwwqzLWIL._AC_SL1500_.jpg", "Transform your house or apartment into an easy-to-use smart home with the award-winning Brilliant Smart Home Control System. Brilliant’s touchscreen control panel with built-in Alexa voice control makes it easy for everyone—spouses, kids, family, friends, guests, babysitters, and pet sitters—to use your home and all available smart home features: lighting, cameras, locks, music, climate, intercom, scenes, and more. Just select the room or rooms where you want to add easy smart home access and install a Brilliant Smart Home Control in the place of any light switch panel. Brilliant also includes an all-in-one app to control your home from anywhere. Brilliant works with a growing list of the top smart home brands including Alexa, Ring, Sonos, Hue, Google Nest, LIFX, Wemo, Honeywell Home, Ecobee, Schlage, Yale, August, SmartThings, Apple HomeKit, Genie, and more. Each Brilliant Control also includes a built-in camera with privacy shutter and motion sensor. Brilliant Control Panels are available in four models to replace any light switch panel with one to four switches (neutral and ground wires required).

", "
Manufacturer	‎Brilliant
Part Number	‎BHA120US-WH3
Parcel Dimensions	‎23.3 x 17.7 x 6.1 cm; 923 Grams
Manufacturer reference	‎BHA120US-WH3
Is Discontinued By Manufacturer	‎No
Size	‎3-Switch Panel
Item Package Quantity	‎1
Batteries Included?	‎No
Batteries Required?	‎No
Item Weight	‎923 g", "https://www.amazon.ca/Brilliant-Control-Lighting-Switch-Version/dp/B07C6PPCCH/ref=sr_1_31?dchild=1&keywords=smart%2Bhome&qid=1624468140&sr=8-31&th=1", "", "https://www.bestbuy.ca/en-ca/product/brilliant-smart-home-control-3-switch-panel/15481934");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("106", "Arlo Essential Spotlight", "https://c1.neweggimages.com/ProductImageCompressAll1280/AGGMD2104112LM4X.jpg", "    Wire-free camera captures 1080p Full HD video with a 130-degree field of view and 12x optical zoom so you can keep a watchful eye on your home or business
    Integrated spotlight, motion detection, and colour night vision ensure you have a clear view anytime day or night
    Weather-resistant design stands up to the heat, cold, rain, and sun so the camera can be used indoors or out
    Built-in siren can be triggered remotely or automatically to deter trespassers and burglars
    Companion app lets you watch live streams or recorded video from your smartphone or tablet
    Two-way audio allows you to hear and speak with visitors by tapping a button in the app
    Included power cable makes it easy to recharge the camera''s battery
    Step-by-step instructions in the app make the camera easy to install
    Comes with a 3-month trial of Arlo Smart for instant notifications and a rolling 30 days of cloud recordings (note: renewal of an Arlo Smart subscription is required to maintain Arlo Smart features, including cloud storage)", "Security Camera Type:
IP Cameras
Number of Cameras Included:
1
Camera Connection:
Wire-Free
Usage:
Indoor & Outdoor
Device Compatibility:
Android & iOS
Works with Amazon Alexa:
Yes
Works with Google Assistant:
Yes
Works with Apple HomeKit:
No
IFTTT:
Yes
Connectivity:
Wifi - No Hub :Required
Remote Access:
Yes
Remote Monitoring:
Yes
Mobile Remote Monitoring:
Yes
Wireless Standard:
802.11 b/g/n
WPS Connection:
No
Detachable:
Not Applicable
Built-In Siren:
Yes
Pet Mode:
No
Colour:
White
Material:
Plastic
Language Support:
English; French", "https://www.amazon.ca/Arlo-Essential-Spotlight-Wire-Free-Activated/dp/B0875FRJPT/ref=sr_1_6?dchild=1&keywords=arlo+essential+spotlight&qid=1624570395&sr=8-6", "https://www.newegg.ca/p/0YH-026H-00135?Description=Arlo%20Essential%20Spotligh&cm_re=Arlo_Essential%20Spotligh-_-9SIAGGMEA91594-_-Product", "https://www.bestbuy.ca/en-ca/product/arlo-essential-spotlight-wire-free-indoor-outdoor-1080p-security-camera-white/14696139");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("106", "Google Nest Hello Wi-Fi", "https://multimedia.bbycastatic.ca/multimedia/products/1500x1500/122/12222/12222651.jpg", "    Google Nest Hello combines the convenience of a video doorbell with the intelligence and high image quality of a Google Nest Cam
    Provides a live view of your front door and sends you a mobile alert when someone approaches, rings the doorbell, or leaves a package
    Smart technology is intelligent enough to tell the difference between a person and a thing; with a Nest Aware subscription (not included), Hello can even tell you if the visitor is someone you know or a complete stranger
    HD video with HDR imaging and night vision mean you can enjoy bright and clear video day or night, even in challenging lighting conditions
    160-degree field of view and 4:3 aspect ratio ensure you can see visitors head to toe from close range, as well as packages on the ground
    Built-in Wi-Fi and Bluetooth mean you can check in anytime from anywhere, and even view a 3-hour snapshot history to see what you missed
    HD Talk and Listen feature lets you have a loud-and-clear conversation with a doorstep visitor even if you''re not at home
    Quick Response feature lets you respond to visitors with convenient pre-recorded messages
    Works with Google Assistant for convenient voice controls
    Note: Google Nest Hello requires an existing wired doorbell and chime, as well as 16V AC to 24V AC power and a 10VA transformer; mobile alerts, video streaming, and video recording require working internet and Wi-Fi
    30-day free trial of Nest Aware cloud storage included (limited to one per home); if you subscribe to Nest Aware, your camera streams all video to the cloud for secure offsite storage
    Add a Nest Aware subscription for all your Nest cameras, speakers, and displays so you can get more video history and alerts that matter", "Compatibility
Works with Google Assistant:
Yes
IFTTT:
Yes
Device Compatibility:
Nest; iOS; Android
Operating environment:
Outdoor
                          Connectivity
Connectivity:
Bluetooth; Wi-Fi
Wi-Fi:
Yes
Bluetooth:
Yes
Apps:
Nest App
Two-Way Communication:
Yes
                                    Features
Automatic Locking/Unlocking:
No
Remote Operation:
Yes
Auto-Shut Off:
No
Entry/Exit History:
Yes
Push Notifications:
Yes
Motion Sensors:
Yes
Built-in Camera:
Yes
Battery Operated:
No
                                   Type Of Installation
Self
Lights Control:
Yes", "", "https://www.newegg.ca/nest-nc5100ef-wifi-accessories/p/N82E16881860030?Description=Google%20Nest%20Hello%20Wi-Fi&cm_re=Google_Nest%20Hello%20Wi-Fi-_-81-860-030-_-Product", "https://www.bestbuy.ca/en-ca/product/google-nest-hello-wi-fi-video-doorbell-black-white/12222651");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("106", "Blink Outdoor Wire-Free", "https://images-na.ssl-images-amazon.com/images/I/51INpZzwCZL._SL1000_.jpg", "    Includes 1 add-on camera (note: requires a Blink Sync Module/Base Station hub, sold separately)
    Wire-free outdoor IP camera with 1080p Full HD resolution, 30fps video capture, and 110-degree viewing angles gives you a clear, vivid view to monitor your home
    Infrared night vision lets you see what''s going on, whether it''s broad daylight or the middle of the night
    Motion detection lets you get alerts on your phone via the Blink Home Monitor app
    Two-way audio features mean you can see, hear, and speak to people (and pets) outside your door
    Weather-resistant design is built to withstand the elements
    Wi-Fi (2.4 GHz 802.11b/g/n) gives you an easy, secure wireless connection
    Runs for up to 2 years on a set of AA lithium batteries (included)
    Amazon Alexa compatibility lets you stream live video, play clips, arm and disarm the camera, get motion alerts, and use other voice commands
    Store your footage in the cloud with the Blink subscription plan (note: Record, view, and save events in your Blink app with a free trial of the Blink Subscription Plan included with your purchase through September 2021. Then, subscribe for just $5 per-camera per-month, or $15 per-month for unlimited cameras at a single location.)", "Security Camera Type:
Add-On Security Cameras
Number of Cameras Included:
1
Camera Connection:
Wire-Free
Usage:
Outdoor
Device Compatibility:
Alexa
Works with Amazon Alexa:
Yes
Works with Google Assistant:
No
Works with Apple HomeKit:
No
IFTTT:
Yes
Connectivity:
Wi-Fi: 2.4 GHz 802.11b/g/n
Remote Access:
Yes
Mobile Remote Monitoring:
Yes
Wireless Standard:
802.11n
Detachable:
Yes
LED Indicator:
Yes
Built-In Siren:
No
Pet Mode:
No
Power Input:
2 x AA 1.5V Lithium Batteries
Colour:
Black
Language Support:
English; French", "https://www.amazon.ca/Blink-Outdoor-Wireless-Security-Camera-Add-on/dp/B086DKR8GT/ref=sr_1_1?dchild=1&keywords=Blink+Outdoor+Wire-Free&qid=1624570722&sr=8-1", "", "https://www.bestbuy.ca/en-ca/product/blink-outdoor-wire-free-1080p-add-on-ip-security-camera-black/14923943");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("106", "Google Nest Wi-Fi Smart Learning Thermostat 3rd Generation", "https://c1.neweggimages.com/ProductImageCompressAll1280/AA1A_1310434709421106154nnVvWGfdT.jpg", "    Innovation upgraded: The 3rd generation Google Nest Learning Thermostat is slimmer, but offers a big 2.08"" 24-bit colour LCD display, with sharper 480 x 480 resolution that makes it even easier to read. With Farsight, it knows you''re around and lights up so you can check the temperature, or time, at a glance from across the room.
    Reduce your energy bill: Nest uses smart learning technology and learns your schedule and heating/cooling preferences over time. It then takes this data and programs itself in a way that reduces overall energy usage up to 20%. The environment and your wallet will thank you.
    Smart savings: Nest is smart enough to turn down the thermostat when you''re away at work, and it displays the Leaf icon to show you when it''s at a temperature that''s saving you money. Airwave automatically reduces air conditioning usage when indoor humidity isn''t too high, so you''ll get reduced energy bills while keeping the house cool.
    Connectivity: Nest connects with your home''s WiFi network so you can control it from your smartphone, tablet, or laptop from anywhere in the world. Compatible with mobile devices that use iOS 8 or later, or Android 4 or later with the free Nest app and Bluetooth 4.0 or set it up from your computer using USB connectivity and a web browser.
    Remote monitoring: You can view Energy History on the Nest Mobile or Web apps so you can get detailed information about your energy usage and figure out how best to save. Plus, Nest lets you know something is out of the ordinary, like if the temperature is too low or too high, with an alert to your mobile device. You can even control your Google Nest Thermostat from your Apple Watch.
    Weather aware: Nest monitors weather conditions so it can figure out how outdoor temperatures and weather affects your heating and cooling needs.
    Convenient voice controls: Works with Google Assistant for convenient voice controls.
    Smart device compatibility: Since Nest is smart and WiFi-connected, it''s able to work with a variety of other smart devices to provide additional convenience and functionality, and the list of compatible devices is growing all the time.
    Easy installation: As easy as installing a lighting fixture, Nest is simple to install, and probably in less than 30 minutes. If you''d rather let a professional handle it, you can contact a Google Nest Pro to install Nest, remove and recycle your old thermostat, and connect Nest to your WiFi network.", "ENERGY STAR Qualified:
Yes
Colour:
White
Works with Google Assistant:
Yes
IFTTT:
Yes
Device Compatibility:
iOS; Android
Connectivity:
WiFi; Bluetooth Low Energy (BLE)
Works Offline:
Yes
Heating/Cooling System Compatibility:
Nest works with over 95% of 24V heating and cooling systems; Gas, Electric, Oil, Solar, Hot Water, Geothermal, Forced Air, Heat Pump and Radiant
Wiring Compatibility:
Heating: 1, 2, And 3 Stages (W1; W2; W3); Cooling: 1 And 2 Stages (Y1; Y2); Heat Pump: With Auxiliary And Emergency Heat (O/B; Aux; E); Humidifier Or Dehumidifier (Hum; Dehum); Fan (G) Power (C; Rh; Rc)
Self-Installation:
Yes
Apps:
Free Nest App with compatible phones or tablets running iOS 8 or later or Android 4 or later and Bluetooth 4.0; Or set it up from your computer using USB and a web browser
Multiple Zones:
Yes
Motion Activated:
Yes
Scheduling:
Yes
Remote Controlled:
Yes
Touchscreen:
No
Multi Stage Control:
Yes
Backup Battery:
Yes
Compatible Systems:
Nest; Insteon; Control4; Crestron; RTI; URC", "", "https://www.newegg.ca/nest-t3007ef-thermostats-hvac/p/35E-000B-00002?Description=Google%20Nest%20Wi-Fi%20Smart%20Learning&cm_re=Google_Nest%20Wi-Fi%20Smart%20Learning-_-35E-000B-00002-_-Product", "https://www.bestbuy.ca/en-ca/product/google-nest-wi-fi-smart-learning-thermostat-3rd-generation-white-only-at-best-buy/10747787");
INSERT INTO products(p_category, p_name, p_image, p_description,p_specs, p_amazon, p_newegg, p_bestbuy) VALUES ("106", "Google Nest Mini ", "https://c1.neweggimages.com/ProductImageCompressAll1280/81-716-013-S05.jpg", "    Voice-controlled speaker with Google Assistant helps you stay organised by managing your schedule, checking the weather, setting reminders, and more
    Built-in timers and alarms help to ensure you never miss an important appointment
    Compatible with more than a thousand smart devices so you can turn on the lights, adjust the thermostat, and control your smart plugs (sold separately)
    Upgraded audio technology plays music from Spotify, YouTube Music, TuneIn, and more with rich bass and powerful sound (additional subscriptions may be required)
    Make calls using a Google Duo account to other Google Duo users anywhere in Canada and the United States
    Intercom feature lets you send messages from your phone to everyone at home or chat between rooms with other Google Nest speakers or displays
    Voice Match recognises voices to provide personalized information for up to six users (additional setup and enrollment required)
    The built-in Google Assistant lets you use your voice to stream your favourite shows and videos right to your TV
    Volume controls on the speaker, as well as voice- and phone-controlled volume adjustment make it easy to turn the speaker up and down
    Downtime helps everyone to disconnect from technology at particular times while family-friendly filters block access to inappropriate content
    Clean, modern design complements any space and can be set up on a table or shelf or mounted on the wall
    2nd generation of the Google Home Mini", "Compatibility
Works with Google Assistant:
Yes
                             Connectivity
Wi-Fi:
Yes
Bluetooth:
Bluetooth 5.0
Connectivity:
802.11b/g/n/ac (2.4 GHz/5 GHz) Wi-Fi
                                 Audio Features
Speaker:
Yes
                                     Power
Max Load:
15 W
                               Dimension
Width:
9.8 cm
Height:
4.2 cm
Depth:
9.8 cm
Weight:
181 g", "", "https://www.newegg.ca/google-ga00638-ca-802-11b-g-n-ac-wi-fi-bluetooth-5-0-chromecast-built-in/p/N82E16881716013?Description=Google%20Nest%20Mini&cm_re=Google_Nest%20Mini-_-81-716-013-_-Product", "https://www.bestbuy.ca/en-ca/product/google-nest-mini-2nd-gen-smart-speaker-chalk/13962883");

/*Sample set of ratings*/
INSERT INTO `reviews` (`r_id`, `p_id`, `id`, `username`, `post_time`, `rating`, `comment`) VALUES
(1, 1, 5, 'corro', '2021-07-18 19:45:08', 5, 'great product! Will buy again!'),
(2, 2, 5, 'corro', '2021-07-18 20:54:53', 5, 'neither great nor that bad. Was average.'),
(3, 3, 5, 'corro', '2021-07-18 20:55:00', 7, 'I would buy this again'),
(4, 1, 5, 'rames11a', '2021-07-18 20:55:10', 1, 'did not live up to my expectations'),
(5, 2, 5, 'rames11a', '2021-07-18 20:55:16', 10, 'LOVE THIS PRODUCT'),
(6, 3, 5, 'rames11a', '2021-07-18 21:03:37', 9, 'it was okay'),
(7, 1, 5, 'adamsmith01', '2021-07-18 21:30:50', 6, 'great'),
(8, 2, 5, 'adamsmith01', '2021-07-18 21:30:57', 7, 'I would recommend this to all my friends and family!'),
(9, 3, 5, 'adamsmith01', '2021-07-18 21:31:03', 3, 'not impressed'),
(10, 1, 5, 'johndoe', '2021-07-18 21:31:10', 9, 'greatness'),
(11, 2, 5, 'johndoe', '2021-07-18 21:31:21', 10, 'AMAZINGGGG'),
(12, 3, 5, 'johndoe', '2021-07-18 21:31:03', 3, 'not impressed'),
(13, 11, 5, 'janey_2001', '2021-07-18 20:55:16', 10, 'LOVE THIS PRODUCT'),
(14, 12, 5, 'janey_2001', '2021-07-18 21:03:37', 9, 'it was okay'),
(15, 13, 5, 'janey_2001', '2021-07-18 21:31:03', 3, 'not impressed'),
(16, 11, 5, 'kmadhavan', '2021-07-18 21:31:10', 9, 'greatness'),
(17, 12, 5, 'kmadhavan', '2021-07-18 21:31:21', 10, 'AMAZINGGGG'),
(18, 13, 5, 'kmadhavan', '2021-07-18 21:31:03', 3, 'not impressed'),
(19, 11, 5, 'bsohail', '2021-07-18 20:55:00', 7, 'I would buy this again'),
(20, 12, 5, 'bsohail', '2021-07-18 20:55:10', 1, 'did not live up to my expectations'),
(21, 13, 5, 'bsohail', '2021-07-18 20:55:16', 10, 'LOVE THIS PRODUCT'),
(22, 21, 5, 'corro', '2021-07-18 19:45:08', 5, 'great product! Will buy again!'),
(23, 22, 5, 'corro', '2021-07-18 20:54:53', 5, 'neither great nor that bad. Was average.'),
(24, 23, 5, 'corro', '2021-07-18 20:55:00', 8, 'I would buy this again'),
(25, 21, 5, 'rames11a', '2021-07-18 20:55:10', 1, 'did not live up to my expectations'),
(26, 22, 5, 'rames11a', '2021-07-18 20:55:16', 10, 'LOVE THIS PRODUCT'),
(27, 23, 5, 'rames11a', '2021-07-18 21:03:37', 6, 'it was okay'),
(28, 21, 5, 'adamsmith01', '2021-07-18 21:30:50', 6, 'great'),
(29, 22, 5, 'adamsmith01', '2021-07-18 21:30:57', 7, 'I would recommend this to all my friends and family!'),
(30, 23, 5, 'adamsmith01', '2021-07-18 21:31:03', 3, 'not impressed'),
(31, 22, 5, 'johndoe', '2021-07-18 21:31:21', 10, 'AMAZINGGGG'),
(32, 23, 5, 'johndoe', '2021-07-18 21:31:03', 3, 'not impressed'),
(33, 31, 5, 'janey_2001', '2021-07-18 20:55:16', 10, 'LOVE THIS PRODUCT'),
(34, 32, 5, 'janey_2001', '2021-07-18 21:03:37', 9, 'it was okay'),
(35, 33, 5, 'janey_2001', '2021-07-18 21:31:03', 3, 'not impressed'),
(36, 31, 5, 'kmadhavan', '2021-07-18 21:31:10', 9, 'greatness');

/*Sample images for front page carousel*/
INSERT INTO `carousel` (`c_id`, `c_image`, `c_created_at`) VALUES
(1,'https://sohailb.myweb.cs.uwindsor.ca/1.JPG' ,'2021-07-24 22:07:08'),
(2, 'https://sohailb.myweb.cs.uwindsor.ca/2.JPG','2021-07-24 22:10:35'),
(3,'https://sohailb.myweb.cs.uwindsor.ca/3.JPG' ,'2021-07-24 22:13:42');
