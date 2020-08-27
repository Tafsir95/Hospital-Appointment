% rebase("base")

% if msg:
	<h2>{{msg}}</h2>
% end

<h1>Please Provide Doctor Information</h1>
<form action="{{request.path}}" method="post">
	First name:
	<br>
	<input type="text" name="first_name" value="{{request.POST.get("first_name", "")}}" required>
	<br>
	Middle Name:
	<br>
	<input type="text" name="middle_name" value="{{request.POST.get("middle_name", "")}}">
	<br>
	Last name:
	<br>
	<input type="text" name="last_name" value="{{request.POST.get("last_name", "")}}">
	<br>
	Gender:
	<input type="radio" name="gender" value="male" % if request.POST.get("gender") == "male" : "selected" % end>Male
	<input type="radio" name="gender" value="female">Female
	<input type="radio" name="gender" value="other">Other
	<br>
	Department:
	<br>
	<input type="text" name="dept" value="{{request.POST.get("dept", "")}}" required>
	<br>
	Phone:
	<br>
	<input type="number" name="phone" value="{{request.POST.get("phone", "")}}" required>
	<br>
	<input type="submit" value="Submit">
</form>
