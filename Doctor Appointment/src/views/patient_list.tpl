% rebase("base")

<h2>Patients' List</h2>

<table>
	<thead>
		<tr>
			<th>First Name</th>
			<th>Middle Name</th>
			<th>Last Name</th>
			<th>Gender</th>
			<th>Street</th>
			<th>City</th>
			<th>Phone</th>
			<th>Assigned Doctor</th>
			<th>Options</th>
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
				<td>{{patient[6]}}</td>
				<td>{{patient[7]}}</td>
				<td>{{patient[9]}}</td>
				<td>
					<a href="/patient/delete/{{patient[0]}}">
						<button>Delete</button>
					</a>
				</td>
			</tr>
		% end
	</tbody>
</table>
