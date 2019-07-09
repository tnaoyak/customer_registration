require 'rails_helper'

describe EventsController, type: :controller do
  describe 'GET #new' do
    it "新規登録画面に遷移するか" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do
    it "indexアクションで正しいインスタンスを取得できるか" do
      events = create_list(:event, 3) # 配列である必要がある
      get :index
      expect(assigns(:events)).to match(events.sort{ |b, a| b.created_at <=> a.created_at } ) # matchで配列と比較する # 昇順で並び替え
    end

    it "一覧画面に遷移するか" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #edit' do
    it "editアクションで正しいインスタンスを取得できるか" do
      event = create(:event)
      get :edit, params: { id: event }
      expect(assigns(:event)).to eq event
    end

    it "編集画面に遷移できるか" do
      event = create(:event)
      get :edit, params: { id: event }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    it "showアクションで正しいインスタンスを取得できるか" do
      event = create(:event)
      get :show, params: { id: event }
      expect(assigns(:event)).to eq event
    end

    it "詳細画面に遷移できるか" do
      event = create(:event)
      get :show, params: { id: event }
      expect(response).to render_template :show
    end
  end
end
