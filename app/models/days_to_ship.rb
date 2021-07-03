class DaysToShip < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '1〜2日' },
    { id: 2, name: '2〜3日' },
    { id: 3, name: '4〜7日' }
  ]

  include ActiveHash::Associations
  has_many :items

end