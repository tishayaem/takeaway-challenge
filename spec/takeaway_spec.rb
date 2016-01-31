require 'takeaway'
describe Takeaway do
subject(:takeaway) {described_class.new}
it 'shows a list of prices' do
expect(subject).to respond_to(:show_menu)
end
it 'shows dishes' do
  expect(subject.show_menu).to include(:Shabu_shabu => 19.50)
  end

  it{ is_expected.to respond_to(:select_dish).with(2).argument }

  it 'selects the dish from the menu' do
expect(subject.select_dish(:Yakitori, 2)).to eq [[:Yakitori, 2]]
  end

  it 'lets selecting multiple dishes from the menu' do
  subject.select_dish(:Yakitori, 2)
  expect(subject.select_dish(:Ramen, 1)).to eq [[:Yakitori, 2], [:Ramen, 1]]
  end

  it 'raise an error when dish is not on menu' do
  expect{subject.select_dish(:Tiramisu, 1)}.to raise_error 'Not on menu. Please pick dish from the list'
  end

end
