package com.jacaranda.logica;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "ARTICLE")
public class Article {

	@Id
	private int id;
	private String name;
	private String description;
	@ManyToOne
	@JoinColumn(name = "id_cat")
	private Category id_cat;

	public Article() {
		super();
	}

	public Article(int id, String name, String description, Category id_cat) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.id_cat = id_cat;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Category getId_cat() {
		return id_cat;
	}

	public void setId_cat(Category id_cat) {
		this.id_cat = id_cat;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Article other = (Article) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", name=" + name + ", description=" + description + ", id_cat=" + id_cat + "]";
	}

}
