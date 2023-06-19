use case_study;


-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, 
-- chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT 
    d.ma_dich_vu,
    d.ten_dich_vu,
    d.dien_tich,
    d.chi_phi_thue,
    loai_dich_vu.ten_loai_dich_vu
FROM
    dich_vu AS d
        JOIN
    loai_dich_vu ON d.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
        JOIN
    hop_dong ON d.ma_dich_vu = hop_dong.ma_dich_vu
WHERE
    hop_dong.ma_dich_vu not IN (SELECT 
            hop_dong.ma_dich_vu
        FROM
            hop_dong
        WHERE
            ngay_lam_hop_dong  BETWEEN '2021-01-01 00:00:00' AND '2021-03-31 00:00:00')
GROUP BY d.ma_dich_vu;
    
    -- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
    -- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
    -- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
    
     select d.ma_dich_vu, d.ten_dich_vu, d.dien_tich, d.so_nguoi_toi_da, d.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
     from dich_vu as d
     join loai_dich_vu on d.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
     join hop_dong on d.ma_dich_vu = hop_dong.ma_dich_vu
     where
     year(hop_dong.ngay_lam_hop_dong) = 2020 and  hop_dong.ma_dich_vu not in (select hop_dong.ma_dich_vu
     from hop_dong
     where  year(ngay_lam_hop_dong) = 2021 
     )
     group by d.ma_dich_vu;
    
 --   8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
 --   Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
 -- cách 1
   select k.ho_ten
   from khach_hang k
   group by k.ho_ten;
   
   -- cách 2
   SELECT DISTINCT
    k.ho_ten
FROM
    khach_hang k;
   
   -- cách 3
  select k.ho_ten
  from loai_khach lk 
 right join khach_hang k on lk.ma_loai_khach = k.ma_khach_hang
 group by k.ho_ten;
 
 -- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với 
 -- mỗi tháng trong năm 2021 
 -- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
 
   select  month(h.ngay_lam_hop_dong)  as thang , count(h.ma_khach_hang) as so_luong_khach
   from hop_dong h
   where year(h.ngay_lam_hop_dong) = 2021 
   group by month(h.ngay_lam_hop_dong) ;
   
 --  10.	Hiển thị thông tin tương ứng với từng hợp đồng 
 --  thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
 --  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, 
 --  tien_dat_coc, so_luong_dich_vu_di_kem 
 --  (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
   
   select h.ma_hop_dong, h.ngay_lam_hop_dong, h.ngay_ket_thuc, h.tien_dat_coc, 
  COALESCE(sum(hct.so_luong),0) as so_luong
   from hop_dong h
   left join hop_dong_chi_tiet hct on h.ma_hop_dong = hct.ma_hop_dong
   group by h.ma_hop_dong, h.ngay_lam_hop_dong, h.ngay_ket_thuc, h.tien_dat_coc
    
    
    
    
    
    
    
