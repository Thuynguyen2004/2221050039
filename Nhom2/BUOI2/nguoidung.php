<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        table{
            width:100%;
        }
        .xoa{
            padding: 0 10px;
            color: white;
            background-color: red;
        }
        .capnhat{
            background-color: blue;
            padding: 0px 10px;
            color: white;
            border-radius: 5px;
        }
        .them{
            background-color: white;
            border: 1px solid black;
            padding: 10px 20px;
            color: black;
            border-radius: 5px;

        }
        td{
            padding: 10px;
        }
        .chucnang{
            display: flex;
        }
        .control{
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .chinh{
            display: flex;
              align-items: center;
            justify-content: space-between;

        }
        

    </style>
</head>
<body>
    <div class = "chinh">
    <h1>Thông tin người dùng</h1>
    <div>
        <a class="them" href="index.php?page_layout=themnguoidung">Thêm</a>
    </div>
    </div>
    <table border="1">
        <tr>
            <th>Tên đăng nhập</th>
            <th>Họ tên</th>
            <th>Email</th>
            <th>Số điện thoại</th>
            <th>Vai trò</th>
            <th>Ngày sinh</th>
            <th>Chức năng</th>
        </tr>
        <?php
        include("connect.php");
        $sql = "SELECT nd.*, vt.ten_vai_tro FROM `nguoi_dung` nd join vai_tro vt on nd.vai_tro_id = vt.id";
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_array($result)){
        ?>
        <tr>
            <td><?php echo $row["ten_dang_nhap"] ?></td>
            <td><?php echo $row["ho_ten"] ?></td>
            <td><?php echo $row["email"] ?></td>
            <td><?php echo $row["sdt"] ?></td>
            <td><?php echo $row["ten_vai_tro"] ?></td>
            <td><?php echo $row["ngay_sinh"] ?></td>
            <td>
                <a class="capnhat" href="index.php?page_layout=capnhatnguoidung&id=<?php echo $row["id"] ?>">Cập nhật</a>
                 <a class="xoa" href="xoanguoidung.php?id=<?php echo $row["id"] ?>">Xóa</a>
            </td>
        </tr>
        <?php } ?>
    </table>
</body>
</html>