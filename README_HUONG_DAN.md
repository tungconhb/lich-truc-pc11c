# HƯỚNG DẪN TRIỂN KHAI LỊCH TRỰC LÊN FIREBASE + GITHUB PAGES

## A. TỔNG QUAN GIẢI PHÁP

```
┌──────────────────────────────────────────────────────┐
│                   Firebase Cloud                       │
│              (Realtime Database)                       │
│   Lưu toàn bộ dữ liệu lịch trực + Trực ban            │
│   Mọi thay đổi sync NGAY LẬP TỨC cho tất cả           │
└────────────────────┬─────────────────────────────────┘
                     │
      ┌──────────────┼──────────────┐
      ▼              ▼              ▼
   Người A       Người B        Người C
   (Xem)         (Sửa ô Hồ sơ)  (Xem)
                 → Firebase cập nhật
                 → A & C thấy ngay
```

**Quy trình vận hành hàng tuần:**
1. Nhận file DOCX mới
2. Chạy lệnh: `python import_docx_final.py`
3. Dữ liệu tự động cập nhật lên Firebase
4. Tất cả mọi người vào link xem ngay - không cần F5


## B. CÁC BƯỚC THỰC HIỆN (LÀM 1 LẦN DUY NHẤT)

### Bước 1: Tạo dự án Firebase (2 phút)

1. Vào https://console.firebase.google.com/
2. Đăng nhập bằng tài khoản Google
3. Nhấn "**Thêm dự án**" (Add project)
4. Đặt tên: `lich-truc-tg3`
5. Bỏ chọn Google Analytics (không cần)
6. Nhấn "Tạo dự án" → đợi vài giây → "Tiếp tục"

### Bước 2: Bật Realtime Database (1 phút)

1. Trong Firebase Console, menu bên trái → **Realtime Database**
2. Nhấn "**Tạo cơ sở dữ liệu**" (Create Database)
3. Chọn vị trí: **Singapore** (asia-southeast1) - gần Việt Nam, tốc độ nhanh
4. Chế độ bảo mật: chọn "**Bắt đầu ở chế độ kiểm thử**" (Start in test mode)
5. Nhấn "Bật"

### Bước 3: Lấy Database Secret (1 phút)

1. Vào biểu tượng bánh răng ⚙️ cạnh "Tổng quan dự án" → **Cài đặt dự án**
2. Tab "**Tài khoản dịch vụ**" (Service Accounts)
3. Mục "**Database Secrets**" → nhấn "Hiển thị" (Show)
4. Copy chuỗi secret dài đó

### Bước 4: Lấy cấu hình Web App (1 phút)

1. Vẫn trong Cài đặt dự án → Tab "**Chung**" (General)
2. Cuối trang, mục "Ứng dụng của bạn" → nhấn biểu tượng Web `</>`
3. Đặt tên: `lich-truc-web`
4. Copy toàn bộ đoạn `firebaseConfig = { ... }`

### Bước 5: Cấu hình file pc11c.html

1. Mở file `pc11c.html` bằng Notepad
2. Tìm dòng 289: `var firebaseConfig = {`
3. Thay toàn bộ nội dung từ `{` đến `}` bằng config đã copy ở Bước 4
4. Lưu file

### Bước 6: Cấu hình file import_docx_final.py

1. Mở file `import_docx_final.py` bằng Notepad
2. Tìm dòng `FIREBASE_DB_URL` → thay `THAY_BANG_PROJECT` bằng tên project thật
3. Tìm dòng `FIREBASE_SECRET` → thay bằng secret ở Bước 3
4. Lưu file

### Bước 7: Push dữ liệu lần đầu

```bash
cd "C:\Users\Riddler\Desktop\Lịch trực"
python import_docx_final.py
```

### Bước 8: Upload lên GitHub Pages

1. Vào https://github.com → tạo repository mới tên `lich-truc`
2. Cài Git: https://git-scm.com/download/win
3. Chạy các lệnh:

```bash
cd "C:\Users\Riddler\Desktop\Lịch trực"

# Khởi tạo Git
git init
git add pc11c.html preview.png
git commit -m "Lịch trực Firebase version"

# Push lên GitHub
git remote add origin https://github.com/TEN_TAI_KHOAN/lich-truc.git
git push -u origin main
```

4. Vào repository trên GitHub → **Settings** → **Pages**
5. Source: "Deploy from a branch", Branch: "main" → Save
6. Đợi 1-2 phút, link sẽ có dạng: `https://TEN_TAI_KHOAN.github.io/lich-truc/pc11c.html`

### Bước 9: Upload ảnh preview lên Imgur (cho Zalo hiển thị đẹp)

1. Vào https://imgur.com/upload
2. Upload file `preview.png`
3. Copy link ảnh (dạng `https://i.imgur.com/xxxxx.png`)
4. Mở `pc11c.html`, tìm `THAY_BANG_URL_ANH_PREVIEW` (có 2 chỗ)
5. Thay bằng link ảnh thật


## C. SỬ DỤNG HÀNG NGÀY

### Nhập lịch từ DOCX mới (mỗi tuần 1 lần)

```bash
cd "C:\Users\Riddler\Desktop\Lịch trực"
python import_docx_final.py
```

Dữ liệu tự động cập nhật lên Firebase → Mọi người vào link xem ngay.

### Mọi người chỉnh sửa trực tiếp

- Click vào ô bất kỳ → sửa nội dung
- Ấn vào hàng → hiện nút [+] thêm hàng, [x] xóa hàng
- Sửa Trực ban ở dòng màu vàng
- **Mọi thay đổi sync ngay cho tất cả người đang xem**


## D. PHÂN QUYỀN BẢO MẬT (TÙY CHỌN)

Mặc định chế độ test cho phép mọi người đọc/ghi. Để hạn chế:

1. Firebase Console → Realtime Database → Tab "Rules"
2. Sửa thành:

```json
{
  "rules": {
    ".read": true,
    ".write": "auth != null"
  }
}
```

Cách này: mọi người vẫn xem được nhưng chỉ Administrator mới ghi được (cần cấu hình thêm).


## E. CÁC FILE TRONG DỰ ÁN

| File | Vai trò |
|------|---------|
| `pc11c.html` | Giao diện web chính (chạy trên GitHub Pages) |
| `import_docx_final.py` | Script import DOCX → Firebase |
| `preview.png` | Ảnh hiển thị khi share link Zalo |
| `data.json` | File dự phòng (tự động tạo) |


## F. KHẮC PHỤC SỰ CỐ

| Vấn đề | Cách sửa |
|--------|----------|
| Trang web không hiện dữ liệu | Kiểm tra đã cấu hình firebaseConfig đúng chưa |
| Script báo "Chưa cấu hình" | Kiểm tra FIREBASE_DB_URL và FIREBASE_SECRET |
| Không sửa được ô | Kiểm tra Firebase Rules cho phép `.write: true` |
| Link Zalo không hiện ảnh | Đã upload preview.png lên Imgur và sửa URL trong HTML? |
| Sau import vẫn thấy dữ liệu cũ | Xóa cache trình duyệt (Ctrl+Shift+R) |
