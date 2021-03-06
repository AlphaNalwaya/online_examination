require 'rails_helper'

describe ExamsController do

  # This should return the minimal set of attributes required to create a valid
  # Exam. As you add validations to Exam, be sure to
  # adjust the attributes here as well.
  #let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }

  #let(:invalid_attributes) {
  #  skip("Add a hash of attributes invalid for your model")
  #}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExamsController. Be sure to keep this updated too.
 # let(:valid_session) { {} }
  let(:exam1){double ("exam1")}
  let(:exam2){double ("exam2")}
  let(:exam3){double ("exam3")}
  let(:exam4){double ("exam4")}
  let(:exam5){double ("exam5")}
  let(:exams){[exam1,exam2,exam3,exam4,exam5]}
  
  describe "#index" do
    it "collects all of the exams" do
      expect(Exam).to receive(:all).and_return(exams)
      get :index
    end
    it "displays all exams" do
      allow(Exam).to receive(:all).and_return(exams)
      #exam = Exam.create! valid_attributes
      get :index
      expect(assigns(:exams)).to eq(exams)
    end
    it "selects the index template for rendering" do
      allow(Exam).to receive(:all).and_return(exams)
      get :index
      expect(response).to render_template("index")
    end
  end
  
  describe "#new" do
    it "selects new template for rendering" do
      get :new 
      expect(response).to render_template("new")
    end
  end
  
  
  
  describe "#create" do
    let(:params){{:name=>"exam1"}}
    let(:exam){double("exam",params)}
    it "creates a new exam" do
      
      expect(Exam).to receive(:create!).with(params).and_return(exam)
      post :create, exam: params
      
    end
    it "sets a flash message" do
      allow(Exam).to receive(:create!).with(params).and_return(exam)
      post :create, exam: params
      expect(flash[:notice]).to match(/^.* was successfully created.$/)
      
    end
    
    it "redirects to the exam index page" do
      allow(Exam).to receive(:create!).with(params).and_return(exam)
      post :create, exam: params
      
      expect(response).to redirect_to(exams_path)
    end
  end
  
  describe "#destroy" do
    let(:exam) {double('exam',:name => 'exam1')}
    let(:id) {'2'}

    it 'calls the find method to retrieve a movie' do
      expect(Exam).to receive(:find).with(id).and_return(exam)
      allow(exam).to receive(:destroy)
      delete :destroy, {:id => id}
    end
  end
  
   
   describe "#update" do
      let(:params){{:name=>"exam1"}}
      let(:exam){double("exam",params)}
      it "updates an exam" do
       
        expect{update :update, id=>@exam}.with(params)
        
      end
     
      
      it "redirects to the exam index page" do
        allow(Exam).to receive(:update).with(params).and_return(exam)
        post :update, exam: params
        expect(response).to redirect_to(exams_path)
      end
   end
    
  end