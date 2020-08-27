% rebase("base")

<h2>Doctors' List</h2>

<table>
	<thead>
		<tr>
			<th>First Name</th>
			<th>Middle Name</th>
			<th>Last Name</th>
			<th>Gender</th>
			<th>Department</th>
			<th>Phone</th>
			<th>Options</th>
		</tr>
	</thead>
	<tbody>
		% for doctor in doctors:
			<tr>
				<td>{{doctor[1]}}</td>
				<td>{{doctor[2]}}</td>
				<td>{{doctor[3]}}</td>
				<td>{{doctor[4]}}</td>
				<td>{{doctor[5]}}</td>
				<td>{{doctor[6]}}</td>
				<td>
					<a href="/doctor/{{doctor[0]}}">
						<button>View</button>
					</a>
					<a href="/doctor/delete/{{doctor[0]}}">
						<button>Delete</button>
					</a>
				</td>
			</tr>
		% end
	</tbody>
</table>
