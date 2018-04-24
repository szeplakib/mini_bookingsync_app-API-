require 'rails_helper'

RSpec.describe 'Booking API' do
  let!(:rental) { create(:rental) }
  let!(:booking) { create_list(:booking, 20, rental_id: rental.id) }
  let(:rental_id) { rental.id }
  let(:id) { bookings.first.id }

  describe 'GET /rentals/:rental_id/bookings' do
    before { get "/rentals/#{rental_id}/bookings" }

    context 'when rental exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all rental bookings' do
        expect(json.size).to eq(20)
      end
    end

    context 'when rental does not exist' do
      let(:rental_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Rental/)
      end
    end
  end

  describe 'GET /rentals/:rental_id/bookings/:id' do
    before { get "/rentals/#{rental_id}/bookings/#{id}" }

    context 'when rental booking exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the booking' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when rental booking does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Booking/)
      end
    end
  end

  describe 'POST /rentals/:rental_id/bookings' do
    let(:valid_attributes) { { name: 'Visit Narnia', done: false } }

    context 'when request attributes are valid' do
      before { post "/rentals/#{rental_id}/bookings", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/rentals/#{rental_id}/bookings", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /rentals/:rental_id/bookings/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/rentals/#{rental_id}/bookings/#{id}", params: valid_attributes }

    context 'when booking exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the booking' do
        updated_booking = Booking.find(id)
        expect(updated_booking.name).to match(/Mozart/)
      end
    end

    context 'when the boking does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Booking/)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /rentals/:id' do
    before { delete "/rentals/#{rental_id}/bookings/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end