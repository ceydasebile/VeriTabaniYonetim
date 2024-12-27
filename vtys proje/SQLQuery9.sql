create table Kullanici_Adres
(
    Adres_ID int identity(1,1), --not null yerine otomatik artan alan yapılabilir. pk olarak da atanabilir.
    Sehir VARCHAR(20),
	Ulke VARCHAR(20),
	Kullanici_ID int,
    primary key (Adres_ID),
	foreign  key (Kullanici_ID) REFERENCES K_kullanicilar (K_ID)
    --yas int check(yas >= 18 and yas < 65), -- alter ile sonradan da eklenebilir. Sonradan eklerken isim de verilebilir.
    --constraint FK_PersonelSiparis foreign key (perNo) references personel(personelNo)
);