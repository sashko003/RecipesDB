USE Recipes;

CREATE TABLE Recipe_Classes (RecipeClassID INT NOT NULL PRIMARY KEY,
								 RecipeClassDescription VARCHAR(1024));
CREATE TABLE Measurements (MeasureAmountID INT NOT NULL PRIMARY KEY,
							 MeasurementDescription VARCHAR(1024));
CREATE TABLE Ingredient_Classes (IngredientClassID INT NOT NULL PRIMARY KEY, 
								IngredientClassDescription VARCHAR(1024));

CREATE TABLE Recipes (RecipeID INT NOT NULL PRIMARY KEY,
					 RecipeTitle VARCHAR(256),
					 RecipeClassID INT FOREIGN KEY REFERENCES Recipe_Classes(RecipeClassID), 
					 Preparation VARCHAR(1024),
					 Notes VARCHAR(1024));

CREATE TABLE Recipe_Ingredients (RecipeID INT NOT NULL,
								RecipeSeqNo INT NOT NULL,
								IngredientID INT NOT NULL,
								MeasureAmountID INT NOT NULL,
								Amount INT NOT NULL,
								FOREIGN KEY (RecipeID) REFERENCES Recipes (RecipeID),
								/*FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID),*/
								FOREIGN KEY (MeasureAmountID) REFERENCES Measurements(MeasureAmountID));

CREATE TABLE Ingredients (IngredientID INT NOT NULL,
						  IngredientName VARCHAR(256),
						  IngredientClassID INT NOT NULL,
						  MeasureAmountID INT NOT NULL,
						  PRIMARY KEY (IngredientID),
						  FOREIGN KEY (IngredientClassID) REFERENCES Ingredient_Classes(IngredientClassID),
						  FOREIGN KEY (MeasureAmountID) REFERENCES Measurements(MeasureAmountID));

ALTER TABLE Recipe_Ingredients ADD FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID);


								
