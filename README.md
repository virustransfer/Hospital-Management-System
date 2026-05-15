# 🏥 Hospital Management System (HMS)

A web-based Hospital Management System built with **Flask** and **MySQL**, designed to streamline patient bookings, doctor management, and appointment tracking.

---

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Author](#author)

---

## ✨ Features

- 🔐 **User Authentication** — Signup/Login with role-based access (Doctor & Patient)
- 👨‍⚕️ **Doctor Management** — Register doctors with their department
- 🗓️ **Patient Booking** — Patients can book appointment slots with time, date, and disease info
- 📋 **Booking Management** — View, edit, and delete bookings
- 🔍 **Department Search** — Search for doctors by department
- 📜 **Trigger Logs** — Automatic audit trail of all patient record changes (insert/update/delete) via MySQL triggers
- 🏥 **Role-based Views** — Doctors see all patients; patients see only their own bookings

---

## 🛠 Tech Stack

| Layer      | Technology                        |
|------------|-----------------------------------|
| Backend    | Python, Flask                     |
| Database   | MySQL (via Flask-SQLAlchemy)      |
| Frontend   | HTML, Jinja2, Bootstrap 4         |
| Auth       | Flask-Login, Werkzeug             |
| ORM        | SQLAlchemy                        |

---

## 📁 Project Structure

```
hospital-management-system/
│
├── main.py                 # Main Flask application & routes
├── requirements.txt        # Python dependencies
├── hms.sql                 # Database schema and seed data
│
└── templates/
    ├── base.html           # Base layout with navbar
    ├── index.html          # Home page with carousel
    ├── login.html          # Login page
    ├── signup.html         # Signup page
    ├── patient.html        # Patient booking form
    ├── booking.html        # Booking details table
    ├── doctor.html         # Doctor registration form
    ├── edit.html           # Edit booking form
    └── trigers.html        # Audit log / trigger history
```

---

## 🗄️ Database Schema

The system uses **5 tables**:

| Table      | Description                                        |
|------------|----------------------------------------------------|
| `user`     | Stores registered users (Doctors & Patients)       |
| `patients` | Stores appointment/booking records                 |
| `doctors`  | Stores doctor name and department                  |
| `trigr`    | Audit log populated automatically by SQL triggers  |
| `test`     | Connection test table                              |

### MySQL Triggers

Three triggers on the `patients` table automatically log all changes to `trigr`:

- **`patientinsertion`** — fires `AFTER INSERT`
- **`PatientUpdate`** — fires `AFTER UPDATE`
- **`PatientDelete`** — fires `BEFORE DELETE`

---

## 🚀 Getting Started

### Prerequisites

- Python 3.7+
- MySQL / MariaDB
- pip

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/hospital-management-system.git
   cd hospital-management-system
   ```

2. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Set up the database**

   Open MySQL and create the database:
   ```sql
   CREATE DATABASE hmdbms;
   ```

   Import the schema and seed data:
   ```bash
   mysql -u root -p hmdbms < hms.sql
   ```

4. **Configure the database connection**

   In `main.py`, update the connection URI if needed:
   ```python
   app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:<password>@localhost/hmdbms'
   ```

5. **Run the application**
   ```bash
   python main.py
   ```

6. **Open in browser**
   ```
   http://127.0.0.1:5000
   ```

---

## 🖥️ Usage

### As a Patient
1. Sign up with usertype **Patient**
2. Log in and navigate to **Patients Booking**
3. Fill in your details, select a department, and book a slot
4. View, edit, or delete your bookings under **Booking Details**

### As a Doctor
1. Sign up with usertype **Doctor**
2. Log in to see **all patient bookings**
3. Access **Doctors** to register doctor profiles
4. View the trigger audit log under **Patients Details**

### Search
Use the navbar search bar to check if a doctor is available by **department name**.

---

## ⚠️ Known Issues / TODOs

- [ ] Passwords are stored in **plain text** — should use `generate_password_hash` (code is commented in `main.py`)
- [ ] No email confirmation (Flask-Mail integration is scaffolded but disabled)
- [ ] No input sanitization against SQL injection on some fields
- [ ] Phone number validation only checks digit count, not format

---

## 👤 Author

**Bibas Shrestha**    
DBMS Lab Project

---

## 📄 License

This project is for academic/educational purposes.
