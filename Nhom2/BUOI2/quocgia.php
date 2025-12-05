<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <style>
        table{
            width: 100%;
        }
        .xoa{
            background-color: red;
            padding: 0px 10px;
            color: white;
        }
        .chinh{
            display: flex;
              align-items: center;
            justify-content: space-between;

        }
        .them{
            background-color: white;
            border: 1px solid black;
            padding: 10px 20px;
            color: black;
            border-radius: 5px;

        }
        .capnhat{
            background-color: blue;
            padding: 0px 10px;
            color: white;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class = "chinh">
    <h1>Thông tin quốc gia</h1>
    <div>
        <a class="them" href="index.php?page_layout=themquocgia">Thêm</a>
    </div>
    </div>
    <table border=1>
        <tr>
            <th>id</th>
            <th>Tên quốc gia</th>
            <th>Chức năng</th>
        </tr>
        <?php 
            include("connect.php");
            $sql = "SELECT *FROM `quoc_gia`";
            $result = mysqli_query($conn, $sql);
            while($row = mysqli_fetch_array($result)){
        ?> 
        <tr>
            <td><?php echo $row["id"]?></td>
            <td><?php echo $row["ten_quoc_gia"] ?></td>
            <td>
                 <a class="capnhat" href="index.php?page_layout=capnhatquocgia&id=<?php echo $row["id"] ?>">Cập nhật</a>
                <a class="xoa" href="xoaquocgia.php?id=<?php echo $row["id"] ?>">Xóa</a>
            </td>
        </tr>
        <?php }?>
    </table>
</body>
</html>