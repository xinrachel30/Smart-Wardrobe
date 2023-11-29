from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from algo import get_recommendation

db = SQLAlchemy()

class Item(db.Model):
    """
    id	name(Inputed by user)	style(Related to Category, chosen by user)	description(Inputed by user)	
    1	Red_Sweater         	1	                                        /	

    AF: This table represents all clothing items created by users, including their names, their styles(that 
    specifics their attribution, and their descriptions (possibly none).
    RI: None. 
    """
    __tablename__ = 'item'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), nullable=False)
    description = db.Column(db.String(128))

    style_id = db.Column(db.Integer, db.ForeignKey('style.id'), nullable=False)
    style_rel = db.relationship('Style', back_populates='item_items')

    def __init__(self, **kwargs):
        """
        Initializes an Item object
        """
        self.name = kwargs.get("name", "")
        self.description = kwargs.get("description")
        self.style_id = kwargs.get("style_id")

    def serialize(self):
        """
        Serializes an Item object
        """
        return {
            "id": self.id, 
            "name": self.name,
            "description": self.description, 
            "style_id": self.style_id
        }
    
    @staticmethod
    def recommend(temp):
        """
        Recommends an outfit based on the temperature
        """
        opt_temp = 75
        temp = opt_temp - temp
        print(temp)
        tops = Item.query.join(Style).filter(Style.category == 'Top').all()
        bottoms = Item.query.join(Style).filter(Style.category == 'Bottom').all()
        shoes = Item.query.join(Style).filter(Style.category == 'Shoe').all()

        def items_to_dict_list(items):
            return [{
                "id": item.id,
                "position": item.style_rel.position,
                "cold_resistance": item.style_rel.cold_resistance
            } for item in items]
        for top in items_to_dict_list(tops): 
            print(top)
        recommended_tops = get_recommendation(temp, items_to_dict_list(tops))
        recommended_bottoms = get_recommendation(temp, items_to_dict_list(bottoms))
        recommended_shoes = get_recommendation(temp, items_to_dict_list(shoes))


        def ids_to_names(ids, items):
            return [item.name for item in items if item.id in ids]

        return {
            "tops": ids_to_names(recommended_tops, tops),
            "bottoms": ids_to_names(recommended_bottoms, bottoms),
            "shoes": ids_to_names(recommended_shoes, shoes)
        }

class Style(db.Model):
    """		
    id	style	category(Top/Bottom/Shoe)	position(Inner/Middle/Outer)	cold_resistance(Range from 1 to 4)
    1	sweater	Top	Middle	3
    2	longSleeve	Top	Inner	2
    3	shortSleeve	Top	Inner	1
    4	jacket	Top	Outer	4

    AF: This table represents all styles a clothes might have, including their category, position, and cold_resistance
    for future recommendation algorithm. 
    RI: style must not have duplication. All shoe should have position 'Outer' because you can't wear shoes outside
    of another pair of shoes 
    """
    __tablename__ = 'style'
    id = db.Column(db.Integer, primary_key=True)
    style = db.Column(db.String(64), nullable=False)
    category = db.Column(db.String(64), nullable=False)  # Assuming 'Top', 'Bottom', 'Shoe' are the only categories
    position = db.Column(db.String(64), nullable=False)  # Assuming 'Inner', 'Middle', 'Outer' are the only positions
    cold_resistance = db.Column(db.Integer, nullable=False)  # Assuming this is an integer between 1 and 8

    item_items = db.relationship('Item', order_by='Item.id', back_populates='style_rel')

    def __init__(self, **kwargs):
        """
        Initializes a Style object
        """
        self.style = kwargs.get("style")
        self.category = kwargs.get("category")
        self.position = kwargs.get("position")
        self.cold_resistance = kwargs.get("cold_resistance")

    def serialize(self):
        """
        Serializes a Style Object
        """
        return {
            "id": self.id, 
            "position": self.position, 
            "cold_resistance": self.cold_resistance
        }

