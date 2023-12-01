import json
from db import db
from flask import Flask, request

from db import Item
from db import Style

db_filename = "wardrobe.db"
app = Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()

    #initializing some example styles for the database
    sweater = Style(style="sweater", category="Top", position="Middle", cold_resistance=25)
    jeans = Style(style="jeans", category="Bottom", position="Middle", cold_resistance=10)
    sweatpants = Style(style="sweatpants", cateogry="Bottom", position="Middle", cold_resistance=20)
    shorts = Style(style="shorts", category="Bottom", position="Middle", cold_resistance=5)
    skirt = Style(style="skirt", category="Bottom", position="Middle", cold_resistance=5)
    longSleeve = Style(style="longSleeve", category="Top", position="Inner", cold_resistance=15)
    shortSleeve = Style(style="shortSleeve", category="Top", position="Inner", cold_resistance=5)
    jacket = Style(style="jacket", category="Top", position="Outer", cold_resistance=20)
    cardigan = Style(style="cardigan", category="Top", position="Outer", cold_resistance=20)
    coat = Style(style="coat", category="Top", position="Outer", cold_resistance=40)
    tshirt = Style(style="tshirt", category="Top", position="Inner", cold_resistance=10)
    windbreaker = Style(style="windbreaker", category="Top", position="Outer", cold_resistance=15)
    thermalUnderwear = Style(style="thermalUnderwear", category="Top", position="Inner", cold_resistance=25)
    leggings = Style(style="leggings", category="Bottom", position="Inner", cold_resistance=10)
    boots = Style(style="boots", category="Shoe", position="Outer", cold_resistance=20)
    sneakers = Style(style="sneakers", category="Shoe", position="Outer", cold_resistance=15)
    sandals = Style(style="sandals", category="Shoe", position="Outer", cold_resistance=10)
    dressShoes = Style(style="dressShoes", category="Shoe", position="Outer", cold_resistance=20)
    winterBoots = Style(style="winterBoots", category="Shoe", position="Outer", cold_resistance=25)


    

    db.session.add(sweater)
    db.session.add(jeans)
    db.session.add(longSleeve)
    db.session.add(shortSleeve)
    db.session.add(jacket)
    db.session.add(coat)
    db.session.add(tshirt)
    db.session.add(windbreaker)
    db.session.add(thermalUnderwear)
    db.session.add(leggings)
    db.session.add(boots)
    db.session.add(sneakers)
    db.session.add(sandals)
    db.session.add(dressShoes)
    db.session.add(winterBoots)
    db.session.add(shorts)

    db.session.commit()

# generalized response formats
def success_response(data, code=200):
    return json.dumps(data), code

def failure_response(message, code=404):
    return json.dumps({"error": message}), code

@app.route("/", methods=["GET"])
def hello_world():
    return "Hello, World!"
# Item Routes

@app.route("/item/", methods=["GET"])
def get_all_items():
    """
    Endpoint for getting all items in the wardrobe
    """
    items = [item.serialize() for item in Item.query.all()]
    return success_response({"items": items})

@app.route("/item/<int:item_id>/", methods=["GET"])
def get_item_by_id(item_id):
    """
    Endpoint for getting a specific item
    """
    item = Item.query.filter_by(id=item_id).first()
    if item is None:
        return failure_response("Item not found")
    return success_response(item.serialize())

@app.route("/item/create/", methods=["POST"])
def create_item():
    """
    Endpoint for adding an item to the wardrobe
    """
    body = json.loads(request.data)
    new_name = body.get("name")
    new_description = body.get("description")
    new_style_id = body.get("style")
    
    if new_name is None or new_style_id is None:
        return failure_response("name or style id of item not found", 400)
    
    style_selected = Style.query.filter_by(id=new_style_id).first()
    if style_selected is None:
        return failure_response("selected style does not exist", 400)
    
    new_item = Item(
        name = new_name, 
        description = new_description,
        style_id = new_style_id
    )

    db.session.add(new_item)
    db.session.commit()

    return success_response(new_item.serialize(), 201)

@app.route("/item/<int:item_id>/", methods=["DELETE"])
def delete_item_by_id(item_id):
    """
    Endpoint for deleting a specific item
    """
    item = Item.query.filter_by(id=item_id).first()
    if item is None:
        return failure_response("Item not found")
    db.session.delete(item)
    db.session.commit()
    return success_response(item.serialize())

# Style Routes

@app.route("/style/", methods=["POST"])
def create_style():
    """
    Endpoint for creating a style
    """
    body = json.loads(request.data)
    new_category = body.get("category")
    new_position= body.get("position")
    new_cold_resistance = body.get("cold_resistance")

    if new_category is None or new_position is None or new_cold_resistance is None:
        return failure_response("Category or position or cold resistance field not found", 400)
    
    # Verifying preconditions for a Style
    if new_category != "top" or new_category != "bottom" or new_category != "shoe": 
        return failure_response("Category invalid: must be top, bottom, or shoe", 400)
    if new_category == "shoe" and new_position != "outer":
        return failure_response("Shoe position invalid: A shoe must have a position of outer", 400)
    if new_position != "inner" or new_position != "outer" or new_position != "middle":
        return failure_response("Position invalid: must be outer, inner, or middle", 400)
    if new_cold_resistance < 0: 
        return failure_response("Invalid cold resistance; ")

    new_style = Style(
        category = new_category, 
        position = new_position, 
        cold_resistance = new_cold_resistance
    )

    db.session.add(new_style)
    db.session.commit()
    return success_response(new_style.serialize(), 201)

# Getting outfit recommendation
@app.route("/recommendation/<int:temperature>", methods=["GET"])
def recommend_outfit(temperature):
    """
    Endpoint for getting a recommended outfit given a temperature provided in fahrenheit
    """
    return success_response(Item.recommend(temp=temperature), 200)
    

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)