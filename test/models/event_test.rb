require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
    @user = create(:user)
    @event = create(:event, owner: @user)
  end

  def test_an_event_can_be_created
    assert @event.persisted?
    assert @event.valid?
  end

  def test_an_event_needs_an_owner
    assert @event.valid?
  end

  def test_an_event_needs_a_time
    @event.time = nil
    @event.save
    refute @event.valid?
  end

  def test_an_event_needs_a_location
    @event.address = nil
    @event.save
    refute @event.valid?
  end

  def test_an_event_needs_activity_type
    @event.activity_type = nil
    @event.save
    refute @event.valid?
  end

  def test_an_event_needs_a_description
    @event.description = nil
    @event.save
    refute @event.valid?
  end

  def test_an_event_has_longitude_and_latitude_generated
    assert @event.latitude != nil
    assert @event.longitude != nil
  end
end
