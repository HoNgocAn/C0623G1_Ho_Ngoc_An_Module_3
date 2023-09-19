USE casestudy;

-- Câu 6

SELECT h.ma_dich_vu, d.ten_dich_vu, d.dien_tich, d.chi_phi_thue, l.ten_loai_dich_vu, h.ngay_lam_hop_dong
FROM hop_dong h 
JOIN dich_vu d 
ON h.ma_dich_vu = d.ma_dich_vu
JOIN loai_dich_vu l
ON d.ma_loai_dich_vu = l.ma_loai_dich_vu
WHERE h.ngay_lam_hop_dong >"2021-3-31" OR h.ngay_lam_hop_dong<"2021-1-1";

-- Câu 7

SELECT h.ma_dich_vu, d.ten_dich_vu, d.dien_tich,d.so_nguoi_toi_da, d.chi_phi_thue,l.ten_loai_dich_vu, h.ngay_lam_hop_dong
FROM hop_dong h 
JOIN dich_vu d 
ON h.ma_dich_vu = d.ma_dich_vu
JOIN loai_dich_vu l
ON d.ma_loai_dich_vu = l.ma_loai_dich_vu
WHERE d.ma_dich_vu 
IN (SELECT ma_dich_vu  
FROM hop_dong 
WHERE YEAR(ngay_lam_hop_dong) = "2020")
AND d.ma_dich_vu  NOT IN (SELECT ma_dich_vu   
FROM hop_dong 
WHERE YEAR(ngay_lam_hop_dong) = "2021");

-- --Câu 8

-- Cách 1
SELECT DISTINCT ho_ten 
FROM khach_hang;

-- Cách 2
SELECT k.ho_ten 
FROM khach_hang k
UNION
SELECT k.ho_ten 
FROM khach_hang k;

-- Cách 3
SELECT k.ho_ten
FROM khach_hang k
GROUP BY k.ho_ten;

-- Câu 9

SELECT MONTH(h.ngay_lam_hop_dong) AS "Tháng có khách đặt phòng trong năm 2021",count(MONTH(h.ngay_lam_hop_dong)) AS "Số khách hàng đặt phòng"
FROM hop_dong h
WHERE YEAR(h.ngay_lam_hop_dong) = 2021
GROUP BY MONTH(h.ngay_lam_hop_dong)
ORDER BY MONTH(h.ngay_lam_hop_dong);

-- Câu 10

SELECT h.ma_hop_dong, h.ngay_lam_hop_dong, h.ngay_ket_thuc, h.tien_dat_coc, sum(ifnull(hct.so_luong,0)) as "So_luong_dich_vu_di_kem"
FROM hop_dong h
LEFT JOIN hop_dong_chi_tiet hct 
ON h.ma_hop_dong = hct.ma_hop_dong
LEFT JOIN dich_vu_di_kem dv 
ON hct.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
GROUP BY h.ma_hop_dong;




