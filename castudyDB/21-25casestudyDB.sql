USE casestudy;

-- Câu 21
CREATE VIEW v_nhan_vien AS
SELECT n.* 
FROM nhan_vien n
JOIN hop_dong h
ON n.ma_nhan_vien = h.ma_nhan_vien
WHERE n.dia_chi LIKE "%Hải Châu%"
AND h.ngay_lam_hop_dong = "2019-12-12";

SELECT *
FROM v_nhan_vien;

-- Câu 22
UPDATE v_nhan_vien
SET dia_chi = "Liên Chiểu" 
WHERE dia_chi = "%Hải Châu%";

-- Câu 23
DELIMITER //
CREATE  PROCEDURE deleteKhachHang(ma_khach_hang_id int)
BEGIN 
	DELETE FROM khach_hang
    WHERE ma_khach_hang = ma_khach_hang_id; 
END //
DELIMITER ;

-- CALL deleteKhachHang ();

