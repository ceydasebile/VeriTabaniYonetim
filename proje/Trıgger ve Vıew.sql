
/*TRIGGER*/
CREATE TRIGGER trgAfterUrunlerInsert
ON Urunler
AFTER INSERT
AS 
BEGIN
    -- Yeni eklenen urunlerin fiyatlarýný %10 indirimli hale getirir
    UPDATE u
    SET u.urun_fiyat = u.urun_fiyat * 0.9
    FROM Urunler u
    INNER JOIN inserted i ON u.urun_id = i.urun_id;
END;
GO

-- Yeni bir ürün ekler
INSERT INTO Urunler (urun_adý, urun_fiyat, tedarikci_id, kategori_id) 
VALUES ('Ceket', 100, 1, 1);

-- Urunler tablosunu kontrol eder
SELECT * FROM Urunler;


/*VÝEW*/
CREATE VIEW UrunBilgileri AS
SELECT
urun_id,
urun_adý,
urun_fiyat
FROM
  Urunler;

-- UrunBilgileri VIEW'inden veri seçme
SELECT * FROM UrunBilgileri;
