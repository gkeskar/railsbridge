class Job < ApplicationRecord
  validates :title, :description,  presence: true
  attr_accessor :content, :name, :tag_list
  has_many :taggings
  has_many :tags, through: :taggings
  # returns the jobs with tags matching a given name
  def self.tagged_with(name)
    Tag.find_by_name!(name).jobs
  end
  def self.tagged_with_id(id)
    Tag.find_by_id(id).jobs
  end
  # returns the tags and a count for each one
  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end
  
  # getting tag list
  def tag_list
    tags.map(&:name).join(",")
  end
  
  # Setting tag list
  # def tag_list=(names)
  #   self.tags = names.spilt(",").map do |n|
  #     Tag.where(name: n.strip).first_or_create!
  #   end
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end


end
