

create table Kullanicilar1
(
    KULLANICI_ID int identity(1,1), --not null yerine otomatik artan alan yapılabilir. pk olarak da atanabilir.
    primary key (KULLANICI_ID),
    --yas int check(yas >= 18 and yas < 65), -- alter ile sonradan da eklenebilir. Sonradan eklerken isim de verilebilir.
    --constraint FK_PersonelSiparis foreign key (perNo) references personel(personelNo)
)