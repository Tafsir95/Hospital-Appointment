import os
import sqlite3

from bottle import redirect, request, route, run, SimpleTemplate, static_file, template


SimpleTemplate.defaults["request"] = request
app_path = os.path.dirname(os.path.abspath(__file__))
base_path = os.path.dirname(app_path)


@route("/static/<filepath:path>")
def server_static(filepath):
    return static_file(filepath, root=os.path.join(app_path, "static"))


@route("/")
def index():
    return template("home")


@route("/about")
def about():
    return template("about")


@route("/service")
def service():
    return template("service")


@route("/contact")
def contact():
    return template("contact")


@route("/patient/add", method=["get", "post"])
def patient_add():
    msg = None
    error = None

    if request.method == "POST":
        try:
            conn = sqlite3.connect(os.path.join(base_path, "db.sqlite3"))
            c = conn.cursor()
            c.execute("INSERT INTO Patient (first_name, middle_name, last_name, gender, street, city, phone, doctor) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", (request.POST.get("first_name"), request.POST.get("middle_name"), request.POST.get("last_name"), request.POST.get("gender"), request.POST.get("street"), request.POST.get("city"), request.POST.get("phone"), int(request.POST.get("doctor")) if request.POST.get("doctor") else None))
            conn.commit()
            c.close()
            msg = "Successfully inserted data into db!"
        except Exception as e:
            error = e
            msg = "Error inserting data into db!"

    conn = sqlite3.connect(os.path.join(base_path, "db.sqlite3"))
    c = conn.cursor()
    c.execute("SELECT id, first_name || ' ' || middle_name || ' ' || last_name FROM Doctor")
    doctors = c.fetchall()

    return template("patient_add", doctors=doctors, msg=msg, error=error)


@route("/patient/list")
def patient_list():
    conn = sqlite3.connect(os.path.join(base_path, "db.sqlite3"))
    c = conn.cursor()
    c.execute("SELECT Patient.*, Doctor.first_name || ' ' || Doctor.middle_name || ' ' || Doctor.last_name FROM Patient LEFT JOIN Doctor ON Patient.doctor = Doctor.id")
    patients = c.fetchall()
    c.close()
    return template("patient_list", patients=patients)


@route("/patient/delete/<id:int>")
def patient_delete(id):
    conn = sqlite3.connect(os.path.join(base_path, "db.sqlite3"))
    c = conn.cursor()
    c.execute("DELETE FROM Patient WHERE id = ?", (id,))
    conn.commit()
    c.close()
    return redirect("/patient/list")


@route("/doctor/add", method=["get", "post"])
def doctor_add():
    msg = None
    error = None

    if request.method == "POST":
        try:
            conn = sqlite3.connect(os.path.join(base_path, "db.sqlite3"))
            c = conn.cursor()
            c.execute("INSERT INTO Doctor (first_name, middle_name, last_name, gender, dept, phone) VALUES (?, ?, ?, ?, ?, ?)", (request.POST.get("first_name"), request.POST.get("middle_name"), request.POST.get("last_name"), request.POST.get("gender"), request.POST.get("dept"), request.POST.get("phone")))
            conn.commit()
            c.close()
            msg = "Successfully inserted data into db!"
        except Exception as e:
            error = e
            msg = "Error inserting data into db!"

    return template("doctor_add", msg=msg, error=error)


@route("/doctor/<id:int>")
def doctor_view(id):
    conn = sqlite3.connect(os.path.join(base_path, "db.sqlite3"))
    c = conn.cursor()
    c.execute("SELECT * FROM Doctor WHERE id = ?", (id,))
    doctor = c.fetchone()
    c.execute("SELECT id, first_name, middle_name, last_name, gender, phone FROM Patient WHERE doctor = ?", (id,))
    patients = c.fetchall()
    c.close()
    return template("doctor_view", doctor=doctor, patients=patients)


@route("/doctor/list")
def doctor_list():
    conn = sqlite3.connect(os.path.join(base_path, "db.sqlite3"))
    c = conn.cursor()
    c.execute("SELECT * FROM Doctor")
    doctors = c.fetchall()
    c.close()
    return template("doctor_list", doctors=doctors)


@route("/doctor/delete/<id:int>")
def doctor_delete(id):
    conn = sqlite3.connect(os.path.join(base_path, "db.sqlite3"))
    c = conn.cursor()
    c.execute("DELETE FROM Doctor WHERE id = ?", (id,))
    conn.commit()
    c.close()
    return redirect("/doctor/list")

if __name__ == "__main__":
    run(host="localhost", port=8080, debug=True, reloader=True)
