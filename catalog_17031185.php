<?php

	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "catalog_17031185";

	$connect = new mysqli($servername, $username, $password, $dbname);

	if ($connect->connect_error){
		die("Connection Failed! " . $connect->connect_error);
	}
else{
	$compSql = "SELECT * FROM company_info";
	$resComp = $connect->query($compSql);

	$compServ = "SELECT * FROM company_service";
	$resCompServ = $connect->query($compServ);

	$empSql = "SELECT * FROM emp_info";
	$resEmp = $connect->query($empSql);

	$empInfo = "SELECT * FROM emp_contact";
	$resInfo = $connect->query($empInfo);


	$xml = new DOMDocument('1.0');
	$xml->formatOutput=true;

	$company = $xml->createElement("Company");
	$xml->appendChild($company);

	$compInfo = $xml->createElement("Company_Info");
	$company->appendChild($compInfo);

	$logo = $xml->createElement("logo");
	$compInfo->appendChild($logo);

	while ($row = mysqli_fetch_assoc($resComp)){
		$compName = $xml->createElement("Name", $row["Comp_Name"]);
		$compInfo->appendChild($compName);


		$compCont = $xml->createElement("Contact");
		$compInfo->appendChild($compCont);

		$street = $xml->createElement("Street", $row["Street"]);
		$compCont->appendChild($street);

		$city = $xml->createElement("City", $row["City"]);
		$compCont->appendChild($city);

		$phone = $xml->createElement("Phone", $row["Phone_No"]);
		$compCont->appendChild($phone);
	}

	$Services = $xml->createElement("Services");
	$compInfo->appendChild($Services);
	
	while ($row =  mysqli_fetch_assoc($resCompServ)) {
		$Service = $xml->createElement("Service");
		$Service->setAttribute("Service_ID",$row["Service_ID"]);
		$Services->appendChild($Service);
		$Service_Name = $xml->createElement("Service_Name",$row["Service_Name"]);
		$Service->appendChild($Service_Name);
		$Service_Desc = $xml->createElement("Service_Desc",$row["Service_Desc"]);
		$Service->appendChild($Service_Desc);
	}

	$employee = $xml->createElement("Employee");
	$company->appendChild($employee);
	
	while (($row = mysqli_fetch_assoc($resEmp)) && ($row2 = mysqli_fetch_assoc($resInfo))) {
		$employeeInfo = $xml->createElement("Employee_Info");
		$employeeInfo->setAttribute("Emp_Info_ID",$row["Emp_Info_Id"]);
		$employee->appendChild($employeeInfo);
	
		$empName = $xml->createElement("Emp_Name");
		$employeeInfo->appendChild($empName);

		$fName = $xml->createElement("First_Name", $row["First_Name"]);
		$empName->appendChild($fName);

		if ($row["Middle_Name"] != ""){
			$mName = $xml->createElement("Middle_Name", $row["Middle_Name"]);
			$empName->appendChild($mName);
		}

		$lName = $xml->createElement("Last_Name", $row["Last_Name"]);
		$empName->appendChild($lName);

		$contact = $xml->createElement("Emp_Contact");
		$employeeInfo->appendChild($contact);

		$cntry = $xml->createElement("Emp_Country", $row2["Country"]);
		$contact->appendChild($cntry);

		$city = $xml->createElement("Emp_City", $row2["City"]);
		$contact->appendChild($city);

		$street = $xml->createElement("Emp_Street", $row2["Street"]);
		$contact->appendChild($street);

		$phone = $xml->createElement("Emp_Phone", $row2["Phone_No"]);
		$contact->appendChild($phone);

	}


	echo "<xmp>".$xml->saveXML()."</xmp>";

	$xml->save("catalog_17031185.xml");
}
?>