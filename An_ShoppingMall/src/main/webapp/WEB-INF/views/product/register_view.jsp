<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        h2 {
            display: inline;
            margin-top: 20px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        div {
            position: relative;
            width: 300px;
            margin-left: 30px;
            margin-top: 30px;
        }

        input {
            font-size: 15px;
            color: #222222;
            width: 300px;
            border: none;
            border-bottom: solid #aaaaaa 1px;
            padding-bottom: 10px;
            padding-left: 10px;
            position: relative;
            background: none;
            z-index: 5;
        }

        .div_color_size {
            all: unset;
            display: flex;
        }

        .div_color_size div {
            position: relative;
            width: 90px;
            margin-right: -15px;
            margin-top: 30px;
        }

        .div_color_size .color_size_input {
            font-size: 15px;
            color: #222222;
            width: 90px;
            border: none;
            border-bottom: solid #aaaaaa 1px;
            padding-bottom: 10px;
            padding-left: 10px;
            position: relative;
            background: none;
            z-index: 5;
        }

        input::placeholder {
            color: #aaaaaa;
        }

        input:focus {
            outline: none;
        }

        span {
            display: block;
            position: absolute;
            bottom: 0;
            left: 0%;
            /* right로만 바꿔주면 오 - 왼 */
            background-color: #666;
            width: 0;
            height: 2px;
            border-radius: 2px;
            transition: 0.5s;
        }

        label {
            position: absolute;
            color: #aaa;
            left: 10px;
            font-size: 20px;
            bottom: 8px;
            transition: all .2s;
        }

        input:focus~label,
        input:not(:placeholder-shown)~label {
            font-size: 16px;
            bottom: 32px;
            color: #666;
            font-weight: bold;
        }

        input:focus~span,
        input:not(:placeholder-shown)~span {
            width: 100%;
        }

        textarea {
            margin-left: 30px;
            margin-bottom: 10px;
            resize: vertical;
            align-self: stretch;
            font-size: 15px;
            font-family: Arial, Helvetica, sans-serif;
            color: #222222;
            border: none;
            border-bottom: solid #aaaaaa 1px;
            padding: 12px;
            background: none;
            z-index: 5;
        }

        input[type="submit"] {
            margin-top: 10px;
            margin-bottom: 20px;
            margin-left: 30px;
            align-self: flex-start;
            padding: 10px 20px;
            background-color: #aaaaaa;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
</head>

<body>
    <h2>제품등록</h2>
    <form method="post" action="register">
        <div>
            <input type="text" required name="proName" size="70" placeholder=" ">
            <label>제품명</label>
            <span></span>
        </div>
        <div class="div_color_size">
            <div>
                <input type="text" class="color_size_input" name="color1" size="70" placeholder=" ">
                <label>색상1</label>
                <span></span>
            </div>
            <div>
                <input type="text" class="color_size_input" name="color2" size="70" placeholder=" ">
                <label>색상2</label>
                <span></span>
            </div>
            <div>
                <input type="text" class="color_size_input" name="color3" size="70" placeholder=" ">
                <label>색상3</label>
                <span></span>
            </div>
        </div>
        <div class="div_color_size">
            <div>
                <input type="text" class="color_size_input" name="size1" size="70" placeholder=" ">
                <label>사이즈1</label>
                <span></span>
            </div>
            <div>
                <input type="text" class="color_size_input" name="size2" size="70" placeholder=" ">
                <label>사이즈2</label>
                <span></span>
            </div>
            <div>
                <input type="text" class="color_size_input" name="size3" size="70" placeholder=" ">
                <label>사이즈3</label>
                <span></span>
            </div>
        </div>
        <div>
            <input type="text" required name="proPrice" size="70" placeholder=" ">
            <label>가격</label>
            <span></span>
        </div>
        <div>
            <input type="text" name="proSale" size="70" placeholder=" ">
            <label>세일가</label>
            <span></span>
        </div>
        <div>
            <input type="text" required name="proQty" size="70" placeholder=" ">
            <label>수량</label>
            <span></span>
        </div>
        <div>
            <input type="text" required name="proThumb" size="70" placeholder=" ">
            <label>썸네일</label>
            <span></span>
        </div>
        <div>
            <input type="text" required name="cateCode" size="70" placeholder=" ">
            <label>카테고리</label>
            <span></span>
        </div>
        <div>
            <input type="text" required name="proImg" size="70" placeholder=" ">
            <label>상세이미지</label>
            <span></span>
        </div>
        <textarea name="proInfo" rows="10"></textarea>
        <tr>
            <input type="submit" value="등록">
        </tr>
    </form>
</body>
</html>