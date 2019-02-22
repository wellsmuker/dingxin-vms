RSpec.describe Dingxin::Vms do

  describe "#top test" do
    before do
      Dingxin::Vms.configure do |config|
        config.app_code = 'test_appcode'
      end
    end

    it "get the http query url" do
      params = {
        'phone' => '15912345678',
        'tpl_id' => 'TP18031516',
        'param' => 'asin:B01E7LLKT2'
      }
      spect_output = 'http://yuyin2.market.alicloudapi.com/dx/voice_notice?param=asin%3AB01E7LLKT2&phone=15912345678&tpl_id=TP18031516'
      expect(Dingxin::Vms.get_url(params)).to eql(spect_output)
    end
  end

  it "get the canonicalized query string" do
    method_input = {
      'phone' =>	'15300000001',
      'tpl_id' => 'TP18031516',
      'param' => 'asin:B01E7LLKT2'
    }

    spect_output = 'param=asin%3AB01E7LLKT2&phone=15300000001&tpl_id=TP18031516'

    expect(Dingxin::Vms.canonicalized_query_string(method_input)).to eql(spect_output)
  end

end
