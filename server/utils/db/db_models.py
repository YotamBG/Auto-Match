# from main import db
from flask_login import UserMixin
from utils.db.database import driver

class User(UserMixin):
    def __init__(self, node):
        super().__init__()  # Call the constructor of the parent class
        self.node = node
        self.id = node['id']

    def get_id(self):
        return str(self.node['id'])  # Assuming 'id' is the property in your Neo4j node representing the user ID

    @classmethod
    def get(cls, user_id):
        print('damn')
        print(user_id)
        with driver.session() as session:
            result = session.run(
                # no pass!
                f"MATCH (u:User {{id: '{user_id}'}}) RETURN u"
            )
            record = result.single()
            if record:
                print(cls(record['u']).node['age'])
                return cls(record['u'])
            return None
     
    # def get_by_id(cls, user_id):
    #     print('wow')
    #     print(user_id)
    #     return cls.query.filter_by(id=user_id).first()
    
    @classmethod
    def get_by_email_and_password(cls, email, password):
        with driver.session() as session:
            result = session.run(
                f"MATCH (u:User {{email: '{email}', password: '{password}'}}) RETURN u"
            )
            record = result.single()
            if record:
                print(cls(record['u']))
                return cls(record['u'])
            return None

    @classmethod
    def get_by_email(cls, email):
        with driver.session() as session:
            result = session.run(
                f"MATCH (u:User {{email: '{email}'}}) RETURN u.id, u.name, u.email, u.age, u.location, u.bio"
            )
            record = result.single()
            if record:
                user_data = record['u']
                user = cls(user_data)  # Assuming the class constructor accepts user data
                return user
            return None
    

    @classmethod
    def create(cls, data):
        with driver.session() as session:
             # Query the maximum ID from existing users
            result = session.run("MATCH (u:User) RETURN MAX(toInteger(u.id)) AS max_id")
            max_id = int(result.single()["max_id"]) or 0  # If max_id is None, set it to 0

            # Create user node in Neo4j based on the provided data
            session.run(
                f"CREATE (u:User {{id: '{max_id+1}', name: '{data['name']}', email: '{data['email']}', password: '{data['password']}', age: '{data['age']}', location: '{data['location']}', bio: '{data['bio']}'}})",
            )
    
    @staticmethod
    def get_all_users():
        user_list = []
        with driver.session() as session:
            result = session.run(
                "MATCH (u:User) RETURN u"
            )
            for record in result:
                user_list.append(record['u'])
        return user_list

    def update(self, data):
        with driver.session() as session:
            # Update user node properties in Neo4j based on the provided data
            session.run(
                f"MATCH (u:User {{id: '{self.get_id()}'}}) SET u.name = {data['name']}, u.email = {data['email']}, u.password = {data['password']}, u.age = {data['age']}, u.location = {data['location']}, u.bio = {data['bio']}"
            )

    def delete(self):
        with driver.session() as session:
            # Delete user node from Neo4j
            session.run(
                f"MATCH (u:User {{id: '{self.get_id()}'}}) DELETE u"
            )

    def write(self, **kwargs):
           """
           Update the user node in the Neo4j database with the provided attributes.
           """
           if not kwargs:
               return  # No attributes to update

           update_query = "MATCH (u:User {id: $id}) SET "

           # Construct SET clause for Cypher query
           set_clause = ", ".join([f"u.{key} = ${key}" for key in kwargs.keys()])
           update_query += set_clause

           with driver.session() as session:
               session.run(update_query, id=self.get_id(), **kwargs)
