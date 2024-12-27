
/* CEYDA SEBÝLE KAHVECÝ 
      B221200035        */

CREATE TABLE Kullanicilar (
    kullanici_id int IDENTITY(1,1),
    kullanici_adi varchar(20) NOT NULL,
    sifre varchar(20) NOT NULL,
	primary key (kullanici_id)

    
);

insert into Kullanicilar (kullanici_adi,sifre) values ('Ayse.nur',453628);
insert into Kullanicilar (kullanici_adi,sifre) values ('belifk',367382);
insert into Kullanicilar (kullanici_adi,sifre) values ('m.ulu',454556);
insert into Kullanicilar (kullanici_adi,sifre) values ('c.kahv',3434345);
insert into Kullanicilar (kullanici_adi,sifre) values ('bkv',77474);





CREATE TABLE Kullanici_Adres (
    adres_id int IDENTITY(1,1),
    sehir varchar(20) NOT NULL,
    ulke varchar(20) NOT NULL,
	kullanici_id int,
	primary key (adres_id),
	foreign  key (kullanici_id) REFERENCES Kullanicilar (kullanici_id)


    
);

insert into Kullanici_Adres (sehir,ulke,kullanici_id) values ('istanbul','Türkiye',1);
insert into Kullanici_Adres (sehir,ulke,kullanici_id) values ('Edirne','Türkiye',2);
insert into Kullanici_Adres (sehir,ulke,kullanici_id) values ('Ýzmir','Türkiye',3);
insert into Kullanici_Adres (sehir,ulke,kullanici_id) values ('istanbul','Türkiye',4);
insert into Kullanici_Adres (sehir,ulke,kullanici_id) values ('Ankara','Türkiye',5);

select * from Kullanici_Adres order by adres_id desc
select * from Kullanicilar order by kullanici_id desc 

CREATE TABLE Kargo (
    kargocu_id int IDENTITY(1,1),
    kargocu_ad varchar(20) NOT NULL,
	kargocu_tel int,
	primary key (kargocu_id),


    
);

insert into Kargo (kargocu_ad,kargocu_tel) values ('Feyza',534261715);
insert into Kargo (kargocu_ad,kargocu_tel) values ('Ravza',534261728);

select * from Kargo

CREATE TABLE Sepet (
    sepet_id int IDENTITY(1,1) not null,
    kullanici_id int not null,
	siparis_tarih int,
	kargo_tarih int,
	kargocu_id int not null,
	primary key (sepet_id),
	foreign  key (kullanici_id) REFERENCES Kullanicilar (kullanici_id),
	foreign  key (kargocu_id) REFERENCES Kargo (kargocu_id)
    
);

insert into Sepet (kullanici_id,siparis_tarih,kargo_tarih,kargocu_id) values (1,20230219,20230225,7);

insert into Sepet (kullanici_id,siparis_tarih,kargo_tarih,kargocu_id) values (2,20230519,20230325,9);

CREATE TABLE Tedarikci (
    tedarikci_id int IDENTITY(1,1) not null,
    tedarikci_ad varchar(20),
	tadarikci_tel int,
	primary key (tedarikci_id)
    
);

insert into Tedarikci(tedarikci_ad) values ('merveulug');
insert into Tedarikci(tedarikci_ad) values ('fatihkaya');

select * from Tedarikci

CREATE TABLE Kategori (
    kategori_id int IDENTITY(1,1) not null,
    kategori_ad varchar(20),
	primary key (kategori_id)
    
);

insert into Kategori(kategori_ad) values ('GIYIM');
insert into Kategori(kategori_ad) values ('AYAKKABI');

CREATE TABLE Urunler (
    urun_id int IDENTITY(1,1) not null,
    urun_adý varchar(20),
	urun_fiyat int,
	tedarikci_id int,
	kategori_id int,
	primary key (urun_id),
		foreign  key (tedarikci_id) REFERENCES Tedarikci (tedarikci_id),
				foreign  key (kategori_id) REFERENCES Kategori (kategori_id),



    
);
select * from Tedarikci
select * from Kategori
insert into Urunler(urun_adý,urun_fiyat,tedarikci_id,kategori_id) values ('Elbise',599,1,1);
insert into Urunler(urun_adý,urun_fiyat,tedarikci_id,kategori_id) values ('Bot',599,1,2);

CREATE TABLE Urun_Siparis (
	toplam_tutar int,
	urun_id int,
	sepet_id int,
		foreign  key (urun_id) REFERENCES Urunler (urun_id),
				foreign  key (sepet_id) REFERENCES Sepet (sepet_id),



    
);
select * from Urunler
select * from Sepet
insert into Urun_Siparis(toplam_tutar,urun_id,sepet_id) values (499,1,4);
insert into Urun_Siparis(toplam_tutar,urun_id,sepet_id) values (499,2,5);


/*TRIGGER*/
-- Urun_Siparis tablosundan veri silmek istediðimizde uyarý mesajý verir --

CREATE TRIGGER veri_sil
on Urun_Siparis
for delete
as
print('Bu tablodaki veriler silinmez!')
rollback transaction

delete from Urun_Siparis where sepet_id=1





	





















