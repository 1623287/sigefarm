<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Administrar Cliente</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<script src="bootstrap/js/jquery.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="shortcut icon" href="" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/sidenav.css">
    <link rel="stylesheet" href="css/home.css">
    <script src="js/manage_customer.js"></script>
    <script src="js/validateForm.js"></script>
    <script src="js/restrict.js"></script>
  </head>
  <body style="max-height: 100%;">

    <?php include("sections/sidenav.html"); ?>

    <div class="container-fluid">
      <div class="container">

	  
        <?php
          require "php/header.php";
          createHeader('handshake', 'Administrar Cliente', 'Administrar Cliente Existente');
        ?>


        <div class="row">

          <div class="col-md-12 form-group form-inline">
            <label class="font-weight-bold" for="">Buscar :&emsp;</label>
            <input type="text" class="form-control" id="" placeholder="buscar cliente" onkeyup="searchCustomer(this.value);">
          </div>

          <div class="col col-md-12">
            <hr class="col-md-12" style="padding: 0px; border-top: 2px solid  #02b6ff;">
          </div>

          <div class="col col-md-12 table-responsive">
            <div class="table-responsive">
            	<table class="table table-bordered table-striped table-hover">
            		<thead>
            			<tr>
            				<th style="width: 2%;">Nº</th>
                    <th style="width: 10%;">ID de Cliente</th>
            				<th style="width: 13%;">Nombre del Cliente</th>
                    <th style="width: 13%;">Celular</th>
                    <th style="width: 17%;">Dirección</th>
                    <th style="width: 13%;">Nombre del Doctor</th>
                    <th style="width: 17%;">Dirección del Doctor</th>
                    <th style="width: 15%;">Acción</th>
            			</tr>
            		</thead>
            		<tbody id="customers_div">
                  <?php
                    require 'php/manage_customer.php';
                    showCustomers(0);
                  ?>
            		</tbody>
            	</table>
            </div>
          </div>

        </div>

        <hr style="border-top: 2px solid #ff5252;">
      </div>
    </div>
  </body>
</html>
