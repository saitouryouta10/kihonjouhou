<?php 
$host = "localhost:3306";
$user = "kihon_db_2";
$pass = "root";
$db = "kihonjouhou";

$dsn = "mysql:dbname={$db};host={$host};";

$name = filter_input(INPUT_POST, "name", FILTER_SANITIZE_STRING);
$name = "%".$name."%";

try {
    $pdo = new PDO($dsn, $user, $pass);
    $pdo->exec('SET NAMES uft8');
    $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "select * from tango left join jenre on tango.jenre_id = jenre.id WHERE name like ?
            OR keyword LIKE ? OR meaning LIKE ? OR jenre_name LIKE ?";

    $stm = $pdo->prepare($sql);
    $stm->bindParam(1, $name);
    $stm->bindParam(2, $name);
    $stm->bindParam(3, $name);
    $stm->bindParam(4, $name);

    $stm->execute();
    $result = $stm->fetchAll(PDO::FETCH_ASSOC);

    $pdo = null;
    
} catch (Exception $e) {
    echo $e->getMessage();
    exit();
}
?>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>hoge</title>

    <style>
        td {
            border: solid 1px;
        }
    </style>

</head>
<body>
    <table>
    <thead>
        <tr>
            <th>単語名</th>
            <th>キーワード</th>
            <th>説明</th>
            <th>ジャンル</th>
        </tr>
    </thead>
            <?php foreach ($result as $row):?>
            <tr>
                <td>
                    <!-- <?php var_dump($row); ?> -->
                    <?= $row["name"]; ?>
                </td>
                <td>
                    <?php if (empty($row["keyword"]) || $row["keyword"] === "null" ): ?>
                        <p>無し</p>
 
                    <?php else: ?>
                        <?= $row["keyword"]; ?>
                        <?php endif; ?>
                </td>
                <td>
                    <?= $row["meaning"]; ?>
                </td>
                <td>
                    <?= $row["jenre_name"]; ?>
                </td>
            </tr>
            <?php endforeach; ?>
    </table>
    <a href="index.html">戻る</a>

</body>
</html>