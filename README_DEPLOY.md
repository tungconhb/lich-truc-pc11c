# HƯỚNG DẪN DEPLOY LÊN GITHUB PAGES (5 PHÚT)

## Bước 1: Tạo repository trên GitHub

1. Mở https://github.com → đăng nhập
2. Nhấn **"+"** → **"New repository"**
3. Đặt tên: **`lich-truc`**
4. Chọn **Public** → **Create repository**

## Bước 2: Chạy deploy script

Mở Command Prompt trong thư mục `C:\Users\Riddler\Desktop\Lịch trực`:

```cmd
deploy.bat
```

Script sẽ hướng dẫn bạn từng bước.

## Bước 3: Bật GitHub Pages

1. Vào repository vừa tạo → **Settings** → **Pages**
2. **Source**: chọn "Deploy from a branch"
3. **Branch**: `main` → **Save**
4. Đợi 1-2 phút → link sẽ hiện: `https://TÊN_TÀI_KHOẢN.github.io/lich-truc/pc11c.html`

## Bước 4: Upload ảnh preview lên Imgur (cho Zalo)

1. Vào https://imgur.com/upload
2. Upload file `preview.png` (có sẵn trong thư mục)
3. Copy link ảnh (dạng `https://i.imgur.com/xxxxx.png`)
4. Mở `pc11c.html` → tìm `THAY_BANG_URL_ANH_PREVIEW` (có 2 chỗ) → thay bằng link thật

## Bước 5: Chia sẻ link

- Link web: `https://TÊN_TÀI_KHOẢN.github.io/lich-truc/pc11c.html`
- Mọi người vào link này là xem được lịch trực **real-time**
- Ai sửa ô → tất cả thấy ngay

## Bước 6: Hàng tuần cập nhật

Khi có file DOCX mới:

```cmd
cd "C:\Users\Riddler\Desktop\Lịch trực"
python import_docx_final.py
```

Dữ liệu tự động cập nhật lên Firebase → Mọi người vào link web xem ngay.

---

## KIỂM TRA NHANH

1. Mở `pc11c.html` trong trình duyệt → thấy dữ liệu? ✅
2. Click vào ô → sửa → F5 lại → thấy thay đổi? ✅
3. Mở link GitHub Pages → thấy giống local? ✅

Nếu lỗi: kiểm tra Firebase Rules (`.read: true, .write: true`).

---

## TỔNG KẾT

✅ Firebase đã cấu hình  
✅ Dữ liệu đã import  
✅ Web hiển thị real-time  
✅ Chỉ cần deploy lên GitHub Pages là xong

Chạy `deploy.bat` để bắt đầu.