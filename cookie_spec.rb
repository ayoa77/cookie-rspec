
require 'rspec'

require_relative 'cookie'

describe Cookie do

  let(:type)   { "peanut butter" }
  let(:cookie) { Cookie.new(type) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Cookie of the specified type" do
        expect(cookie.type).to eq(type)
      end
    end

    context "with invalid input" do
      it "throws an argument error when not given a type argument" do
        expect { Cookie.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#type" do
    it "returns the type of the cookie" do
    expect(cookie.type).to eq(type)

  end
end

  describe "#bake!" do
    it "requires an integer time argument" do
    expect{cookie.bake!("badinput")}.to raise_error(TypeError)
    expect{cookie.bake!(:badinput)}.to raise_error(TypeError)
    expect{cookie.bake!({:badinput => "badinput"})}.to raise_error(TypeError)
    expect{cookie.bake!(['bad', 'input'])}.to raise_error(TypeError)
  end
    it "returns the cookie object" do
    expect(cookie.bake!(7)).to be_an_instance_of(Cookie)
  end
    it "changes the status of the cookie when given enough time" do
      expect { cookie.bake!(10) }.to change(cookie, :status)
    end
  end

  describe "#status" do
      it "returns the cookie's current status" do
      expect(cookie.bake!(1).status).to be_a_kind_of(Symbol)
      end
      it "returns the cookie's current status" do
      expect(cookie.bake!(4).status).to be_a_kind_of(Symbol)
      end
      it "returns the cookie's current status" do
      expect(cookie.bake!(7).status).to be_a_kind_of(Symbol)
      end
      it "returns the cookie's current status" do
      expect(cookie.bake!(10).status).to be_a_kind_of(Symbol)
      end
      it "returns the cookie's current status" do
      expect(cookie.bake!(14).status).to be_a_kind_of(Symbol)
      end
    end

    context "when unbaked" do
      it "is `:doughy`" do
      expect(cookie.status).to eq(:doughy)
      end
    end

    context "when baked for less than 7 minutes" do
      let(:time_baked) {0}
      it "is `:doughy`" do
      expect(cookie.bake!(1).status).to eq(:doughy)
    end
      it "is `:doughy`" do
      expect(cookie.bake!(2).status).to eq(:doughy)
    end
      it "is `:doughy`" do
      expect(cookie.bake!(3).status).to eq(:doughy)
    end
      it "is `:doughy`" do
      expect(cookie.bake!(4).status).to eq(:doughy)
    end
      it "is `:doughy`" do
      expect(cookie.bake!(5).status).to eq(:doughy)
    end
      it "is `:doughy`" do
      expect(cookie.bake!(6).status).to eq(:doughy)
      end
    end

    context "when baked for at least 7 but less than 10 minutes" do
      it "is `:almost_ready`" do
      expect(cookie.bake!(7).status).to eq(:almost_ready)
      end
      it "is `:almost_ready`" do
      expect(cookie.bake!(8).status).to eq(:almost_ready)
      end
      it "is `:almost_ready`" do
      expect(cookie.bake!(9).status).to eq(:almost_ready)
      end
    end

    context "when baked for at least 10 but less than 12 minutes" do
      it "is `:ready`" do
        expect(cookie.bake!(10).status).to eq(:ready)
        end
        it "is `:ready`" do
        expect(cookie.bake!(11).status).to eq(:ready)
        end
    end

    context "when baked for at least 12 minutes" do
      it "is `:burned`" do
      expect(cookie.bake!(12).status).to eq(:burned)
      end
      it "is `:burned`" do
      expect(cookie.bake!(13).status).to eq(:burned)
      end
      it "is `:burned`" do
      expect(cookie.bake!(21).status).to eq(:burned)
      end
  end
end
