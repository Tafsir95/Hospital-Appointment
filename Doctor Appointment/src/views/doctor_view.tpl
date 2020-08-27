% rebase("base")

<h2>Doctor's Details</h2>

First Name: {{doctor[1]}}
<br>
Middle Name: {{doctor[2]}}
<br>
Last Name: {{doctor[3]}}
<br>
Gender: {{doctor[4]}}
<br>
Department: {{doctor[5]}}
<br>
Phone: {{doctor[6]}}
<br>

<h2>Patients</h2>
<table>
	<thead>
		<tr>
			<th>First Name</th>
			<th>Middle Name</th>
			<th>Last Name</th>
			<th>Gender</th>
			<th>Phone</th>
		</tr>
	</thead>
	<tbody>
		% for patient in patients:
			<tr>
				<td>{{patient[1]}}</td>
				<td>{{patient[2]}}</td>
				<td>{{patient[3]}}</td>
				<td>{{patient[4]}}</td>
				<td>{{patient[5]}}</td>
			</tr>
		% end
	</tbody>
</table>
