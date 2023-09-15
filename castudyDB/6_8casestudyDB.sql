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
WHERE year(h.ngay_lam_hop_dong) = 2020 ;

-- --Câu 8
SELECT DISTINCT ho_ten 
FROM khach_hang;

-- Câu 9

SELECT h.ngay_lam_hop_dong, h.tien_dat_coc,k.ho_ten
FROM khach_hang k
JOIN hop_dong h
ON k.ma_khach_hang = h.ma_khach_hang
WHERE YEAR(h.ngay_lam_hop_dong) = 2021
ORDER BY h.ngay_lam_hop_dong;

-- Câu 10

SELECT h.ma_hop_dong, h.ngay_lam_hop_dong, h.ngay_ket_thuc, h.tien_dat_coc, sum(hct.so_luong) as "So_luong_dich_vu_di_kem"
FROM hop_dong h
JOIN hop_dong_chi_tiet hct 
ON h.ma_hop_dong = hct.ma_hop_dong
JOIN dich_vu_di_kem dv 
ON hct.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
GROUP BY h.ma_hop_dong;




