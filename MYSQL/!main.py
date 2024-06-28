'''
Connecting to MYSQL Server
'''

# import mysql.connector

# database = mysql.connector.connect(
#     host = "localhost",
#     user = "user",
#     passwd = "password"
# )

# print(database)

# database.close()
# importing required libraries
# import mysql.connector

# dataBase = mysql.connector.connect(
# host ="localhost",
# user ="user",
# passwd ="password"
# )

# print(dataBase)

# # Disconnecting from the server
# dataBase.close()
# importing required libraries
import mysql.connector

dataBase = mysql.connector.connect(
host ="localhost",
user ="user",
passwd ="password"
)

# preparing a cursor object
cursorObject = dataBase.cursor()

# creating database
cursorObject.execute("CREATE DATABASE gfg")
