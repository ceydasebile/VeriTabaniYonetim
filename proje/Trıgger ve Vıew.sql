
/*TRIGGER*/
CREATE TRIGGER trgAfterUrunlerInsert
ON Urunler
AFTER INSERT
AS 
BEGIN
    -- Yeni eklenen urunlerin fiyatlar�n� %10 indirimli hale getirir
    UPDATE u
    SET u.urun_fiyat = u.urun_fiyat * 0.9
    FROM Urunler u
    INNER JOIN inserted i ON u.urun_id = i.urun_id;
END;
GO

-- Yeni bir �r�n ekler
INSERT INTO Urunler (urun_ad�, urun_fiyat, tedarikci_id, kategori_id) 
VALUES ('Ceket', 100, 1, 1);

-- Urunler tablosunu kontrol eder
SELECT * FROM Urunler;


/*V�EW*/
CREATE VIEW UrunBilgileri AS
SELECT
urun_id,
urun_ad�,
urun_fiyat
FROM
  Urunler;

-- UrunBilgileri VIEW'inden veri se�me
SELECT * FROM UrunBilgileri;
