require_relative '../rails_helper'

describe CreditCardInfo do
  subject{
    student = StudentInfo.new
    student.credit_card_info = CreditCardInfo.new(name: 'test card', card_number: '1532123432123123', expiration_date: '21/21', cvv: '123')
    student.credit_card_info
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid if it credit card number is not 16" do
    subject.card_number = '123123123123'
    expect(subject).to_not be_valid
  end

  it "is not valid if the CVV is not 3 numbers" do
    subject.cvv = '1234'
    expect(subject).to_not be_valid
  end

  it "is not valid if the credit card number contains non-digit" do
    subject.card_number = 'werasesxweer1wer'
    expect(subject).to_not be_valid
  end

  it "is not valid if the cvv contains non-digit" do
    subject.cvv = 'qwe'
    expect(subject).to_not be_valid
  end

  it "is not valid if we do not have a name for the card" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid if expiration date is not following MM/YY" do
    subject.expiration_date = '1123'
    expect(subject).to_not be_valid
  end
end