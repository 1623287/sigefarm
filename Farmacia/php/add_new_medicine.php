<?php
  require "db_connection.php";
  if($con) {
    $name = ucwords($_GET["name"]);
    $packing = strtoupper($_GET["packing"]);
    $generic_name = ucwords($_GET["generic_name"]);
    $suppliers_name = $_GET["suppliers_name"];

    $query = "SELECT * FROM medicines WHERE UPPER(NAME) = '".strtoupper($name)."' AND UPPER(PACKING) = '".strtoupper($packing)."' AND UPPER(SUPPLIER_NAME) = '".strtoupper($suppliers_name)."'";
    $result = mysqli_query($con, $query);
    $row = mysqli_fetch_array($result);
    if($row)
      echo "¡Medicina $name con $packing ya existe por el proveedor $suppliers_name!";
    else {
      $query = "INSERT INTO medicines (NAME, PACKING, GENERIC_NAME, SUPPLIER_NAME) VALUES('$name', '$packing', '$generic_name', '$suppliers_name')";
      $result = mysqli_query($con, $query);
      if(!empty($result))
  			echo "$name registrado...";
  		else
  			echo "¡No se pudo registrar a $name!";
    }
  }
?>
