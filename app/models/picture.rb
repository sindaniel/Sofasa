class Picture < ActiveRecord::Base
  belongs_to :car



  #has_attached_file :picture1
  #validates_attachment_presence :picture1



  HUMANIZED_ATTRIBUTES = {
      :picture1 => 'Imagen 1',
      :picture2 => 'Imagen 2',
      :time => 'Tiempo'
  }

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end


  has_attached_file :picture1, :styles => {:home => '548x300>', :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture1, :content_type => /\Aimage\/.*\Z/

  has_attached_file :picture2, :styles => {:home => '548x300>', :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture2, :content_type => /\Aimage\/.*\Z/





  default_scope { order("priority ASC") }

  before_create do

    ultimo = Picture.where(:car_id => self.car_id).last()

    if ultimo.nil?
      self.position = 1
    else
      self.position = ultimo.position+1
    end

  end

end
