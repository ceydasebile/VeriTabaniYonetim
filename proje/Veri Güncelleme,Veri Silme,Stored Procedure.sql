
/*Veri Güncelleme*/
UPDATE Kullanicilar
SET kullanici_adi = 'bkv2', sifre = '12345'
WHERE kullanici_adi = 'bkv' AND sifre = '77474';

/*Veri Silme*/
DELETE FROM Kullanici_Adres
WHERE kullanici_id = (SELECT kullanici_id FROM Kullanicilar WHERE kullanici_adi = 'c.kahv' AND sifre = '3434345');

DELETE FROM Kullanicilar
WHERE kullanici_adi = 'c.kahv' AND sifre = '3434345';


/* Stored Procedure */
/*Kullanicilar tablosundaki kullanýcý bilgilerini ve bu kullanýcýlarýn adreslerini getiren bir stored procedure*/

CREATE PROCEDURE GetUserAddresses
    @KullaniciID INT
AS
BEGIN
    SELECT 
        k.kullanici_id,
        k.kullanici_adi,
        k.sifre,
        ka.adres_id,
        ka.sehir,
        ka.ulke
    FROM 
        Kullanicilar k
    LEFT JOIN 
        Kullanici_Adres ka ON k.kullanici_id = ka.kullanici_id
    WHERE 
        k.kullanici_id = @KullaniciID;
END;

EXEC GetUserAddresses @KullaniciID = 1;
EXEC GetUserAddresses @KullaniciID = 2;
    


