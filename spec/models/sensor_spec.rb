require 'spec_helper'

describe Sensor do

  let(:user) { FactoryGirl.create(:user) }
  let(:device_type) { DeviceType.create(name: 'Test') }
  let(:sensor_type) { SensorType.create(name: 'Test') }
  let(:unit) { Unit.create(name: 'Test', symbol: 'T') }
  let(:device) { Device.create(uuid: '12345678901234567890123456789012', name: 'Device 123', device_type_id: device_type.id, user_id: user.id) }
  before {
    @sensor = device.sensors.build(uuid: '12345678901234567890123456789012', name: 'Sensor 123', sensor_type_id: sensor_type.id, unit_id: unit.id)
  }

  subject { @sensor }

  it { should respond_to(:uuid) }
  it { should respond_to(:name) }

  it { should respond_to(:sensor_type_id) }
  it { should respond_to(:sensor_type) }
  its(:sensor_type) { should eq sensor_type }

  it { should respond_to(:device_id) }
  it { should respond_to(:device) }
  its(:device) { should eq device }

  it { should respond_to(:unit_id) }
  it { should respond_to(:unit) }
  its(:unit) { should eq unit }

  it { should be_valid }

  describe 'when uuid is not present' do
    before { @sensor.uuid = ' ' }
    it { should_not be_valid }
  end

  describe 'when name is not present' do
    before { @sensor.name = ' ' }
    it { should_not be_valid }
  end

end
