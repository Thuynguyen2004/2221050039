<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
          p{
            font-weight: bold;
            margin:5px 0;
        }
        h1{
            margin: 5px 0;
        }
        .container{
            border: 1px solid black;
            border-radius: 10px;
            width: 35%;
            padding: 20px 0;
            display: flex;
            justify-content: center;
            margin-top : 50px;
            margin-left : 50px;
        }
        form{
            width:80%;
        }
        input{
            width:100%;
            padding: 5px 0;

        }
        .box{
            margin: 10px 0;
        }
        .select{
            width: 100%;
            padding: 5px 0;
        }
        .warning{
            color: red;
            font-weight: bold;

        }

    </style>
</head>
<body>
    <div class="container">
    <form action="index.php?page_layout=themquocgia" method="post">
        <h1>Thêm quốc gia</h1>
         <div>
        <p>Tên quốc gia</p>
        <input type = "text" name="ten-quoc-gia" placeholder="Tên quốc gia">
    </div>

        <div><input type="submit" value="Thêm"></div>
    </form>
    </div>
    <?php
    include("connect.php");
    if(!empty($_POST["ten-quoc-gia"])){
        $tenQuocGia= $_POST["ten-quoc-gia"];
       
         $sql = "INSERT INTO `quoc_gia`(`ten_quoc_gia`) VALUES ('$tenQuocGia')";
        mysqli_query($conn, $sql);
        header('location: index.php?page_layout=quocgia');
       // mysqli_close($conn);
       }else{
        echo '<p class="warning">Vui lòng nhập đầy đủ thông tin</p>';
       }

    ?>
</body>
</html>