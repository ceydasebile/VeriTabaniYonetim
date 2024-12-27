CREATE TRIGGER delete_Urun_Siparis1
on Urun_Siparis1
instead of delete
as
begin
select 'TRIGGER ÖRNEÐÝ'  as ['Bu tablodaki veriler silinmez!']
end;


CREATE TABLE Urun_Siparis1 (
	toplam_tutar int,
	urun_id int,
	sepet_id int,
		foreign  key (urun_id) REFERENCES Urunler (urun_id),
				foreign  key (sepet_id) REFERENCES Sepet (sepet_id),



    
);

DROP TRIGGER Urun_Siparis.DELETE_Urun_Siparis ON Urun_Siparis

select * from Urun_Siparis

delete from Urun_Siparis where sepet_id=2




