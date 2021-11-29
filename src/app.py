from flask import Flask, jsonify,request
from flask_mysqldb import MySQL
from config import config

from flask_jwt_extended import create_access_token
from flask_jwt_extended import get_jwt_identity
from flask_jwt_extended import jwt_required
from flask_jwt_extended import JWTManager


app=Flask(__name__)

conexion=MySQL(app)


from sqlalchemy.exc import IntegrityError

app.config["JWT_SECRET_KEY"] = "qjnbdijdkasmdoanbdabnsdmsódpaoisd"  # Change this!
jwt = JWTManager(app)

@app.route("/login", methods=["POST"])
def login():
    username = request.json.get("username", None)
    password = request.json.get("password", None)
    if username != "test" or password != "test":
        return jsonify({"msg": "Bad username or password"}), 401
    access_token = create_access_token(identity=username)
    return jsonify(access_token=access_token)

@app.route("/protected", methods=["GET"])
@jwt_required()
def protected():
    
    current_user = get_jwt_identity()
    return jsonify(logged_in_as=current_user), 200


@app.route('/player', methods=['GET'])
def leer_players():
    try:
        playerr=conexion.connection.playerr()
        sql="SELECT race, name FROM player"
        sql="SELECT object FROM inventory_player"
        playerr.execute(sql)
        datos=playerr.fetchall()
        players=[]
        for fila in datos:
            player={'race':fila[0], 'name':fila[1]}
            player={'object':fila[0]}
            players.append(player)

        return jsonify({'players':players, 'mensaje':"Bienvenido jugador!"})
    except Exception as ex:
        return "ERROR"

def web_not_found(error):
    return "La pagina que intentas buscar no existe..."

@app.route('/npc', methods=['GET'])
def leer_npcs():
    try:
        npcr=conexion.connection.npcr()
        sql="SELECT race, name FROM npc"
        sql="SELECT object FROM inventory_npc"
        npcr.execute(sql)
        datos=npcr.fetchall()
        npcs=[]
        for fila in datos:
            npc={'race':fila[0], 'name':fila[1]}
            npc={'object':fila[0]}
            npcs.append(npc)

        return jsonify({'npcs':npcs, 'mensaje':"Este es el unico comerciante de Skyrim?"})
    except Exception as ex:
        return "ERROR lo siento de verdad"

@app.route('/items', methods=['GET'])
def leer_itemss():
    try:
        itemsr=conexion.connection.itemsr()
        sql="SELECT code_obj, name, type, description FROM npc"
        itemsr.execute(sql)
        datos=itemsr.fetchall()
        itemss=[]
        for fila in datos:
            items={'code_obj':fila[0],'name':fila[1], 'type':fila[2], 'value':fila[3], 'description':fila[4]}
            itemss.append(items)

        return jsonify({'itemss':itemss, 'mensaje':"Estos son todos los objetos de Skyrim."})
    except Exception as ex:
        return "ERROR no se pudireon mostrar los objetos."

@app.route('/razas', methods=['GET'])
def leer_razass():
    try:
        razasr=conexion.connection.razasr()
        sql="SELECT id_raza, name, description FROM player"
        razasr.execute(sql)
        datos=razasr.fetchall()
        razass=[]
        for fila in datos:
            razas={'id_razas':fila[0], 'name':fila[1],'description':fila[2] }
            
            razass.append(razas)

        return jsonify({'razass':razass, 'mensaje':"Estas son las razas de Skyrim!"})
    except Exception as ex:
        return "ERROR no se pudieron mostrar las razas."

@app.route('/player', methods=['POST'])
def registrar_jugador():
    try:
        playerr= conexion.connection.playerr()
        sql="""INSERT INFO player (race, name) VALUES ('{}','{}')""".format(request.json['race'],request.json['name'])
        return jsonify({'mensaje':"jugador registrado!"})
    except Exception as ex:
        return jsonify({'mensaje':"No se puede registrar un jugador en este momento"})

@app.route('/inventory_npc', methods=['POST'])
def registrar_inventario_npc():
    try:
        i_npcr= conexion.connection.i_npcr()
        sql="""INSERT INFO inventory_npc (object) VALUES ('{}',)""".format(request.json['object'])
        return jsonify({'mensaje':"inventario editado!"})
    except Exception as ex:
        return jsonify({'mensaje':"No se puede editar el inventario del npc en este momento"})

@app.route('/inventory_player', methods=['POST'])
def registrar_inventario_player():
    try:
        i_playerr= conexion.connection.i_playerr()
        sql="""INSERT INFO inventory_player (object) VALUES ('{}',)""".format(request.json['object'])
        return jsonify({'mensaje':"inventario editado!"})
    except Exception as ex:
        return jsonify({'mensaje':"No se puede editar el inventario del player en este momento"})

@app.route('/inventory_player', methods=['DELETE'])
def eliminar_obj_player():
    try:
        obj_player= conexion.connection.obj_player()
        sql= "DELETE FROM inventroy_player WHERE object ='{0}' ".format(object)
        obj_player.execute(sql)
        conexion.connection.commit()
        return jsonify({'mensaje': "obejto eliminado"})
    except Exception as ex:
            return jsonify({'mensaje': "No se puede editar"})

@app.route('/inventory_npc', methods=['DELETE'])
def eliminar_obj_npc():
    try:
        obj_npc= conexion.connection.obj_npc()
        sql= "DELETE FROM inventroy_npc WHERE object ='{0}' ".format(object)
        obj_npc.execute(sql)
        conexion.connection.commit()
        return jsonify({'mensaje': "obejto eliminado"})
    except Exception as ex:
            return jsonify({'mensaje': "No se puede editar"})

@app.route('/eliminate_player', methods=['DELETE'])
def eliminar_player():
    try:
        playerr= conexion.connection.playerr()
        sql= "DELETE FROM player WHERE race ='{0}', name ='{0}' ".format(race, name)
        playerr.execute(sql)
        conexion.connection.commit()
        return jsonify({'mensaje': "juagdor eliminado"})
    except Exception as ex:
            return jsonify({'mensaje': "No se puede eliminar en este momento"})
            
@app.route('/gold_player', methods=['put'])
def update_gold_player():
    try:
        playerr= conexion.connection.playerr()
        sql= """UPDATE invcentory_player SET gold='{0}' """.format(request.json['gold'])
        playerr.execute(sql)
        conexion.connection.commit()
        return jsonify({'mensaje': "oro actualizado"})
    except Exception as ex:
            return jsonify({'mensaje': "No se puede actualizar en este momento"})

@app.route('/gold_npc', methods=['put'])
def update_gold_npc():
    try:
        npcr= conexion.connection.npcr()
        sql= """UPDATE invcentory_npc SET gold='{0}' """.format(request.json['gold'])
        npcr.execute(sql)
        conexion.connection.commit()
        return jsonify({'mensaje': "oro actualizado"})
    except Exception as ex:
            return jsonify({'mensaje': "No se puede actualizar en este momento"})

def web_not_found(error):
    return "La pagina que intentas buscar no existe..."






if __name__ == '__main__':
    app.config.from_object(config['development'])
    app.register_error_handler(404, web_not_found)
    app.run()