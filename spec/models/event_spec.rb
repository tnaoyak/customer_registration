require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#create' do
    context 'イベントを保存できる' do
      it "全ての項目がある" do
        event = build(:event)
        expect(event).to be_valid
      end

      it "nameとschool_idとweb_public以外がnil" do
        event = build(:event, public_start_date: nil, public_end_date: nil, remarks: nil )
        expect(event).to be_valid
      end

    end
    context 'イベントを保存できない' do
      it "nameがnil" do
        event = build(:event, name: nil)
        event.valid?
        expect(event.errors[:name]).to include('を入力してください')
      end
      it "school_idがnil" do
        event = build(:event, school_id: nil)
        event.valid?
        expect(event.errors[:school_id]).to include('を入力してください')
      end
    end
  end
end
