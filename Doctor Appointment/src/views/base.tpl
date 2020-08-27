<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Hospital Management System</title>
  <link href="/static/css/style.css" type="text/css" rel="stylesheet">
  <style type="text/css">
    .dropdown {
    float: left;
    overflow: hidden;
    }

    .dropdown .dropbtn {
        font-size: 16px;
        border: none;
        outline: none;
        color: white;
        padding: 14px 16px;
        background-color: inherit;
        font-family: inherit;
        margin: 0;
    }

    .navbar a:hover, .dropdown:hover .dropbtn {
        background-color: red;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    .dropdown-content a {
        float: none;
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        text-align: left;
    }

    .dropdown-content a:hover {
        background-color: #ddd;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }
  </style>

</head>
<body>
  <div class="top">
		<div>
		 Contact Us +880123456334 | dhaka@hospital.com
		</div>
	</div>

	<div class="logo">
		<div>
			<table>
				<tr>
					<td width="600px" style="font-size:50px;font-family:forte;"> <font color="#428bca"> Dhaka  </font><font color="#000"> Hospital</font> </td>
					<td> <br> <br>
						<font size="4px">
							<a href="/">HOME</a>
							<a href="/about">ABOUT US</a>
							<a href="/service">SERVICE</a>
							<div class="dropdown">
                <button class="dropbtn">Doctor
                  <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                  <a href="/doctor/add">Doctor Add</a>
                  <a href="/doctor/list">Doctor List</a>
                </div>
              </div>
              <div class="dropdown">
                <button class="dropbtn">Appointment
                  <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                  <a href="/patient/add">Patient Add</a>
                  <a href="/patient/list">Patient List</a>
                </div>
              </div>
							<a href="/contact">CONTACT US</a>
						</font>
					</td>
				</tr>
			</table>
		</div>
	</div>
  {{!base}}
</body>
</html>
