-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
use case_study;
SET SQL_SAFE_UPDATES = 0;
delete n
from nhan_vien n 
left join hop_dong h on n.ma_nhan_vien = h.ma_nhan_vien
where h.ma_hop_dong is null;
SET SQL_SAFE_UPDATES = 1;
select * from nhan_vien;

-- 17.	Cập nhật thông tin những khách hàng có 
-- ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

SET SQL_SAFE_UPDATES = 0;
update khach_hang k
 join loai_khach lk on k.ma_loai_khach = k.ma_loai_khach 
 join hop_dong h on k.ma_khach_hang = h.ma_khach_hang
 join dich_vu d on h.ma_dich_vu = d.ma_dich_vu
 join hop_dong_chi_tiet hct on h.ma_hop_dong = hct.ma_hop_dong
 join dich_vu_di_kem dvdk on hct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
set k.ma_loai_khach = 1
where k.ma_loai_khach = 2 and d.chi_phi_thue + hct.so_luong * dvdk.gia >10000000 and year(h.ngay_lam_hop_dong) = 2021 ;
SET SQL_SAFE_UPDATES = 1;
select * from khach_hang 
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET FOREIGN_KEY_CHECKS=0;
delete k
from khach_hang k
join hop_dong h on k.ma_khach_hang = h.ma_khach_hang
where year(h.ngay_lam_hop_dong) <2021; 
 SET FOREIGN_KEY_CHECKS=1;
 select * from khach_hang;


-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 
-- lần trong năm 2020 lên gấp đôi.
SET SQL_SAFE_UPDATES = 0;
update dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hct on dvdk.ma_dich_vu_di_kem = hct.ma_dich_vu_di_kem
join hop_dong h on hct.ma_hop_dong = h.ma_hop_dong
set dvdk.gia = dvdk.gia* 2
where hct.ma_dich_vu_di_kem  IN (
    SELECT ma_dich_vu_di_kem
    FROM hop_dong_chi_tiet 
    where year(h.ngay_lam_hop_dong) =2020
    GROUP BY ma_dich_vu_di_kem
    HAVING COUNT(*) > 10
);
SET SQL_SAFE_UPDATES = 1;
select * from dich_vu_di_kem;


-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng 
-- có trong hệ thống, thông tin hiển thị bao gồm id 
-- (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select n.ma_nhan_vien, n.ho_ten, n.email, n.so_dien_thoai, n.ngay_sinh, n.dia_chi
from nhan_vien n
union all 
select k.ma_khach_hang, k.ho_ten, k.email, k.so_dien_thoai, k.ngay_sinh, k.dia_chi
from khach_hang k;




