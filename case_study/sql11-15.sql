use case_study;

-- 11.	Hiển thị thông tin các dịch vụ đi 
-- kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” 
-- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select *
from dich_vu_di_kem d
join hop_dong_chi_tiet hct on d.ma_dich_vu_di_kem = hct.ma_dich_vu_di_kem
join hop_dong h on hct.ma_hop_dong = h.ma_hop_dong
join khach_hang k on h.ma_khach_hang = k.ma_khach_hang
join loai_khach lk on k.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = "Diamond" and k.dia_chi like "%Vinh" or k.dia_chi like "Quảng Ngãi";

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên),
 -- ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào
-- 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select 
 h.ma_hop_dong, n.ho_ten, k.ho_ten, k.so_dien_thoai, d.ten_dich_vu, sum(hct.so_luong) as so_luong, h.tien_dat_coc
from hop_dong h
 join nhan_vien n on h.ma_nhan_vien = n.ma_nhan_vien 
 join khach_hang k on h.ma_khach_hang = k.ma_khach_hang
 join dich_vu d on h.ma_dich_vu = d.ma_dich_vu 
 left join hop_dong_chi_tiet hct on h.ma_hop_dong = hct.ma_hop_dong
 where (month(h.ngay_lam_hop_dong) >9 and year(h.ngay_lam_hop_dong) = 2020 ) and  ((month(h.ngay_lam_hop_dong)<7 and year(h.ngay_lam_hop_dong) = 2021) = 0)
 group by h.ma_hop_dong;
 
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất 
-- bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

SELECT 
    d.ma_dich_vu_di_kem,
    d.ten_dich_vu_di_kem,
    SUM(hct.so_luong) AS so_luong
FROM
    dich_vu_di_kem d
        JOIN
    hop_dong_chi_tiet hct ON d.ma_dich_vu_di_kem = hct.ma_dich_vu_di_kem
WHERE
    hct.so_luong IN (SELECT 
             MAX(so_luong)
        FROM
            dich_vu_di_kem )
GROUP BY d.ma_dich_vu_di_kem , d.ten_dich_vu_di_kem;

-- 14 	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).
select  h.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, COUNT(*) as so_lan_su_dung
from dich_vu_di_kem dvdk
left join hop_dong_chi_tiet hct on dvdk.ma_dich_vu_di_kem = hct.ma_dich_vu_di_kem
left join hop_dong h on hct.ma_hop_dong = h.ma_hop_dong
left join dich_vu d on h.ma_dich_vu = d.ma_dich_vu
left join loai_dich_vu ldv on d.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE dvdk.ma_dich_vu_di_kem NOT IN (
    SELECT ma_dich_vu_di_kem
    FROM hop_dong_chi_tiet
    GROUP BY ma_dich_vu_di_kem
    HAVING COUNT(DISTINCT ma_hop_dong) > 1
)
group by  h.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem
 HAVING COUNT(*) = 1;
 
 -- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm
 -- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, 
 -- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.


select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do,bo_phan.ten_bo_phan,nv.so_dien_thoai,nv.dia_chi
, count(h.ma_hop_dong) as so_luong_hop_dong
from nhan_vien nv 
join hop_dong h on nv.ma_nhan_vien = h.ma_nhan_vien 
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan on nv.ma_bo_phan = bo_phan.ma_bo_phan
group by nv.ma_nhan_vien
having count(h.ma_hop_dong) <4 









