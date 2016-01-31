require 'takeaway'
describe Takeaway do
subject(:takeaway) {described_class.new}
it 'shows a list of prices' do
expect(subject).to respond_to(:show_menu)
end
it 'shows dishes' do
  expect(subject.show_menu).to include(:Shabu_shabu => 19.50)
  end


end
