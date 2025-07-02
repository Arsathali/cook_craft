package com.model;

import java.sql.Timestamp;

public class Recipe {
	 private int recipeId;
     private String name;
     private String description;
     private String ingredients;
     private String instructions;
     private String imagePath;
     private String time;
     private String difficulty;
     private int categoryId;
     private Timestamp createdTime;
     private int creatorId;
     
     
	public Recipe() {
		super();
	}

	@Override
	public String toString() {
		return "Recipe [recipeId=" + recipeId + ", name=" + name + ", description=" + description + ", ingredients="
				+ ingredients + ", instructions=" + instructions + ", imagePath=" + imagePath + ", time=" + time
				+ ", difficulty=" + difficulty + ", categoryId=" + categoryId + ", cteatedTime=" + createdTime + "]";
	}

	public Recipe(int recipeId, String name, String description, String ingredients, String instructions,
			String imagePath, String time, String difficulty, int categoryId, Timestamp createdTime) {
		super();
		this.recipeId = recipeId;
		this.name = name;
		this.description = description;
		this.ingredients = ingredients;
		this.instructions = instructions;
		this.imagePath = imagePath;
		this.time = time;
		this.difficulty = difficulty;
		this.categoryId = categoryId;
		this.createdTime = createdTime;
	}

	public int getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}

	public int getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public Timestamp getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Timestamp createdTime) {
		this.createdTime = createdTime;
	}
	
	
     
     
}
