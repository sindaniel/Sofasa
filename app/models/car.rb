class Car < ActiveRecord::Base
  has_many :pictures, dependent: :destroy

  HUMANIZED_ATTRIBUTES = {
      :name => 'Nombre',
      :code => 'Codigo',
  }

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end



  validates :name, presence: true
  validates :code, presence: true
  default_scope { order('id desc') }



end
