from flask import Flask,request,jsonify
import mysql.connector as mysql

db = mysql.connect(
    host = "localhost",
    user = "root",
    passwd = "hihello",
    database = "userinfo"
)

print(db) 

# x =  '{ "name":"John", "age":30, "city":"New York"}'

cursor = db.cursor(buffered=True)
# cursor = cnx.cursor(buffered=True)

# print(cursor.fetchall())
# cursor.execute("CREATE TABLE user(name varchar(20) NOT NULL,phno int PRIMARY KEY,dob DATE NOT NULL)")
cursor.execute("show tables")
# cursor.execute("insert into user (name,phno,dob) values ('hihello', 9390 , '1998-10-1')")
hi = "INSERT INTO user(name , phno , dob) VALUES (%s,%s,%s)"


print(cursor.fetchall())


class dbh :
    def add_user():
        if(request.content_type == 'application/json'):
            x = request.get_json()
            name = x.get('name')
            phno = x.get('phno')
            dob = x.get('dob')
            data = (name , phno , dob)
            cursor.execute(hi,data)
            db.commit()
            # cursor.execute("insert into user (name,phno,dob) values ('%s', '%s','%s')"%(name,phno,dob))
            # cursor.execute("INSERT INTO USER(name , phno , dob) VALUES ('%s', '%d','%s')")
            return jsonify("success")
        else:
            return jsonify('failed')
    def update_user():
        if(request.content_type == 'application/json'):
            x = request.get_json()
            name = x.get('name')
            phnum = x.get('phno')
            dob = x.get('dob')
            cursor.execute("select * from user where phno IN ('%s')"%(phnum))
            cursor.execute("UPDATE user SET name = '%s' ,phno = '%s', dob = '%s' where phno IN ('%s')"%(name , phnum ,dob , phnum))
            db.commit()
            return jsonify("yes")



    def delete_user():
        if(request.content_type == 'application/json'):
            x = request.get_json()
            name = x.get('name')
            phnum = x.get('phno')
            dob = x.get('dob')
            cursor.execute("delete from user where phno = '%s'"%(phnum))
            db.commit()
            return jsonify("yes")
    def display_user():
        cursor.execute("select *  from user")
        data1 = cursor.fetchall()
        return jsonify(data1)