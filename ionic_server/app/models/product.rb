class Product < ActiveRecord::Base
  has_many :prices
  has_attached_file :photo, styles: {
    thumb: 'x100',
    croppable: '600x600>',
    big: '1000x1000>',
    default_url: "/missing.png"
  }
  validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)

  scope :by_name, -> (name) { where("name like ?", "%#{name}%")}
  scope :by_barcode, -> (barcode) { where("barcode like ?", "%#{barcode}%")}

  def self.getAllJson(filter)
    return Product.all.by_name(filter[:name]).by_barcode(filter[:barcode]).map {|p| {
      id: p.id,
      name: p.name,
      description: p.description,
      barcode: p.barcode,
      prices: p.prices,
      photo: "http://romz.hd.free.fr:3000#{p.photo.url(:croppable)}"
      }
    }
  end
end
