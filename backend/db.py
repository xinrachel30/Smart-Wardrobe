from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

db = SQLAlchemy()

class Wardrobe(db.Model):
    __tablename__ = 'wardrobe'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), nullable=False)
    type_id = db.Column(db.Integer, db.ForeignKey('type.id'), nullable=False)
    description = db.Column(db.String(128))

    type_rel = db.relationship('Type', back_populates='wardrobe_items')

class Type(db.Model):
    __tablename__ = 'type'
    id = db.Column(db.Integer, primary_key=True)
    style = db.Column(db.String(64), nullable=False)
    category = db.Column(db.String(64), nullable=False)  # Assuming 'Top', 'Bottom', 'Shoe' are the only categories
    position = db.Column(db.String(64), nullable=False)  # Assuming 'Inner', 'Middle', 'Outer' are the only positions
    cold_resistance = db.Column(db.Integer, nullable=False)  # Assuming this is an integer between 1 and 4

    wardrobe_items = db.relationship('Wardrobe', order_by='Wardrobe.id', back_populates='type_rel')


