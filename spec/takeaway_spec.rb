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

  it{ is_expected.to respond_to(:count_price) }

  it 'calculates price for one dish' do
    subject.select_dish(:Sarada, 1)
    expect(subject.count_price).to eq 4.50
  end

  it 'calculates price for two dishes' do
    subject.select_dish(:Sarada, 1)
    subject.select_dish(:Vareniki, 2)
    expect(subject.count_price).to eq 21.20
  end

  context 'payment' do
    it 'confirms payment if given amount equals price' do
      subject.select_dish(:Borscht, 2)
      expect(subject.check_payment 13.90).to eq 'Payment was succesful'
    end

    it 'raises an error if given amount not equals price' do
      subject.select_dish(:Borscht, 2)
      expect{subject.check_payment 0}.to raise_error 'Payment was unsuccesful. Incorrect amount'
    end
end

context 'delivery time' do

    it{ is_expected.to respond_to(:delivery_time) }

    it 'shows delivery time(Time.now + 1 hour)' do
      allow(Time).to receive(:now) { Time.new(2015,6,21, 13,30,0, "+01:00") }
      expect(subject.delivery_time).to eq(Time.new(2015,6,21, 14,30,0, "+01:00"))
    end
  end
end
