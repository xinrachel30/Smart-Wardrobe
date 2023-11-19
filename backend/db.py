from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

db = SQLAlchemy()

class Item(db.Model):
    """
    id	name(Inputed by user)	style(Related to Category, chosen by user)	description(Inputed by user)	
1	Red_Sweater	1	/	/	
    """
    __tablename__ = 'item'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), nullable=False)
    style_id = db.Column(db.Integer, db.ForeignKey('style.id'), nullable=False)
    description = db.Column(db.String(128))

    style_rel = db.relationship('Style', back_populates='item_items')

class Style(db.Model):
    """		
    id	style	category(Top/Bottom/Shoe)	position(Inner/Middle/Outer)	cold_resistance(Range from 1 to 4)
    1	sweater	Top	Middle	3
    2	longSleeve	Top	Inner	2
    3	shortSleeve	Top	Inner	1
    4	jacket	Top	Outer	4
    """
    __tablename__ = 'style'
    id = db.Column(db.Integer, primary_key=True)
    style = db.Column(db.String(64), nullable=False)
    category = db.Column(db.String(64), nullable=False)  # Assuming 'Top', 'Bottom', 'Shoe' are the only categories
    position = db.Column(db.String(64), nullable=False)  # Assuming 'Inner', 'Middle', 'Outer' are the only positions
    cold_resistance = db.Column(db.Integer, nullable=False)  # Assuming this is an integer between 1 and 4

    item_items = db.relationship('Item', order_by='Item.id', back_populates='style_rel')



