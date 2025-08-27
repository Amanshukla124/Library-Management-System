from flask import Flask, render_template, request, redirect, url_for, jsonify, session
import mysql.connector

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Required for session management

# Database Connection
db = mysql.connector.connect(
    host="localhost",
    user="root",  # Change if necessary
    password="anushka",
    database="student_management"
)

# Use buffered cursor to prevent "Unread result found" error
cursor = db.cursor(buffered=True)


# Route to show login page
@app.route('/')
def login():
    return render_template('login.html')


# Route to handle login
@app.route('/login', methods=['POST'])
def handle_login():
    username = request.form['username']
    password = request.form['password']

    query = "SELECT * FROM teachers WHERE username=%s AND password=%s"
    cursor.execute(query, (username, password))
    teacher = cursor.fetchone()

    if teacher:
        session['username'] = username
        return redirect(url_for('dashboard'))
    else:
        return render_template('login.html', error="Invalid Credentials")


# Route to show dashboard
@app.route('/dashboard')
def dashboard():
    if 'username' not in session:
        return redirect(url_for('login'))

    # Fetch student data
    cursor.execute("SELECT * FROM students")
    students = cursor.fetchall()

    return render_template('dashboard.html', students=students)


# API to add a student
@app.route('/add_student', methods=['POST'])
def add_student():
    name = request.form['name']
    age = request.form['age']
    grade = request.form['grade']

    query = "INSERT INTO students (name, age, grade) VALUES (%s, %s, %s)"
    cursor.execute(query, (name, age, grade))
    db.commit()

    return jsonify({'status': 'success'})


# API to get all students
@app.route('/get_students', methods=['GET'])
def get_students():
    cursor.execute("SELECT * FROM students")
    students = cursor.fetchall()

    student_list = [{'id': row[0], 'name': row[1], 'age': row[2], 'grade': row[3]} for row in students]
    return jsonify(student_list)


# API to edit a student
@app.route('/edit_student', methods=['POST'])
def edit_student():
    student_id = request.form['id']
    name = request.form['name']
    age = request.form['age']
    grade = request.form['grade']

    query = "UPDATE students SET name=%s, age=%s, grade=%s WHERE id=%s"
    cursor.execute(query, (name, age, grade, student_id))
    db.commit()

    return jsonify({'status': 'success'})


# API to delete a student
@app.route('/delete_student', methods=['POST'])
def delete_student():
    student_id = request.form['id']

    query = "DELETE FROM students WHERE id=%s"
    cursor.execute(query, (student_id,))
    db.commit()

    return jsonify({'status': 'success'})


# Logout route
@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('login'))


if __name__ == '__main__':
    app.run(debug=True)
